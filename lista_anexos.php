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
$url_raiz = dirname($_SERVER['HTTP_HOST']);
$dir_raiz = dirname(__FILE__);
/* ---------------------------------------------------------+
  |                       MAIN                               |
  +--------------------------------------------------------- */
//empieza Anexos   por  Julian Rolon
//lista los documentos del radicado y proporciona links para ver historicos de cada documento
//este archivo se incluye en la pagina verradicado.php

define('ADODB_ASSOC_CASE', $assoc);

if (!$ruta_raiz)
    $ruta_raiz = ".";
include_once("$ruta_raiz/class_control/anexo.php");
include_once "$ruta_raiz/include/db/ConnectionHandler.php";
require_once("$ruta_raiz/class_control/TipoDocumento.php");
include_once "$ruta_raiz/class_control/firmaRadicado.php";
include "$ruta_raiz/config.php";
require_once("$ruta_raiz/class_control/ControlAplIntegrada.php");
require_once("$ruta_raiz/class_control/AplExternaError.php");

$db = new ConnectionHandler(".");
//$db->conn->debug = true;
$objTipoDocto = new TipoDocumento($db);
$objTipoDocto->TipoDocumento_codigo($tdoc);
$objFirma = new FirmaRadicado($db);
$objCtrlAplInt = new ControlAplIntegrada($db);

$db->conn->SetFetchMode(ADODB_FETCH_ASSOC);
$num_archivos = 0;
$ent = substr($verrad, -1);
//Retiro referencia
$anex = new Anexo($db);
$sqlFechaDocto = $db->conn->SQLDate("Y-m-D H:i:s A", "sgd_fech_doc");
$sqlFechaAnexo = $db->conn->SQLDate("Y-m-D H:i:s A", "anex_fech_anex");
//$sqlFechaAnexo = "to_char(anex_fech_anex, 'YYYY/DD/MM HH:MI:SS')";
$sqlSubstDesc = "anex_desc ";
include_once("include/query/busqueda/busquedaPiloto1.php");
// Modificado SGD 06-Septiembre-2007
$isql = "select distinct anex_codigo AS DOCU
                ,anex_tipo_ext AS EXT
                ,anex_tamano AS TAMA
                ,anex_solo_lect AS RO
                ,usua_nomb AS CREA
                ,$sqlSubstDesc AS DESCR
                ,anex_nomb_archivo AS NOMBRE
                ,ANEX_CREADOR
                ,ANEX_ORIGEN
                ,ANEX_SALIDA
                ,$radi_nume_salida as RADI_NUME_SALIDA
                ,ANEX_ESTADO
                ,SGD_PNUFE_CODI
                ,SGD_DOC_SECUENCIA
                ,SGD_DIR_TIPO
                ,SGD_DOC_PADRE
                ,SGD_APLI_CODI
                ,SGD_TRAD_CODIGO
                ,SGD_TPR_CODIGO
                ,ANEX_TIPO
                ,$sqlFechaDocto as FECDOC
                ,$sqlFechaAnexo as FEANEX
                ,ANEX_TIPO as NUMEXTDOC
                ,anex_radi_nume
                ,sgd_srd_codigo
                ,sgd_sbrd_codigo
                , anex_numero
           from anexos, anexos_tipo,usuario
           where anex_radi_nume='$verrad' and anex_tipo=anex_tipo_codi
                 and anex_creador=usua_login and anex_borrado='N'
	   order by anex_codigo desc";

$sqlcount = "select count(anex_codigo) as conteo from anexos where anex_radi_nume='$verrad'";
//order by anex_codigo,radi_nume_salida, sgd_dir_tipo, anex_numero ";
error_reporting(7);
?>
<script>
    swradics = 0;
    radicando = 0;

    function verDetalles(anexo, tpradic, aplinteg, num) {
        optAsigna = "";
        if (swradics == 0) {
            optAsigna = "&verunico=1";
        }
        contadorVentanas = contadorVentanas + 1;
        nombreventana = "ventanaDetalles" + contadorVentanas;
        //url="detalle_archivos.php?usua=<?= $krd ?>&radi=<?= $verrad ?>&anexo="+anexo;
        url = "<?= $ruta_raiz ?>/nuevo_archivo.php?codigo=" + anexo + "&<?= "krd=$krd&" . session_name() . "=" . trim(session_id()) ?>&usua=<?= $krd ?>&numrad=<?= $verrad ?>&contra=<?= $drde ?>&radi=<?= $verrad ?>&tipo=<?= $tipo ?>&ent=<?= $ent ?><?= $datos_envio ?>&ruta_raiz=<?= $ruta_raiz ?>" + "&tpradic=" + tpradic + "&aplinteg=" + aplinteg + optAsigna;
        window.open(url, nombreventana, 'top=0,height=580,width=640,scrollbars=yes,resizable=yes');
        return;
    }

    function borrarArchivo(anexo, linkarch, radicar_a, procesoNumeracionFechado) {
        if (confirm('Estas seguro de borrar este archivo anexo ?')) {
            contadorVentanas = contadorVentanas + 1;
            nombreventana = "ventanaBorrar" + contadorVentanas;
            //url="borrar_archivos.php?usua=<?= $krd ?>&contra=<?= $drde ?>&radi=<?= $verrad ?>&anexo="+anexo+"&linkarchivo="+linkarch;

            url = "lista_anexos_seleccionar_transaccion.php?borrar=1&usua=<?= $krd ?>&numrad=<?= $verrad ?>&&contra=<?= $drde ?>&radi=<?= $verrad ?>&anexo=" + anexo + "&linkarchivo=" + linkarch + "&numfe=" + procesoNumeracionFechado + "&dependencia=<?= $dependencia ?>&codusuario=<?= $codusuario ?>";
            window.open(url, nombreventana, 'height=100,width=180');
        }
        return;
    }

    function radicarArchivo(anexo, linkarch, radicar_a, procesoNumeracionFechado, tpradic, aplinteg, numextdoc) {
        if (radicando > 0) {
            alert("Ya se esta procesando una radicacion, para re-intentarlo hagla click sobre la pestaña documentos");
            return;
        }

        radicando++;

        if (confirm('Se asignar\xe1 un n\xfamero de radicado a \xe9ste documento. Est\xe1 seguro  ?')) {
            contadorVentanas = contadorVentanas + 1;
            nombreventana = "mainFrame";

            url = "<?= $ruta_raiz ?>/lista_anexos_seleccionar_transaccion.php?radicar=1&radicar_a=" + radicar_a + "&vp=n&<?= "&" . session_name() . "=" . trim(session_id()) ?>&radicar_documento=<?= $verrad ?>&numrad=<?= $verrad ?>&anexo=" + anexo + "&linkarchivo=" + linkarch + "<?= $datos_envio ?>" + "&ruta_raiz=<?= $ruta_raiz ?>&numfe=" + procesoNumeracionFechado + "&tpradic=" + tpradic + "&aplinteg=" + aplinteg + "&numextdoc=" + numextdoc;
            window.open(url, nombreventana, 'height=450,width=600');
        }
        return;
    }

    function numerarArchivo(anexo, linkarch, radicar_a, procesoNumeracionFechado) {
        if (confirm('Se asignar\xe1 un n\xfamero a \xe9ste documento. Est\xe1 seguro ?')) {
            contadorVentanas = contadorVentanas + 1;
            nombreventana = "mainFrame";
            url = "<?= $ruta_raiz ?>/lista_anexos_seleccionar_transaccion.php?numerar=1" + "&vp=n&<?= "krd=$krd&" . session_name() . "=" . trim(session_id()) ?>&radicar_documento=<?= $verrad ?>&numrad=<?= $verrad ?>&anexo=" + anexo + "&linkarchivo=" + linkarch + "<?= $datos_envio ?>" + "&ruta_raiz=<?= $ruta_raiz ?>&numfe=" + procesoNumeracionFechado;
            window.open(url, nombreventana, 'height=450,width=600');
        }
        return;
    }

    function asignarRadicado(anexo, linkarch, radicar_a, numextdoc) {
        if (radicando > 0) {
            alert("Ya se esta procesando una radicacion, para re-intentarlo hagla click sobre la pestaña de documentos");
            return;
        }

        radicando++;

        if (confirm('Esta seguro de asignarle el numero de Radicado a este archivo ?')) {
            contadorVentanas = contadorVentanas + 1;
            nombreventana = "mainFrame";
            url = "<?= $ruta_raiz ?>/genarchivo.php?generar_numero=no&radicar_a=" + radicar_a + "&vp=n&<?= "&" . session_name() . "=" . trim(session_id()) ?>&radicar_documento=<?= $verrad ?>&numrad=<?= $verrad ?>&anexo=" + anexo + "&linkarchivo=" + linkarch + "<?= $datos_envio ?>" + "&ruta_raiz=<?= $ruta_raiz ?>" + "&numextdoc=" + numextdoc;
            window.open(url, nombreventana, 'height=450,width=600');
        }
        return;
    }

    function ver_tipodocuATRD(anexo, codserie, tsub) {
<?php
$isqlDepR = "SELECT RADI_DEPE_ACTU,RADI_USUA_ACTU from radicado WHERE RADI_NUME_RADI = '$numrad'";
$rsDepR = $db->conn->Execute($isqlDepR);
$coddepe = $rsDepR->fields['RADI_DEPE_ACTU'];
$codusua = $rsDepR->fields['RADI_USUA_ACTU'];
$ind_ProcAnex = "S";
?>
        window.open("./radicacion/tipificar_documento.php?krd=<?= $krd ?>&nurad=" + anexo + "&ind_ProcAnex=<?= $ind_ProcAnex ?>&codusua=<?= $codusua ?>&coddepe=<?= $coddepe ?>&tsub=" + tsub + "&codserie=" + codserie + "&texp=<?= $texp ?>", "Tipificacion_Documento_Anexos", "height=500,width=750,scrollbars=yes");
    }

    function ver_tipodocuAnex(cod_radi, codserie, tsub) {
        window.open("./radicacion/tipificar_anexo.php?krd=<?= $krd ?>&nurad=" + cod_radi + "&ind_ProcAnex=<?= $ind_ProcAnex ?>&codusua=<?= $codusua ?>&coddepe=<?= $coddepe ?>&tsub=" + tsub + "&codserie=" + codserie, "Tipificacion_Documento_Anexos", "height=300,width=750,scrollbars=yes");
    }

    function vistaPreliminar(anexo, linkarch, linkarchtmp) {
        contadorVentanas = contadorVentanas + 1;
        nombreventana = "mainFrame";
        url = "<?= $ruta_raiz ?>/genarchivo.php?vp=s&<?= "krd=$krd&" . session_name() . "=" . trim(session_id()) ?>&radicar_documento=<?= $verrad ?>&numrad=<?= $verrad ?>&anexo=" + anexo + "&linkarchivo=" + linkarch + "&linkarchivotmp=" + linkarchtmp + "<?= $datos_envio ?>" + "&ruta_raiz=<?= $ruta_raiz ?>";
        window.open(url, nombreventana, 'height=450,width=600');
        return;
    }

    function nuevoArchivo(asigna) {
        contadorVentanas = contadorVentanas + 1;
        optAsigna = "";
        if (asigna == 1) {
            optAsigna = "&verunico=1";
        }
        //alert (asigna);
        nombreventana = "ventanaNuevo" + contadorVentanas;
        url = "<?= $url_raiz ?>/nuevo_archivo.php?codigo=&<?= "krd=$krd&" . session_name() . "=" . trim(session_id()) ?>&usua=<?= $krd ?>&numrad=<?= $verrad ?>&contra=<?= $drde ?>&radi=<?= $verrad ?>&tipo=<?= $tipo ?>&ent=<?= $ent ?>" + "<?= $datos_envio ?>" + "&ruta_raiz=<?= $ruta_raiz ?>&tdoc=<?= $tdoc ?>" + optAsigna;
                window.open(url, nombreventana, 'height=700,width=632,scrollbars=yes,resizable=yes');
                return;
            }

            function nuevoEditWeb(asigna) {
                contadorVentanas = contadorVentanas + 1;
                optAsigna = "";
                if (asigna == 1) {
                    optAsigna = "&verunico=1";
                }
                //alert (asigna);
                nombreventana = "ventanaNuevo" + contadorVentanas;
                url = "<?= $ruta_raiz ?>/edicionWeb/editorWeb.php?codigo=&<?= "krd=$krd&" . session_name() . "=" . trim(session_id()) ?>&usua=<?= $krd ?>&numrad=<?= $verrad ?>&contra=<?= $drde ?>&radi=<?= $verrad ?>&tipo=<?= $tipo ?>&ent=<?= $ent ?>" + "<?= $datos_envio ?>" + "&ruta_raiz=<?= $ruta_raiz ?>&tdoc=<?= $tdoc ?>" + optAsigna;
                        window.open(url, nombreventana, 'height=800,width=700,scrollbars=yes,resizable=yes');
                        return;
                    }

                    function Plantillas(plantillaper1) {
                        if (plantillaper1 == 0) {
                            plantillaper1 = "";
                        }
                        contadorVentanas = contadorVentanas + 1;
                        nombreventana = "ventanaNuevo" + contadorVentanas;
                        urlp = "plantilla.php?<?= "krd=$krd&" . session_name() . "=" . trim(session_id()); ?>&verrad=<?= $verrad ?>&numrad=<?= $numrad ?>&plantillaper1=" + plantillaper1;
                        window.open(urlp, nombreventana, 'top=0,left=0,height=800,width=850');
                        return;
                    }

                    function Plantillas_pb(plantillaper1) {
                        if (plantillaper1 == 0) {
                            plantillaper1 = "";
                        }
                        contadorVentanas = contadorVentanas + 1;
                        nombreventana = "ventanaNuevo" + contadorVentanas;
                        urlp = "crea_plantillas/plantilla.php?<?= "krd=$krd&" . session_name() . "=" . trim(session_id()); ?>&verrad=<?= $verrad ?>&numrad=<?= $numrad ?>&plantillaper1=" + plantillaper1;
                        window.open(urlp, nombreventana, 'top=0,left=0,height=800,width=850');
                        return;
                    }

                    function regresar() {
                        //window.history.go(0);
                        window.location.reload();
                        window.close();
                    }

</script>
<!--<link rel="stylesheet" href="estilos/orfeo.css">-->
<style>
    .listado6 {
        background-color: silver;
        font-size: 12px;
    }
</style>
<body>
    <table width="100%" border="1" cellspacing="0" cellpadding="0">
        <tr>
            <td  width="15%" class="titulos2"><img src="<?= $ruta_raiz ?>/<?= $imagenes ?>/estadoDocInfo.gif" width="280" height="30" alt="Imagen con la especificacion de los estado de un documento, anexado, radicado, impreso, enviado"></td>
            <td  width="85%" class="titulos2">Generaci&oacute;n de documentos</td>
        </tr>
    </table><br>
    <?php
    if ($verradPermisos == "Full") {
        ?>
        <table  width="100%" align="center" border="1" cellpadding="0" cellspacing="5" class="borde_tab">
            <tr align="center" class="titulos2">
                <td style="text-align: center">
                    <a class="vinculosCabezote" href='javascript:nuevoArchivo(<? if ( $num_archivos==0 && $swRadDesdeAnex==false)  echo "1"; else echo "0";  ?>)' class="timpar">
                        Anexar Archivo ... </a>
                </td>
            <script>
                swradics =<?= $num_archivos ?>;
            </script>
        </tr>
    </table>
    <?php
}
?>
<table WIDTH="100%" align="center" border="1" cellpadding="0" cellspacing="5" class="borde_tab" style="margin-top: 10px;">
    <tr class='etextomenu' align='middle'>
        <th width='10%' class="titulos3" align="left">
            <img src="<?= $ruta_raiz ?>/<?= $imagenes ?>/estadoDoc.gif" width="130" alt="Imagen con la especificacion de los estado de un documento, anexado, radicado, impreso, enviado" height="32">
        </th>
        <th width='15%'  class="titulos3">Radicado</th>
        <th  width='5%' class="titulos3">Tipo</th>
        <th  width='30%' class="titulos3" colspan="3">TRD</font></th>
        <th  width='20%' class="titulos3" >Creador</th>
        <th  width='20%' class="titulos3">Descripci&oacute;n</th>
        <th  width='12%' class="titulos3">Anexado</th>
        <th  width='35%' colspan="5" class="titulos3">Acci&oacute;n</th>
    </tr>
    <?php
    $rowan = array();
    $rs = $db->query($isql);
    $rsCountanex = $db->query($sqlcount);
//    echo '********************* '.$isql.' **************** '. $rsCountanex->fields["conteo"].'<br>';
    $tiposdocumentales = $objTipoDocto->getDatosPermisosTipo();
    //By Skina Inci
    // Ing Camilo Pintor
    //Se agrega opcion de borrar documentos de todo lo tipos que no hallan sido radicados
    $perm_borrar_anexo = $_SESSION['perm_borrar_anexo'];

    if (!$ruta_raiz_archivo)
        $ruta_raiz_archivo = $ruta_raiz;
    $directoriobase = "$ruta_raiz_archivo/bodega/";
    //Flag que indica si el radicado padre fue generado desde esta Ã¡rea de anexos
    $swRadDesdeAnex = $anex->radGeneradoDesdeAnexo($verrad);

    // By Skinatech - 14/08/2018
    // Para la construcción del número de radicado, esto indica la parte inicial del radicado.
    if ($estructuraRad == 'ymd') {
        $num = 8;
    } elseif ($estructuraRad == 'ym') {
        $num = 6;
    } else {
        $num = 4;
    }
    
    if ($rs) {
        while (!$rs->EOF) {
            $contadorAnexos = $rsCountanex->fields["conteo"];
            $anexNumero = isset($rs->fields["anex_numero"]) ? $rs->fields["anex_numero"] : $rs->fields["ANEX_NUMERO"];
            $classanex = 'listado2';

            $anexradprincipal = $rs->fields["anex_radi_nume"];
            $aplinteg = $rs->fields["SGD_APLI_CODI"];
            $numextdoc = $rs->fields["NUMEXTDOC"];
            $tpradic = $rs->fields["SGD_TRAD_CODIGO"];
            $coddocu = $rs->fields["DOCU"];
            $origen = $rs->fields["ANEX_ORIGEN"];
            $tdocper = $rs->fields["SGD_TPR_CODIGO"];

            if ($rs->fields["ANEX_SALIDA"] == 1)
                $num_archivos++;
            $puedeRadicarAnexo = $objCtrlAplInt->contiInstancia($coddocu, $MODULO_RADICACION_DOCS_ANEXOS, 2);
            $linkarchivo = $directoriobase . substr(trim($coddocu), 0, 4) . "/" . strtoupper(substr(trim($coddocu), $num, $longitud_codigo_dependencia)) . "/docs/" . trim(strtoupper(stristr($rs->fields["NOMBRE"], ".", true))) . trim(stristr($rs->fields['NOMBRE'], "."));
            $linkarchivo_vista = "$ruta_raiz/bodega/" . substr(trim($coddocu), 0, 4) . "/" . strtoupper(substr(trim($coddocu), $num, $longitud_codigo_dependencia)) . "/docs/" . trim(strtoupper(stristr($rs->fields["NOMBRE"], ".", true))) . trim(stristr($rs->fields['NOMBRE'], ".")) . "?time=" . time();
            $linkarchivotmp = $directoriobase . substr(trim($coddocu), 0, 4) . "/" . strtoupper(substr(trim($coddocu), $num, $longitud_codigo_dependencia)) . "/docs/tmp" . trim(strtoupper(stristr($rs->fields["NOMBRE"], ".", true))) . trim(stristr($rs->fields['NOMBRE'], "."));
            if (!trim($rs->fields["NOMBRE"]))
                $linkarchivo = "";
            ?>
            <tr class="<?= $classanex ?>">
                <?php
                if ($origen == 1) {
                    echo " class='timpar' ";
                    if ($rs->fields["NOMBRE"] == "No") {
                        $linkarchivo = "";
                    }
                    echo "";
                }
                if ($rs->fields["RADI_NUME_SALIDA"] != 0) {
                    $cod_radi = $rs->fields["RADI_NUME_SALIDA"];
                } else {
                    $cod_radi = $coddocu;
                }

                $anex_estado = $rs->fields["ANEX_ESTADO"];
                if ($anex_estado <= 1) {
                    $img_estado = "<img  alt='Se ha subido un documento al anexo' src=$ruta_raiz/$imagenes/docRecibido.gif ";
                }
                if ($anex_estado == 2) {
                    $estadoFirma = $objFirma->firmaCompleta($cod_radi);
                    if ($estadoFirma == "NO_SOLICITADA")
                        $img_estado = "<img src=$ruta_raiz/$imagenes/docRadicado.gif  border=0 alt='Se ha radicado el documento subido al anexo'>";
                    else if ($estadoFirma == "COMPLETA") {
                        $img_estado = "<img src=$ruta_raiz/$imagenes/docFirmado.gif  border=0 alt='El documento radicado se ha generado firma'>";
                    } else if ($estadoFirma == "INCOMPLETA") {
                        $img_estado = "<img src=$ruta_raiz/$imagenes/docEsperaFirma.gif border=0 alt='El documento esta a la espera de firma'>";
                    }
                }
                if ($anex_estado == 3) {
                    $img_estado = "<img src=$ruta_raiz/$imagenes/docImpreso.gif alt='EL documento radicado se ha marcado como impreso'>";
                }
                if ($anex_estado == 4) {
                    $img_estado = "<img src=$ruta_raiz/$imagenes/docEnviado.gif alt='EL documento radicado se ha enviado al destinatario'>";
                }
                ?>
                <TD height="21"> <font size=1> <?= $img_estado ?> </font></TD>
                <TD>
                    <font size=1>
                    <?php
                    echo "<input type='hidden' name='radicadover' id='radicadover$anexNumero' value='" . $verrad . "'  >";
                    echo '<input type="hidden" name="expanex_numero" id="expanex_numero'.$anexNumero.'" value="'.$anexNumero.'">';

                    $qsss = "select *  from sgd_tpr_tpdcumento where sgd_tpr_codigo=$tdocper";
                    $rssss = $db->query($qsss);
                    $nombre = $rssss->fields['sgd_tpr_descrip'];

                    if (in_array($tdocper, $tiposdocumentales)) {
                        if($rs->fields["EXT"] != 'pdf' && $rs->fields["EXT"] != 'png' && $rs->fields["EXT"] != 'jpg' && $rs->fields["EXT"] != 'tiff'){
                            echo "<b><a class=vinculos href='" . trim($linkarchivo_vista) . "' aria-label='Abrir docuemnto cargado al anexo'>" . trim($cod_radi) . "</a>";
                        }else{
                            echo "<b><a class='vinculos vinculoid' id=$anexNumero href='#myModalDocDesc' aria-label='Abrir docuemnto cargado al anexo'>" . trim($cod_radi) . "</a>";
                        }
                    } else {
                        echo "<a class=vinculos href='#' onclick=\"alert('Usted no tiene acceso al tipo documental " . $nombre . ". Comun&iacute;quese con el administrador')\">" . trim($cod_radi) . "</a>";
                    }
                    ?>
                    </font> 
                </td>
                <TD>
                    <font size=1> 
                    <?php
                    if (trim($linkarchivo)) {
                        echo $rs->fields["EXT"];
                    } else {
                        echo $msg;
                    }
                    if ($rs->fields["SGD_DIR_TIPO"] == 7)
                        $msg = "Otro Destinatario";
                    else
                        $msg = "Otro Destinatario";
                    ?> 
                    </font> 
                </td>
                <td width="1%" valign="middle" colspan="3">
                    <font face="Arial, Helvetica, sans-serif" class="etextomenu">
                    <?php
                    /** Indica si el Radicado Ya tiene asociado algun TRD */
                    $isql_TRDA = "SELECT * FROM SGD_RDF_RETDOCF WHERE RADI_NUME_RADI = '$cod_radi'";
                    $rs_TRA = $db->conn->Execute($isql_TRDA);
                    $radiNumero = $assoc == 0 ? $rs_TRA->fields["radi_nume_radi"] : $rs_TRA->fields["RADI_NUME_RADI"];
                    $mrdTRD = $assoc == 0 ? $rs_TRA->fields["sgd_mrd_codigo"] : $rs_TRA->fields["SGD_MRD_CODIGO"];

                    $selectTRD = "select distinct tp.sgd_tpr_descrip, sr.sgd_srd_descrip, srb.sgd_sbrd_descrip from sgd_mrd_matrird mrd";

                    if ($radiNumero == '') {
                        /* Para extraer la información que tiene asignado el anexo cargado, serie, subserie, tipodocumental */
                        $trdAnex = "select sgd_sbrd_codigo, sgd_srd_codigo, sgd_tpr_codigo from anexos where anex_codigo='$coddocu'";
                        $rsselect_TRA_anex = $db->conn->Execute($trdAnex);

                        $codserieanex = $assoc == 0 ? $rsselect_TRA_anex->fields["sgd_srd_codigo"] : $rsselect_TRA_anex->fields["SGD_SRD_CODIGO"];
                        $tsubanex = $assoc == 0 ? $rsselect_TRA_anex->fields["sgd_sbrd_codigo"] : $rsselect_TRA_anex->fields["SGD_SBRD_CODIGO"];
                        $tdocanex = $assoc == 0 ? $rsselect_TRA_anex->fields["sgd_tpr_codigo"] : $rsselect_TRA_anex->fields["SGD_TPR_CODIGO"];

                        $selectTRD .= " inner join sgd_tpr_tpdcumento tp on mrd.sgd_tpr_codigo=tp.sgd_tpr_codigo
                                inner join sgd_sbrd_subserierd srb on mrd.sgd_sbrd_codigo=srb.sgd_sbrd_codigo 
                                inner join sgd_srd_seriesrd sr on mrd.sgd_srd_codigo=sr.sgd_srd_codigo 
                            where srb.sgd_srd_codigo=sr.sgd_srd_codigo and mrd.sgd_tpr_codigo = $tdocanex "
                                . "and mrd.sgd_srd_codigo = $codserieanex and mrd.sgd_sbrd_codigo = $tsubanex";
                    } else {
                        $selectTRD .= " inner join sgd_rdf_retdocf rdf on mrd.sgd_mrd_codigo=rdf.sgd_mrd_codigo 
                                inner join sgd_tpr_tpdcumento tp on mrd.sgd_tpr_codigo=tp.sgd_tpr_codigo
                                inner join sgd_sbrd_subserierd srb on mrd.sgd_sbrd_codigo=srb.sgd_sbrd_codigo 
                                inner join sgd_srd_seriesrd sr on mrd.sgd_srd_codigo=sr.sgd_srd_codigo 
                            where  srb.sgd_srd_codigo=sr.sgd_srd_codigo and mrd.sgd_mrd_codigo = $mrdTRD and rdf.radi_nume_radi='$radiNumero'";
                    }
                    $rsselect_TRA = $db->conn->Execute($selectTRD);
                    
                    /* Se agrega esta*/
                    $datoSgd_tpr_descrip = $assoc == 0 ? $rsselect_TRA->fields["sgd_tpr_descrip"] : $rsselect_TRA_anex->fields["SGD_TPR_DESCRIP"];
                    $datoSgd_srd_descrip = $assoc == 0 ? $rsselect_TRA->fields["sgd_srd_descrip"] : $rsselect_TRA_anex->fields["SGD_SRD_DESCRIP"];
                    $datoSgd_sbrd_descrip = $assoc == 0 ? $rsselect_TRA->fields["sgd_sbrd_descrip"] : $rsselect_TRA_anex->fields["SGD_SBRD_DESCRIP"];

                    if ($datoSgd_tpr_descrip != '') {
                        $msg_TRD = $datoSgd_srd_descrip . ' / ' . $datoSgd_sbrd_descrip . ' / ' . $datoSgd_tpr_descrip;
                    } else {
                        $trdAnex = "select sgd_sbrd_codigo as SGD_SBRD_CODIGO, sgd_srd_codigo, sgd_tpr_codigo from anexos where anex_codigo='$coddocu'";
                        $rsselect_TRA_anex = $db->conn->Execute($trdAnex);

                        if ($rsselect_TRA_anex->fields["SGD_SBRD_CODIGO"] != '') {
                            $srserie = $assoc == 0 ? $rsselect_TRA_anex->fields["sgd_srd_codigo"] : $rsselect_TRA_anex->fields["SGD_SRD_CODIGO"];
                            $srbserie = $assoc == 0 ? $rsselect_TRA_anex->fields["sgd_sbrd_codigo"] : $rsselect_TRA_anex->fields["SGD_SBRD_CODIGO"];
                            $srtipodoc = $assoc == 0 ? $rsselect_TRA_anex->fields["sgd_tpr_codigo"] : $rsselect_TRA_anex->fields["SGD_TPR_CODIGO"];
                            /************************************************************************************** 
                             * Se consulta tabla por tabla la información correspondiente a la trd desde Skinascan *
                             * ************************************************************************************* */
                            $infoserie = "select sgd_srd_descrip as SGD_SRD_DESCRIP from sgd_srd_seriesrd where sgd_srd_codigo=" . $srserie;
                            $rsinfoserie = $db->conn->Execute($infoserie);
                            $infosubserie = "select sgd_sbrd_descrip as SGD_SBRD_DESCRIP from sgd_sbrd_subserierd where sgd_srd_codigo=" . $srserie . " and sgd_sbrd_codigo=" . $srbserie;
                            $rsinfosubserie = $db->conn->Execute($infosubserie);
                            $infotipodoc = "select sgd_tpr_descrip as SGD_TPR_DESCRIP from sgd_tpr_tpdcumento where sgd_tpr_codigo=" . $srtipodoc;
                            $rsinfotipodoc = $db->conn->Execute($infotipodoc);

                            $msg_TRD = $rsinfoserie->fields["SGD_SRD_DESCRIP"] . ' / ' . $rsinfosubserie->fields["SGD_SBRD_DESCRIP"] . ' / ' . $rsinfotipodoc->fields["SGD_TPR_DESCRIP"];
                        } else {
                            $msg_TRD = "No";
                        }
                    }
                    ?>
            <center>
                <?php
                echo $msg_TRD;
                ?>
            </center>
            </font>
        </td>
        </font>
        </TD>
        <td><font size=1> <?php echo $assoc == 0 ? $rs->fields["crea"] : $rs->fields["CREA"] ?> </font></td>
        <td><font size=1> <?php echo $assoc == 0 ? $rs->fields["descr"] : $rs->fields["DESCR"] ?> </font></td>
        <td><font size=1> <?php echo $assoc == 0 ? $rs->fields["feanex"] : $rs->fields["FEANEX"]?> </font></td>
        <td ><font size=1>
            <?php
            if (in_array($tdocper, $tiposdocumentales)) {
                $permisoS = 'si';
            } else {
                $permisoS = 'no';
            }
            if ($origen != 1 and $linkarchivo and $verradPermisos == "Full" and $permisoS == 'si') {	
                if ($anex_estado == 4 and $perm_tipif_anexo == 1)
                    echo "<a class=vinculos href=javascript:verDetalles('$coddocu','$tpradic','$aplinteg') aria-label='Ingrese para modificar datos del anexo y plantilla'>Modificar</a> ";
                elseif ($anex_estado != 4)
                    echo "<a class=vinculos href=javascript:verDetalles('$coddocu','$tpradic','$aplinteg'); aria-label='Ingrese para modificar datos del anexo y plantilla'>Modificar</a> ";
            }
            ?>
            </font>
        </td>
        <?php
        //Estas variables se utilizan para verificar si se debe mostrar la opci�n de tipificaci�n de anexo .TIF
        $anexTipo = $rs->fields["ANEX_TIPO"];
        $anexTPRActual = $rs->fields["SGD_TPR_CODIGO"];
        if ($verradPermisos == "Full") {
            ?>
                                                                            <!--            <td ><font size=1>
            <?php
//                $radiNumeAnexo = $rs->fields["RADI_NUME_SALIDA"];
//                if ($radiNumeAnexo > 0 and trim($linkarchivo)) {
//                    if (!$codserie)
//                        $codserie = "0";
//                    if (!$tsub)
//                        $tsub = "0";
//                    echo "<a class=vinculos href=javascript:ver_tipodocuATRD('$radiNumeAnexo',$codserie,$tsub); aria-label='Asignar clasificacion documental a anexo' >Tipificar</a> ";
//                }elseif ($perm_tipif_anexo == 1 && $anexTipo == 99 && $anexTPRActual == '') { //Es un anexo de tipo tif (4) y el usuario tiene permiso para Tipificar, adem�s el anexo no ha sido tipificado
//                    if (!$codserie)
//                        $codserie = "0";
//                    if (!$tsub)
//                        $tsub = "0";
////			echo "<a class=vinculoTipifAnex href=javascript:ver_tipodocuAnex('$cod_radi','$anexo',$codserie,$tsub);> Tipificar </a> ";
//                    echo "<a class=vinculoTipifAnex href=javascript:ver_tipodocuAnex('$cod_radi',$codserie,$tsub); aria-label='Asignar clasificacion documental a anexo'> Tipificar </a> ";
//                }elseif ($perm_tipif_anexo == 1 && $anexTipo == 99 && $anexTPRActual != '') { //Es un anexo de tipo tif (4) y el usuario tiene permiso para Tipificar, adem�s el anexo YA ha sido tipificado antes
//                    if (!$codserie)
//                        $codserie = "0";
//                    if (!$tsub)
//                        $tsub = "0";
//                    //echo "<a class=vinculoTipifAnex href=javascript:ver_tipodocuAnex('$cod_radi','$anexo',$codserie,$tsub);> Re-Tipificar </a> ";
//                    echo "<a class=vinculoTipifAnex href=javascript:ver_tipodocuAnex('$cod_radi',$codserie,$tsub);  aria-label='Asignar clasificacion documental a anexo'> Re-Tipificar </a> ";
//                }
            ?>
                                                                                    </font>
                                                                                </td>-->
            <td >
                <font size=1>
            <?php
            if ($rs->fields["RADI_NUME_SALIDA"] == 0  and ( trim($rs->fields["ANEX_CREADOR"]) == trim($krd) OR $codusuario == 1)
            ) {
                //Se agrega opcion de borrar documentos de todo lo tipos que no hallan sido radicados
                if ($perm_borrar_anexo == 1 and $anex_estado == 0) {
                    echo "<a class=vinculos href=javascript:borrarArchivo('$coddocu','$linkarchivo','$cod_radi','" . $rs->fields["SGD_PNUFE_CODI"] . "');  aria-label='Borrar documento anexo' >Borrar</a> ";
                }
            }
            ?>
                </font>
            </td>
            <td ><font size=1>
                <?php
                /**
                 *  $perm_radi_sal  Viene del campo PER_RADI_SAL y Establece permiso en la rad. de salida
                 *  1 Radicar documentos,  2 Impresion de Doc's, 3 Radicacion e Impresion.
                 *  (Por. Jh)
                 *  Ademas verifica que el documento no este radicado con $rowwan[9] y [10]
                 *  El jefe con $codusuario=1 siempre podra radicar
                 */
                if ($tpPerRad[$tpradic] == 2 or $tpPerRad[$tpradic] == 3) {
                    if (!$rs->fields["RADI_NUME_SALIDA"]) {
                        //By skina valido respuestas a doc de entrada 2,7 y pqr registrada en config.php

                        if (($ent == 2 or $ent == $tipoRadicadoPqr) && $puedeRadicarAnexo == 1) {
                            $rs->fields["SGD_PNUFE_CODI"] = 0;
                            echo "<a class=vinculos href=javascript:radicarArchivo('$coddocu','$linkarchivo','si'," . $rs->fields["SGD_PNUFE_CODI"] . ",'$tpradic','$aplinteg','$numextdoc');  aria-label='Generar numero nuevo de radicado tipo $tpradic a documento anexado'>Radicar(-$tpradic)</a>";
                            $radicado = "false";
                            $anexo = $cod_radi;
                        } else
                        if ($puedeRadicarAnexo != 1) {
                            $objError = new AplExternaError();
                            $objError->setMessage($puedeRadicarAnexo);
                            echo ($objError->getMessage());
                        } else {
//                            echo 'paso aqui linea 608 <br> ';
                            //By skina valido respuestas a doc de entrada 2,4,7
                            if (($ent != 2 and $ent != $tipoRadicadoPqr) and $num_archivos == 1 and ! $rs->fields["SGD_PNUFE_CODI"] and $swRadDesdeAnex == false) {
                                echo "<a class=vinculos href=javascript:asignarRadicado('$coddocu','$linkarchivo','$cod_radi','$numextdoc');  aria-label='Asignar el mismo numero de radicado al cual esta anexado '>Asignar Rad</a>";
                                $radicado = "false";
                                $anexo = $cod_radi;
                            } else if ($rs->fields["SGD_PNUFE_CODI"] && strcmp($cod_radi, $rs->fields["SGD_DOC_PADRE"]) == 0 && !$anex->seHaRadicadoUnPaquete($rs->fields["SGD_DOC_PADRE"])) {
                                //if (strstr($rs->fields["RADI_PATH"], ".", true) == "docx") {
                                echo "<a class=vinculos href=javascript:radicarArchivo('$coddocu','$linkarchivo','si'," . $rs->fields["SGD_PNUFE_CODI"] . ",'$tpradic','$aplinteg','$numextdoc');  aria-label='Generar nuevo radicado tipo $tpradic al documento anexo'>Radicar($tpradic)</a>";
                                $radicado = "false";
                                $anexo = $cod_radi;
                                //}
                            } else if ($puedeRadicarAnexo == 1) {
                                $rs->fields["SGD_PNUFE_CODI"] = 0;
                                echo "<a class=vinculos href=javascript:radicarArchivo('$coddocu','$linkarchivo','si'," . $rs->fields["SGD_PNUFE_CODI"] . ",'$tpradic','$aplinteg',$numextdoc);  aria-label='Generar radicado nuevo tipo $tpradic al documento anexo'>Radicar(-$tpradic)</a>";
                                $radicado = "false";
                                $anexo = $cod_radi;
                            }
                        }
                    } else {
                        if (!$rs->fields["SGD_PNUFE_CODI"])
                            $rs->fields["SGD_PNUFE_CODI"] = 0;
                        if ($anex_estado < 4) {
                            echo "<a class=vinculos href=javascript:radicarArchivo('$coddocu','$linkarchivo','$cod_radi'," . $rs->fields["SGD_PNUFE_CODI"] . ",'','',$numextdoc);  aria-label='Re-generar la radicacion del documento anexo para que tome los nuevos datos o la nueva plantilla'>Re-Generar</a>";
                            $radicado = "true";
                        }
                    }
                } else if ($rs->fields["SGD_PNUFE_CODI"] && ($usua_perm_numera_res == 1) && $ruta_raiz != ".." && !$rs->fields["SGD_DOC_SECUENCIA"] && strcmp($cod_radi, $rs->fields["SGD_DOC_PADRE"]) == 0) { // SI ES PAQUETE DE DOCUMENTOS Y EL USUARIO TIENE PERMISOS
                    echo "<a class=vinculos href=javascript:numerarArchivo('$coddocu','$linkarchivo','si'," . $rs->fields["SGD_PNUFE_CODI"] . ")>Numerar</a>";
                }
                if ($rs->fields["RADI_NUME_SALIDA"]) {
                    $radicado = "true";
                }
                ?>
                </font>
            </td>
            <?php
        } else {

        }
        ?>
        </tr>
        <?php
        $rs->MoveNext();
    }
}
?>
</table>
</body>
<script type="text/javascript">
    
    <?php if ($rutaAnexo): ?>
        
    $( document ).ready(function() {
        ruta = "<?= $rutaAnexo ?>";
            $.post('buscaRutaArchivoPrincipal.php', {
            tipo: 4, 
            rutaAnexo: ruta
        })
        .done(function (res) {
            if (res.status) {
                if (res.mostrar == true) {
                    loadPdf(res.token);
                    $('#loadFile').show();
                    $('.alertDoc').hide();
                } 
                else {
                    var rawss = window.atob(res.extencion);
                    document.getElementById('the-frame').setAttribute('src', rawss);
                }
            } else {
                $('.textMessageModalDoc').text(res.message);
                $('.alertDoc').show();
            }
        });
        $("#myModalDocDesc").modal("show");
        
        
    });
            
    <?php endif; ?>

    $('body').on('click', '.vinculoid', function() {
        $('#loadFile').hide();
        $('.textMessageModalDoc').text('Cargando...');
        var idCampo = this.id;
        var variable_post = document.getElementById('radicadover'+idCampo).value;
        var anex_numero = document.getElementById('expanex_numero'+idCampo).value;

        $.post('buscaRutaArchivoPrincipal.php', {
            tipo: 2, //Documentos clientes
            id: variable_post,
            anexo: anex_numero
        })
        .done(function (res) {
            if (res.status) {
                if (res.mostrar == true) {
                    loadPdf(res.token);
                    $('#loadFile').show();
                    $('.alertDoc').hide();
                } 
                else {
                    var rawss = window.atob(res.extencion);
                    document.getElementById('the-frame').setAttribute('src', rawss);
                }
            } else {
                $('.textMessageModalDoc').text(res.message);
                $('.alertDoc').show();
            }
        });
        $("#myModalDocDesc").modal("show");
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
        document.getElementById('the-frame').setAttribute('src', url + encodeURIComponent(dataPdf));

    }
</script>
<div id="myModalDocDesc" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" style="padding-right: 13px; margin-top: -21px;">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content" style="width: 148%; margin-left: -23%; height: 100%;">
            <button type="button" class="btn btn-default" data-dismiss="modal" style="padding: 2px; color: #FFFFFF; border-color: #1C4056; background-color: #1C4056;">Cerrar</button>
            <div class="modal-body">
                <div class="alert alert-warning alertDoc" role="alert">
                    <span class="textMessageModalDoc">Cargando...</span>
                </div>
                <div id="loadFile" style="display: none;">
                    <iframe id="the-frame" width="100%" height="100%" allowfullscreen webkitallowfullscreen ></iframe>
                </div>
            </div>
        </div>
    </div>
</div>
