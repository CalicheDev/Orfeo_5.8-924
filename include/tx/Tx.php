<?php

/**
 * En este frame se van cargado cada una de las funcionalidades del sistema
 *
 * Descripcion Larga
 *
 * @category
 * @package      SGD Orfeo
 * @subpackage   Main
 * @author       Community
 * @author       Skina Technologies SAS (http://www.skinatech.com)
 * @license      GNU/GPL <http://www.gnu.org/licenses/gpl-2.0.html>
 * @link         http://www.orfeolibre.org
 * @version      SVN: $Id$
 * @since
 */
/* ---------------------------------------------------------+
  |                    DEFINICIONES                          |
  +--------------------------------------------------------- */
session_start();
error_reporting(7);
$url_raiz = "..";
$dir_raiz = $_SESSION['dir_raiz'];
$ESTILOS_PATH2 = $_SESSION['ESTILOS_PATH2'];

/* ---------------------------------------------------------+
  |                     INCLUDES                             |
  +--------------------------------------------------------- */
include_once($dir_raiz . "/include/tx/Historico.php");
include_once dirname(__FILE__) . DIRECTORY_SEPARATOR . ".." . DIRECTORY_SEPARATOR . ".." . DIRECTORY_SEPARATOR . "config.php";

class Tx extends Historico {
    /** Aggregations: */
    /** Compositions: */
    /*     * * Attributes: ** */

    /**
     * Clase que maneja los Historicos de los documentos
     *
     * @param int     Dependencia Dependencia de Territorial que Anula
     * @param number  usuaDocB    Documento de Usuario
     * @param number  depeCodiB   Dependencia de Usuario Buscado
     * @param varchar usuaNombB   Nombre de Usuario Buscado
     * @param varcahr usuaLogin   Login de Usuario Buscado
     * @param number	usNivelB	Nivel de un Ususairo Buscado..
     * @db 	Objeto  conexion
     * @access public
     */
    var $db;

    function Tx($db) {
        /**
         * Constructor de la clase Historico
         * @db variable en la cual se recibe el cursor sobre el cual se esta trabajando.
         *
         */
        $this->db = $db;
    }

    /**
     * Metodo que trae los datos principales de un usuario a partir del codigo y la dependencia
     *
     * @param number $codUsuario
     * @param number $depeCodi
     *
     */
    function datosUs($codUsuario, $depeCodi) {
        if (strpos($depeCodi, "'") == FALSE)
            $depDestino = "'" . $depeCodi . "'";
        $sql = "SELECT
				USUA_DOC
				,USUA_LOGIN
				,CODI_NIVEL
				,USUA_NOMB
			FROM
				USUARIO
			WHERE
				DEPE_CODI='$depeCodi'
				AND USUA_CODI=$codUsuario";
        # Busca el usuairo Origen para luego traer sus datos.
//	$this->db->conn->debug=true;

        $rs = $this->db->query($sql);
        //$usNivel = $rs->fields["CODI_NIVEL"];
        //$nombreUsuario = $rs->fields["USUA_NOMB"];
        $this->usNivelB = $rs->fields['CODI_NIVEL'];
        $this->usuaNombB = $rs->fields['USUA_NOMB'];
        $this->usuaDocB = $rs->fields['USUA_DOC'];
    }

// MODIFICADO PARA GENERAR ALERTAS
// JUNIO DE 2009
    function getRadicados($tipo, $usua_cod) {
        $con = $this->db->driver;
        switch ($con) {
            case'oci8':
                $query = "SELECT $tipo FROM SGD_NOVEDAD_USUARIO WHERE USUA_DOC=$usua_cod";
                break;
            case 'postgres':

                $campo1 .= '"';
                $campo1 .= $tipo;
                $campo1 .= '"';
                $campo2 = '"USUA_DOC"';
                $query = "SELECT $campo1 FROM SGD_NOVEDAD_USUARIO WHERE $campo2='$usua_cod'";
                break;
        }
        $rs = $this->db->query($query);
        if ($rs) {
            return $rs->fields["$tipo"];
        }
    }

// MODIFICADO PARA GENERAR ALERTAS
// JUNIO  DE 2009 

    function registrarNovedad($tipo, $docUsuarioDest, $numRad, $dir_raiz) {
        // busco la información de radicados informados pendientes de alerta
        // Busco info del campo NOV_INFOR de la tabla SGD_NOVEDAD_USUARIO
        //include("$dir_raiz/class_control/Param_admin.php"); 
        $param = Param_admin::getObject($this->db, '%', 'ALERT_FUNCTION');

        if ($param->PARAM_VALOR == "1") {

            $rads = $this->getRadicados($tipo, $docUsuarioDest);

            if ($rads != "") {
                $rads .= ",";
            }
            $rads .= $numRad;

            $con = $this->db->driver;

            switch ($con) {
                case'oci8':
                    $xarray['USUA_DOC'] = $docUsuarioDest;
                    $xarray["$tipo"] = $rads;

                    $tipo1 = $tipo;
                    $valor = $xarray["$tipo"];

                    $qs = "Select count(*) as contador from SGD_NOVEDAD_USUARIO where USUA_DOC=$docUsuarioDest";
                    $rs = $this->db->conn->query($qs);

                    if ($rs->fields['CONTADOR'] == 0) {
                        $qu = "INSERT INTO SGD_NOVEDAD_USUARIO (USUA_DOC,$tipo1) values ($docUsuarioDest,$valor)";
                        $this->db->conn->query($qu);
                    } else {
                        $this->db->conn->query("UPDATE SGD_NOVEDAD_USUARIO SET $tipo1 = $valor where USUA_DOC'$docUsuarioDest'");
                    }

                    break;

                case 'postgres':

                    $xarray['USUA_DOC'] .= '"';
                    $xarray['USUA_DOC'] .= $docUsuarioDest;
                    $xarray['USUA_DOC'] .= '"';

                    $tipo1 = '"';
                    $tipo1 .= $tipo;
                    $tipo1 .= '"';

                    $xarray["$tipo"] .= "'";
                    $xarray["$tipo"] .= $rads;
                    $xarray["$tipo"] .= "'";

                    $valor = $xarray["$tipo"];

                    $campo = '"USUA_DOC"';
                    $qs = "Select count(*) as contador from SGD_NOVEDAD_USUARIO where $campo='$docUsuarioDest'";
                    $rs = $this->db->conn->query($qs);

                    if ($rs->fields['CONTADOR'] == 0) {
                        $qu = "INSERT INTO SGD_NOVEDAD_USUARIO ($campo,$tipo1) values ('$docUsuarioDest',$valor)";
                        $this->db->conn->query($qu);
                    } else {
                        $this->db->conn->query("UPDATE SGD_NOVEDAD_USUARIO SET $tipo1 = $valor where $campo='$docUsuarioDest'");
                    }

                    break;
            }
        }
    }

    function informar($radicados, $loginOrigen, $depDestino, $depOrigen, $codUsDestino, $codUsOrigen, $observa, $idenviador = null, $dir_raiz = "") {
        $whereNivel = "";
        
        error_log('@@@@@@@@@@@@@ '.$radicados.','.$loginOrigen.','. $depDestino.','.$depOrigen.','.$codUsDestino.','.$codUsOrigen.','.$codUsDestino.','.$codUsOrigen.','.$observa);
        
        if (substr_count($depDestino, "'") == 0)
            $depDestino = "'" . $depDestino . "'";

        elseif (substr_count($depDestino, "'") > 2)
            $depDestino = trim($depDestino, "'");
        
        //$this->db->conn->debug=true;
//        $this->db->conn->SetFetchMode(ADODB_FETCH_ASSOC);
        $sql = "SELECT USUA_DOC ,USUA_LOGIN ,CODI_NIVEL ,USUA_NOMB FROM USUARIO WHERE DEPE_CODI=$depDestino AND USUA_CODI=$codUsDestino";
        $this->db->conn->SetFetchMode(ADODB_FETCH_ASSOC);
        # Busca el usuairo Origen para luego traer sus datos.
        $rs = $this->db->query($sql); # Ejecuta la busqueda

        $usNivel = $rs->fields["CODI_NIVEL"];
        $usLoginDestino = $rs->fields["USUA_LOGIN"];
        $nombreUsuario = $rs->fields["USUA_NOMB"];
        $docUsuarioDest = $rs->fields["USUA_DOC"];

        
        if ($tomarNivel == "si") {
            $whereNivel = ",CODI_NIVEL=$usNivel";
        }
        
        $codTx = 8;
        $observa = "A: $usLoginDestino - $observa";
        
        if (!$observacion)
            $observacion = $observa;

        $tmp_rad = array();
        $informaSql = true;
        //$this->db->conn->debug=true;

        if (is_array($radicados)) {
            while ((list(, $noRadicado) = each($radicados)) and $informaSql) {
                if (strstr($noRadicado, '-'))
                    $tmp = explode('-', $noRadicado);
                else
                    $tmp = $noRadicado;

                if (is_array($tmp)) {
                    $record["RADI_NUME_RADI"] = $tmp[1];
                } else {
                    $record["RADI_NUME_RADI"] = $noRadicado;
                }

                # Asignar el valor de los campos en el registro
                # Observa que el nombre de los campos pueden ser mayusculas o minusculas
                $record["DEPE_CODI"] = $depDestino;
                $record["USUA_CODI"] = $codUsDestino;
                $record["INFO_CODI"] = $idenviador;
                $record["INFO_DESC"] = "'$observacion '";
                $record["USUA_DOC"] = "'$docUsuarioDest'";
                $record["INFO_FECH"] = $this->db->conn->OffsetDate(0, $this->db->conn->sysTimeStamp);

                # Mandar como parametro el recordset vacio y el arreglo conteniendo los datos a insertar
                # a la funcion GetInsertSQL. Esta procesara los datos y regresara un enunciado SQL
                # para procesar el INSERT.
                if (strpos($record['RADI_NUME_RADI'], "'") === false)
                    $record['RADI_NUME_RADI'] = "'" . $record['RADI_NUME_RADI'] . "'";
                if (substr_count($record['RADI_NUME_RADI'], "'") < 2)
                    $record['RADI_NUME_RADI'] = "'" . str_replace("'", "", $record['RADI_NUME_RADI']) . "'";
                $informaSql = $this->db->conn->Replace("INFORMADOS", $record, array('RADI_NUME_RADI', 'INFO_CODI', 'USUA_DOC'), false);

                // MODIFICADO PARA GENERAR ALERTAS
                // JUNIO DE 2009
                //Modificado idrd 
                if ($informaSql)
                    $tmp_rad[] = trim($record["RADI_NUME_RADI"], "'");
            }
        }else {
            
            # Asignar el valor de los campos en el registro
            # Observa que el nombre de los campos pueden ser mayusculas o minusculas
            $record["RADI_NUME_RADI"] = $radicados;
            $record["DEPE_CODI"] = $depDestino;
            $record["USUA_CODI"] = $codUsDestino;
            $record["INFO_CODI"] = $idenviador;
            $record["INFO_DESC"] = "'$observacion '";
            $record["USUA_DOC"] = "'$docUsuarioDest'";
            $record["INFO_FECH"] = $this->db->conn->OffsetDate(0, $this->db->conn->sysTimeStamp);

            # Mandar como parametro el recordset vacio y el arreglo conteniendo los datos a insertar
            # a la funcion GetInsertSQL. Esta procesara los datos y regresara un enunciado SQL
            # para procesar el INSERT.
            if (strpos($record['RADI_NUME_RADI'], "'") === false)
                $record['RADI_NUME_RADI'] = "'" . $record['RADI_NUME_RADI'] . "'";
            
            if (substr_count($record['RADI_NUME_RADI'], "'") < 2)
                $record['RADI_NUME_RADI'] = "'" . str_replace("'", "", $record['RADI_NUME_RADI']) . "'";
            
            $informaSql = $this->db->conn->Replace("INFORMADOS", $record, array('RADI_NUME_RADI', 'INFO_CODI', 'USUA_DOC'), false);

            // MODIFICADO PARA GENERAR ALERTAS
            // JUNIO DE 2009
            //Modificado idrd 
            if ($informaSql)
                $tmp_rad[] = trim($record["RADI_NUME_RADI"], "'");                
        }

        $depDestino = trim($depDestino, "'");
        $depOrigen = trim($depOrigen, "'");
        $this->insertarHistorico($tmp_rad, $depOrigen, $codUsOrigen, $depDestino, $codUsDestino, $observa, $codTx);
        
        return $nombreUsuario;
    }

    function borrarInformado($radicados, $loginOrigen, $depDestino, $depOrigen, $codUsDestino, $codUsOrigen, $observa) {
        $tmp_rad = array();
        $deleteSQL = true;
        //$this->db->conn->debug=true;
        while ((list(, $noRadicado) = each($radicados)) and $deleteSQL) { //foreach($radicados as $noRadicado)
            # Borrar el informado seleccionado
            $tmp = explode('-', $noRadicado);
            ($tmp[0]) ? $wtmp = ' and INFO_CODI = ' . $tmp[0] : $wtmp = ' and INFO_CODI IS NULL ';
            $record["RADI_NUME_RADI"] = "'" . $tmp[1] . "'";
            $record["USUA_CODI"] = $codUsOrigen;
            $record["DEPE_CODI"] = $depOrigen;
            $deleteSQL = $this->db->conn->Execute("DELETE FROM INFORMADOS WHERE RADI_NUME_RADI='" . $tmp[1] . " and USUA_CODI=" . $codUsOrigen . " and DEPE_CODI='" . $depOrigen . "'" . str_replace("'", "", $wtmp));
            if ($deleteSQL) {
                $record["RADI_NUME_RADI"] = str_replace("'", "", $record["RADI_NUME_RADI"]);
                $tmp_rad[] = $record["RADI_NUME_RADI"];
            }
        }
        $codTx = 7;
        if ($deleteSQL) {
            $this->insertarHistorico($tmp_rad, $depOrigen, $codUsOrigen, $depOrigen, $codUsOrigen, $observa, $codTx, $observa);
            return $tmp_rad;
        } else
            return $deleteSQL;
    }

    function cambioCarpeta($radicados, $usuaLogin, $carpetaDestino, $carpetaTipo, $tomarNivel, $observa) {
        $whereNivel = "";
        $sql = "SELECT b.USUA_DOC ,b.USUA_LOGIN ,b.CODI_NIVEL ,b.DEPE_CODI ,b.USUA_CODI ,b.USUA_NOMB FROM  USUARIO b
		WHERE b.USUA_LOGIN = '$usuaLogin'";
        # Busca el usuairo Origen para luego traer sus datos.
        $rs = $this->db->query($sql); # Ejecuta la busqueda

        $usNivel = $rs->fields[2];
        $depOrigen = $rs->fields[3];
        $codUsOrigen = $rs->fields[4];
        $nombOringen = $rs->fields[5];
        if ($tomarNivel == "si") {
            $whereNivel = ",CODI_NIVEL=$usNivel";
        }
        $codTx = "10";

        $radicadosIn = join(",", $radicados);
        $sql = "update radicado set CARP_CODI=$carpetaDestino, CARP_PER=$carpetaTipo, radi_fech_agend=null, radi_agend=null  $whereNivel where RADI_NUME_RADI in($radicadosIn)";

        //$this->conn->Execute($isql);
        $rs = $this->db->query($sql); # Ejecuta la busqueda
        $retorna = 1;
        if (!$rs) {
            echo "<center><font color=red>Error en el Movimiento ... A ocurrido un error y no se ha podido realizar la Transaccion</font> <!-- $sql -->";
            $retorna = -1;
        }
        if ($retorna != -1) {
            $radicados = str_replace("'", "", $radicados);
            $this->insertarHistorico($radicados, $depOrigen, $codUsOrigen, $depOrigen, $codUsOrigen, $observa, $codTx);
        }
        return $retorna;
    }

    function reasignar($radicados, $loginOrigen, $depDestino, $depOrigen, $codUsDestino, $codUsOrigen, $tomarNivel, $observa, $codTx, $carp_codi) {
        //AQUI PIERDE DIR RAIZ
        $dir_raiz = $_SESSION['dir_raiz'];
        $whereNivel = "";
        if (strpos($depDestino, "'") == FALSE)
            $depDestino = "'" . $depDestino . "'";
        $this->db->conn->SetFetchMode(ADODB_FETCH_ASSOC);

        $sql = "SELECT
				USUA_DOC
				,USUA_LOGIN
				,CODI_NIVEL
				,USUA_NOMB
			FROM
				USUARIO
			WHERE
				DEPE_CODI=$depDestino
				AND USUA_CODI=$codUsDestino";
        # Busca el usuairo Origen para luego traer sus datos.
//	$this->db->conn->debug=true;

        $rs = $this->db->query($sql);
        //$usNivel = $rs->fields["CODI_NIVEL"];
        //$nombreUsuario = $rs->fields["USUA_NOMB"];
        $usNivel = $rs->fields['CODI_NIVEL'];
        $nombreUsuario = $rs->fields['USUA_NOMB'];
        $docUsuaDest = $rs->fields['USUA_DOC'];
        if ($tomarNivel == "si") {
            $whereNivel = ",CODI_NIVEL=$usNivel";
        }


        $radicadosIn = join(",", $radicados);
        $proccarp = "Reasignar";
        $carp_per = 0;
        $isql = "update radicado
				set
				  RADI_USU_ANTE='$loginOrigen'
				  ,RADI_DEPE_ACTU=$depDestino
				  ,RADI_USUA_ACTU=$codUsDestino
				  ,CARP_CODI=$carp_codi
				  ,CARP_PER=$carp_per
				  ,RADI_LEIDO=0
				  , radi_fech_agend=null
				  ,radi_agend=null
				  $whereNivel
			 where radi_depe_actu='$depOrigen'
			 	   AND radi_usua_actu=$codUsOrigen
				   AND RADI_NUME_RADI in($radicadosIn)";
        //$this->conn->Execute($isql);
        // MODIFICADO PARA GENERAR ALERTAS
        // JUNIO DE 2009
        foreach ($radicados as $rad) {
            $this->registrarNovedad('NOV_REASIG', $docUsuaDest, $rad, ".");
            //AQUI ENVIO DIR RAIZ
        }
        //////////////////////////////////
        $this->db->conn->Execute($isql); # Ejecuta la busqueda
        $radicados = str_replace("'", "", $radicados);
        $depOrigen = str_replace("'", "", $depOrigen);
        $depDestino = str_replace("'", "", $depDestino);
        $this->insertarHistorico($radicados, $depOrigen, $codUsOrigen, $depDestino, $codUsDestino, $observa, $codTx);
        return $nombreUsuario;
    }

//Modificado por Fabian Mauricio Losada
    function archivar($radicados, $loginOrigen, $depOrigen, $codUsOrigen, $observa,$dependenciaSalida) {
        $whereNivel = "";
        $radicadosIn = join(",", $radicados);
        $carp_codi = substr($depOrigen, 0, 2);
        $carp_per = 0;
        $carp_codi = 0;
        //$this->db->conn->debug=true;
        $isql = "update radicado
					set
					  RADI_USU_ANTE='$loginOrigen'
					  ,RADI_DEPE_ACTU='$dependenciaSalida'
					  ,RADI_USUA_ACTU=1
					  ,CARP_CODI=$carp_codi
					  ,CARP_PER=$carp_per
					  ,RADI_LEIDO=0
					  ,radi_fech_agend=null
					  ,radi_agend=null
					  ,CODI_NIVEL=1
					  ,SGD_SPUB_CODIGO=0
				 where radi_depe_actu='$depOrigen'
				 	   AND radi_usua_actu=$codUsOrigen
					   AND RADI_NUME_RADI in($radicadosIn)";
        //$this->conn->Execute($isql);
        $this->db->conn->Execute($isql); # Ejecuta la busqueda
        $this->insertarHistorico(str_replace("'", "", $radicados), $depOrigen, $codUsOrigen, '0999', 1, $observa, 13);
        return $isql;
    }

    // Hecho por Fabian Mauricio Losada
    function nrr($radicados, $loginOrigen, $depOrigen, $codUsOrigen, $observa) {
        //$this->db->conn->debug=true;
        $whereNivel = "";
        $radicadosIn = join(",", $radicados);
        $carp_codi = substr($depOrigen, 0, 2);
        $carp_per = 0;
        $carp_codi = 0;
        $isql = "update radicado
					set
					  RADI_USU_ANTE='$loginOrigen'
					  ,RADI_DEPE_ACTU='0999'
					  ,RADI_USUA_ACTU=1
					  ,CARP_CODI=$carp_codi
					  ,CARP_PER=$carp_per
					  ,RADI_LEIDO=0
					  ,radi_fech_agend=null
					  ,radi_agend=null
					  ,CODI_NIVEL=1
					  ,SGD_SPUB_CODIGO=0
					  ,RADI_NRR=1
                                   where RADI_NUME_RADI in ($radicadosIn)";
        /* where radi_depe_actu=$depOrigen
          AND radi_usua_actu=$codUsOrigen
          AND RADI_NUME_RADI in($radicadosIn)"; */
        //$this->conn->Execute($isql);
        $this->db->conn->Execute($isql); # Ejecuta la busqueda
        $radicados = str_replace("'", "", $radicados);
        $this->insertarHistorico($radicados, $depOrigen, $codUsOrigen, '0999', 1, $observa, 65);
        return $isql;
    }

    //creada by skina
    function trdm($radicados, $loginOrigen, $depOrigen, $codUsOrigen, $observa) {
        $whereNivel = "";
        $radicadosIn = join(",", $radicados);
        // $this->db->conn->debug=true;
        $this->insertarHistorico($radicados, $depOrigen, $codUsOrigen, $depOrigen, $codUsOrigen, $observa, 61);
        return $isql;
    }

    function expm($radicados, $loginOrigen, $depOrigen, $codUsOrigen, $observa, $numExpHidden) {
        $whereNivel = "";
        $radicadosIn = join(",", $radicados);
        // Modificado por SkinaTech, se agrego la query y la variable $rad1 para q me tome el primer valor del arreglo.
        $rad1 = $radicados[0];
        //$this->db->conn->debug=true;
        $esql = "SELECT SGD_EXP_NUMERO FROM SGD_EXP_EXPEDIENTE  WHERE  RADI_NUME_RADI=$rad1";
        $rs = $this->db->query($esql);
        
        $esqlUsuario = "SELECT usua_doc FROM usuario WHERE usua_login='$loginOrigen'";
        $rsUsuario = $this->db->query($esqlUsuario);
        $usDoc = $rsUsuario->fields["USUA_DOC"];
        
        if($rs->fields["SGD_EXP_NUMERO"] != ''){
            $expmult = $rs->fields["SGD_EXP_NUMERO"];
        }else{
            $expmult = $numExpHidden;
        }
        
        foreach ($radicados as $noRadicado) {
            /* Inserta en el expediente antes de craear el historico */
            $queryInserta = "insert into SGD_EXP_EXPEDIENTE(SGD_EXP_NUMERO, RADI_NUME_RADI,SGD_EXP_FECH,DEPE_CODI, USUA_CODI,USUA_DOC, SGD_EXP_ESTADO )
                VALUES ('$expmult', "
                    . "$noRadicado,"
                    . "" . $this->db->conn->OffsetDate(0, $this->db->sysTimeStamp) . ","
                    . "'$depOrigen' ,"
                    . "'$codUsOrigen' ,"
                    . "'$usDoc',"
                    . "'0'"
                    . ")";
            $rsInserta = $this->db->query($queryInserta);
        }
        
        $this->insertarHistoricoExp($expmult, $radicados, $depOrigen, $codUsOrigen, $observa, 62, 0);
        
        return $isql;
    }

    /**
     * Nueva Funcion para agendar.
     * Este metodo permite programar un radicado para una fecha especifica, el arreglo con la version anterior
     * , es que no se borra el agendado cuando el radicado sale del usuario actual.
     *
     * @author JAIRO LOSADA JUNIO 2006
     * @version 3.5.1
     *
     * @param array int $radicados
     * @param varchar $loginOrigen
     * @param numeric $depOrigen
     * @param numeric $codUsOrigen
     * @param varchar $observa
     * @param date $fechaAgend
     * @return boolean
     */
    function agendar($radicados, $loginOrigen, $depOrigen, $codUsOrigen, $observa, $fechaAgend) {
        $whereNivel = "";
        $radicadosIn = join(",", $radicados);
        $carp_codi = substr($depOrigen, 0, 2);
        $carp_per = 1;
        $sqlFechaAgenda = $this->db->conn->DBDate($fechaAgend);
//	$this->db->conn->debug=true;
        $this->datosUs($codUsOrigen, $depOrigen);
        $usuaDocAgen = $this->usuaDocB;
        foreach ($radicados as $noRadicado) {
            # Busca el usuairo Origen para luego traer sus datos.
            $rad = array();
            $observa = "Agendado para el $fechaAgend - " . $observa;
            if ($usuaDocAgen) {
                $record["RADI_NUME_RADI"] = $noRadicado;
                $record["DEPE_CODI"] = "'" . $depOrigen . "'";
                $record["SGD_AGEN_OBSERVACION"] = "'$observa '";
                $record["USUA_DOC"] = "'$usuaDocAgen'";
                $record["SGD_AGEN_FECH"] = $this->db->conn->OffsetDate(0, $this->db->conn->sysTimeStamp);
                $record["SGD_AGEN_FECHPLAZO"] = $sqlFechaAgenda;
                $record["SGD_AGEN_ACTIVO"] = 1;
                $insertSQL = $this->db->insert("SGD_AGEN_AGENDADOS", $record, "true");
                $radicados = str_replace("'", "", $radicados);
                $this->insertarHistorico($radicados, $depOrigen, $codUsOrigen, $depOrigen, $codUsOrigen, $observa, 14);
            }
        }
        //$this->conn->Execute($isql);
        return $isql;
    }

    /**
     * Metodo que sirve para sacar uno o varios radicados de agendado
     *
     * @param array $radicados
     * @param unknown_type $loginOrigen
     * @param unknown_type $depOrigen
     * @param unknown_type $codUsOrigen
     * @param unknown_type $observa
     * @return unknown
     */
    function noAgendar($radicados, $loginOrigen, $depOrigen, $codUsOrigen, $observa) {
        $this->datosUs($codUsOrigen, $depOrigen);
        $usuaDocAgen = $this->usuaDocB;
        $whereNivel = "";
        $radicadosIn = join(",", $radicados);
        $carp_codi = substr($depOrigen, 0, 2);
        $isql = "update sgd_agen_agendados
					set
					  SGD_AGEN_ACTIVO=0
				 where
				   RADI_NUME_RADI in($radicadosIn)
				   AND USUA_DOC='$usuaDocAgen'";
        //$this->conn->Execute($isql);
        $this->db->conn->Execute($isql); # Ejecuta la busqueda
        $radicados = str_replace("'", "", $radicados);
        $this->insertarHistorico($radicados, $depOrigen, $codUsOrigen, $depOrigen, $codUsOrigen, $observa, 15);
        return $isql;
    }

    function devolver($radicados, $loginOrigen, $depOrigen, $codUsOrigen, $tomarNivel, $observa) {
        $whereNivel = "";
        $retorno = "";
        //$this->db->conn->debug=true;
        $this->db->conn->SetFetchMode(ADODB_FETCH_ASSOC);
        foreach ($radicados as $noRadicado) {
            $sql = "SELECT
					b.USUA_DOC
					,b.USUA_LOGIN
					,b.CODI_NIVEL
					,b.DEPE_CODI
					,b.USUA_CODI
					,b.USUA_NOMB
					,b.USUA_DOC
				FROM
					RADICADO a, USUARIO b
				WHERE
					a.RADI_USU_ANTE=b.USUA_LOGIN
					AND a.RADI_NUME_RADI = $noRadicado";
            # Busca el usuairo Origen para luego traer sus datos.
            $rs = $this->db->conn->Execute($sql); # Ejecuta la busqueda
            if ($rs->fields['DEPE_CODI'] == '') {
                $sqlradica = "SELECT
			  b.USUA_DOC
			  ,b.USUA_LOGIN
			  ,b.CODI_NIVEL
			  ,b.DEPE_CODI 
			  ,b.USUA_CODI
			  ,b.USUA_NOMB
			  ,b.USUA_DOC
	  FROM
			RADICADO a, USUARIO b
	  WHERE
			  a.RADI_DEPE_RADI=b.DEPE_CODI AND a.RADI_USUA_RADI=b.USUA_CODI
			  AND a.RADI_NUME_RADI = $noRadicado";

                # Busca el usuairo Origen para luego traer sus datos.
                $rsradica = $this->db->conn->Execute($sqlradica); # Ejecuta la busqueda
                $usNivel = $rsradica->fields['CODI_NIVEL'];
                $depDestino = $rsradica->fields['DEPE_CODI'];
                $codUsDestino = $rsradica->fields['USUA_CODI'];
                $nombDestino = $rsradica->fields['USUA_NOMB'];
                $docUsuaDest = $rsradica->fields['USUA_DOC'];
            } else {
                $usNivel = $rs->fields['CODI_NIVEL'];
                $depDestino = $rs->fields['DEPE_CODI'];
                $codUsDestino = $rs->fields['USUA_CODI'];
                $nombDestino = $rs->fields['USUA_NOMB'];
                $docUsuaDest = $rs->fields['USUA_DOC'];
            }
            $rad = array();
            if ($codUsDestino) {
                if ($tomarNivel == "si") {
                    $whereNivel = ",CODI_NIVEL=$usNivel";
                }
                $radicadosIn = join(",", $radicados);
                $proccarp = "Dev. ";
                $carp_codi = 12;
                $carp_per = 0;
                $isql = "update radicado
						set
						  RADI_USU_ANTE='$loginOrigen'
						  ,RADI_DEPE_ACTU='$depDestino'
						  ,RADI_USUA_ACTU=$codUsDestino
						  ,CARP_CODI=$carp_codi
						  ,CARP_PER=$carp_per
						  ,RADI_LEIDO=0
						  , radi_fech_agend=null
						  ,radi_agend=null
						  $whereNivel
					 where radi_depe_actu='$depOrigen'
						   AND radi_usua_actu=$codUsOrigen
						   AND RADI_NUME_RADI = $noRadicado";
                $this->db->conn->Execute($isql); # Ejecuta la busqueda
                $rad[] = $noRadicado;
                $rad = str_replace("'", "", $rad);
                $this->insertarHistorico($rad, $depOrigen, $codUsOrigen, $depDestino, $codUsDestino, $observa, 12);
                array_splice($rad, 0);
                $retorno = $nombDestino; //modificado  skina 27/01/2012  para notificaciones devueltos
                //$retorno=$retorno."$noRadicado ------> $nombDestino <br>";
                // MODIFICADO PARA GENERAR ALERTAS
                //JUNIO DE 2009
                $this->registrarNovedad('NOV_DEV', $docUsuaDest, $noRadicado, $dir_raiz);
                //////////////////////////////////
            } else {
                $retorno = $retorno . "<font color=red>$noRadicado ------> Usuario Anterior no se encuentra o esta inactivo</font><br>";
            }
        }
        return $retorno;
    }

}

?>
