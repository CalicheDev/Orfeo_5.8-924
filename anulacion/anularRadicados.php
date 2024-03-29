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
  |                     INCLUDES                             |
  +--------------------------------------------------------- */


/* ---------------------------------------------------------+
  |                    DEFINICIONES                          |
  +--------------------------------------------------------- */
session_start();
error_reporting(7);
$url_raiz = "..";
$dir_raiz = $_SESSION['dir_raiz'];
$ESTILOS_PATH2 = $_SESSION['ESTILOS_PATH2'];
$assoc = $_SESSION['assoc'];
/* ---------------------------------------------------------+
  |                       MAIN                               |
  +--------------------------------------------------------- */

$krd = $_POST['krd'];
$fecha_h = $_POST['fecha_h'];
$fecha_busq = $_POST['fecha_busq'];
$fecha_busq2 = $_POST['fecha_busq2'];
$tipoRadicado = $_POST['tipoRadicado'];
$depeBuscada = $_POST['depeBuscada'];
$generar_informe = $_POST['generar_informe'];
$aceptarAnular = $_POST['aceptarAnular'];
$cancelarAnular = $_POST['cancelarAnular'];
$radAnularE = $_GET['radAnularE'];
$dependencia = $_SESSION['dependencia'];
$codusuario = $_SESSION["codusuario"];
$usua_doc = $_SESSION["usua_doc"];

if (!$_SESSION['dependencia'] and ! $_SESSION['depe_codi_territorial'])
    include "../rec_session.php";
if (!$fecha_busq)
    $fecha_busq = date("Y-m-d");
if (!$fecha_busq2)
    $fecha_busq2 = date("Y-m-d");

include('../config.php');
include_once "Anulacion.php";
include_once "$dir_raiz/include/tx/Historico.php";
include_once "$dir_raiz/include/db/ConnectionHandler.php";
$db = new ConnectionHandler("$dir_raiz");
//$db->conn->debug = true;
if ($cancelarAnular) {
    $aceptarAnular = "";
    $actaNo = "";
}

?>
<head>
    <link href="<?= $url_raiz . $ESTILOS_PATH2 ?>bootstrap.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="<?= $url_raiz . $_SESSION['ESTILOS_PATH_ORFEO'] ?>">
    <script>
        function soloNumeros(){
            jh = document.new_product.actaNo.value;
            if (jh){
                var1 = parseInt(jh);
                if (var1 != jh){
                    alert('Sólo introduzca números');
                    //document.forma.submit();
                    return false;
                } else{
                    document.new_product.aceptarAnular.value = "Hecho"
                    document.new_product.submit();
                }
            } else{
                        document.new_product.submit();
                    }
                }
    </script>
</head>
<BODY>
    <div id="spiffycalendar" class="text"></div>
    <link rel="stylesheet" type="text/css" href="../js/spiffyCal/spiffyCal_v2_1.css">
    <script language="JavaScript" src="../js/spiffyCal/spiffyCal_v2_1.js"></script>
    <script language="javascript">
                setRutaRaiz("..");
  <!--
  var dateAvailable = new ctlSpiffyCalendarBox("dateAvailable", "new_product", "fecha_busq","btnDate1","<?= $fecha_busq ?>",scBTNMODE_CUSTOMBLUE);
var dateAvailable2 = new ctlSpiffyCalendarBox("dateAvailable2", "new_product", "fecha_busq2","btnDate2","<?= $fecha_busq2 ?>",scBTNMODE_CUSTOMBLUE);
  //-->
    </script><P>
    <form name="new_product"  action='anularRadicados.php?<?= session_name() . "=" . session_id() . "&krd=$krd&fecha_h=$fechah" ?>' method=post>
        <center>

            <TABLE width="600" class='borde_tab' cellspacing='5' border="1">
                <!--DWLayoutTable-->
                <tr>
                <div id="titulo" style="width: 600px;" align="center">Anulaci&oacute;n de radicados por dependencia</div>
                </tr>

                <TR>
                    <TD width="125" height="21"  class='titulos2'><label for="fecha_busq"> Fecha inicial</label><br>
                        <?
                        // echo "($fecha_busq)";
                        ?>
                    </TD>
                    <TD width="500" align="right" valign="top" class='listado2'>
                        <script language="javascript">
                        dateAvailable.date = "2003-08-05";
                        dateAvailable.writeControl();
                      dateAvailable.dateFormat="yyyy-MM-dd";
                        </script>
                    </TD>
                </TR>
                <TR>
                    <TD width="125" height="21"  class='titulos2'><label for="fecha_busq2"> Fecha final</label><br>
                        <?
                        // echo "($fecha_busq2)";
                        ?>
                    </TD>
                        <TD width="500" align="right" valign="top"  class='listado2'>
<script language="javascript">
dateAvailable2.date = "2003-08-05";
dateAvailable2.writeControl();
dateAvailable2.dateFormat="yyyy-MM-dd";
</script>
                    </TD>
                </TR>
                <tr>
                    <TD height="26" class='titulos2'><label for="tipoRadicado">Tipo Radicacion</label></TD>
                    <TD valign="top" align="left"  class='listado2'>
                        <?php
                        $sqlTR ="select upper(sgd_trad_descr),sgd_trad_codigo from sgd_trad_tiporad 
                        order by sgd_trad_codigo";
                        $rsTR = $db->conn->Execute($sqlTR);
                        print $rsTR->GetMenu2("tipoRadicado","$tipoRadicado",false, false, 0," class='select' id='tipoRadicado' title='Listado de los tipos de radicado registrados en el sistema'>");
                        //if(!$depeBuscada) $depeBuscada=$dependencia;
                        ?>    

                    </TD>
                </tr>
                <tr>
                    <TD height="26" class='titulos2'><label for="depeBuscada">Dependencia</label></TD>
                    <TD valign="top" align="left"  class='listado2'>
                        <?php

                        /*by skina $sqlD = "select depe_nomb,depe_codi from dependencia 
                        where depe_codi_territorial = $depe_codi_territorial
                        order by depe_codi"; */
                        $sqlD = "select depe_nomb,depe_codi from dependencia  order by depe_codi";
                        $rsD = $db->conn->Execute($sqlD);
                        print $rsD->GetMenu2("depeBuscada","$depeBuscada",false, false, 0," class='select' id='depeBuscada' title='Listado de todas las dependencias existentes'> <option value=0>--- TODAS LAS DEPENDENCIAS --- </OPTION ");
                        //if(!$depeBuscada) $depeBuscada=$dependencia;
                        ?>    

                    </TD>
                </tr>
                <tr>
                    <td height="26" colspan="2" valign="top" class='titulos2'> <center>
                    <INPUT TYPE=submit name=generar_informe Value='<?= "Ver Radicados en Solicitud de Anulaci&oacute;n" ?>' class='botones_largo' aria-label="Mostrar cantidad de documentos que fueron solicitados para anulación">
                </center>
                </td>
                </tr>
            </TABLE>

            <HR>
            <?php
            if (!$fecha_busq)
                $fecha_busq = date("Y-m-d");
            if ($aceptar1 and ! $actaNo and ! $cancelarAnular)
                die("<font color=red><span class=etextomenu>Debe colocal el Numero de acta para poder anular los radicados</span></font>");

            if (($generar_informe or $aceptarAnular) and ! $cancelarAnular) {
                if ($depeBuscada and $depeBuscada != 0) {
                    $whereDependencia = " b.DEPE_CODI='$depeBuscada' AND";
                }
                include_once("../include/query/busqueda/busquedaPiloto1.php");
                include "$dir_raiz/include/query/anulacion/queryanularRadicados.php";
                error_reporting(7);
                $fecha_ini = $fecha_busq;
                $fecha_fin = $fecha_busq2;
                $fecha_ini = mktime(00, 00, 00, substr($fecha_ini, 5, 2), substr($fecha_ini, 8, 2), substr($fecha_ini, 0, 4));
                $fecha_fin = mktime(23, 59, 59, substr($fecha_fin, 5, 2), substr($fecha_fin, 8, 2), substr($fecha_fin, 0, 4));

                //Modificacion skina
                $query = "select $radi_nume_radi as radi_nume_radi, r.radi_fech_radi, r.ra_asun, r.radi_usua_actu,
                r.radi_depe_actu, r.radi_usu_ante, c.depe_nomb, b.sgd_anu_sol_fech, 
                " . $db->conn->substr . "(b.sgd_anu_desc, 21,250) as sgd_anu_desc
             from radicado r, sgd_anu_anulados b, dependencia c";
                $fecha_mes = substr($fecha_ini, 0, 7);
                // Si la variable $generar_listado_existente viene entonces este if genera la planilla existente
                $where_isql = " WHERE $whereDependencia    b.sgd_anu_sol_fecH BETWEEN " .
                        $db->conn->DBTimeStamp($fecha_ini) . " and " . $db->conn->DBTimeStamp($fecha_fin) .
                        " and SGD_EANU_CODI = 1 $whereTipoRadi and r.radi_nume_radi=b.radi_nume_radi and b.depe_codi = c.depe_codi";
                $order_isql = " ORDER BY  b.depe_codi, b.SGD_ANU_SOL_FECH";
                $query_t = $query . $where_isql . $order_isql;

                // Verifica el ultimo numero de acta del tipo de radicado

                $queryk = "Select max(usua_anu_acta) from sgd_anu_anulados where sgd_eanu_codi=2 and sgd_trad_codigo = $tipoRadicado";

                $c = $db->conn->Execute($queryk);
                $rsk = $db->query($queryk);

                //require "$ruta_raiz/class_control/class_control.php";
                require "../anulacion/class_control_anu.php";
                $db->conn->SetFetchMode(ADODB_FETCH_NUM);
                $btt = new CONTROL_ORFEO($db);
                $campos_align = array("C", "L", "L", "L");
                $campos_tabla = array("depe_nomb", "radi_nume_radi", "sgd_anu_sol_fech", "sgd_anu_desc");
                $campos_vista = array("Dependencia", "Radicado", "Fecha de Solicitud", "Observaci&oacute;n Solicitante");
                $campos_width = array(200, 100, 280, 300);
                $btt->campos_align = $campos_align;
                $btt->campos_tabla = $campos_tabla;
                $btt->campos_vista = $campos_vista;
                $btt->campos_width = $campos_width;
                
//                echo '****** '.$query_t;
                ?>
                <TABLE width="95%" class='borde_tab' border="1" cellspacing="3">
                    <TR>
                        <TD height="30" valign="middle"   class='titulos2' align="center" colspan="2" >Radicados en solicitud de anulaci&oacute;n</td></tr>
                    <tr><td width="16%" class='titulos5'>Fecha Inicial </td><td width="84%" class='listado2'><?= $fecha_busq ?> </td></tr>
                    <tr><td class='titulos5'>Fecha Final   </td><td class='listado2'><?= $fecha_busq2 ?> </tr>
                    <tr><td class='titulos5'>Fecha Generado </td><td class='listado2'><? echo date("Ymd - H:i:s"); ?></td></tr>
                </table>
                <?php
                $btt->tabla_sql($query_t);
                error_reporting(7);
                $html = $btt->tabla_html;
                //by skina
                $tabla_html2 = $html;
                $radAnular = $btt->radicadosEnv;
                $radObserva = $btt->radicadosObserva;

                //Se asigna el No. de la ultima acta + 1
                $k = $rsk->fields["0"] + 1;
            }
            if ($generar_informe) {
                ?>
                <center>
                    <br>Si esta seguro de Anular estos documentos por favor escriba el n&uacute;mero de acta y presione aceptar.<br>
                    <br>&Uacute;ltima acta generada de este tipo de radicado es la No. <? echo $rsk->fields["0"]; ?> <br> 

                    <!--
                    Skinatech
                    Autor: Andrés Mosquera
                    Fecha: 07-11-2018
                    Información: input de acta con maxlength(10) y readonly
                    -->
                    <br><label for="actaNo">Acta No.</label>    <input id="actaNp" title="N&uacute;mero del acta de anulaci&oacute;n" type=text name=actaNo class=tex_area value="<?php echo $rsk->fields["0"] + 1; ?>" maxlength="10" readonly="readonly"><br>
                    <!--
                    Skinatech
                    Autor: Andrés Mosquera
                    Fecha: 07-11-2018
                    Información: Fin input de acta con maxlength(10) y readonly
                    -->
                    <table class='borde_tab' align="center">
                        <tr><td>
                                <input type=button name=AcepAnular value=Aceptar class=botones onClick="soloNumeros();" aria-label="Al aceptar accede a anular los radicados listados entre los criterios dados"> 
                                <input type=Hidden name=aceptarAnular class=ebutton onClick="soloNumeros();"> 
                            </td><td>
                                <input type=submit name=cancelarAnular value=Cancelar class=botones aria-label="cancelar anulaci&oacute;n de documentos">
                            </td></tr>
                    </table>
                </center>
                <?php
            }

            //Se le asigna a actaNo el No. de acta que debe seguir
            $actaNo=$k;


            if ($aceptarAnular and $actaNo) {

                error_reporting(7);
                include_once "$dir_raiz/include/db/ConnectionHandler.php";
                $db = new ConnectionHandler("$dir_raiz");
                //*Inclusion territorial

                if ($depeBuscada == 0) {

                    /* by skina $sqlD = "select depe_nomb,depe_codi from dependencia 
                      where depe_codi_territorial = $depe_codi_territorial
                      order by depe_codi"; */
                    $sqlD = "select depe_nomb,depe_codi from dependencia order by depe_codi";
                    $db->conn->SetFetchMode(ADODB_FETCH_ASSOC);
                    $rsD = $db->conn->Execute($sqlD);
                    while (!$rsD->EOF) {
                        $depcod = $assoc == 0 ? $rsD->fields["depe_codi"] : $rsD->fields["DEPE_CODI"];
                        $lista_depcod .= " '$depcod',";
                        $rsD->MoveNext();
                    }
                    $lista_depcod .= "'0'";
                } else {
                    $lista_depcod = "'" . $depeBuscada . "'";
                }
                $where_depe = " and (depe_codi) in ($lista_depcod )";
                //*fin inclusion
                /*
                 * Variables que manejan el tipo de Radicacion
                 */
                $isqlTR = 'select sgd_trad_descr,sgd_trad_codigo from sgd_trad_tiporad where sgd_trad_codigo = ' . $tipoRadicado . '';
                $rsTR = $db->conn->Execute($isqlTR);
                if ($rsTR) {
                    $TituloActam = $assoc == 0 ? $rsTR->fields["sgd_trad_descr"] : $rsTR->fields["SGD_TRAD_DESCR"];
                } else {
                    $TituloActam = "sin titulo ";
                }

                $dbSel = new ConnectionHandler("$dir_raiz");
                //$dbSel->conn->debug = true;
                $dbSel->conn->SetFetchMode(ADODB_FETCH_ASSOC);
                $rsSel = $dbSel->conn->Execute($query_t);
                $i = 0;
//                echo '--------------------- '.$query_t;
                while (!$rsSel->EOF) {
                    $radAnularE[$i] = $assoc == 0 ? $rsSel->fields['radi_nume_radi'] : $rsSel->fields['RADI_NUME_RADI'];
                    $radObservaE[$i] = $assoc == 0 ? $rsSel->fields['sgd_anu_desc'] : $rsSel->fields['SGD_ANU_DESC'];
                    $i++;
                    $rsSel->MoveNext();
                }
//
                if (!$radAnularE)
                    die("<P><span class=etextomenu><CENTER><FONT COLOR=RED>NO HAY RADICADOS PARA ANULAR</FONT></CENTER><span>");
                else {
                    /*
                     * $where_TipoRadicado incluido 03082005 para filtrar por tipo radicacion del anulado
                     */

                    $where_TipoRadicado = " and sgd_trad_codigo = " . $tipoRadicado;
                    $Anulacion = new Anulacion($db);
                    $observa = "Radicado Anulado. (Acta No $actaNo)";
                    $noArchivo = "/pdfs/planillas/ActaAnul_$dependencia" . "_" . "$tipoRadicado" . "_" . "$actaNo.pdf";
                    $radicados = $Anulacion->genAnulacion($radAnularE, $dependencia, $usua_doc, $observaE, $codusuario, $actaNo, $noArchivo, $where_depe, $where_TipoRadicado, $tipoRadicado, $rsk->fields["0"]);

                    $Historico = new Historico($db);
                    /** Funcion Insertar Historico 
                     *
                     * ($radicados,  $depeOrigen, $depeDest, $usDocOrigen , $usDocDest, $usCodOrigen, $usCodDest, $observacion, $tipoTx)
                     *
                     */
                    $radicados = $Historico->insertarHistorico($radAnularE, $dependencia, $codusuario, $depe_codi_territorial, 1, $observa, 26);

                    //Inclusion de radicados anulados en NRR automaticamente
                    require_once "$dir_raiz/include/tx/Tx.php";
                    $observaArchivoNRR = "Radicado archivado automaticamente como NRR por Anulacion";
                    $Tx = new Tx($db);
                    $rad_archivados = $Tx->nrr($radAnularE, $codusuario, $dependencia, $codusuario, $observaArchivoNRR);

                    //Fin inclusion NRR
                    //define(FPDF_FONTPATH,'../include/fpdf/font/');
                    $radAnulados = join(",", $radAnularE);
                    error_reporting(7);
                    $radicadosPdf = "";
                    foreach ($radAnularE as $id => $noRadicado) {
                        $radicadosPdf .= '<tr><td align="center" colspan="2">' . $radAnularE[$id] . '</td><td align="center" colspan="4">' . $radObservaE[$id] . "</td></tr>";
                    }
                    $anoActual = date("Y");
                    error_reporting(7);

                    //include ("$dir_raiz/include/fpdf/html2pdf.php");

                    $fecha = date("d-m-Y");
                    $fecha_hoy_corto = date("d-m-Y");

                    /* include "$dir_raiz/class_control/class_gen.php";
                      $b = new CLASS_GEN();
                      $date =  date("m/d/Y");
                      $fecha_hoy =  $b->traducefecha($date); */

                    require_once('../include/tcpdf/config/lang/spa.php');
                    require_once('../include/tcpdf/tcpdf.php');
                    $pdf = new TCPDF('P', PDF_UNIT, "FOLIO", true, 'UTF-8', false);
                    $pdf->AddPage();

                    /***
                    Skinatech
                    Autor: Andrés Mosquera
                    Fecha: 06-11-2018
                    Información: Se reemplaza la tilde html por el utf8 para codificar el texto y que salga de la manera adecuada
                    ***/
                    //$entidad = strtoupper($db->entidad);
                    $entidad = strtoupper($db->entidad);
                    $entidadReplaceTildeHtml = str_replace("&OACUTE;", "Ó", $entidad);
                    $nit_entidad = $_SESSION['nit_entidad'];

                    $empo_encabeza = <<<EOD
<html lang="es">
<head>
<meta http-equiv="Content-Type" content="text/html; charset="UTF-8" />
<title>Acta de anulacion</title>
</head>

<body>
<table width="550" border="1">
  <tr>
    <td width="80" rowspan="4"><img src="../logoEntidad.jpg" align="middle"  width="80" height="40" /></td>
    <td colspan="5"><div align="center">$entidadReplaceTildeHtml</div></td>
  </tr>
  
  <tr>
    <td colspan="5"><div align="center">$nit_entidad</div></td>
  </tr>
  <tr>
    <td colspan="5"><div align="center">ACTA DE ANULACI&Oacute;N CONSECUTIVOS RADICACI&Oacute;N</div></td>
  </tr>
  <tr>
    <td colspan="5"><div align="center">GESTIÓN DOCUMENTAL</div></td>
  </tr>
  <tr>
    <td align="center" colspan="6"><strong>ACTA No.</strong> $actaNo</td>
  </tr>
  <tr>
    <td colspan="1"><div align="center"><STRONG>LUGAR Y FECHA</STRONG></div></td>
    <td colspan="3">&nbsp;</td>
    <td ><div align="center"><strong>PAGINA</strong></div></td>
    <td ><div align="center">1 de 1</div></td>
  </tr>
  <tr>
    <td height="105" colspan="6"><div></div><div align="justify">En cumplimiento a lo establecido en el Acuerdo No. 060 del 30 de octubre de 2001 expedido por el Archivo General de la nación, en el cual se establecen pautas para la administración de las comunicaciones oficiales en las entidades públicas y privadas que cumplen funciones públicas.</div><div align="justify">ARTICULO QUINTO: Procedimientos para la radicación de comunicaciones oficiales - PARAGRAFO: Cuando existan errores en la radicación y se anulen los números, se debe dejar constancia por escrito, con la respectiva justificación y firma del Jefe de la unidad de correspondencia.</div><div align="justify">Siendo así se deja constancia de anulación de el (los) siguiente(s) número(s) de radicación:</div><div></div></td>
  </tr>
  <tr>
    <td colspan="2"><div align="center"><STRONG>No. Radicado</STRONG></div></td>
    <td colspan="4"><div align="center"><STRONG>Justificacón del Solicitante</STRONG></div></td>
  </tr>
EOD;

                    //$pdf->WriteHTML($encabezado. $html);
                    //Imprimeindo intento 1
                    $empo_pie = <<<EOD
<tr>
    <td colspan="6">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="6"> Para constancia , se firma en Bogotá, el $fecha_hoy</td>
  </tr>
  <tr>
    <td colspan="6">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="6"><div align="center">
      <p>&nbsp;</p>
      <p>_____________________________</p>
      <p>FIRMA RESPONSABLE ARCHIVO    </p>
    </div></td>
  </tr>
</table>
</body>
</html>
EOD;

                    $html = $empo_encabeza . $radicadosPdf . $empo_pie;
                    if (ini_get('magic_quotes_gpc') == '1')
                        $html = stripslashes($html);

//$pdf->WriteHTML($html, true, false,false, false, '');

                    $pdf->WriteHTML($html, true, false, false, false, '');
                    //$pdf->WriteHTML($html);
                    //save and redirect
                    $noArchivo = "../bodega" . $noArchivo;
                    $pdf->Output($noArchivo, "F");
                    ?>
                    <center>Ver  <a href='<?= $noArchivo ?>'>Acta No <?= $actaNo ?> </a></center>
                    <?php
                    // exit;
                }
            }
            ?>
    </form>
