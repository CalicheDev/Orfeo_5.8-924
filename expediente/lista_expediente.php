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
$imagenes = $_SESSION["imagenes"];
$tipoRadicadoPqr = $_SESSION["tipoRadicadoPqr"];
$assoc = $_SESSION['assoc'];
/* ---------------------------------------------------------+
  |                       MAIN                               |
  +--------------------------------------------------------- */

// Ajuste para adaptarse al cambio de m�todo (de POST a GET) en el script verradicado.php
( isset($_POST['orden']) && $_POST['orden'] != '' ) ? $orden = $_POST['orden'] : $orden = $_GET['orden'];
( isset($_POST['verBorrados']) && $_POST['verBorrados'] != '' ) ? $verBorrados = $_POST['verBorrados'] : $verBorrados = $_GET['verBorrados'];
( isset($_POST['anexosRadicado']) && $_POST['anexosRadicado'] != '' ) ? $anexosRadicado = $_POST['anexosRadicado'] : $anexosRadicado = $_GET['anexosRadicado'];
( isset($_POST['expIncluido'][0]) && $_POST['expIncluido'][0] != '' ) ? $expIncluido = $_POST['expIncluido'][0] : $expIncluido = $_GET['expIncluido'][0];
( isset($_POST['verBorrados']) && $_POST['verBorrados'] != '' ) ? $verBorrados = $_POST['verBorrados'] : $verBorrados = $_GET['verBorrados'];
( isset($_POST['ordenarPor']) && $_POST['ordenarPor'] != '' ) ? $ordenarPor = $_POST['ordenarPor'] : $ordenarPor = $_GET['ordenarPor'];

//$numrad = $_POST['numrad'];
$verrad = $_GET['verrad'];
?>
<html>
    <head>
        <title>.: Modulo total :.</title>
        <script>
            function regresar() {
                window.location.reload();
                window.close();
            }

            function verTipoExpediente(numeroExpediente, codserie, tsub, tdoc, opcionExp) {
                <?php
                //$db->conn->debug=true;
                $isqlDepR = "SELECT RADI_DEPE_ACTU,  RADI_USUA_ACTU  FROM radicado WHERE RADI_NUME_RADI = '$numrad'";
                $rsDepR = $db->conn->Execute($isqlDepR);
                $coddepe = $rsDepR->fields['RADI_DEPE_ACTU'];
                $codusua = $rsDepR->fields['RADI_USUA_ACTU'];
                $ind_ProcAnex = "N";
                $fechaH = Date("Ymdhis");
                ?>
                                window.open("<?= $ruta_raiz ?>/expediente/tipificarExpediente.php?opcionExp=" + opcionExp + "&numeroExpediente=" + numeroExpediente + "&nurad=<?= $verrad ?>&codserie=" + codserie + "&tsub=" + tsub + "&tdoc=" + tdoc + "&krd=<?= $krd ?>&dependencia=<?= $dependencia ?>&fechaExp=<?= $radi_fech_radi ?>&codusua=<?= $codusua ?>&coddepe=<?= $coddepe ?>", "MflujoExp<?= $fechaH ?>", "height=600,width=750,scrollbars=yes");
                            }

                            function verHistExpediente(numeroExpediente, codserie, tsub, tdoc, opcionExp) {
                <?php
                $isqlDepR = "SELECT RADI_DEPE_ACTU,RADI_USUA_ACTU from radicado WHERE RADI_NUME_RADI = '$numrad'";
                $rsDepR = $db->conn->Execute($isqlDepR);
                $coddepe = $rsDepR->fields['RADI_DEPE_ACTU'];
                $codusua = $rsDepR->fields['RADI_USUA_ACTU'];
                $ind_ProcAnex = "N";
                ?>
                window.open("<?= $ruta_raiz ?>/expediente/verHistoricoExp.php?sessid=<?= session_id() ?>&opcionExp=" + opcionExp + "&numeroExpediente=" + numeroExpediente + "&nurad=<?= $verrad ?>&krd=<?= $krd ?>&ind_ProcAnex=<?= $ind_ProcAnex ?>", "HistExp<?= $fechaH ?>", "height=680,width=1270,scrollbars=yes");
            }

            function crearProc(numeroExpediente) {
                window.open("<?= $ruta_raiz ?>/expediente/crearProceso.php?sessid=<?= session_id() ?>&numeroExpediente=" + numeroExpediente + "&nurad=<?= $verrad ?>&krd=<?= $krd ?>&ind_ProcAnex=<?= $ind_ProcAnex ?>", "HistExp<?= $fechaH ?>", "height=400,width=850,scrollbars=yes");
            }

            function verTipoExpedienteOld(numeroExpediente) {
                <?php
                $isqlDepR = "SELECT RADI_DEPE_ACTU,RADI_USUA_ACTU from radicado WHERE RADI_NUME_RADI = '$numrad'";
                $rsDepR = $db->conn->Execute($isqlDepR);
                $coddepe = $rsDepR->fields['RADI_DEPE_ACTU'];
                $codusua = $rsDepR->fields['RADI_USUA_ACTU'];
                $ind_ProcAnex = "N";
                ?>
                window.open("<?= $ruta_raiz ?>/expediente/tipificarExpedienteOld.php?numeroExpediente=" + numeroExpediente + "&nurad=<?= $verrad ?>&krd=<?= $krd ?>&dependencia=<?= $dependencia ?>&fechaExp=<?= $radi_fech_radi ?>&codusua=<?= $codusua ?>&coddepe=<?= $coddepe ?>", "Tipificacion_Documento", "height=450,width=750,scrollbars=yes");
            }

            function modFlujo(numeroExpediente, texp, codigoFldExp) {
                <?php
                $isqlDepR = "SELECT RADI_DEPE_ACTU,RADI_USUA_ACTU from radicado WHERE RADI_NUME_RADI = '$numrad'";
                $rsDepR = $db->conn->Execute($isqlDepR);
                $coddepe = $rsDepR->fields['RADI_DEPE_ACTU'];
                $codusua = $rsDepR->fields['RADI_USUA_ACTU'];
                $ind_ProcAnex = "N";
                ?>
                window.open("<?= $ruta_raiz ?>/flujo/modFlujoExp.php?codigoFldExp=" + codigoFldExp + "&krd=<?= $krd ?>&numeroExpediente=" + numeroExpediente + "&numRad=<?= $verrad ?>&texp=" + texp + "&krd=<?= $krd ?>&ind_ProcAnex=<?= $ind_ProcAnex ?>&codusua=<?= $codusua ?>&coddepe=<?= $coddepe ?>", "TexpE<?= $fechaH ?>", "height=250,width=750,scrollbars=yes");
            }

            function Responsable(numeroExpediente) {
                <?php
                $isqlDepR = "SELECT RADI_DEPE_ACTU,RADI_USUA_ACTU FROM radicado WHERE RADI_NUME_RADI = '$numrad'";
                $rsDepR = $db->conn->Execute($isqlDepR);
                $coddepe = $rsDepR->fields['RADI_DEPE_ACTU'];
                $codusua = $rsDepR->fields['RADI_USUA_ACTU'];
                $isql = "SELECT USUA_DOC_RESPONSABLE  FROM SGD_SEXP_SECEXPEDIENTES WHERE SGD_EXP_NUMERO = '$numeroExpediente'";
                $rs = $db->conn->Execute($isql);
                $responsable = $rs->fields['USUA_DOC_RESPONSABLE'];
                ?>

                window.open("<?= $ruta_raiz ?>/expediente/responsable.php?&numeroExpediente=" + numeroExpediente +
                        "&numRad=<?= $verrad ?>&krd=<?= $krd ?>&ind_ProcAnex=<?= $ind_ProcAnex ?>&responsable=<?= $responsable ?>&coddepe=<?= $coddepe ?>&codusua=<?= $codusua ?>", "Responsable", "height=200,width=600,scrollbars=yes");
            }

            function CambiarE(est, numeroExpediente) {
                window.open("<?= $ruta_raiz ?>/archivo/cambiar.php?krd=<?= $krd ?>&numRad=<?= $verrad ?>&expediente=" + numeroExpediente + "&est=" + est + "&dependencia=<?= $dependencia ?>", "Cambio Estado Expediente", "height=70,width=300,scrollbars=yes");
            }

            function insertarExpediente() {
                //    window.open( "<?= $ruta_raiz ?>/expediente/insertarExpediente.php?sessid=<?= session_id() ?>&nurad=<?= $verrad ?>&krd=<?= $krd ?>&ind_ProcAnex=<?= $ind_ProcAnex ?>","HistExp<?= $fechaH ?>","height=300,width=600,scrollbars=yes" );
                <?php
                $whereFiltro .= ' b.radi_nume_radi = ' . $verrad . ' or';
                $whereFiltro2 .= '' . $verrad . ',';
                ?>
                window.open('<?= $ruta_raiz ?>/expediente/insertarExpedienteMultiple.php?whereFiltro=<?= $whereFiltro ?>&whereFiltro2=<?= $whereFiltro2 ?>&krd=<?= $krd ?>', 'Incluir radicados en Expedientes', 'height=500,width=750,scrollbars=yes');
            }

            function crearExpediente() {
                numExpediente = document.getElementById('num_expediente').value;
                numExpedienteDep = document.getElementById('num_expediente').value.substr(4,<?= $longitud_codigo_dependencia ?>);
                if (numExpedienteDep ==<?= $dependencia ?>) {
                    if (numExpediente.length == 13) {
                        insertarExpedienteVal = true;
                    } else {
                        alert("Error. El numero de digitos debe ser de 13.");
                        insertarExpedienteVal = false;
                    }
                } else {
                    alert("Error. Para crear un expediente solo lo podra realizar con el codigo de su dependencia. ");
                    insertarExpedienteVal = false;
                }
                if (insertarExpedienteVal == true) {
                    respuesta = confirm("Esta apunto de crear el EXPEDIENTE No. " + numExpediente + " Esta Seguro ? ");
                    insertarExpedienteVal = respuesta;
                    if (insertarExpedienteVal == true) {
                        dv = digitoControl(numExpediente);
                        document.getElementById('num_expediente').value = document.getElementById('num_expediente').value + "E" + dv;
                        document.getElementById('funExpediente').value = "CREAR_EXP"
                        document.form2.submit();
                    }
                }
            }
        </script>
        <script language="javascript">
            var varOrden = 'ASC';
            function ordenarPor(campo) {
                if (document.getElementById('orden').value == 'ASC') {
                    varOrden = 'DESC';
                } else {
                    varOrden = 'ASC';
                }
                document.getElementById('orden').value = varOrden;
                document.getElementById('ordenarPor').value = campo + ' ' + varOrden;
                document.form2.submit();
            }

            var i = 1;
            var numRadicado;
            function cambiarImagen(imagen) {
                numRadicado = imagen.substr(13);
                if (i == 1) {
                    document.getElementById('anexosRadicado').value = numRadicado;
                    i = 2;
                } else {
                    document.getElementById('anexosRadicado').value = "";
                    i = 1;
                }

                document.form2.submit();
            }

            function excluirExpediente() {
                window.open("<?= $ruta_raiz ?>/expediente/excluirExpediente.php?sessid=<?= session_id() ?>&nurad=<?= $verrad ?>&krd=<?= $krd ?>&ind_ProcAnex=<?= $ind_ProcAnex ?>", "HistExp<?= $fechaH ?>", "height=300,width=600,scrollbars=yes");
                    }

                    // Incluir Anexos y Asociados a un Expediente.
                    function incluirDocumentosExp() {
                        var strRadSeleccionados = "";
                        frm = document.form2;
                        if (typeof frm.check_uno.length != "undefined") {
                            for (i = 0; i < frm.check_uno.length; i++) {
                                if (frm.check_uno[i].checked) {
                                    if (strRadSeleccionados == "") {
                                        coma = "";
                                    } else {
                                        coma = ",";
                                    }
                                    strRadSeleccionados += coma + frm.check_uno[i].value;
                                }
                            }
                        } else {
                            if (frm.check_uno.checked) {
                                strRadSeleccionados = frm.check_uno.value;
                            }
                        }

                        if (strRadSeleccionados != "") {
                            window.open("<?= $ruta_raiz ?>/expediente/incluirDocumentosExp.php?sessid=<?= session_id() ?>&nurad=<?= $verrad ?>&krd=<?= $krd ?>&ind_ProcAnex=<?= $ind_ProcAnex ?>&strRadSeleccionados=" + strRadSeleccionados, "HistExp<?= $fechaH ?>", "height=300,width=600,scrollbars=yes");
                        } else {
                            alert("Error. Debe seleccionar por lo menos un \n\r documento a incluir en el expediente.");
                            return false;
                        }
                    }

                    // Crear Subexpediente
                    function incluirSubexpediente(numeroExpediente, numeroRadicado) {
                        window.open("<?= $ruta_raiz ?>/expediente/datosSubexpediente.php?sessid=<?= session_id() ?>&nurad=" + numeroRadicado + "&krd=<?= $krd ?>&num_expediente=" + numeroExpediente, "HistExp<?= $fechaH ?>", "height=350,width=700,scrollbars=yes");
                    }
        </script>
        <style type="text/css">
            <!--
            .style1 {color: #000000}
            -->
        </style>
        <script language="JavaScript" src="./js/funciones.js"></script>
    </head>
    <body bgcolor="#FFFFFF" topmargin="0">
        <input type="hidden" name="ordenarPor" id="ordenarPor" value="">
        <input type="hidden" name="orden" id="orden" value="<?php print $orden; ?>">
        <input type="hidden" name="verAnexos" id="verAnexos" value="">
        <input type="hidden" name="anexosRadicado" id="anexosRadicado" value="">
        <?php

        function microtime_float() {
            list($usec, $sec) = explode(" ", microtime());
            return ((float) $usec + (float) $sec);
        }

        $time_start = microtime_float();
        /*
         *  Modificado: 23-Agosto-2006 Supersolidaria
         *  Ajuste para ver los anexos borrados de un radicado al ingresar a la pesta�a EXPEDIENTES.
         */
        // Modificado Infom�trika 23-Julio-2009
        // Ajuste para adaptarse al cambio de m�todo (de POST a GET) en el script verradicado.php
        //if( !isset( $_POST['verBorrados'] ) ) {
        if (!isset($verBorrados)) {
            // Modificado Infom�trika 23-Julio-2009
            // Ajuste para adaptarse al cambio de m�todo (de POST a GET) en el script verradicado.php
            //print '<input type="hidden" name="verBorrados" id="verBorrados" value="'.$_POST['anexosRadicado'].'">';
            print '<input type="hidden" name="verBorrados" id="verBorrados" value="' . $anexosRadicado . '">';
        }

        error_reporting(7);
        include ("$ruta_raiz/include/js/digitoControl.js");
        $verradicado = $verrad;
        if ($menu_ver_tmp) {
            $menu_ver = $menu_ver_tmp;
        }
        if ($verradicado) {
            $verrad = $verradicado;
        }
        $numrad = $verrad;
        if (!$menu_ver) {
            $menu_ver = 4;
        }
        $fechah = date("dmy_h_m_s") . " " . time("h_m_s");
        $check = 1;
        $numeroa = 0;
        $numero = 0;
        $numeros = 0;
        $numerot = 0;
        $numerop = 0;
        $numeroh = 0;

        if ($radi_nume_deri and ( $radi_tipo_deri == 0 or $radi_tipo_deri == 2)) {
            ?>
            <input type="hidden" name="menu_ver_tmp" value=4>
            <input type="hidden" name="menu_ver" value=4>
            <table  cellspacing="5" width=100% align="center" border="1" class="borde_tab">
                <tr>
                    <td class="titulos5"><span class="leidos"> Documento <?= $nombre_deri ?>
                            <b> <?= $verrad ?> </b></span></td>
                </tr>
            </table>
            <table border=1 width=100% cellspacing="4" class="borde_tab" align="center">
                <?php
                $isql = "select a.* from radicado a where a.radi_nume_radi = '$radi_nume_deri'";
                $rs = $db->conn->Execute($isql);
//                echo '-------------- '.$isql;
                if (!$rs->EOF) {
                    while (!$rs->EOF) {
                        $radicado_d = $assoc == 0 ? $rs->fields["radi_nume_radi"] : $rs->fields["RADI_NUME_RADI"];
                        $fechaRadicadoPadre = $assoc == 0 ? $rs->fields["radi_fech_radi"] : $rs->fields["RADI_FECH_RADI"];
                        $radicado_path = $assoc == 0 ? $rs->fields["radi_path"] : $rs->fields["RADI_PATH"];
                        $raAsunAnexo = $assoc == 0 ? $rs->fields["ra_asun"] : $rs->fields["RA_ASUN"];
                        $cuentaIAnexo = $assoc == 0 ? $rs->fields["radi_cuentai"] : $rs->fields["RADI_CUENTAI"];
                        if ($radicado_path and $radicado_path != "") {
                            $ref_radicado = "<a href='bodega/$radicado_path' >$radicado_d </a>";
                        } else {
                            $ref_radicado = "$radicado_d";
                        }
                        ?>
                        <tr  class='leidos2' ><TD class="listado5"><span class="leidos2"><?= $ref_radicado ?></span>
                            </td>
                            <TD  class="listado5"><span class="leidos2">Fecha Rad:
                                    <a href="<?= $ruta_raiz ?>/verradicado.php?verrad=<?= $radicado_d ?>&<?= session_name() ?>=<?= session_id() ?>&krd=<?= $krd ?>" target="VERRAD<?= $radicado_d ?>" aria-label="Ver informacion del radicado">
                                        <?= $fechaRadicadoPadre ?>
                                    </a></span>
                            </TD>
                            <TD class="listado5"><span class="leidos2">Asunto:<?= $raAsunAnexo ?></span></TD>
                            <TD class="listado5"><span class="leidos2">Ref:<?= $cuentaIAnexo ?></span></TD></tr>
                        <?php
                        $rs->MoveNext();
                    }
                }
                ?>
            </table>
            <?php
        }
        ?>
        <!--
        <table border="0" width="98%" class="borde_tab" align="center">
        <tr><td></td></tr>
        </table></p>
        -->
        <table border="1" width="100%" class="borde_tab" align="center" class="titulos2">
            <tr class="titulos2">
                <?php
                $q_exp = "SELECT  SGD_EXP_NUMERO as valor, SGD_EXP_NUMERO as etiqueta, SGD_EXP_FECH as fecha";
                $q_exp .= " FROM SGD_EXP_EXPEDIENTE ";
                $q_exp .= " WHERE RADI_NUME_RADI = '" . $numrad . "'";
                $q_exp .= " AND SGD_EXP_ESTADO <> 2";
                $q_exp .= " ORDER BY fecha desc";
                $rs_exp = $db->conn->Execute($q_exp);
                
//                echo '@@@@@@@@@@@@@@ '.$q_exp;

                if ($rs_exp->RecordCount() == 0) {
                    $mostrarAlerta = "<td align=\"center\" class=\"titulos2\">";
                    $mostrarAlerta .= "<span class=\"leidos2\" class=\"titulos2\" align=\"center\">
				<b class='vinculosCabezote'>Este documento no ha sido incluido en ning&uacute;n expediente.</b>
			</span>
			</td>";
                    $sqlt = "select RADI_USUA_ACTU,RADI_DEPE_ACTU from RADICADO where RADI_NUME_RADI LIKE '$numrad'";
                    $rsE = $db->conn->query($sqlt);
                    $depe = $assoc == 0 ? $rsE->fields['radi_depe_actu'] : $rsE->fields['RADI_DEPE_ACTU'];
                    $usua = $assoc == 0 ? $rsE->fields['radi_usua_actu'] : $rsE->fields['RADI_USUA_ACTU'];
                    if ($depe == '999' and $usua == '1') {
                        ?>

                        <td align="left">
                            <a href="#" onClick="insertarExpediente();" ><span class="leidos2"><b>INCLUIR EN</b></span></a>

                            <?php
                        }
                        echo $mostrarAlerta;
                    } else {
                        ?>
                    <td align="center" class="titulos2">
                        <span class="titulos2" align="center">
                            <b><label for="expIncluido">Este documento se encuentra incluido en el(los) siguientes(s) expedientes(s).</label></b>
                        </span>
                    </td>
                    <td align="center">
                        <?php print $rs_exp->GetMenu('expIncluido', $expIncluido, false, true, 3, "class='select' onChange='document.form2.submit();' id='expIncluido' aria-label='Listado de espedientes en el cual esat incluido el radicado'", false); ?>
                    </td>
                    <td align="center" nowrap>

                        <div class="listasCortas"><a class="vinculosCabezote" href="#" aria-label="Enlace para incluir el radicado actual en un expediente" onClick="insertarExpediente();" >Incluir en:</a></div>
                        <br>
                        <div class="listasCortas"><a class="vinculosCabezote" href="#" aria-label="Enlace para excluir el radicado actual de un expediente" onClick="excluirExpediente();" >Excluir de:</a></div>
                        <br>
                        <?php
                        if (!$codserie) {
                            $codserie = 0;
                        }
                        if (!$tsub) {
                            $tsub = 0;
                        }
                        if (!$tdoc) {
                            $tdoc = 0;
                        }
                        if ($usuaPermExpediente > 1 and $verradPermisos == "Full") {
                            ?>
                            <div class="listasCortas"><a class="vinculosCabezote" aria-label="Enlace para crear un nuevo expediente" href="#" onClick="verTipoExpediente('<?= $num_expediente ?>',<?= $codserie ?>,<?= $tsub ?>,<?= $tdoc ?>, 'MODIFICAR')" >
                                    Crear</a></div>
                            <?php
                        }
                        ?>
                    </td>
                    <?php
                }
                ?>
            </tr>
        </table>

        <table  cellspacing="5" width=100% align="center" border="1" class="borde_tab">
            <?php
            error_reporting(7);
            include_once ("$ruta_raiz/include/tx/Expediente.php");
            require_once("$ruta_raiz/class_control/TipoDocumento.php");
            $expediente = new Expediente($db);
            $objTipoDocto = new TipoDocumento($db);
            $db->conn->SetFetchMode(ADODB_FETCH_ASSOC);
//            $db->conn->debug=true;

            if ($radi_tipo_deri == 0 and $radi_nume_deri) {
                $verrad_padre = $radi_nume_deri;
            } else {
                $verrad_padre = $verrad;
            }

            // Modificado 23-Junio-2006 Supersolidaria
            // Consulta si el radicado est� archivado o ha sido excluido del expediente.
            if ($numExpediente == "") {
                $numExpediente = $expediente->consulta_exp("$verrad");
            }
            // Modificado Infom�trika 23-Julio-2009
            // Ajuste para adaptarse al cambio de m�todo (de POST a GET) en el script verradicado.php
            if ($num_expediente != "" && !isset($expIncluido)) {
                $numExpediente = $num_expediente;
            }
            // Modificado Infom�trika 23-Julio-2009
            // Ajuste para adaptarse al cambio de m�todo (de POST a GET) en el script verradicado.php
             else if (isset($expIncluido) && $expIncluido != "") {
                $numExpediente = $expIncluido;
            }
            $expediente->expedienteArchivado($verrad, $numExpediente);

            // Si el radicado no ha sido excluido del expediente
            if ($expediente->estado_expediente != 2) {
                // $numExpediente = $expediente->consulta_exp("$verrad");
                // Si tiene expediente
                if ($numExpediente) {
                    // Modificado Supersolidaria 03-Agosto-2006
                    // Asigna a $num_expediente el valor de $numExpedente recibido desde ver_datosrad.php
                    $num_expediente = $numExpediente;
                    $datoss = " readonly ";

                    if ($expediente->estado_expediente == 0) {
                    } else if ($expediente->estado_expediente == 1) {
                        $mensaje = "<br>El expediente se ha Ubicado fisicamente en Archivo<br>";
                    }
                }
                if ($carpeta == 8) {
                }
            } else {
                $numExpediente = "";
            }

            $isqlDepR = "SELECT USUA_DOC_RESPONSABLE FROM SGD_SEXP_SECEXPEDIENTES WHERE SGD_EXP_NUMERO = '$numExpediente' ORDER BY SGD_SEXP_FECH DESC ";
            //$db->conn->debug=true;
            $rsDepR = $db->conn->Execute($isqlDepR);
            $docRes = $rsDepR->fields['USUA_DOC_RESPONSABLE'];
            $isqlDepR = "SELECT USUA_NOMB from USUARIO WHERE USUA_DOC = '$docRes'";
            $rsDepR = $db->conn->Execute($isqlDepR);
            $responsable = $rsDepR->fields['USUA_NOMB'];
            $isql = "SELECT USUA_PERM_EXPEDIENTE from USUARIO WHERE USUA_LOGIN = '$krd'";
            $rs = $db->conn->Execute($isql);
            $krdperm = $rs->fields['USUA_PERM_EXPEDIENTE'];
            $sqlb = "select sgd_exp_archivo from sgd_exp_expediente where sgd_exp_numero like '$num_expediente'";
            $rsb = $db->conn->Execute($sqlb);
            $arch = $rsb->fields['SGD_EXP_ARCHIVO'];

            $mostar = true;
            $mostrar = true;
            ?>
            <tr >
                <td class="listado2" colspan="4">
                    <?php
                    // Modificado Infom�trika 23-Julio-2009
                    // Ajuste para adaptarse al cambio de m�todo (de POST a GET) en el script verradicado.php
                    // By skina
                    // Extraccion de nombre:
                    $sql_nombreExp = "SELECT sgd_sexp_parexp1 FROM sgd_sexp_secexpedientes WHERE sgd_exp_numero='$num_expediente'";
                    $rs_nombreExp = $db->conn->Execute($sql_nombreExp);
                    $nombreExp = $assoc == 0 ? $rs_nombreExp->fields['sgd_sexp_parexp1'] : $rs_nombreExp->fields['SGD_SEXP_PAREXP1'];
                    // Fin extraccion nombre

                    if ($num_expediente != "" && !isset($expIncluido)) {
                        ?>
                        <label for="num_expediente">Nombre de Expediente</label>
                        <input name="num_expediente" type="text" size="30" maxlength="18" id="num_expediente" value="<?= $nombreExp ?>" class="tex_area" aria-label="Nombre del expediente asociado al radicado" '<?= $datoss ?>'>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Responsable: &nbsp;&nbsp;&nbsp;<b><span class=leidos2>
                            <?php echo $responsable; ?></b> &nbsp;&nbsp;&nbsp;
                        <?php
                        if ($krdperm == 2) {
                            echo "<input type=\"button\" value=\"Cambiar\" class=\"botones_mediano\" onClick=\"Responsable('$num_expediente')\" aria-label=\"Boton para cambiar responsable del expediente\">";
                            if ($arch != 2 && $mostar) {
                                ?>
                                <input type="button" class="botones" value="Cerrar Expediente" aria-label="Boton para cerrar el expediente actual" onClick=" CambiarE(2, '<?= $num_expediente ?>')">
                                <?php
                            } elseif ($mostrar) {
                                ?>
                                <input type="button" class="botones_largo" value="Reabrir Expediente" aria-label="Boton para re- abrir expediente cerrado" onClick=" CambiarE(1, '<?= $num_expediente ?>')">
                                <?php
                            }
                        }
                    }
                    // Modificado Infom�trika 23-Julio-2009
                    // Ajuste para adaptarse al cambio de m�todo (de POST a GET) en el script verradicado.php
                    else if (isset($expIncluido) && $expIncluido != "") {
                        ?>
                        <label for="num_expediente">Nombre de Expediente</label>
                        <?php
                        // Modificado Infom�trika 23-Julio-2009
                        // Ajuste para adaptarse al cambio de m�todo (de POST a GET) en el script verradicado.php
                        // Cambi� $_POST['expIncluido'][0] por $expIncluido
                        ?>
                        <input name="num_expediente" type="text" size="30" maxlength="18" id="num_expediente" aria-label="Nombre del expediente asociado al radicado" value="<? print $expIncluido; ?>" class="tex_area" '<?= $datoss ?>'>

                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Responsable: &nbsp;&nbsp;&nbsp; <b> <span class=leidos2>
                                <? echo $responsable;?></b> &nbsp;&nbsp;&nbsp;
                        <?php
                        if ($krdperm == 2) {
                            ?>
                            <input type="button" value="Cambiar" aria-label="Boton para cambiar el responsable del expediente" class=botones_3 onClick="Responsable('<?= $num_expediente ?>')">
                            <br>
                            <?php if ($mostrar) { ?>
                                <input type="button" class="botones_mediano" value="Cerrar Expediente" aria-label="Boton para cerrar el expediente" onClick=" CambiarE(2, '<?= $num_expediente ?>')">
                            <?php } ?>			
                            <?php
                            if ($arch == 2 && $mostar) {
                                ?>
                                <input type="button" class="botones_mediano" value="Reabrir Expediente" aria-label="Boton para re-abrir el expediente" onClick=" CambiarE(1, '<?= $num_expediente ?>')">
                                <?php
                            }
                        }
                    } else {
                        ?>
                        <input name="num_expediente" type="hidden" id='num_expediente' value="">
                        <?php
                    }
                    ?>
                    <input type="hidden" name='funExpediente' id='funExpediente' value="" >
                    <input type="hidden" name='menu_ver_tmp' id='menu_ver_tmp' value="4" >
                    <?php
                    // CONSULTA SI EL EXPEDIENTE TIENE UNA CLASIFICACION TRD

                    error_reporting(7);
                    $codserie = "";
                    $tsub = "";
                    include_once ("$ruta_raiz/include/tx/Expediente.php");
                    $trdExp = new Expediente($db);

                    $mrdCodigo = $trdExp->consultaTipoExpediente("$numExpediente");
                    $trdExpediente = $trdExp->descSerie . " / " . $trdExp->descSubSerie;
                    $descPExpediente = $trdExp->descTipoExp;
                    $procAutomatico = $trdExpediente->pAutomatico;
                    $codserie = $trdExp->codiSRD;
                    $tsub = $trdExp->codiSBRD;
                    $tdoc = $trdExp->codigoTipoDoc;
                    $texp = $trdExp->codigoTipoExp;
                    $descFldExp = $trdExp->descFldExp;
                    $codigoFldExp = $trdExp->codigoFldExp;
                    if (!$codserie)
                        $codserie = 0;
                    if (!$tsub)
                        $tsub = 0;
                    if (!$tdoc)
                        $tdoc = 0;

                    error_reporting(7);
                    $resultadoExp = 1;
                    if ($funExpediente == "INSERT_EXP") {
                        $resultadoExp = $expediente->insertar_expediente($num_expediente, $verrad, $dependencia, $codusuario, $usua_doc);
                        if ($resultadoExp == 1) {
                            echo '<hr>Se anex&oacute; este radicado al expediente correctamente.<hr>';
                        } else {
                            echo '<hr><font color=red>No se anex&oacute; este radicado al expediente. V
                        Verifique que el numero del expediente exista e intente de nuevo.</font><hr>';
                        }
                    }

                    if ($funExpediente == "CREAR_EXP") {
                        $resultadoExp = $expediente->crearExpediente($num_expediente, $verrad, $dependencia, $codusuario, $usua_doc);
                        if ($resultadoExp == 1) {
                            echo '<hr>El expediente se creo correctamente<hr>';
                        } else {
                            echo '<hr><font color=red>El expediente ya se encuentra creado.
                        <br>A continuaci&oacute;n aparece la lista de documentos pertenecientes al expediente que intento crear
                        <br>Si esta seguro de incluirlo en este expediente haga click sobre el boton  "Grabar en Expediente"
                        </font><hr>';
                        }
                    }

                    if ($carpeta == 8) {
                        //<input type="button"0. name="UPDATE_EXP" value="ACTUALIZAR EXPEDIENTE" class="botones_mediano" onClick="Start('buscar_usuario.php?busq_salida=',1024,400);">
                    } else {
                        if (!$num_expediente or $resultadoExp != 1 or $dependencia == '999') {
                            ?>
                            <a href="#" onClick="insertarExpediente();" aria-label="Insertar radicado en expediente" ><span class="leidos"><b>Incluir en</b></span></a> &nbsp;
                            <?php
                            if ($usuaPermExpediente > 1) {
                                ?>
                                <a href="#" onClick="verTipoExpediente('<?= $num_expediente ?>',<?= $codserie ?>,<?= $tsub ?>,<?= $tdoc ?>, 'MODIFICAR')" aria-label="Crear Expediente al radicado actual" >
                                    <span class="leidos"><b>Crear</b></span>
                                </a>
                                <?php
                            }
                        } else {
                            if (!$codserie and ! $tsub) {
                                ?>
                                <a href="#" onClick="verTipoExpedienteOld('<?= $num_expediente ?>')"aria-label="Asignar trd a Expediente actual" ><span class="leidos"><b>Tipificar Expediente</b></span></a>
                                <?php
                            }
                            //<input type="button" name="ASOC_EXP" value="Asociar Anexos a Este Expediente" class="botones_largo" >
                        }
                    }
                    if ($ASOC_EXP and ! $funExpediente) {
                        for ($ii = 1; $ii < $i; $ii++) {
                            $expediente->num_expediente = "";
                            $exp_num = $expediente->consulta_exp("$radicados_anexos[$ii]");
                            $exp_num = $expediente->num_expediente;

                            //echo "===>$exp_num==>".$radicados_anexos[$ii]."<br>";
                            if ($exp_num == "") {
                                $expediente->insertar_expediente($num_expediente, $radicados_anexos[$ii], $dependencia, $codusuario, $usua_doc);
                            }
                        }
                    }
                    echo "<br>$mensaje<br>";
                    ?>
                </TD>
            </tr>
            <?php
            if (!$codigoFldExp)
                $codigoFldExp = "0";
            ?>
            <tr class='listado5'>
                <!--
                <td class="titulos4" colspan="2"></td>
                -->
                <!--<td class="listado2" width="42%" colspan="2">-->
                    <?php
//                    if ($descPExpediente) {
//                        $expediente->consultaTipoExpediente($num_expediente);
                        ?>
                        <!--&nbsp;&nbsp;&nbsp;&nbsp;Estado :<span class=leidos2> <?= $descFldExp ?></span>&nbsp;&nbsp;&nbsp;-->
                        <!--<input type="button" value="..." aria-label="Cambiar estado del expediente" class=botones_2 onClick="modFlujo('<?= $num_expediente ?>',<?= $texp ?>,<?= $codigoFldExp ?>)"></td>-->
                    <?php
//                }
                if ($num_expediente != "") {
                    ?>
                <td class="listado2" colspan="4">Historia del Expediente :&nbsp;&nbsp;&nbsp;
                        <input type="button" value="..." aria-label="Abrir hitorico del expediente" class=botones_2 onClick="verHistExpediente('<?= $num_expediente ?>');">
                    </td>
                    <?php // if ($usuaPermExpediente and $verradPermisos == "Full") { ?>
    <!--                        <td colspan="2" class="listado2" nowrap>Adicionar Proceso :&nbsp;&nbsp;&nbsp;
                            <input type="button" value="..." aria-label="Agregar proceso al expedeinte actual" class=botones_2 onClick="crearProc('<?= $num_expediente ?>');">
                        </td>-->
                    <?php
//                } 
//                    else { 
                    ?>
                        <!--<td>&nbsp;</td>-->	
                    <?php //}   ?>	
                </tr>

                <?php
                // Modificado Infom�trika 23-Julio-2009
                // Ajuste para adaptarse al cambio de m�todo (de POST a GET) en el script verradicado.php
                //if ( $_POST['expIncluido'][0] != "" ) {
                if ($expIncluido != "") {
                    // Modificado Infom�trika 23-Julio-2009
                    // Ajuste para adaptarse al cambio de m�todo (de POST a GET) en el script verradicado.php
                    //$arrTRDExp = $expediente->getTRDExp( $_POST['expIncluido'][0], "", "", "" );
                    $arrTRDExp = $expediente->getTRDExp($expIncluido, "", "", "");
                } else if ($num_expediente != "") {
                    $arrTRDExp = $expediente->getTRDExp($num_expediente, "", "", "");
                }
                ?>

                <tr>
                    <td class='titulos5' style="width: 11%;" >
                        <b>TRD:</b>
                    </td>
                    <td class='listado2' colspan="4" aria-label="Trd asignada actualmente al expediente">
                        <?php print $arrTRDExp['serie'] . " / " . $arrTRDExp['subserie']; ?>
                    </td>
                    <!--<td colspan="3"></td>-->
                    <!--<td rowspan="3" class="listado2" >-->
                        <!--<table width="100%" border="1" height="200%" cellspacing=1>-->
                            <?php
                            // Modificado Infom�trika 23-Julio-2009
                            // Ajuste para adaptarse al cambio de m�todo (de POST a GET) en el script verradicado.php
                            //if ( $_POST['expIncluido'][0] != "" ) {
                            if ($expIncluido != "") {
                                // Modificado Infom�trika 23-Julio-2009
                                // Ajuste para adaptarse al cambio de m�todo (de POST a GET) en el script verradicado.php
                                //$arrDatosParametro = $expediente->getDatosParamExp( $_POST['expIncluido'][0], $dependencia );
                                $arrDatosParametro = $expediente->getDatosParamExp($expIncluido, $dependencia);
                            }
                            // Modificado 16-Agosto-2006 Supersolidaria
                            // Se evala la variable $numExpediente en lugar de $num_expediente.
                            else if ($numExpediente != "") {
                                $arrDatosParametro = $expediente->getDatosParamExp($numExpediente, $dependencia);
                            }
                            if ($arrDatosParametro != "") {
                                foreach ($arrDatosParametro as $clave => $datos) {
                                    ?>
                                    <tr rowspan="4"   class="leidos2">
                                        <td colspan="2" class="titulos5"><? print $datos['etiqueta']; ?>:</td>
                                        <td colspan="2" ><? print $datos['parametro']; ?></td>
                                    </tr>
                                    <?php
                                }
                            }
                            ?>
                        <!--</table>-->
                    <!--</td>-->
                </tr>
                <tr >
                    <td class='titulos5' nowrap>
                        Fecha Inicio:
                    </td>
                    <td colspan="4" class='listado2' aria-label="Fecha creacio del expediente">
                        <?php print $arrTRDExp['fecha']; ?>
                    </td>
                </tr>

                <tr class='timparr'>
                    <td colspan="4" class="titulos5">
                        <p>Documentos Pertenecientes al expediente &nbsp;</p>
                        <a name="t1"></a>
                        <table border=1 width=98% class="borde_tab" align="center" cellpadding="0" cellspacing="0">
                            <?php
                        }
                        // Modificado Infom�trika 23-Julio-2009
                        // Ajuste para adaptarse al cambio de m�todo (de POST a GET) en el script verradicado.php
                        //if ( $num_expediente != "" && !isset( $_POST['expIncluido'][0] ) ) {
                        if ($num_expediente != "" && !isset($expIncluido)) {
                            $expedienteSeleccionado = $num_expediente;
                        }
                        // Modificado Infom�trika 23-Julio-2009
                        // Ajuste para adaptarse al cambio de m�todo (de POST a GET) en el script verradicado.php
                        //else if ( isset( $_POST['expIncluido'][0] ) && $_POST['expIncluido'][0] != "" ) {
                        else if (isset($expIncluido) && $expIncluido != "") {
                            // Modificado Infom�trika 23-Julio-2009
                            // Ajuste para adaptarse al cambio de m�todo (de POST a GET) en el script verradicado.php
                            //$expedienteSeleccionado = $_POST['expIncluido'][0];
                            $expedienteSeleccionado = $expIncluido;
                        }

                        // if( $num_expediente )
                        if ($expedienteSeleccionado) {
                            include_once($ruta_raiz . '/include/query/queryver_datosrad.php');
                            $fecha = $db->conn->SQLDate("d-m-Y H:i A", "a.RADI_FECH_RADI");
                            $tiposdocumentales = $objTipoDocto->getDatosPermisosTipo();

                            // Modificaci�: 14-Junio-2006 Supersolidaria Opci� para ordenar los registros
                            $isql = "select ";
                            if ($driver == "oci8") {
                                $isql .= " /*+ all_rows */ ";
                            }
                            $isql .= " r.*,c.sgd_tpr_descrip, " . $fecha . "as FECHA_RAD ,
                            a.RADI_CUENTAI, substring(a.RA_ASUN,1,300) as RA_ASUN , a.RADI_PATH ,$radi_nume_radi as RADI_NUME_RADI,c.sgd_tpr_codigo
                            from  sgd_exp_expediente r, radicado a, SGD_TPR_TPDCUMENTO c
                            where r.sgd_exp_numero='$expedienteSeleccionado' and r.radi_nume_radi=a.radi_nume_radi
                            and a.tdoc_codi=c.sgd_tpr_codigo AND r.SGD_EXP_ESTADO <> 2 ";
                            // Modificado Infom�trika 23-Julio-2009
                            // Ajuste para adaptarse al cambio de m�todo (de POST a GET) en el script verradicado.php

                            if ($ordenarPor != "") {
                                $isql .= "ORDER BY " . $ordenarPor;
                            } else {
                                $isql .= " order by a.radi_fech_radi desc";
                            }
                            ?>
                            <tr class="titulos3" >
                                <td>&nbsp;</td>
                                <td align="center">
                                    <a href="#" aria-label="Ordenar por numero de radicado" onClick="javascript:ordenarPor('a.RADI_NUME_RADI');">
                                        Radicado
                                    </a>
                                </td>
                                <td align="center">
                                    <a aria-label="Ordenar por fecha de radicación" href="#" onClick="javascript:ordenarPor('a.RADI_FECH_RADI');">
                                        Fecha Radicaci&oacute;n
                                    </a>
                                </td>
                                <TD align="center">
                                    <a href="#" aria-label="Ordenar por tipo de documento" onClick="javascript:ordenarPor('c.SGD_TPR_DESCRIP');">
                                        Tipo<br> Documento
                                    </a>
                                </TD>
                                <TD align="center">
                                    <a href="#" aria-label="Ordenar por asunto" onClick="javascript:ordenarPor('a.RA_ASUN');">
                                        Asunto
                                    </a>
                                </TD>
                            </tr>
                            <?php
                            $rs = $db->conn->query($isql);
                            $i = 0;
                            while (!$rs->EOF) {
                                $radicado_d = "";
                                $radicado_path = "";
                                $radicado_fech = "";
                                $radi_cuentai = "";
                                $rad_asun = "";
                                $tipo_documento_desc = "";
                                $radicado_d = $assoc == 0  ? $rs->fields["radi_nume_radi"] : $rs->fields["RADI_NUME_RADI"];
                                $radicado_path = $assoc == 0  ? $rs->fields["radi_path"] : $rs->fields["RADI_PATH"];
                                $radicado_fech = $assoc == 0  ? $rs->fields["fecha_rad"] : $rs->fields["FECHA_RAD"];
                                $radi_cuentai = $assoc == 0  ? $rs->fields["radi_cuentai"] : $rs->fields["RADI_CUENTAI"];
                                $rad_asun = $assoc == 0  ? $rs->fields["ra_asun"] : $rs->fields["RA_ASUN"];
                                $tipo_documento_desc = $assoc == 0  ? $rs->fields["sgd_tpr_descrip"] : $rs->fields["SGD_TPR_DESCRIP"];
                                $subexpediente = $assoc == 0  ? $rs->fields["sgd_exp_subexpediente"] : $rs->fields["SGD_EXP_SUBEXPEDIENTE"];
                                $seguridadRadicado = $assoc == 0  ? $rs->fields["sgd_spub_codigo"] : $rs->fields["SGD_SPUB_CODIGO"];
                                $usu_cod = $assoc == 0  ? $rs->fields["radi_usua_actu"] : $rs->fields["RADI_ASUA_ACTU"];
                                $radi_depe = $assoc == 0  ? $rs->fields["radi_depe_actu"] : $rs->fields["RADI_DEPE_ACTU"];
                                $nivelRadicado = $assoc == 0  ? $rs->fields["codi_nivel"] : $rs->fields["CODI_NIVEL"];
                                $tdocper = $assoc == 0  ? $rs->fields["sgd_tpr_codigo"] : $rs->fields["SGD_TPR_CODIGO"];
                                
                                $verImg = ($seguridadRadicado == 1) ? (($usu_cod != $_SESSION['codusuario'] || $radi_depe != $_SESSION['dependencia']) ? false : true) : ($nivelRadicado > $nivelus ? false : true);
                                if ($verImg) {
                                    //by skina valido radicado_path 
                                    if ($radicado_path and $radicado_path != "") {
                                        if (in_array($tdocper, $tiposdocumentales)) {
                                            $ref_radicado = "<a href='bodega/$radicado_path' aria-label='Abrir documento del radicado o anexo' >$radicado_d </a>";
                                        } else {
                                            $v = "<a href='#' onclick=\"alert('Usted no tiene acceso a este tipo documental".$tipo_documento_desc."')\"><span class=''>$radicado_d</span></a>";
                                        }
                                    } else {
                                        $ref_radicado = "$radicado_d";
                                    }

                                    if (in_array($tdocper, $tiposdocumentales)) {
                                        $radicado_fech = "<a href='$ruta_raiz/verradicado.php?verrad=$radicado_d&PHPSESSID=" . session_id() . "&krd=$krd&carpeta=8&nomcarpeta=Busquedas&tipo_carp=0&menu_ver_tmp=3' aria-label='Abrir informaci�n del radicado' target=" . $radicado_fech . "><span class=leidos>$radicado_fech</span></a>";
                                    } else {
                                        $radicado_fech = "<a href='#' onclick=\"alert('Usted no tiene acceso a este tipo documental')\"><span class=''>$radicado_fech</span></a>";
                                    }
                                } else {
                                    $ref_radicado = "$radicado_d";
                                    $radicado_fech = "<a href='#' onclick=\"alert('El documento posee seguridad y no posee los suficientes permisos'); return false;\"><span class=leidos>$radicado_fech</span></a>";
                                }
                                
                                ?>

                                <tr class='listado1'>
                                    <td valign="baseline">
                                        <?php
                                        // Modificado Infom�trika 23-Julio-2009
                                        // Ajuste para adaptarse al cambio de m�todo (de POST a GET) en el script verradicado.php
                                        if (!isset($verBorrados)) {
                                            // Modificado Infom�trika 23-Julio-2009
                                            // Ajuste para adaptarse al cambio de m�todo (de POST a GET) en el script verradicado.php
                                            if (( $anexosRadicado != $radicado_d)) {
                                                ?>
                                                <!--Modificado: 23-Agosto-2006 Supersolidaria
                                                 *  Muestra todos los anexos de un radicado.
                                                -->
                                                <img alt="Enlace gr&aacute;fico para mostrar listado de anexos asociados al radicado" name="imgVerAnexos_<?php print $radicado_d; ?>" src="imagenes/menu.gif" border="0">
                                                <?php
                                            }
                                            // Modificado Infom�trika 23-Julio-2009
                                            // Ajuste para adaptarse al cambio de m�todo (de POST a GET) en el script verradicado.php
                                            else if (( $anexosRadicado == $radicado_d)) {
                                                ?>
                                                <img name="imgVerAnexos_<?php print $radicado_d; ?>" src="imagenes/menuraya.gif" border="0">
                                                <?php
                                            }
                                        }
                                        if (isset($verBorrados)) {
                                            if (( $verBorrados == $radicado_d)) {
                                                ?>
                                                <img name="imgVerAnexos_<?php print $radicado_d; ?>" src="imagenes/menuraya.gif" border="0">
                                                <?php
                                            } else if (( $verBorrados != $radicado_d)) {
                                                ?>
                                                <img name="imgVerAnexos_<?php print $radicado_d; ?>" src="imagenes/menu.gif" border="0">
                                                <?php
                                            }
                                        }

                                        //skina 18-10-2011
                                        ?>
                                    </td>
                                    <td valign="baseline" >
                                        <span class="leidos"><?= $ref_radicado ?></span>
                                    </td>
                                    <td valign="baseline" align="center" width="100"><span class="leidos2"><?= $radicado_fech ?></span></td>
                                    <TD valign="baseline" ><span class="leidos2"><?= $tipo_documento_desc ?></span></TD>
                                    <TD valign="baseline"><span class="leidos2"><?= $rad_asun ?></span></TD>
                                </tr>
                                <?php
                                //skina 18-10-2011
                                /**
                                 *   Carga los anexos del radicado indicado en la variable $radicado_d
                                 *   incluye la clase anexo.php
                                 * */
                                //$db->conn->debug = true;
                                include_once "$ruta_raiz/class_control/anexo.php";
                                include_once "$ruta_raiz/class_control/TipoDocumento.php";
                                $a = new Anexo($db->conn);
                                $tp_doc = new TipoDocumento($db->conn);
                                // Modificaci�n: 15-Julio-2006 Mostrar los anexos del radicado seleccionado.
                                /*
                                 *  Modificado: 23-Agosto-2006 Supersolidaria
                                 *  Muestra todos los anexos de un radicado al ingresar a la pesta�a de EXPEDIENTES.
                                 */
                                $num_anexos = $a->anexosRadicado($radicado_d);
                                $anexos_radicado = $a->anexos;
                                /*
                                 *  Modificado: 23-Agosto-2006 Supersolidaria
                                 *  Muestra los anexos borrados de un radicado al ingresar a la pesta�a de EXPEDIENTES.
                                 */
                                // Modificado Infom�trika 23-Julio-2009
                                // Ajuste para adaptarse al cambio de m�todo (de POST a GET) en el script verradicado.php
                                if (isset($verBorrados)) {
                                    $num_anexos = $a->anexosRadicado($radicado_d, true);
                                }
                                if ($num_anexos >= 1) {
                                    for ($iia = 0; $iia <= $num_anexos; $iia++) {
                                        error_reporting(7);

                                        $codigo_anexo = $a->codi_anexos[$iia];
                                        if ($codigo_anexo and substr($anexDirTipo, 0, 1) != '7') {
                                            $select = "select sgd_tpr_descrip from sgd_tpr_tpdcumento where sgd_tpr_codigo =".$a->get_sgd_tpr_codigo();;
                                            $rsselect = $db->conn->query($select);
                                            $tdocpers = $a->get_sgd_tpr_codigo();
                                            $tipo_documento_desc = $assoc == 0 ? $rsselect->fields["sgd_tpr_descrip"] : $rsselect->fields["SGD_TPR_DESCRIP"];
                                            $fechaDocumento = "";
                                            $anex_desc = "";
                                            $a->anexoRadicado($radicado_d, $codigo_anexo);
                                            $secuenciaDocto = $a->get_doc_secuencia_formato($dependencia);
                                            $fechaDocumento = $a->get_sgd_fech_doc();
                                            $anex_nomb_archivo = $a->get_anex_nomb_archivo();
                                            $anex_desc = $a->get_anex_desc();

                                            // By Skinatech - 14/08/2018
                                            // Para la construcción del número de radicado, esto indica la parte inicial del radicado.
                                            if ($estructuraRad == 'ymd') {
                                                $num = 8;
                                            } elseif ($estructuraRad == 'ym') {
                                                $num = 6;
                                            } else {
                                                $num = 4;
                                            }

                                            $dependencia_creadora = substr($codigo_anexo, $num, $longitud_codigo_dependencia);
                                            $ano_creado = substr($codigo_anexo, 0, 4);
                                            $sgd_tpr_codigo = $a->get_sgd_tpr_codigo();
                                            $sgd_srd_codigo = $a->get_sgd_srd_codigo();
                                            $sgd_sbrd_codigo = $a->get_sgd_sbrd_codigo();
                                            $anex_codigo = $a->get_anex_codigo();
                                            /**
                                             *   Trae la descripcion del tipo de Documento del anexo
                                             * */
//                                            if ($sgd_tpr_codigo) {
//                                                $tp_doc->TipoDocumento_codigo($sgd_tpr_codigo);
//                                                $tipo_documento_desc = $tp_doc->get_sgd_tpr_descrip();
//                                            }
                                            $anexBorrado = $a->anex_borrado;
                                            $anexSalida = $a->get_radi_anex_salida();
                                            $ext = substr($anex_nomb_archivo, -3);

                                            if (trim($anex_nomb_archivo) or $anexSalida != 1 or $ii) {
                                                ?>
                                                <tr>
                                                    <td valign="baseline" class='listado2'>&nbsp;</td>
                                                    <td valign="baseline"  class='listado2'>
                                                        <?php
                                                        if ($anexBorrado == "S") {
                                                            ?>
                                                            <img src="iconos/docs_tree_del.gif">
                                                            <?php
                                                        } else if ($anexBorrado == "N") {
                                                            ?>
                                                            <img alt="Icono de anexo" src="iconos/docs_tree.gif">
                                                            <?php
                                                        }
                                                        
                                                        $sqlcount = "select count(anex_codigo) as conteo from anexos where anex_radi_nume='$radicado_d'";
                                                        $rsConteoAnexos = $db->conn->query($sqlcount);
                                                        $contadorAnexos = $rsConteoAnexos->fields['conteo'];
                                                        $tipoRadicado = substr($radicado_d, -1);
                                                        $anexNumeroLis = substr($codigo_anexo, -1);
                                                        echo "<input type='hidden' name='radicadover' id='radicadover$anexNumeroLis' value='" . $radicado_d . "'  >";
                                                        echo '<input type="hidden" name="expanex_numero" id="expanex_numero'.$anexNumeroLis.'" value="'.$anexNumeroLis.'" size="2">';
                                                        
                                                        if (in_array($tdocpers, $tiposdocumentales)) {
                                                            if($ext != 'pdf' && $ext != 'png' && $ext != 'jpg' && $ext != 'tiff'){
                                                                ?>
                                                                <a href='bodega/<?= $ano_creado . "/$dependencia_creadora/docs/$anex_nomb_archivo" ?>' aria-label='Abrir documento de anexo de radicado <?= $radicado_d ?>, anexo numero <?= substr($codigo_anexo, -4) ?>'>
                                                                    <?= substr($codigo_anexo, -4) ?> 
                                                                </a>
                                                                <?php
                                                            }else{
                                                                echo "<b><a class='vinculos vinculoEXp' id=$anexNumeroLis href='#myModalDocExp' aria-label='Abrir docuemnto cargado al anexo'>" . substr($codigo_anexo, -4) . "</a>";
                                                            }                                                                
                                                        } else {                                                            
                                                            echo "<a href='#' onclick=\"alert('Usted no tiene acceso a este tipo documental ".$tipo_documento_desc."')\"><span class=''>".substr($codigo_anexo, -4)."</span></a>";
                                                        }
                                                        ?>
                                                    </td>
                                                    <td valign="baseline" class='listado2'><?= $fechaDocumento ?></td>
                                                    <TD valign="baseline" class='listado2'><?= $tipo_documento_desc ?></TD>
                                                    <TD valign="baseline" class='listado2'><?= $anex_desc ?></TD>
                                                </tr>
                                                <?php
                                            } // Fin del if que busca si hay link de archivo para mostrar o no el doc anexo
                                        }
                                    }  // Fin del For que recorre la matriz de los anexos de cada radicado perteneciente al expediente
                                }
                                error_reporting(7);

                                $rs->MoveNext();
                            }
                        }
                        /**
                         *  Fin del While que Recorre los documentos de un expediente.
                         * */
                        ?>
                    </table>
                    <p>
        </TABLE>
        <p>
        <span class="tituloListado"> </span>
        <table border=1 width=100% class="borde_tab" align="center">
            <tr class='titulos3'>
                <th class="titulos3">
                    <input type="checkbox" name="check_todos" value="checkbox" aria-label="Casilla de verificacion para seleccionar todos los radicados realcionados" onClick="todos(document.forms[1]);">
                </th>
                <th align="center">Radicado</th>
                <th align="center">Fecha radicado</th>
                <th align="center">Tipo documento</th>
                <th align="center">Asunto</th>
                <th align="center">Tipo de relaci&oacute;n</th>
            </tr>
            <?php
            $arrAnexoAsociado = $expediente->expedienteAnexoAsociado($verrad);

            if (is_array($arrAnexoAsociado)) {
                /*
                 *  Modificado: 29-Agosto-2006 Supersolidaria
                 *  Consulta los datos de los radicados Anexo de (Padre), Anexo y Asociado.
                 */
                include_once "$ruta_raiz/include/tx/Radicacion.php";
                $rad = new Radicacion($db);

                foreach ($arrAnexoAsociado as $clave => $datosAnexoAsociado) {
                    if ($datosAnexoAsociado['radPadre'] != "" && $datosAnexoAsociado['radPadre'] != $verrad && $datosAnexoAsociado['anexo'] == $verrad) {
                        $arrDatosRad = $rad->getDatosRad($datosAnexoAsociado['radPadre']);
                        if ($arrDatosRad['ruta'] != "") {
                            $rutaRadicado = "<a href='bodega/" . $arrDatosRad['ruta'] . "' aria-label='Abrir documento del radicado' >" . $datosAnexoAsociado['radPadre'] . "</a>";
                        } else {
                            $rutaRadicado = $datosAnexoAsociado['radPadre'];
                        }
                        $radicadoAnexo = $datosAnexoAsociado['radPadre'];
                        $tipoRelacion = "ANEXO DE (PADRE)";
                    } else if ($datosAnexoAsociado['radPadre'] == $verrad && $datosAnexoAsociado['anexo'] != "") {
                        $arrDatosRad = $rad->getDatosRad($datosAnexoAsociado['anexo']);
                        if ($arrDatosRad['ruta'] != "") {
                            $rutaRadicado = "<a href='bodega/" . $arrDatosRad['ruta'] . "' aria-label='Abrir documento del radicado ' >" . $datosAnexoAsociado['anexo'] . "</a>";
                        } else {
                            $rutaRadicado = $datosAnexoAsociado['anexo'];
                        }
                        $radicadoAnexo = $datosAnexoAsociado['anexo'];
                        $tipoRelacion = "ANEXO";
                    } else if ($datosAnexoAsociado['radPadre'] == $verrad && $datosAnexoAsociado['asociado'] != "") {
                        $arrDatosRad = $rad->getDatosRad($datosAnexoAsociado['asociado']);
                        if ($arrDatosRad['ruta'] != "") {
                            $rutaRadicado = "<a href='bodega/" . $arrDatosRad['ruta'] . "' aria-label='Abrir documento del radicado' >" . $datosAnexoAsociado['asociado'] . "</a>";
                        } else {
                            $rutaRadicado = $datosAnexoAsociado['asociado'];
                        }
                        $radicadoAnexo = $datosAnexoAsociado['asociado'];
                        $tipoRelacion = "ASOCIADO";
                    }
                    ?>
                    <tr class='listado2'>
                        <td>
                            <input type="checkbox" name="check_uno" aria-label="Seleccionar radicado anexo No. <?= $radicadoAnexo ?>" value="<?php print $radicadoAnexo; ?>" onClick="uno(document.forms[1]);">
                        </td>
                        <td>
                            <?php
                            print $rutaRadicado;
                            ?>
                        </td>
                        <td>
                            <a href='<?= $ruta_raiz ?>/verradicado.php?verrad=<?= $radicadoAnexo ?>&<?= session_name() ?>=<?= session_id() ?>&krd=<?= $krd ?>' aria-label="Ver informacion del radicado <?= $radicadoAnexo ?>" target="VERRAD<?= $radicadoAnexo ?>">
                                <?php
                                print $arrDatosRad['fechaRadicacion'];
                                ?>
                            </a>
                        </td>
                        <td>
                            <?php
                            print $arrDatosRad['tipoDocumento'];
                            ?>
                        </td>
                        <td>
                            <?php
                            print $arrDatosRad['asunto'];
                            ?>
                        </td>
                        <td>
                            <?php
                            print $tipoRelacion;
                            ?>
                        </td>
                    </tr>
                    <center>
                        <?php
                    }
                }
                $time_end = microtime_float();
                $time = $time_end - $time_start;
                echo "<span class='info'>";
                echo "<br><b>Se demor&oacute;: $time segundos la Operaci&oacute;n total.</b>";
                echo "</span>";
                ?>
            </center>
        </table>
    </body>
<script type="text/javascript">
    $('body').on('click', '.vinculoEXp', function() { 
        $('#loadFile').hide();
        $('.textMessageModalDoc').text('Cargando...');
        var idCampo = this.id;
        var radicadover = document.getElementById('radicadover'+idCampo).value;
        var expanex_numero = document.getElementById('expanex_numero'+idCampo).value;

        $.post('./buscaRutaArchivoPrincipal.php', {
            tipo: 3, //Documentos clientes
            id: radicadover,
            anexo: expanex_numero
        })
        .done(function (res) {
            if (res.status) {
                if (res.mostrar) {
                    loadPdf(res.token);
                    $('#loadFile').show();
                    $('.alertDoc').hide();
                } 
                else {
                    var rawss = window.atob(res.extencion);
                    document.getElementById('the-frame-expe').setAttribute('src', rawss);
                }
            } else {
                $('.textMessageModalDoc').text(res.message);
                $('.alertDoc').show();
            }
        });
        $("#myModalDocExp").modal();
    });

    function convertDataURIToBinary(base64) {
        var raw = window.atob(base64);
        var rawLength = raw.length;
        var array = new Uint8Array(new ArrayBuffer(rawLength));

        for (var i = 0; i < rawLength; i++) {
            array[i] = raw.charCodeAt(i);
        }
        return array;
    }

    function loadPdf(base64Document) {
        var pdfAsDataUri = base64Document;
        var pdfAsArray = convertDataURIToBinary(pdfAsDataUri);
        var url = 'pdfjs/web/viewer.php?file=';

        var binaryData = [];
        binaryData.push(pdfAsArray);
        var dataPdf = window.URL.createObjectURL(new Blob(binaryData, {type: "application/pdf"}))
        document.getElementById('the-frame-expe').setAttribute('src', url + encodeURIComponent(dataPdf));

    }
</script>
<div id="myModalDocExp" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" style="padding-right: 13px; margin-top: -21px;">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content" style="width: 148%; margin-left: -23%; height: 100%;">
            <button type="button" class="btn btn-default" data-dismiss="modal" style="padding: 5px; color: #FFFFFF; border-color: #1C4056; background-color: #1C4056;">Cerrar</button>
            <div class="modal-body">
                <div class="alert alert-warning alertDoc" role="alert">
                    <span class="textMessageModalDoc">Cargando...</span>
                </div>
                <div id="loadFile" style="display: none;">
                    <iframe id="the-frame-expe" width="100%" height="100%" allowfullscreen webkitallowfullscreen ></iframe>
                </div>
            </div>
        </div>
    </div>
</div>
</html>