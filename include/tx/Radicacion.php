<?PHP

class Radicacion {
    /** Aggregations: */
    /** Compositions: */
    /*     * * Attributes: ** */
    /**
     * Clase que maneja los Historicos de los documentos
     *
     * @param int Dependencia Dependencia de Territorial que Anula
     * @db Objeto conexion
     * @access public
     */

    /**
     *  VARIABLES DE DATOS PARA LOS RADICADOS
     */
    var $db;
    var $tipRad;
    var $radiTipoDeri;
    var $radiCuentai;
    var $eespCodi;
    var $mrecCodi;
    var $radiFechOfic;
    var $radiNumeDeri;
    var $tdidCodi;
    var $descAnex;
    var $radiNumeHoja;
    var $radiPais;
    var $raAsun;
    var $radiDepeRadi;
    var $radiUsuaActu;
    var $radiDepeActu;
    var $carpCodi;
    var $radiNumeRadi;
    var $trteCodi;
    var $radiNumeIden;
    var $radiFechRadi;
    var $sgd_apli_codi;
    var $tdocCodi;
    var $estaCodi;
    var $radiPath;
    var $nguia;
    var $tsopt;
    var $urgnt;
    var $dptcn;

    /**
     *  VARIABLES DEL USUARIO ACTUAL
     */
    var $dependencia;
    var $usuaDoc;
    var $usuaLogin;
    var $usuaCodi;
    var $codiNivel;
    var $noDigitosRad;
    var $estructuraRad;
 //   var $radicadoReferenciaCliente;

    function Radicacion($db) {

        /**
         * Constructor de la clase Historico
         * @db variable en la cual se recibe el cursor sobre el cual se esta trabajando.
         *
         */
        global $HTTP_SERVER_VARS, $PHP_SELF, $HTTP_SESSION_VARS, $HTTP_GET_VARS, $krd;
        //global $HTTP_GET_VARS;
        $this->db = $db;
        $this->noDigitosRad = 6;
        $curr_page = $id . '_curr_page';
        $this->dependencia = $_SESSION['dependencia'];
        $this->usuaDoc = $_SESSION['usua_doc'];
        $this->estructuraRad = $_SESSION['estructuraRad'];
        $this->usuaLogin = $krd;
        $this->usuaCodi = $_SESSION['codusuario'];
        isset($_GET['nivelus']) ? $this->codiNivel = $_GET['nivelus'] : $this->codiNivel = $_SESSION['nivelus'];
    }

    function newRadicado($tpRad, $tpDepeRad, $driver, $numero) {
        /** FUNCION QUE INSERTA UN RADICADO NUEVO
         * Busca el Nivel de Base de datos. * */
        $whereNivel = "";
        $sql = "SELECT CODI_NIVEL FROM USUARIO WHERE USUA_CODI = " . $this->radiUsuaActu . " AND DEPE_CODI=" . $this->radiDepeActu . "";
        # Busca el usuairo Origen para luego traer sus datos.
        $rs = $this->db->conn->query($sql); # Ejecuta la busqueda
        $usNivel = $rs->fields["CODI_NIVEL"];
        # Busca el usuairo Origen para luego traer sus datos.
        $SecName = "SECR_TP$tpRad" . "_" . $tpDepeRad;

        $numero == '' ? $secNew = $this->db->conn->nextId($SecName, $driver) : '';

        if ($secNew == 0 && $numero == '') {
            $this->db->conn->RollbackTrans();
            $secNew = $this->db->conn->nextId($SecName, $driver);
            if ($secNew == 0)
                die("<hr><b><font color=red><center>Error no genero un Numero de Secuencia<br>SQL: $secNew</center></font></b><hr>");
        }
        include_once dirname(__FILE__) . DIRECTORY_SEPARATOR . ".." . DIRECTORY_SEPARATOR . ".." . DIRECTORY_SEPARATOR . "config.php";
        if (strlen($this->dependencia) < $longitud_codigo_dependencia)
            $this->dependencia = str_pad($this->dependencia, $longitud_codigo_dependencia, '0', STR_PAD_LEFT);

        // By skina - 14/08/2018
        // Para la construcción del número de radicado, esto indica la parte inicial del radicado.
        if ($this->estructuraRad == 'ymd') {
            $valano = date("Ymd");
        } elseif ($this->estructuraRad == 'ym') {
            $valano = date("Ym");
        } else {
            $valano = date("Y");
        }

        if ($numero == '') {
            $newRadicado = $valano . $this->dependencia . str_pad($secNew, $this->noDigitosRad, "0", STR_PAD_LEFT) . $tpRad;
        } else {
            $newRadicado = $numero;
        }

        if (!$this->radiTipoDeri) {
            $recordR["radi_tipo_deri"] = "0";
        } else {
            $recordR["radi_tipo_deri"] = $this->radiTipoDeri;
        }
        if (!$this->carpCodi)
            $this->carpCodi = 0;
        if (!$this->radiNumeDeri)
            $this->radiNumeDeri = 0;

        $recordR["RADI_CUENTAI"] = $this->radiCuentai;
        $recordR["EESP_CODI"] = $this->eespCodi ? $this->eespCodi : 0;
        $recordR["MREC_CODI"] = $this->mrecCodi;
        // Modificado SGD 06-Septiembre-2007
        switch ($GLOBALS['driver']) {
            case 'postgres':
                $recordR["radi_fech_ofic"] = $this->db->conn->DBDate($this->radiFechOfic);
                break;
            default:
                $recordR["radi_fech_ofic"] = $this->db->conn->DBDate($this->radiFechOfic);
        }
        $recordR["RADI_NUME_DERI"] = $this->db->conn->qstr($this->radiNumeDeri);
        $recordR["RADI_USUA_RADI"] = $this->usuaCodi;
        $recordR["RADI_PAIS"] = "'" . $this->radiPais . "'";
        $recordR["RA_ASUN"] = $this->db->conn->qstr($this->raAsun);
        $recordR["radi_desc_anex"] = $this->db->conn->qstr($this->descAnex);
        $recordR["RADI_DEPE_RADI"] = $this->radiDepeRadi;
        $recordR["RADI_USUA_ACTU"] = $this->radiUsuaActu;
        $recordR["carp_codi"] = $this->carpCodi;
        $recordR["CARP_PER"] = 0;
        $recordR["RADI_NUME_RADI"] = $this->db->conn->qstr($newRadicado);
        $recordR["TRTE_CODI"] = $this->trteCodi;
        $recordR["RADI_FECH_RADI"] = $numero == '' ? $this->db->conn->OffsetDate(0, $this->db->conn->sysTimeStamp) : "'" . $this->radiFechOfic . "'";
        $recordR["RADI_DEPE_ACTU"] = $this->radiDepeActu;
        $recordR["TDOC_CODI"] = $this->tdocCodi;
        $recordR["TDID_CODI"] = $this->tdidCodi;
        //by skina: Modificacion para solucionar problema de codi_nivel vacio
        if ($usNivel == '')
            $usNivel = 1;
        $recordR["CODI_NIVEL"] = $usNivel;
        $recordR["SGD_APLI_CODI"] = $this->sgd_apli_codi;
        $recordR["RADI_PATH"] = "$this->radiPath";
//        $recordR["RADICADO_REFERENCIA_CLIENTE"] = "$this->radicadoReferenciaCliente";

        $edd = strlen($newRadicado); //edd  skina para  CIAC
        if ($edd < 14 || $edd > 20)
            die("se genero un numero de radicado  de $edd Numeros ");

        $whereNivel = "";
        $insertSQL = $this->db->insert("RADICADO", $recordR, "true");
//        $this->db->debug=true;
        $insertSQL = $this->db->conn->Replace("RADICADO", $recordR, "RADI_NUME_RADI", false);
        if (!$insertSQL) {
            echo "<hr><b><font color=red>Error no se inserto sobre radicado al insertar<br>SQL: " . $this->db->querySql . "</font></b><hr>";
        }
        //$this->db->conn->CommitTrans();
        return $newRadicado;
    }

    function updateRadicado($radicado, $radPathUpdate = null) {
//        error_log('@@@@@@@@@@@@@@@@@@@@@@@@@@@ ');
        $recordR["radi_cuentai"] = $this->radiCuentai;
        $recordR["eesp_codi"] = $this->eespCodi;
        $recordR["mrec_codi"] = $this->mrecCodi;
        $recordR["radi_fech_ofic"] = $this->db->conn->DBDate($this->radiFechOfic);
        $recordR["radi_pais"] = "'" . $this->radiPais . "'";
        $recordR["RA_ASUN"] = $this->db->conn->qstr($this->raAsun);
        $recordR["radi_desc_anex"] = $this->db->conn->qstr($this->descAnex);
        $recordR["trte_codi"] = $this->trteCodi;
        $recordR["tdid_codi"] = $this->tdidCodi;
        $recordR["radi_nume_radi"] = $this->db->conn->qstr($radicado);
        $recordR["SGD_APLI_CODI"] = $this->sgd_apli_codi;
        $recordR["radi_depe_actu"] = $this->db->conn->qstr($this->radiDepeActu);
        $recordR["TDOC_CODI"] = $this->tdocCodi;
  //      $recordR["RADICADO_REFERENCIA_CLIENTE"] = "$this->radicadoReferenciaCliente";

        // Linea para realizar radicacion Web de archivos pdf
        if (!empty($radPathUpdate) && $radPathUpdate != "") {
            $archivoPath = explode(".", $radPathUpdate);
            // Sacando la extension del archivo
            $extension = array_pop($archivoPath);
            if ($extension == "pdf") {
                $recordR["radi_path"] = "'" . $radPathUpdate . "'";
            }
        }
        $insertSQL = $this->db->conn->Replace("RADICADO", $recordR, "radi_nume_radi", false);
        return $insertSQL;
    }

    /** FUNCION DATOS DE UN RADICADO
     * Busca los datos de un radicado.
     * @param $radicado int Contiene el numero de radicado a Buscar
     * @return Arreglo con los datos del radicado
     * Fecha de creaci�n: 29-Agosto-2006
     * Creador: Supersolidaria
     * Fecha de modificaci�n:
     * Modificador:
     */
    function getDatosRad($radicado) {
        $query = 'SELECT RAD.RADI_FECH_RADI, RAD.RADI_PATH, TPR.SGD_TPR_DESCRIP,';
        $query .= ' RAD.RA_ASUN';
        $query .= ' FROM RADICADO RAD';
        $query .= ' LEFT JOIN SGD_TPR_TPDCUMENTO TPR ON TPR.SGD_TPR_CODIGO = RAD.TDOC_CODI';
        $query .= ' WHERE RAD.RADI_NUME_RADI = \'' . $radicado . "'";

        $rs = $this->db->conn->query($query);

        $arrDatosRad['fechaRadicacion'] = $rs->fields['RADI_FECH_RADI'];
        $arrDatosRad['ruta'] = $rs->fields['radi_path'];
        $arrDatosRad['tipoDocumento'] = $rs->fields['SGD_TPR_DESCRIP'];
        $arrDatosRad['asunto'] = $rs->fields['RA_ASUN'];

        return $arrDatosRad;
    }

    function newPreradicado($tpRad, $tpDepeRad, $driver) {
        /** FUNCION QUE INSERTA UN RADICADO NUEVO * */
        $whereNivel = "";
        $sql = "SELECT CODI_NIVEL FROM USUARIO WHERE USUA_CODI = " . $this->radiUsuaActu . " AND DEPE_CODI=" . $this->radiDepeActu . "";
        $rs = $this->db->conn->query($sql); # Ejecuta la busqueda
        $usNivel = $rs->fields["CODI_NIVEL"];
        $SecName = "SECR_TP$tpRad" . "_" . $tpDepeRad;
        $secNew = $this->db->conn->nextId($SecName, $driver);

        if ($secNew == 0) {
            $this->db->conn->RollbackTrans();
            $secNew = $this->db->conn->nextId($SecName, $driver);
            if ($secNew == 0)
                die("<hr><b><font color=red><center>Error no genero un Numero de Secuencia<br>SQL: $secNew</center></font></b><hr>");
        }
        include_once dirname(__FILE__) . DIRECTORY_SEPARATOR . ".." . DIRECTORY_SEPARATOR . ".." . DIRECTORY_SEPARATOR . "config.php";
        if (strlen($this->dependencia) < $longitud_codigo_dependencia)
            $this->dependencia = str_pad($this->dependencia, $longitud_codigo_dependencia, '0', STR_PAD_LEFT);

        // By skina - 14/08/2018
        // Para la construcción del número de radicado, esto indica la parte inicial del radicado.
        if ($this->estructuraRad == 'ymd') {
            $valano = date("Ymd");
        } elseif ($this->estructuraRad == 'ym') {
            $valano = date("Ym");
        } else {
            $valano = date("Y");
        }

        $newRadicado = $valano . $this->dependencia . str_pad($secNew, $this->noDigitosRad, "0", STR_PAD_LEFT) . $tpRad;

        return $newRadicado;
    }
    
    // aplica trd al radcado
    function trdRadicado($radicado, $serie, $subserie, $dependencia, $usuaCodi, $usuaDoc) {
        /* La información del tipo documental que se le aplico al radicado */
        $sql_radicado = "SELECT tdoc_codi FROM radicado WHERE RADI_NUME_RADI='$radicado'";
        $rs_radicado = $this->db->conn->query($sql_radicado);
        $tdoc = $rs_radicado->fields["TDOC_CODI"];
        
        /* Se busca que el radicado exista o no en la tabla que relaciona radicado con Trd */
        $sql_rdf = "SELECT RADI_NUME_RADI FROM SGD_RDF_RETDOCF WHERE RADI_NUME_RADI='$radicado' AND DEPE_CODI='$dependencia'";
        $rs_rdf = $this->db->conn->query($sql_rdf);        
        $radiNumero = $rs_rdf->fields["RADI_NUME_RADI"];
              
        /* Se busca en la matriz de relación si existe la combinación de serie, subserie, tipo documental de radicado */
        $isqlTRD = "select SGD_MRD_CODIGO "
                . " from SGD_MRD_MATRIRD "
                . " where DEPE_CODI = '$dependencia' "
                    . " and SGD_SRD_CODIGO = '$serie' "
                    . " and SGD_SBRD_CODIGO = '$subserie' "
                    . " and SGD_TPR_CODIGO = '$tdoc'";
        $rs_mrd = $this->db->conn->query($isqlTRD);
        
        if($rs_mrd){
            $mrdCodigo = $rs_mrd->fields["SGD_MRD_CODIGO"];
        }else{
            $conteoTRd = "select max(SGD_MRD_CODIGO) as maximo from SGD_MRD_MATRIRD";
            $rsconteoTRd = $this->db->conn->Execute($conteoTRd);
            $idMrd = $rsconteoTRd->fields['MAXIMO'] + 1;
            /***
             * Inserta en la tabla de retención documental la combinación de serie/subserie/tipo documental
             * en caso que el tipo documental asignado al radicado no se encuentre la TRD
             ***/
            $inserTRD = "insert into SGD_MRD_MATRIRD values ($idMrd,'$dependencia',$serie,$subserie,$tdoc,'Electronico','".date('Y-m-d')."','2050-12-31','1')";
            $rsInsertTRD = $this->db->conn->Execute($inserTRD);
            
            if($rsInsertTRD){
                $mrdCodigo = $rsInsertTRD->fields["SGD_MRD_CODIGO"];
            }
        }
        
        // Se valida si al radicado se le debe asignar o actualizar la TRD
        if($radiNumero == ''){
            $insert_rdf = "insert into sgd_rdf_retdocf values ($mrdCodigo,'$radicado','$dependencia',$usuaCodi,'$usuaDoc','".date('Y-m-d')."')";
            $rsinsert_rdf = $this->db->conn->Execute($insert_rdf);            
        }else{
            $update_rdf = "update sgd_rdf_retdocf set sgd_mrd_codigo='$mrdCodigo' where radi_nume_radi='$radicado'";
            $rsupdate_rdf = $this->db->conn->Execute($update_rdf);
        }
        
        if($rsinsert_rdf or $rsupdate_rdf){
            $anexosRadicado = "select * from anexos where anex_radi_nume='$radicado'";
            $rsanexos = $this->db->conn->Execute($anexosRadicado);
            while (!$rsanexos->EOF) {
                $anexCodi = $rsanexos->fields['ANEX_CODIGO'];
                $updateAnexo = "update anexos set sgd_srd_codigo='$serie', sgd_sbrd_codigo='$subserie' where anex_codigo='$anexCodi'";
                $this->db->conn->Execute($updateAnexo);
                $rsanexos->MoveNext();
            }
            
        }
    }

}

// Fin de Class Radicacion
?>
