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

if (!$tipoEstadistica)
    $tipoEstadistica = 1;
if (!$dependencia_busq)
    $dependencia_busq = $dependencia;

$krd = $_SESSION["krd"];
foreach ($_GET as $key => $valor)
    ${$key} = $valor;
foreach ($_POST as $key => $valor)
    ${$key} = $valor;

$nomcarpeta = $_GET["carpeta"];
$tipo_carpt = $_GET["tipo_carpt"];
if ($_GET["orderNo"])
    $orderNo = $_GET["orderNo"];
if ($_GET["orderTipo"])
    $orderTipo = $_GET["orderTipo"];
if ($_GET["tipoEstadistica"])
    $tipoEstadistica = $_GET["tipoEstadistica"];
else if (!$tipoEstadistica)
    $tipoEstadistica = $_POST["tipoEstadistica"];

if ($_GET["genDetalle"])
    $genDetalle = $_GET["genDetalle"];
if ($_GET["dependencia_busq"])
    $dependencia_busq = $_GET["dependencia_busq"];
if ($_GET["fecha_ini"])
    $fecha_ini = $_GET["fecha_ini"];
if ($_GET["fecha_fin"])
    $fecha_fin = $_GET["fecha_fin"];
if ($_GET["codus"])
    $codus = $_GET["codus"];
if ($_GET["tipoRadicado"])
    $tipoRadicado = $_GET["tipoRadicado"];
if ($_GET["codUs"])
    $codUs = $_GET["codUs"];
if ($_GET["fecSel"])
    $fecSel = $_GET["fecSel"];
if ($_GET["genDetalle"])
    $genDetalle = $_GET["genDetalle"];
if ($_GET["generarOrfeo"])
    $generarOrfeo = $_GET["generarOrfeo"];

if (!$tipoEstadistica)
    $tipoEstadistica = 1;
if (!$dependencia_busq)
    $dependencia_busq = $dependencia;

$dependencia = $_SESSION["dependencia"];
$usua_doc = $_SESSION["usua_doc"];
$codusuario = $_SESSION["codusuario"];
$tip3Nombre = $_SESSION["tip3Nombre"];
$tip3desc = $_SESSION["tip3desc"];
$tip3img = $_SESSION["tip3img"];
$usua_perm_estadistica = $_SESSION["usua_perm_estadistica"];
$rol = $_SESSION["rol"];

/** DEFINICION DE VARIABLES ESTADISTICA
 * 	var $tituloE String array  Almacena el titulo de la Estadistica Actual
 * var $subtituloE String array  Contiene el subtitulo de la estadistica
 * var $helpE String Almacena array Almacena la descripcion de la Estadistica.
 */
$tituloE[1] = "1 - ESTAD&Iacute;STICA DE RADICADOS POR USUARIO";
$tituloE[2] = "2 - ESTAD&Iacute;STICA POR MEDIO DE RECEPCI&Oacute;N";
$tituloE[3] = "3 - ESTAD&Iacute;STICA DE MEDIO ENV&Iacute;O FINAL DE DOCUMENTOS";
$tituloE[4] = "4 - ESTAD&Iacute;STICA DE DIGITALIZACI&Oacute;N DE DOCUMENTOS";
$tituloE[5] = "5 - ESTAD&Iacute;STICA DE RADICADOS DE ENTRADA RECIBIDOS DEL &Aacute;REA DE CORRESPONDENCIA";
$tituloE[6] = "6 - ESTAD&Iacute;STICA DE RADICADOS ACTUALES EN LA DEPENDENCIA";
//$tituloE[7] = utf8_decode("7 - ESTADÍSTICAS DE NUMERO DE DOCUMENTOS ENVIADOS");
$tituloE[8] = "7 - ESTAD&Iacute;STICA DE RADICADOS VENCIDOS";
$tituloE[9] = "8 - ESTAD&Iacute;STICA DE PROCESOS RADICADOS DE ENTRADA";
$tituloE[10] = "9 - ESTAD&Iacute;STICA DE REASIGNACI&Oacute;N RADICADOS";
$tituloE[11] = "10 - ESTAD&Iacute;STICA DE DIGITALIZACI&Oacute;N";
$tituloE[12] = "11 - ESTAD&Iacute;STICA DE DOCUMENTOS RETIPIFICADOS POR TRD";
$tituloE[13] = "12 - ESTAD&Iacute;STICA DE EXPEDIENTES POR DEPENDENCIA";
$tituloE[14] = "13 - ESTAD&Iacute;STICA DE RADICADOS ASIGNADOS DETALLADOS (CARPETAS PERSONALES)";
$tituloE[15] = "14 - ESTAD&Iacute;STICA DE DIGITALIZACI&Oacute;N (ANEXOS)";
$tituloE[16] = "15 - ESTAD&Iacute;STICA DE TR&Aacute;MITES TERMINADOS";
$tituloE[17] = "16 - ESTAD&Iacute;STICA POR RADICADOS Y SUS RESPUESTAS";
$tituloE[18] = "17 - ESTAD&Iacute;STICA POR PERMISOS ASIGNADOS";
$subtituloE[1] = "ORFEO - Generada el: " . date("Y/m/d H:i:s") . "\n Parametros de Fecha: Entre $fecha_ini y $fecha_fin";
$subtituloE[2] = "ORFEO - Fecha: " . date("Y/m/d H:i:s") . "\n Parametros de Fecha: Entre $fecha_ini y $fecha_fin";
$subtituloE[3] = "ORFEO - Fecha: " . date("Y/m/d H:i:s") . "\n Parametros de Fecha: Entre $fecha_ini y $fecha_fin";
$subtituloE[4] = "ORFEO - Fecha: " . date("Y/m/d H:i:s") . "\n Parametros de Fecha: Entre $fecha_ini y $fecha_fin";
$subtituloE[5] = "ORFEO - Fecha: " . date("Y/m/d H:i:s") . "\n Parametros de Fecha: Entre $fecha_ini y $fecha_fin";
$subtituloE[6] = "ORFEO - Fecha: " . date("Y/m/d H:i:s") . "\n Parametros de Fecha: Entre $fecha_ini y $fecha_fin";
$subtituloE[8] = "ORFEO - Fecha: " . date("Y/m/d H:i:s") . "\n Parametros de Fecha: Entre $fecha_ini y $fecha_fin";
$subtituloE[17] = "ORFEO - Fecha: " . date("Y/m/d H:i:s") . "\n Parametros de Fecha: Entre $fecha_ini y $fecha_fin";
$subtituloE[18] = "ORFEO - Fecha: " . date("Y/m/d H:i:s") . "\n Parametros de Fecha: Entre $fecha_ini y $fecha_fin";


$helpE[1] = "Este reporte genera la cantidad de radicados de acuerdo al medio de recepci&oacute;n o env&iacute;o realizado al momento de la radicaci&oacute;n. ";
$helpE[2] = "Este reporte genera la cantidad de radicados de acuerdo al medio de recepci&oacute;n o env&iacute;o realizado al momento de la radicaci&Oacute;n. ";
$helpE[3] = "Este reporte genera la cantidad de radicados enviados a su destino final por el &aacute;rea.  ";
$helpE[4] = "Este reporte genera la cantidad de radicados digitalizados por usuario y el total de hojas digitalizadas. Se puede seleccionar el tipo de radicaci&oacute;n.";
$helpE[5] = "Esta estad&iacute;stica trae la cantidad de radicados actuales por usuario y dependencia. ";
$helpE[6] = "Esta estad&iacute;stica trae la cantidad de radicados actuales por usuario y dependencia ";
$helpE[8] = "Este reporte genera la cantidad de radicados de entrada cuyo vencimiento esta dentro de las fechas seleccionadas. ";
$helpE[9] = "Este reporte muestra el proceso que han tenido los radicados tipo 2 que ingresaron durante las fechas seleccionadas. ";
$helpE[10] = "Este reporte muestra cuantos radicados de entrada han sido reasignados. ";
$helpE[11] = "Muestra la cantidad de radicados digitalizados por usuario y el total de hojas digitalizadas. Se puede seleccionar el tipo de radicaci&oacute;n y la fecha de digitalizaci&oacute;n.";
$helpE[12] = "Muestra los radicados que ten&iacute;an asignados un tipo documental(TRD) y han sido modificados";
$helpE[13] = "Muestra todos los expedientes agrupados por dependencia con el número de radicados totales";
$helpE[14] = "Muestra el total de radicados que tiene un usuario detallado por cada carpeta";
$helpE[15] = "Muestra la cantidad de anexos de radicados digitalizados por usuario y el total de hojas digitalizadas. Se puede seleccionar el tipo de radicaci&oacute;n y la fecha de digitalizaci&oacute;n.";
$helpE[16] = "Reporte  con respecto a los  d&iacute;as de tramite y finalizaci&oacute;n de &eacute;ste";
$helpE[17] = "Este reporte genera la cantidad de documentos que han llegado al &aacute;rea o usuarios sin importar su origen. ";
$helpE[18] = "Esta estad&iacute;stica permite las siguientes consultas: <br> a). Si selecciona solo el rol, muestra como resultado todos los usuarios pertenecientes al rol. "
        . "<br>b). Se selecciona rol y tipo permiso (Accesos al sistema) muestra los permisos que tiene el rol. <br> c). Si selecciona rol y tipo permiso (Tipos documentales) muestra todos los tipos documentales a los que tiene permiso el rol. ";
?>	  
<html>
    <head>
        <title>principal</title>
        <link href="<?= $url_raiz . $ESTILOS_PATH2 ?>bootstrap.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="<?= $url_raiz . $_SESSION['ESTILOS_PATH_ORFEO'] ?>">
        <link rel="stylesheet" type="text/css" href="../js/spiffyCal/spiffyCal_v2_1.css">
        <script language="JavaScript" src="../js/spiffyCal/spiffyCal_v2_1.js"></script>
        <link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel = "stylesheet">
        <script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
        <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
        <style>
            .ui-autocomplete { height: 200px; width: 200px; overflow-y: scroll; overflow-x: hidden;}
        </style>
        <script>
            setRutaRaiz("..");
            function adicionarOp(forma, combo, desc, val, posicion) {
            o = new Array;
            o[0] = new Option(desc, val);
            eval(forma.elements[combo].options[posicion] = o[0]);
            //alert ("Adiciona " +val+"-"+desc );
            }
            
            $(function () {
                $("#s_clasificacion").autocomplete({
                    source: "searchsGeneral.php",
                    minLength: 3,
                    select: function (event, ui) {}
                });
            });
        </script>

        <script language="javascript">
  <!--
           <?
  $ano_ini = date("Y");
  $mes_ini = substr("00" . (date("m") - 1), -2);
  if ($mes_ini == 0) {
                    $ano_ini == $ano_ini - 1;
            $mes_ini = "12";
  }
  $dia_ini = date("d");
  if (!$fecha_ini)
  $fecha_ini = "$ano_ini/$mes_ini/$dia_ini";
  $fecha_busq = date("Y/m/d");
if (!$fecha_fin)
$fecha_fin = $fecha_busq;
?>
var dateAvailable = new ctlSpiffyCalendarBox("dateAvailable", "formulario", "fecha_ini", "btnDate1", "<?= $fecha_ini ?>", scBTNMODE_CUSTOMBLUE);
var dateAvailable2 = new ctlSpiffyCalendarBox("dateAvailable2", "formulario", "fecha_fin", "btnDate2", "<?= $fecha_fin ?>", scBTNMODE_CUSTOMBLUE);
  
  //--></script>
    </head>
    <?php
    include "$dir_raiz/envios/paEncabeza.php";
    ?>
    <table><tr><TD></TD></tr></table>
    <?php
    require_once dirname(__FILE__) . DIRECTORY_SEPARATOR . ".." . DIRECTORY_SEPARATOR . "config.php";
    include_once "$dir_raiz/include/db/ConnectionHandler.php";
    include("$dir_raiz/class_control/usuario.php");
    $db = new ConnectionHandler($dir_raiz);
    //$db->conn->debug=true;
    $db->conn->SetFetchMode(ADODB_FETCH_ASSOC);
    $objUsuario = new Usuario($db);
    
    if($encabezado == ''){
        $encabezado = '';
    }
//    $encabezado = ;
    ?>
    <br>
    <!--
    Skinatech
    Autor: Andrés Mosquera
    Fecha: 08-11-2018
    Información: Eliminado del body: (onLoad="comboUsuarioDependencia(document.formulario, document.formulario.elements['dependencia_busq'].value, 'codus');") ya que no existe la función
    -->
    <body bgcolor="#ffffff" topmargin="0">
        <div id="spiffycalendar" class="text"></div>
        <form name="formulario"  method=post action='./vistaFormConsulta.php?<?=  session_name() . "=" . trim(session_id()) . "&krd=$krd&fechah=$fechah".$encabezado ?>'>
            <center>
                <div id="titulo" style="width: 95%;" align="center">Por Radicados</div>
                <table width="95%"  border="1" cellpadding="0" cellspacing="5" class="borde_tab">
                    <tr>
                      <!--<td colspan="2" class="titulos4">POR RADICADOS  -  <A href='vistaFormProc.php?<? //=session_name()."=".trim(session_id())."&krd=$krd&fechah=$fechah"  ?>' style="color: #FFFFCC">POR PROCESOS </A> </td>-->
                        <!-- Titulo que se encontraba activo,desactivado 21/02/2017<td colspan="2" class="titulos4">Por radicados </td>-->
                    </tr>

                    <tr>
                        <td width="30%" class="titulos2"><label for="tipoEstadistica">Tipo de Consulta / Estad&iacute;stica</label></td>
                        <td class="listado2" align="left">
                            <select id="tipoEstadistica" name=tipoEstadistica  aria-label='Listado de tipos de estadisticas del aplicativo' class="select form-control" onChange="formulario.submit();">
                                <?php
                                foreach ($tituloE as $key => $value) {
                                    if ($tipoEstadistica == $key)
                                        $selectE = " selected ";
                                    else
                                        $selectE = "";
                                    ?>
                                    <option  value=<?= $key ?> <?= $selectE ?>><?= $tituloE[$key] ?></option>
                                    <?php
                                }
                                ?>
                            </select>
                        </td>
                    </tr>

                    <?php

                    if ($tipoEstadistica != 18) {
                        ?>
                        <tr>
                            <td width="30%" class="titulos2"><label for="dependencia_busq">Dependencia</label></td>
                            <td class="listado2">
                                <select id="dependencia_busq" name=dependencia_busq  aria-label='Listado de dependecias disponibles para la generación de estadísticas' class="select form-control"  onChange="formulario.submit();">
                                    <?php
                                    if ($usua_perm_estadistica > 1) {
                                        if ($dependencia_busq == '99999') {
                                            $datoss = " selected ";
                                        }
                                        if ($tipoEstadistica != 13) {
                                            ?>
                                            <option value=99999  <?= $datoss ?>>-- Todas las Dependencias --</option>
                                        <?php } else {
                                            ?>
                                            <option value=99999  <?= $datoss ?>>-- Seleccione una Dependencia --</option>
                                            <?php
                                        }
                                    }
                                    $whereDepSelect = " DEPE_CODI = '$dependencia' ";
                                    if ($usua_perm_estadistica == 1) {
                                        $whereDepSelect = " $whereDepSelect or depe_codi_padre = '$dependencia' ";
                                    }
                                    if ($usua_perm_estadistica == 2) {
                                        $isqlus = "select a.DEPE_CODI,a.DEPE_NOMB,a.DEPE_CODI_PADRE from DEPENDENCIA a ORDER BY a.DEPE_NOMB";
                                    } else {
                                        //$whereDepSelect=
                                        $isqlus = "select a.DEPE_CODI,a.DEPE_NOMB,a.DEPE_CODI_PADRE from DEPENDENCIA a 
                                    where $whereDepSelect ";
                                    }
                                    //if($codusuario!=1) $isqlus .= " and a.usua_codi=$codusuario "; 
                                    //echo "--->".$isqlus;
                                    $rs1 = $db->query($isqlus);

                                    do {
                                        $codigo = $rs1->fields["DEPE_CODI"];
                                        $vecDeps[] = $codigo;
                                        $depnombre = $rs1->fields["DEPE_NOMB"];
                                        $datoss = "";
                                        if ($dependencia_busq == $codigo) {
                                            $datoss = " selected ";
                                        }
                                        echo "<option value=$codigo  $datoss>$codigo - $depnombre</option>";
                                        $rs1->MoveNext();
                                    } while (!$rs1->EOF);
                                    ?>
                                </select>
                            </td>
                        </tr>
                        <?php
                        if ($dependencia_busq != 99999) {
                            $whereDependencia = " AND DEPE_CODI='$dependencia_busq'";
                        }
                        $encabezado .= '&dependencia_busq='.$codigo;
                    }

                    if ($tipoEstadistica == 18) {
                        ?>
                        <tr id="cUsuario">
                            <td width="30%" class="titulos2">
                                <label for="codus">Rol</label>
                            </td>
                            <td class="listado2">
                                <select id="codrol" name="codrol"  aria-label='Listado de roles del sistema' class="select form-control"  onChange="formulario.submit();">
                                    <?php if ($usua_perm_estadistica > 0) {
                                        ?>			
                                        <option value=0> -- Seleccionar rol --</option>
                                        <?php
                                    }
                                    $queryRoles = "select nomb_rol as NOMB_ROL, cod_rol as COD_ROL from roles where estado =1 order by nomb_rol ";
                                    $rsD = $db->query($queryRoles);
//                                    error_log('----------- '.$queryRoles);
                                    while (!$rsD->EOF) {
                                        $codigo = $rsD->fields["COD_ROL"];
                                        $vecDeps[] = $codigo;
                                        $usNombre = $rsD->fields["NOMB_ROL"];
                                        $datoss = ($codrol == $codigo) ? $datoss = " selected " : "";
                                        echo "<option value=$codigo  $datoss>$usNombre</option>";
                                        $rsD->MoveNext();
                                    }
                                    ?>
                                </select>
                                &nbsp;</td>
                        </tr>
                        <tr id="cUsuario">
                            <td width="30%" class="titulos2">
                                <label for="codus">Tipo permiso</label>
                            </td>
                            <td class="listado2">
                                <select id="codpermisos" name="codpermisos"  aria-label='Listado de roles del sistema' class="select form-control"  onChange="formulario.submit();">
                                    <?php if ($usua_perm_estadistica > 0) {
                                        ?>			
                                        <option value=0> -- Agrupar por tipos de permisos --</option>
                                        <option value=1 <?= $codpermisos == 1 ? $datoss = " selected " : "" ?>> ACCESOS AL SISTEMA </option>
                                        <option value=2 <?= $codpermisos == 2 ? $datoss = " selected " : "" ?>> TIPOS DOCUMENTALES </option>
                                        <?php
                                    }
                                    ?>
                                </select>
                                &nbsp;</td>
                        </tr>
                        <?php
                        $encabezado .= '&codrol='.$codrol.'&codpermisos='.$codpermisos.'&tipoDocumento='.$tipoDocumento;
                    }

                    //Modificado idrd
                    //echo " tipo $tipoEstadistica ";

                    if ($tipoEstadistica == 1 or $tipoEstadistica == 2 or $tipoEstadistica == 3 or
                            $tipoEstadistica == 4 or $tipoEstadistica == 5 or $tipoEstadistica == 6 or
                            $tipoEstadistica == 7 or $tipoEstadistica == 11 or $tipoEstadistica == 12 or $tipoEstadistica == 10 or $tipoEstadistica == 15 or $tipoEstadistica == 17) {
                        ?> 
                        <tr id="cUsuario">
                            <td width="30%" class="titulos2">
                                <label for="codus">Usuario</label>
                                <br>
                                <label for="usActivos" style="margin-left: 12px;">Incluir Usuarios Inactivos</label> 
                                <? $datoss = isset($usActivos) && ($usActivos) ? " checked " : ""; ?>
                                <input id="usActivos" name="usActivos" type="checkbox" title="Seleccione para incluir usuarios inactivos en el aplicativo en la consulta" class="select" <?= $datoss ?> onChange="formulario.submit();">
                            </td>

                            <td class="listado2">
                                <select id="codus" name="codus"  aria-label='Listado de usuarios disponibles para genera la estadistica seleccionada' class="select form-control"  onChange="formulario.submit();">
                                    <?php if ($usua_perm_estadistica > 0) {
                                        ?>			
                                        <option value=0> -- AGRUPAR POR TODOS LOS USUARIOS --</option>
                                        <?php
                                    }
                                    $whereUsSelect = (!isset($_POST['usActivos']) ) ? " u.USUA_ESTA = '1' " : "";
                                    $whereUsSelect = ($usua_perm_estadistica < 1) ?
                                            (($whereUsSelect != "") ? $whereUsSelect . " AND u.USUA_LOGIN='$krd' " : " u.USUA_LOGIN='$krd' ") : $whereUsSelect;

                                    if ($dependencia_busq != 99999) {
                                        $whereUsSelect = ($whereUsSelect == "") ? substr($whereDependencia, 4) : $whereUsSelect . $whereDependencia;
                                        $isqlus = "select u.USUA_NOMB,u.USUA_CODI,u.USUA_ESTA, u.DEPE_CODI from USUARIO u where  $whereUsSelect order by u.USUA_NOMB";
                                        //if($codusuario!=1) $isqlus .= " and a.usua_codi=$codusuario "; 
                                        //echo "--->".$isqlus;
                                        $rs1 = $db->query($isqlus);
                                        while (!$rs1->EOF) {
                                            $codigo = $rs1->fields["USUA_CODI"];
                                            $dependenciaPer = $rs1->fields["DEPE_CODI"];
                                            $vecDeps[] = $codigo;
                                            $usNombre = $rs1->fields["USUA_NOMB"];
                                            $datoss = ($codus == $codigo) ? $datoss = " selected " : "";
                                            echo "<option value=$codigo  $datoss>$dependenciaPer - $usNombre</option>";
                                            $rs1->MoveNext();
                                        }
                                    }
                                    ?>
                                </select>
                                &nbsp;</td>
                        </tr>
                        <?php
                        $encabezado .= '&usActivos='.$usActivos;
                    }
                    //by skina, quitamos T.R para estadistica 3

                    if ($tipoEstadistica == 1 or $tipoEstadistica == 2 or $tipoEstadistica == 4 or $tipoEstadistica == 6 or $tipoEstadistica == 11 or $tipoEstadistica == 12 or $tipoEstadistica == 15 or $tipoEstadistica == 16 or $tipoEstadistica == 17) {
                        ?>
                        <tr>
                            <td width="30%" height="40" class="titulos2"><label for="nmenu">Tipo de Radicado</label> </td>
                            <td class="listado2">
                                <?php
                                //** Modificacion by Skina - 01/11/2013                     **//
                                //** Ing Camilo Pintor                                      **//   
                                //** Condicional para solo selecionar registros de entrada  **//    
                                //** en la estadistica 16 ESTADISTICA DE TRAMITES TERMINADOS**//    
                                if ($tipoEstadistica == 16) {
                                    $wheretprad = 'where SGD_TRAD_CODIGO=2';
                                    $tipoRadicado = 2;
                                }
                                //** Fin de modificacion                                   **//    
                                $rs = $db->conn->Execute("select SGD_TRAD_DESCR, SGD_TRAD_CODIGO  from SGD_TRAD_TIPORAD $wheretprad order by 2");
                                $nmenu = "tipoRadicado";
                                $valor = "";
                                $default_str = $tipoRadicado;
                                $itemBlanco = " -- Agrupar por Todos los Tipos de Radicado -- ";
                                print $rs->GetMenu2($nmenu, $default_str, $blank1stItem = "$valor:$itemBlanco", false, 0, "class='select form-control' id='nmenu' aria-label='Listado de tipos de radicados para incluir en la estadistica'");
                                ?>&nbsp;</td>
                        </tr>
                        <?php
                        $encabezado .= '&tipoRadicado='.$tipoRadicado;
                    }
                    if ($tipoEstadistica == 1 or $tipoEstadistica == 6 or $tipoEstadistica == 10 or
                            $tipoEstadistica == 12 or $tipoEstadistica == 14 or $tipoEstadistica == 17 or $tipoEstadistica == 19) {
                        ?>
                        <tr>
                            <td width="30%" height="40" class="titulos2"><label for="tipoDocumento">Agrupar por Tipo de Documento</label> </td>
                            <td class="listado2">
                                <select id="tipoDocumento" name=tipoDocumento  class="select form-control" aria-label='Listado con los tipos documentales para seleccionar en la estadistica' >
                                    <?php
                                    $isqlTD = "SELECT SGD_TPR_DESCRIP, SGD_TPR_CODIGO 
                                from SGD_TPR_TPDCUMENTO
                                WHERE SGD_TPR_CODIGO<>0
                                order by  SGD_TPR_DESCRIP";
                                    //if($codusuario!=1) $isqlus .= " and a.usua_codi=$codusuario "; 
                                    //echo "--->".$isqlus;
                                    $rs1 = $db->query($isqlTD);
                                    $datoss = "";

                                    if ($tipoDocumento != '9998') {
                                        $datoss = " selected ";
                                        $selecUs = " b.USUA_NOMB USUARIO, ";
                                        $groupUs = " b.USUA_NOMB, ";
                                    }

                                    if ($tipoDocumento == '9999') {
                                        $datoss = " selected ";
                                    }
                                    ?>
                                    <option value='9999'  <?= $datoss ?>>-- No Agrupar Por Tipo de Documento</option>
                                    <?php
                                    $datoss = "";



                                    if ($tipoDocumento == '9998') {
                                        $datoss = " selected ";
                                    }
                                    ?>
                                    <option value='9998'  <?= $datoss ?>>-- Agrupar Por Tipo de Documento</option>
                                    <?php
                                    $datoss = "";


                                    if ($tipoDocumento == '9997') {
                                        $datoss = " selected ";
                                    }
                                    ?>
                                    <option value='9997'  <?= $datoss ?>>-- Tipos Documentales No Definidos</option>
                                    <?php
                                    do {
                                        $codigo = $rs1->fields["SGD_TPR_CODIGO"];
                                        $vecDeps[] = $codigo;
                                        $selNombre = $rs1->fields["SGD_TPR_DESCRIP"];
                                        $datoss = "";
                                        if ($tipoDocumento == $codigo) {
                                            $datoss = " selected ";
                                        }
                                        echo "<option value=$codigo  $datoss>$selNombre</option>";
                                        $rs1->MoveNext();
                                    } while (!$rs1->EOF);
                                    ?>
                                </select>
                            </td>
                        </tr>
                        <?php
                        $encabezado .= '&tipoDocumento='.$tipoDocumento;
                    }
                    if ($tipoEstadistica == 1 or $tipoEstadistica == 2 or $tipoEstadistica == 3 or
                            $tipoEstadistica == 4 or $tipoEstadistica == 5 or $tipoEstadistica == 7 or
                            $tipoEstadistica == 8 or $tipoEstadistica == 9 or $tipoEstadistica == 10 or
                            $tipoEstadistica == 11 or $tipoEstadistica == 12 or $tipoEstadistica == 15 or $tipoEstadistica == 16 or $tipoEstadistica == 17 or $tipoEstadistica == 19) {
                        ?>  
                        <tr>
                            <td width="30%" class="titulos2"><label>Fecha inicial (a&ntilde;o/mes/dia)</label> </td>
                            <td class="listado2">
                                <script language="javascript">
                            dateAvailable.writeControl();
                                dateAvailable.dateFormat = "yyyy/MM/dd";
                                </script>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td width="30%" class="titulos2"><label>Fecha final (a&ntilde;o/mes/dia) </label></td>
                            <td class="listado2">
                                <script language="javascript">
                            dateAvailable2.writeControl();
                                dateAvailable2.dateFormat = "yyyy/MM/dd";
    </script>&nbsp;</td>
                        </tr>
                        <?php
                        $encabezado .= '&fecha_fin='.$fecha_fin.'&fecha_ini='.$fecha_ini;
                    }
                    ?>
                    <tr>
                        <td colspan="2" class="listado1">
                    <center>
                        <input name="Submit" type="reset" class="botones" value="Limpiar" aria-label='Restablecer valores del formulario a los por defecto'> 
                        <input type="submit" class="botones" value="Generar" name="generarOrfeo" aria-label='Generar reporte estadistico con los parametros antes selecccionados'>
                    </center>
                    </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="listado1"><span class="alarmas"><?= $helpE[$tipoEstadistica] ?></span></td>
                    </tr>
                </table>
                <br>
                </form>
                <?php
                //Modificado idrd para enviar documento del usuario
                $datosaenviar = "fechaf=$fechaf&tipoEstadistica=$tipoEstadistica&codus=$codus&krd=$krd&dependencia_busq=$dependencia_busq&dir_raiz=$dir_raiz&fecha_ini=$fecha_ini&fecha_fin=$fecha_fin&tipoRadicado=$tipoRadicado&tipoDocumento=$tipoDocumento&usua_doc=$usuadocs";

                //echo " usua_doc $usua_docs codus $codus";

                if (isset($generarOrfeo) && $tipoEstadistica == 12) {
                    global $orderby;
                    $orderby = 'ORDER BY NOMBRE';
                    $whereDep = ($dependencia_busq != 99999) ? "AND h.DEPE_CODI = '" . $dependencia_busq . "'" : '';

                    switch ($db->driver) {
                        case 'mssql':
                            $fecha = "AND " . $db->conn->SQLDate('Y/m/d', 'r.RADI_FECH_RADI') . " BETWEEN '$fecha_ini'  AND '$fecha_fin'";
                            break;
                        case 'mysql':
                            $fecha = "AND " . $db->conn->SQLDate('Y/m/d', 'r.RADI_FECH_RADI') . " BETWEEN '$fecha_ini'  AND '$fecha_fin'";
                            break;
                        case 'postgres':
                            $fecha = " AND TO_CHAR(r.RADI_FECH_RADI,'yyyy/mm/dd') BETWEEN '$fecha_ini'  AND '$fecha_fin'";
                            break;
                        case 'ocipo':
                            $fecha = "AND " . $db->conn->SQLDate('Y/m/d', 'r.RADI_FECH_RADI') . " BETWEEN '$fecha_ini'  AND '$fecha_fin'";
                            break;
                    }
                    //modificado idrd para postgres	
                    $isqlus = "SELECT u.USUA_NOMB 		AS NOMBRE
                , u.USUA_DOC
                , d.DEPE_CODI, 
                COUNT(r.RADI_NUME_RADI) as TOTAL_MODIFICADOS
                FROM USUARIO u, RADICADO r, HIST_EVENTOS h, DEPENDENCIA d, SGD_TPR_TPDCUMENTO s
                WHERE u.USUA_DOC = h.USUA_DOC
                AND h.SGD_TTR_CODIGO = 32
                AND h.HIST_OBSE LIKE '*Modificado TRD*%'
                AND h.DEPE_CODI = d.DEPE_CODI
                $whereDep
                AND s.SGD_TPR_CODIGO = r.TDOC_CODI
                AND r.RADI_NUME_RADI = h.RADI_NUME_RADI $fecha GROUP BY u.USUA_NOMB, u.USUA_DOC, d.DEPE_CODI $orderby";

                    $rs1 = $db->query($isqlus);
//                    echo '------------------> ' . $isqlus;
                    while (!$rs1->EOF) {
                        $usuadoc[] = $rs1->fields["USUA_DOC"];
                        $dependencias[] = $rs1->fields["DEPE_CODI"];
                        $rs1->MoveNext();
                    }
                }



                if ($generarOrfeo) {
                    include "genEstadistica.php";
                }
                ?>
                </body>
                </html>

                <table border=0 cellspace=2 cellpad=2 WIDTH=100% class='borde_tab' align='center'>
                    <tr align="center"> 
                        <td>
                            <?php
                            // Se calcula el numero de | a mostrar
                            //$db->conn->debug = true;
                            $rs = $db->query($isqlCount);
                            $numerot = $rs->fields["CONTADOR"];
                            $paginas = ($numerot / 20);
                            ?><span class='vinculos'>P&aacute;ginas </span> <?php
                            if (intval($paginas) <= $paginas) {
                                $paginas = $paginas;
                            } else {
                                $paginas = $paginas - 1;
                            }
                            // Se imprime el numero de Paginas.
                            for ($ii = 0; $ii < $paginas; $ii++) {
                                if ($pagina == $ii) {
                                    $letrapg = "<font color=green size=3>";
                                } else {
                                    $letrapg = "";
                                }
                                echo " <a href='vistaFormConsulta.php?pagina=$ii&$encabezado$orno'><span class=leidos>$letrapg" . ($ii + 1) . "</span></font></a>\n";
                            }
                            echo "<input type=hidden name=check value=$check>";
                            ?></td>
                    </tr></table>
                <form name=jh >
                    <input type=hidDEN name=jj value=0>
                    <input type=hidDEN name=dS value=0>
                </form>
