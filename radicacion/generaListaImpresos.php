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
$gen_lisDefi = $_POST["gen_lisDefi"];
$cancelarListado = $_POST["cancelarListado"];
$checkValue = $_POST["checkValue"];
$dep_sel = $_GET["dep_sel"];
$fecha_busqH = $_GET["fecha_busqH"];
$fecha_busq = $_GET["fecha_busq"];
$hora_ini = $_GET["hora_ini"];
$minutos_ini = $_GET["minutos_ini"];
$hora_fin = $_GET["hora_fin"];
$minutos_fin = $_GET["minutos_fin"];

if (!$_SESSION["dependencia"] and ! $_SESSION["depe_codi_territorial"])
    include "../rec_session.php";
include_once dirname(__FILE__) . DIRECTORY_SEPARATOR . ".." . DIRECTORY_SEPARATOR . "config.php";
$htmlE = "";

function get_dep_name($iadb, $num_radica) {
    $asql = "SELECT depe_nomb FROM dependencia WHERE depe_codi='$num_radica'";
    $ars_dep = $iadb->conn->Execute($asql);
    return $ars_dep->fields['DEPE_NOMB'];
}

foreach ($_GET as $key => $valor)   ${$key} = $valor;
foreach ($_POST as $key => $valor)   ${$key} = $valor;

//define('ADODB_FETCH_ASSOC', $assoc);
//error_reporting(7);
?>
<html>
    <head>
        <title>Untitled Document</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link href="<?= $url_raiz . $ESTILOS_PATH2 ?>bootstrap.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="<?= $url_raiz . $_SESSION['ESTILOS_PATH_ORFEO'] ?>">
    </head>
    <body>
        <?php
        include_once "$dir_raiz/include/db/ConnectionHandler.php";
        $db = new ConnectionHandler("$dir_raiz");
//        $db->conn->debug = true;
        $ADODB_FETCH_MODE = ADODB_FETCH_ASSOC;
        if ($gen_lisDefi and ! $cancelarListado) {
            $indi_generar = "SI";
        } else {
            $indi_generar = "NO";
        }

        if ($indi_generar == "SI") {
            ?>
        <center>
            <table class=borde_tab width='95%' cellspacing="5">
                <tr>
                    <td class=titulos2><center>Listado documentos radicados</center></td>
                </tr>
            </table>
        </center>
        <form name='forma' action='generaListaImpresos.php?<?= session_name() . "=" . session_id() . "&krd=$krd&hora_ini=$hora_ini&hora_fin=$hora_fin&minutos_ini=$minutos_ini&minutos_fin=$minutos_fin&tip_radi=$tip_radi&fecha_busq=$fecha_busq&fecha_busqH=$fecha_busqH&fecha_h=$fechah&dep_sel=$dep_sel&num=$num" ?>' method=post>
            <?php
            $fecha_ini = $fecha_busq . ":" . $hora_ini . ":" . $minutos_ini;
            $fecha_fin = $fecha_busqH . ":" . $hora_fin . ":" . $minutos_fin;
            
            if ($checkValue) {
                $num = count($checkValue);
                $i = 0;
                while ($i < $num) {
                    $record_id = key($checkValue);
                    $radicadosSel[$i] = $record_id;
                    $setFiltroSelect .= "'" . $record_id . "'";
                    if ($i <= ($num - 2)) {
                        $setFiltroSelect .= ",";
                    }
                    next($checkValue);
                    $i++;
                }
                if ($radicadosSel)
                    $whereFiltro = " and c.radi_nume_radi in($setFiltroSelect)";
            } // FIN  if ($checkValue)

            if ($setFiltroSelect)
                $filtroSelect = $setFiltroSelect;
            if ($filtroSelect) {

                // En este proceso se utilizan las variabels $item, $textElements, $newText que son temporales para esta operacion.
                $filtroSelect = trim($filtroSelect);
                $textElements = split(",", $filtroSelect);
                $newText = "";
                foreach ($textElements as $item) {
                    $item = trim($item);
                    if (strlen($item) != 0) {
                        if (strlen($item) <= 6)
                            $sec = str_pad($item, 6, "0", STR_PAD_left);
                    }
                }
            } // FIN if ($filtroSelect)
            
            //Condicion Dependencia
            if (strlen($orderNo) == 0) {
                $orderNo = "1";
                $order = 2;
            } else {
                $order = $orderNo + 1;
            }

            if ($dep_sel != 0)
                $dependencia_busq2 = " and h.depe_codi_dest = '$dep_sel'";
            //Construccion Condicion de Fechas//
            $fecha_ini = $fecha_busq;
            $fecha_fin = $fecha_busqH;
            $fecha_ini = mktime($hora_ini, $minutos_ini, 00, substr($fecha_busq, 5, 2), substr($fecha_busq, 8, 2), substr($fecha_busq, 0, 4));
            $fecha_fin = mktime($hora_fin, $minutos_fin, 59, substr($fecha_busqH, 5, 2), substr($fecha_busqH, 8, 2), substr($fecha_busqH, 0, 4));

            $where_fecha = " and c.radi_fech_radi BETWEEN " . $db->conn->DBTimeStamp($fecha_ini) . " and " . $db->conn->DBTimeStamp($fecha_fin);
            //Condicion Tipo Radicacion
            if ($tip_radi == 0) {
                $where_tipRadi = "";
            } else {
                $where_tipRadi = " and c.radi_nume_radi like '%$tip_radi'";
            }

            include "$dir_raiz/include/query/radicacion/queryListaImpresos.php";
            $db->conn->SetFetchMode(ADODB_FETCH_ASSOC);
            $rsMarcar = $db->conn->Execute($isql);
            $db->conn->SetFetchMode(ADODB_FETCH_ASSOC);
            $no_registros = 0;

            //$no_registros = $rsMarcar->recordcount(); 
            $radiNumero = $rsMarcar->fields["NUMERO_RADICADO"];
            
            if ($radiNumero == '') {
                $estado = "Error";
                $mensaje = "Verifique...";
                foreach ($textElements as $item) {
                    $verrad_sal = trim($item);
                }
                echo "<script>alert('No se puede Generar el Listado $verrad_sal . $mensaje  ')</script>";
            } else {

                // By Skinatech - 14/08/2018
                // Para la construcción del número de radicado, esto indica la parte inicial del radicado.
                if ($estructuraRad == 'ymd') {
                    $num = 8;
                } elseif ($estructuraRad == 'ym') {
                    $num = 6;
                } else {
                    $num = 4;
                }

                //Modificacion 28112005
                //Modificacion skina 040411
                $sql = "select depe_nomb from dependencia where depe_codi='$dep_sel'";
                $rs_dep = $db->conn->Execute($sql);
                $dep_sel_nomb = $rs_dep->fields['DEPE_NOMB'];
                //Modificado skina 31-10-08
                $archivo = "../bodega/pdfs/planillas/radicacion/$krd" . date("Ymd_hms") . "_lis_IMP.txt";
                $fp = fopen($archivo, "w");
                $com = chr(34);
                $tab = chr(9);
                $contenido = "$com*Radicado*$com$tab$com*Fecha Radicado*$com$tab$com*Asunto*$com$tab$com*Tipo de Documento*$com$tab$com*Remitente*$com$tab$com*Valor de factura*$com\n";
                $query_t = $isql;

                $dir_raiz = "..";
                //error_reporting(7);
                define('ADODB_FETCH_NUM', $assoc);
                $ADODB_FETCH_MODE = ADODB_FETCH_NUM;
                //require "../radicacion/classControlLis.php";
                require "../radsalida/classControlLis.php";
                $btt = new CONTROL_ORFEO($db);
                $campos_align = array("C", "C", "C", "C", "C", "C", "C", "C", "C", "C", "C");
                //$campos_tabla = array("$verrad_sal","$fecha_radi","$no_facturia","$asunto","$sgd_tpr_codigo","$rem_destino","$valor_factura");
                $campos_vista = array("Fecha Radicado", "Radicado", "Empresa", "Nombre", "Asunto", "Dependencia", "Colaborador", "Dirección");
                $campos_width = array(120, 120, 120, 120, 250, 120, 120, 120);
                
                $btt->campos_align = $campos_align;
                $btt->campos_tabla = $campos_tabla;
                $btt->campos_vista = $campos_vista;
                $btt->campos_width = $campos_width;
                $btt->tabla_sql($query_t, $fecha_ini, $fecha_fin);
                $htmlE = $btt->tabla_htmlE;
                //Fin Modificacion 28112005
                while (!$rsMarcar->EOF) {
                    $no_registros = $no_registros + 1;
                    $mensaje = "";
                    $verrad_sal = $rsMarcar->fields["NUMERO_RADICADO"];
                    $fecha_radi = $rsMarcar->fields["FECHA_RADICADO"];
                    $remitente = $rsMarcar->fields["EMPRESA"];
                    $nombre = $rsMarcar->fields["NOMBRE"];
                    $asunto = $rsMarcar->fields["ASUNTO"];
                    $usuarioResponsable = $rsMarcar->fields["USUARIO"];
                    $direccionEnvio = $rsMarcar->fields["DIRECCION"];
                    $fecha = substr($fecha_radi, 0, 16);
                    $dep_radicado = substr($verrad_sal, $num, $longitud_codigo_dependencia);
                    $ano_radicado = substr($verrad_sal, 0, 4);
                    $carp_codi = substr($dep_radicado, 0, 2);
                    $radi_path_sal = "/$ano_radicado/$dep_radicado/docs/$ref_pdf";
                    //by skina 
                    $radi_depe_actu = get_dep_name($db, $rsMarcar->fields["RADI_DEPE_ACTU"]);
                    $radi_depe_radi = get_dep_name($db, $rsMarcar->fields["RADI_DEPE_RADI"]);

                    if (substr($verrad_sal, -1) == 2 or substr($verrad_sal, -1) == 4 or substr($verrad_sal, -1) == 7) {
                        $destino = "$radi_depe_actu";
                    } else {
                        $destino = $rem_destino;
                        $rem_destino = "$radi_depe_radi";
                    }

                    $campos_tabla_pdf[] = array("$fecha", "$verrad_sal", "$remitente", "$nombre", "$asunto", "$rem_destino", "$usuarioResponsable", "$direccionEnvio");

                    $campos_tabla = array("$fecha", "$verrad_sal", "$remitente", "$nombre", "$asunto", "$rem_destino", "$usuarioResponsable", "$direccionEnvio");
                    $btt->campos_tabla = $campos_tabla;
                    $btt->tabla_Cuerpo();
                    //error_reporting(7);
                    $contenido = $contenido . "$tab$fecha$tab$tab$tab$verrad_sal$remitente$tab$tab$tab$nombre$tab$tab$tab$tab$tab$tab$rem_destino$tab$tab$tab$asunto$tab$tab$tab$rem_destino$tab$tab$tab$usuarioResponsable$tab$tab$tab$direccionEnvio$tab$tab$tab\n";
                    //Fin Modificacion 28112005
                    $rsMarcar->MoveNext();
                } // FIN del WHILE (!$rsMarcar->EOF)

                $no_planilla = $db->conn->nextId('SEC_PLANILLA', $driver);
                fputs($fp, $contenido);
                fclose($fp);
                $fecha_dia = date("Ymd - H:i:s");
                $html = $htmlE;
                $html .= $btt->tabla_html;
                error_reporting(7);

                // by skina
                // Cambio de clase y progrma para generar los PDF's
                $entidad = strtoupper($db->entidad);
                $entidad = str_replace("&OACUTE;", "Ó", $entidad);
                $nit_entidad = $_SESSION['nit_entidad'];
                $dependenciaPlanila = $_SESSION["depe_nomb"];
                $encaenti = "";
                define(FPDF_FONTPATH, $dir_raiz . '/include/fpdf/font/');
                require($dir_raiz . "/include/fpdf/html_table.php");
                $pdf = new PDF("L", "mm", "Letter");
                $pdf->setMargins(2, 10, 2);
                $pdf->AddPage();

                /***
                Skinatech
                Autor: Andrés Mosquera
                Fecha: 21-11-2018
                Información: Se crearon las tablas por medio de la librería fpdf
                ***/

                //print_r($_SERVER["DOCUMENT_ROOT"])

                $pdf->Image('../logoEntidad.jpg', 5, 10, 50);

                $pdf->SetFont('Arial', 'B', 10);
                    $pdf->cell(60, 5, '', 'TLR', 0);
                    $pdf->cell(0, 5, '', 'TLR', 1);
                    $pdf->cell(60, 5, '', 'LR', 0);
                    $pdf->cell(0, 5, $entidad, 'BLR', 1, 'C');

                $pdf->SetFont('Arial', 'B', 9);
                    $pdf->cell(60, 5, '', 'LR', 0);
                    $pdf->cell(0, 5, 'PLANILLA DE CORRESPONDENCIA RECIBIDA', 1, 1, 'C');

                $pdf->SetFont('Arial', 'B', 8);
                    $pdf->cell(60, 5, '', 'LR', 0);
                    $pdf->cell(69.5, 5, 'USUARIO RESPONSABLE', 1, 0, 'C');
                    $pdf->cell(69.5, 5, 'DEPENDENCIA ENTREGA', 1, 0, 'C');
                    $pdf->cell(0, 5, 'FECHA DE ENTREGA', 1, 1, 'C');

                $pdf->SetFont('Arial', '', 8);
                    $pdf->cell(60, 5, '', 'BLR', 0);
                    $pdf->cell(69.5, 5, $usua_nomb, 1, 0, 'C');
                    $pdf->cell(69.5, 5, $dependenciaPlanila, 1, 0, 'C');
                    $pdf->cell(0, 5, $fecha_dia, 1, 1, 'C');

                    $pdf->cell(0, 7, '', 0, 1);

                    $campos_width_pdf = array(100, 130, 100, 100, 270, 160, 120, 120);
                    $htmlPdf = '<table border="1" width="100%">';
                        $htmlPdf .= '<tr>';

                            for($j = 0; $j < count($campos_vista); $j++)
                            {
                                $htmlPdf .= '<td bgcolor="#CCCCCC" width="'. $campos_width_pdf[$j] .'"><b>'. $campos_vista[$j] .'</b></td>';
                            }

                        $htmlPdf .= '</tr>';

                        for($f = 0; $f < $no_registros; $f++)
                        {
                            $htmlPdf .= '<tr>';

                                for($j = 0; $j < count($campos_vista); $j++)
                                {
                                    if(empty($campos_tabla_pdf[$f][$j]) || $campos_tabla_pdf[$f][$j] == '' || strlen($campos_tabla_pdf[$f][$j]) == 0 || strlen($campos_tabla_pdf[$f][$j]) == 1)
                                    {
                                        $htmlPdf .= '<td width="'. $campos_width_pdf[$j] .'">-</td>';
                                    } else {
                                        $htmlPdf .= '<td width="'. $campos_width_pdf[$j] .'">'. $campos_tabla_pdf[$f][$j] .'</td>';
                                    }
                                }

                            $htmlPdf .= '</tr>';
                        }
                    $htmlPdf .= '</table>';

                    /*for($j = 0; $j < count($campos_vista); $j++)
                    {
                        $pdf->cell($campos_width_pdf[$j], 5, utf8_decode($campos_vista[$j]), 1, 0, 'C', true);
                    }*/
                    $pdf->WriteHTML($htmlPdf);

                $pdf->SetFont('Arial', '', 8);
                    $pdf->cell(0, 7, '', 0, 1);

                    $pdf->cell(30, 5, 'Fecha de Entrega', 0, 0);
                    $pdf->cell(0, 5, '', 'B', 1);

                    $pdf->cell(30, 5, 'Usuario que Entrega', 0, 0);
                    $pdf->cell(0, 5, '', 'B', 1);

                    $pdf->cell(0, 5, '', 0, 1);

                    $pdf->cell(30, 5, 'Observaciones', 0, 0);
                    $pdf->cell(0, 5, '', 'B', 1);
                    $pdf->cell(0, 5, '', 'B', 1);
                    $pdf->cell(0, 5, '', 'B', 1);

                /*$encabezado = '
                    <table border="1" cellpadding="1" cellspacing="1">
                        <tbody>
                            <tr>
                                <td colspan="4" rowspan="6" align="center"></td>
                                <td colspan="7" rowspan="2" align="center"><br><br><small><strong>'.utf8_decode($entidad).'</strong></small></td>
                                <td colspan="3" ><small><strong>'. utf8_decode("CÓDIGO") .':</strong> 306-101.1-PRO02-FOR01</small></td>
                            </tr>
                            <tr align="center">
                                <td colspan="3" ><small><strong>'. utf8_decode("VERSIÓN") .':</strong> 1</small></td>
                            </tr>
                            <tr align="center">
                                <td colspan="7" ><small><strong>'. utf8_decode("COMUNICACIÓN") .' RECIBIDA</strong></small></td>
                                <td colspan="3" ><small><strong>FECHA '. utf8_decode("CREACIÓN") .': </strong>13/10/2009</small></td>
                            </tr>
                            <tr align="center">
                                <td colspan="4" ><small><strong>USUARIO RESPONSABLE</strong></small></td>
                                <td colspan="3" ><small><strong>DEPENDENCIA ENTREGA</strong></small></td>
                                <td colspan="3" ><small><strong>FECHA DE ENTREGA</strong></small></td>
                            </tr>
                            <tr align="center">
                                <td colspan="4"><small>'.$usua_nomb.'</small></td>
                                <td colspan="3"><small>'.$dependenciaPlanila.'</small></td>
                                <td colspan="3" ><small>'.$fecha_dia.'</small></td>
                            </tr>
                        </tbody>
                    </table>
                    <br>
                    <table border="1">
                        <tr align="center">
                            <td colspan="2" rowspan="2" align="center" bgcolor="#BDBDBD"><small><br><br><strong>FECHA RADICADO        </strong></small></td>
                            <td colspan="2" rowspan="2" align="center" bgcolor="#BDBDBD"><small><br><br><strong>RADICADO            </strong></small></td>
                            <td colspan="4" rowspan="1" align="center" bgcolor="#BDBDBD"><small><br><strong>DATOS REMITENTE     </strong></small></td>
                            <td colspan="2" rowspan="2" align="center" bgcolor="#BDBDBD"><small><br><br><strong>ASUNTO          </strong></small></td>
                            <td colspan="6" rowspan="1" align="center" bgcolor="#BDBDBD"><small><br><strong>DATOS DESTINATARIO  </strong></small></td>
                            <td colspan="2" rowspan="2" align="center" bgcolor="#BDBDBD"><small><br><br><strong>Firma Recibido </strong></small></td>
                        </tr>
                        <tr>
                            <td colspan="2" rowspan="2" align="center" bgcolor="#BDBDBD"><small><br><strong>Nombre Remitente          </strong></small></td>
                            <td colspan="2" rowspan="2" align="center" bgcolor="#BDBDBD"><small><br><strong>Responsable           </strong></small></td>
                            <td colspan="2" rowspan="2" align="center" bgcolor="#BDBDBD"><small><br><strong>Nombre/Raz.Social      </strong></small></td>
                            <td colspan="2" rowspan="2" align="center" bgcolor="#BDBDBD"><small><br><strong>Dignatario      </strong></small></td>
                            <td colspan="2" rowspan="2" align="center" bgcolor="#BDBDBD"><small><br><strong>Dirección     </strong></small></td>
                        </tr>
                    </table>';

                $fin = "
                    <table border=0 >
                        <tr><td width=1120 height=40></td></tr>
                        <tr><td width=1120 height=40 ><small> Fecha de Entrega     </small>    ________________________________________________</td></tr>
                        <tr>
                            <td width=560 height=40 ><small> Usuario que Entrega </small> ________________________________________________</td>
                            <td width=560 height=30 ><small> Usuario que Recibe  </small> ______________________________________________</td>
                        </tr>
                        <tr><td width=1120 height=40 ><small> Observaciones  </small>    _________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________</td></tr>
                        <tr><td width=1120 height=40></td></tr>
                    </table>
                <br>";

                //$pdf->WriteHTML($encabezado . $html . $fin);*/
                $arpdf_tmp = "$dir_raiz/bodega/pdfs/planillas/radicacion/$krd" . date("Ymd_hms") . "_lis_IMP.pdf";
                $pdf->Output($arpdf_tmp, 'F');
                echo '<div style=margin-left: 2%; margin-top: 1%;>';
                echo "Se genero la planilla No. $no_planilla";
                echo "<br>";
                echo "Para obtener el archivo pdf haga click en el siguiente vinculo <a class=vinculos href='$arpdf_tmp' target='" . date("dmYh") . time("his") . "'>Abrir Archivo Pdf</a>";
                echo "<br>";
                $salida = "csv";
                //modificado skina 31-10-08
                //cambio de csv a txt
                echo "Para obtener el archivo txt guarde del destino del siguiente v&iacute;nculo  <a class=vinculos href='$archivo' target='" . date("dmYh") . time("his") . "'>Generado
        </a>";
                echo '</div>';
            }
            //FIN else if ($no_registros <=0)
            ?>
        </form>
        <?php
    } else {
        echo "<hr><center><b><span class='alarmas'>Operacion CANCELADA</span></center></b></hr>";
    }
    ?>  
</body>
</html>

