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

        /*---------------------------------------------------------+
        |                     INCLUDES                             |
        +---------------------------------------------------------*/


        /*---------------------------------------------------------+
        |                    DEFINICIONES                          |
        +---------------------------------------------------------*/
session_start();
error_reporting(7);
$url_raiz=$_SESSION['url_raiz'];
$dir_raiz=$_SESSION['dir_raiz'];		
$driver = $_SESSION['driver'];
        /*---------------------------------------------------------+
        |                       MAIN                               |
        +---------------------------------------------------------*/


if (!$dir_raiz) $dir_raiz=$_SESSION['dir_raiz'];
?>
<link rel="stylesheet" type="text/css" href="<?=$url_raiz?>/js/spiffyCal/spiffyCal_v2_1.css">
<script language="JavaScript" src="<?=$url_raiz?>/js/spiffyCal/spiffyCal_v2_1.js"></script>
		 <script language="javascript">
				<!-- Funcion que activa el sistema de marcar o desmarcar todos los check  -->
<!--		setRutaRaiz ('<?=$dir_raiz?>');-->
		function markAll()

		{
		if(document.form1.elements['checkAll'].checked)
		for(i=1;i<document.form1.elements.length;i++)
		document.form1.elements[i].checked=1;
		else
				for(i=1;i<document.form1.elements.length;i++)
				document.form1.elements[i].checked=0;
		}

		 <!--
			<?
				// print ("El control agenda en tx($controlAgenda");
				$ano_ini = date("Y");
				$mes_ini = substr("00".(date("m")-1),-2);
				if ($mes_ini==0) {$ano_ini==$ano_ini-1; $mes_ini="12";}
				$dia_ini = date("d");
				if(!$fecha_ini) $fecha_ini = "$ano_ini/$mes_ini/$dia_ini";
					$fecha_busq = date("Y/m/d") ;
				if(!$fecha_fin) $fecha_fin = $fecha_busq;
			?>

//--></script>
<?

require_once("$dir_raiz/js/pestanas.js");
 /**  TRANSACCIONES DE DOCUMENTOS
   *  @depsel number  contiene el codigo de la dependcia en caso de reasignacion de documentos
   *  @depsel8 number Contiene el Codigo de la dependencia en caso de Informar el documento
   *  @carpper number Indica codigo de la carpeta a la cual se va a mover el documento.
   *  @codTx   number Indica la transaccion a Trabajar. 8->Informat, 9->Reasignar, 21->Devlver
   */
?>
<script language="JavaScript" type="text/JavaScript">
// Variable que guarda la �ltima opci�n de la barra de herramientas de funcionalidades seleccionada
seleccionBarra = -1;
<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</script>
    <script type="text/javascript">

function showCalendarTable(){
    var calendarTable = document.getElementById('calendarTable');
    if(calendarTable.style.display==='none'){
        calendarTable.style.display='table';
    }else{
       calendarTable.style.display='none'; 
    }         
}

function vistoBueno(){

   changedepesel(9);
   document.getElementById('EnviaraV').value = 'VoBo';
   envioTx();
}

function devolver(){
   changedepesel(12);
   envioTx();
}

function txAgendar(){
//    if (!validaAgendar('SI'))
//    	return;
	changedepesel(14);
   envioTx();
}
function txNoAgendar()
{
    changedepesel(15);
   	envioTx();
}
function archivar()
{
   changedepesel(13);
   envioTx();
}
function nrr()
{
   changedepesel(16);
   envioTx();
}

function trd_m()
{
   changedepesel(61);
   envioTx();
}

function envioTx()
{
   sw=0;
   <?
   if(!$verrad)
   {
   ?>
	for(i=1;i<document.form1.elements.length;i++)
	if (document.form1.elements[i].checked)
      sw=1;
	if (sw==0)
	{
	alert ("<?php echo utf8_decode("Debe seleccionar uno o más radicados"); ?>");
	return;
	}
	<?
	}
	?>
   document.form1.submit();
}
function window_onload()
{
   document.getElementById('depsel').style.display = 'none';
  // document.getElementById('Enviara').style.display = '';
   document.getElementById('depsel8').style.display = 'none';
   document.getElementById('carpper').style.display = 'none';
   document.getElementById('Enviar').style.display = 'none';

  // document.getElementById('movera_r').style.display = 'none';
  // document.getElementById('reasignar_r').style.display = 'none';
  // document.getElementById('reasignar_r').style.display = 'none';
  // document.getElementById('informar_r').style.display = 'none';
  // document.getElementById('informar').style.display = '';
   //changedepesel(9);
   <?
   if(!$verrad)
   {
   }
   else
   {
   ?>
	 window_onload2();
   <?
   }
   if($carpeta==11 and $_SESSION['codusuario']==1){
        echo "document.getElementById('salida').style.display = ''; ";
	    echo "document.getElementById('enviara').style.display = ''; ";
		echo "document.getElementById('Enviar').style.display = ''; ";
      }ELSE{
	      echo " ";
	  }
  	  if($carpeta==11 and $_SESSION['codusuario']!=1){
		 echo "document.getElementById('enviara').style.display = 'none'; ";
		 echo "document.getElementById('Enviar').style.display = 'none'; ";
	  }
  ?>
}
</script>
<body onload="MM_preloadImages('<?=$dir_raiz?>/imagenes/internas/overVobo.gif','<?=$dir_raiz?>/imagenes/internas/overNRR.gif','<?=$dir_raiz?>/imagenes/internas/overMoverA.gif','<?=$dir_raiz?>/imagenes/internas/overReasignar.gif','<?=$dir_raiz?>/imagenes/internas/overInformar.gif','<?=$dir_raiz?>/imagenes/internas/overDevolver.gif','<?=$dir_raiz?>/imagenes/internas/overArchivar.gif')"><table width="100%" border="1" cellspacing="0" cellpadding="0" align="center">
<!--DWLayoutTable-->
<?php
/* Si esta en la Carpeta de Visto Bueno no muesta las opciones de reenviar
 *
*/
//$db->conn->debug = true;
if (($mostrar_opc_envio==0) || ($_SESSION['codusuario'] == $radi_usua_actu && $_SESSION['dependencia'] == $radi_depe_actu)) {
	// Modificado SGD 21-Septiembre-2007
	$sql = "SELECT PERM_ARCHI AS \"PERM_ARCHI\", PERM_VOBO AS \"PERM_VOBO\" FROM USUARIO WHERE USUA_CODI = " . $_SESSION['codusuario'] . " AND 
		DEPE_CODI = '" . $_SESSION['dependencia']."'";
	$rs = $db->query($sql);

	if(!$rs->EOF) {
		$permArchi = $rs->fields["PERM_ARCHI"];
		$permVobo = $rs->fields["PERM_VOBO"];
	}
?>
<tr>
	
<table id="calendarTable" width="100%" height="25"  border="0" cellpadding="0" cellspacing="0" style="display: none" >
	<tr>
		<td width="730" valign="bottom">
<?php

//Modificado skina if ($controlAgenda==1)
if ($controlAgenda==1 or $controlAgenda==2)
{
    //Si el esta consultando la carpeta de documentos agendados entonces muestra el boton de sacar de la agenda

	if ($agendado)
	{	echo("<img name='principal_r5_c1'  src='$url_raiz/imagenes/internas/noAgendar.gif' alt='Menu para asignar fecha de agendado al radicado seleccionado' width='130' height='20' border='0' alt=''>");
     	echo ("<input name='Submit2' type='button' class='botones' value='Agendar' onClick='txNoAgendar();'>");
	}
	else
	{	echo("<img name='principal_r5_c1'  src='$url_raiz/imagenes/internas/agendar.gif' width='69' height='20' border='0' alt='Menu para asignar fecha de agendado al radicado seleccionado'> ");
?>
			<script language="javascript">
				var dateAvailable = new ctlSpiffyCalendarBox("dateAvailable", "form1","fechaAgenda","btnDate1","",scBTNMODE_CUSTOMBLUE);
		 		dateAvailable.date = "2003-08-05";
				dateAvailable.writeControl();
				dateAvailable.dateFormat="yyyy-MM-dd";
			</script>
			<input name="Submit2" type="button" class="botones" value="Agendar" alt="Agendar radicado" title="Agendar radicado" onClick='txAgendar();'>
<?php
}	}
?>		</td>
<?php
if (!$agendado) {
		
?>
<!--		<td width="25" valign="bottom">
			<img name="principal_r4_c3" src="<?=$dir_raiz?>/imagenes/internas/principal_r4_c3.gif" width="25" height="51" border="0" alt="">		</td>
        <td width="63" valign="bottom">
        	<a href="#" onMouseOut="MM_swapImgRestore()" onClick="seleccionBarra = 10;changedepesel(10);" onMouseOver="MM_swapImage('Image8','','<?=$dir_raiz?>/imagenes/internas/overMoverA.gif',1)">
        	<img src="<?=$dir_raiz?>/imagenes/internas/moverA.gif" name="Image8" alt="Mover radicados entre carpetas" width="63" height="51" border="0"  ></a>		</td>
		<td width="64" valign="bottom">
			<a href="#" onMouseOut="MM_swapImgRestore()" onClick="seleccionBarra = 9;changedepesel(9);" onMouseOver="MM_swapImage('Image9','','<?=$dir_raiz?>/imagenes/internas/overReasignar.gif',1)">
			<img src="<?=$dir_raiz?>/imagenes/internas/reasignar.gif" name="Image9" alt="Reasignar radicados a otro usuario y/o dependencia" width="64" height="51" border="0"  ></a>		</td>
		<td width="66" valign="bottom">
			<a href="#" onMouseOut="MM_swapImgRestore()" onClick="seleccionBarra = 8;changedepesel(8);" onMouseOver="MM_swapImage('Image10','','<?=$dir_raiz?>/imagenes/internas/overInformar.gif',1)">
			<img src="<?=$dir_raiz?>/imagenes/internas/informar.gif" name="Image10" alt="Informar radicado a algun usuario" width="66" height="51" border="0"></a>		</td>
		<td width="58" valign="bottom">
			<a href="#" onMouseOut="MM_swapImgRestore()" onClick="seleccionBarra = 12;changedepesel(12);" onMouseOver="MM_swapImage('Image11','','<?=$dir_raiz?>/imagenes/internas/overDevolver.gif',1)">
			<img src="<?=$dir_raiz?>/imagenes/internas/devolver.gif" name="Image11" width="58" alt="Devolver radicado a usuario anterior" height="51" border="0"></a>		</td>-->
	<?php
	if (($_SESSION['depe_codi_padre'] and $_SESSION['codusuario']==1) or $_SESSION['codusuario']!=1) {
            
		if(!empty($permVobo) && $permVobo != 0) {
	?>
                <script language="JavaScript" type="text/JavaScript">var VOBOPerm = true;</script>
<!--		<td width="55" valign="bottom"><a href="#" onmouseout="MM_swapImgRestore()" onclick="seleccionBarra = 14;vistoBueno();" onmouseover="MM_swapImage('Image12','','<?=$dir_raiz?>/imagenes/internas/overVobo.gif',1)"><img src="<?=$dir_raiz?>/imagenes/internas/vobo.gif" name="Image12" width="55" height="51" alt="Solicitar Visto Bueno" border="0" /></a></td>-->
    <?
    		}
	}
	?>
	<?
	//Insertado by skina para Indupalma 191009  trd multiple?>

<!--		<td width="61" valign="bottom"><a href="#" onmouseout="MM_swapImgRestore()" onclick="seleccionBarra = 61;changedepesel(61);" onmouseover="MM_swapImage('Image61','','<?=$dir_raiz?>/imagenes/internas/overTRD.gif',1)"><img src="<?=$dir_raiz?>/imagenes/internas/TRD.gif" name="Image61" alt="Asignar TRD Multiple a radicados seleccionados" width="61" height="51" border="0" /></a></td> -->
		<!--<td width="61" valign="bottom"><a href="radicacion/tipificar_documento_multiple.php?verrad=<?=$verrad?>" onmouseout="MM_swapImgRestore()" onclick="seleccionBarra = 61;changedepesel(61);" onmouseover="MM_swapImage('Image61','','<?=$dir_raiz?>/imagenes/internas/overTRD.gif',1)"><img src="<?=$dir_raiz?>/imagenes/internas/TRD.gif" name="Image61" width="61" height="51" border="0" /></a></td> -->
<!--		<td width="61" valign="bottom"><a href="expediente/insertarExpedienteMultiple.php?verrad=<?=$verrad?>" onmouseout="MM_swapImgRestore()" onclick="seleccionBarra = 62;changedepesel(62);" onmouseover="MM_swapImage('Image62','','<?=$dir_raiz?>/imagenes/internas/overexpediente.gif',1)"><img src="<?=$dir_raiz?>/imagenes/internas/expediente.gif" name="Image62" width="61" height="51" border="0" /></a></td>-->
<!--		<td width="61" valign="bottom"><a href="#" onmouseout="MM_swapImgRestore()" onclick="seleccionBarra = 62;changedepesel(62);" onmouseover="MM_swapImage('Image62','','<?=$dir_raiz?>/imagenes/internas/overexpediente.gif',1)"><img src="<?=$dir_raiz?>/imagenes/internas/expediente.gif" name="Image62" alt="Incluir en Expediente Multiple radicados" width="61" height="51" border="0"></a></td>-->
	<?php
			if(!empty($permArchi) && $permArchi != 0) {
			?>
                
<!--		<td width="61" valign="bottom">-->
                        <script language="JavaScript" type="text/JavaScript">var archivarPerm = true;</script>            
<!--			<a href="#" onMouseOut="MM_swapImgRestore()" onClick="seleccionBarra = 13;changedepesel(13);" onMouseOver="MM_swapImage('Image13','','<?=$dir_raiz?>/imagenes/internas/overArchivar.gif',1)">
			<img src="<?=$dir_raiz?>/imagenes/internas/archivar.gif" name="Image13" width="61" alt="Archivar / Finalizar tramite radicado seleccionado" height="51" border="0"></a>		</td>-->
		<?php
			}
			//by skina, nrr para todos
			//if($codusuario == 1){
			if($codusuario){
			?>
                <script language="JavaScript" type="text/JavaScript">var NRRPerm = false;</script>
<!--		<td width="61" valign="bottom"><a href="#" onmouseout="MM_swapImgRestore()" onclick="seleccionBarra = 14;changedepesel(16);" onmouseover="MM_swapImage('Image14','','<?=$dir_raiz?>/imagenes/internas/overNRR.gif',1)"><img src="<?=$dir_raiz?>/imagenes/internas/NRR.gif" name="Image14" width="61" alt="Archivar radicado que no requiere respuesta alguna." height="51" border="0" /></a></td>-->
		<?php
		}
	}
?>
	</tr>
	</table>
	</td>
<tr/>
<?
}
/* Final de opcion de enviar para carpetas que no son 11 y 0(VoBo)
*/
?>
<tr>
	<td height="59" colspan="3" >
            <table BORDER=0 class="titulos2"  WIDTH=100%  align='center' id="menuListar">
	<tr>
		<td width='40%'>
		<?php if ($controlAgenda==1){ ?>
			<table width="100%"  border="0" cellpadding="0" cellspacing="5" class="titulos2">
			<tr>
				<td width="15%" class="titulos2">Listar por: </td>
				<td width="60%" class="titulos2">
					<a href='<?=$url_raiz?>/cuerpo.php?<?=session_name()."=".trim(session_id()).$encabezado."7&orderTipo=DESC&orderNo=10"; ?>' aria-label='Ordenar Por radicados Leidos' title='Ordenar Por radicados Leidos' alt='Ordenar Por radicados Leidos'>
					<span class='leidos'>Le&iacute;dos</span></a><?=$img7 ?>&nbsp;
					<a href='<?=$url_raiz?>/cuerpo.php?<?=session_name()."=".trim(session_id()).$encabezado."8&orderTipo=ASC&orderNo=10" ?>' title='Ordenar Por radicados no Le&iacute;dos' alt='Ordenar Por radicados no Le&iacute;dos' aria-label='Ordenar Por radicados no Le&acute;dos' class="tparr">
                                        <span class='no_leidos'>No le&iacute;dos</span></a>
				</td>
			</tr>
			</table>
			<?}?>
		</td>
<?php
/* si esta en la Carpeta de Visto Bueno no muesta las opciones de reenviar
*/
if (($mostrar_opc_envio==0) || ($_SESSION['codusuario'] == $radi_usua_actu && $_SESSION['dependencia'] == $radi_depe_actu)){
?>
		<td width='55%'  align="right" class="titulos2"  >
	<?php
	$row1 = array();
	// Combo en el que se muestran las dependencias, en el caso  de que el usuario escoja reasignar.
	$dependencianomb=substr($dependencianomb,0,35);
	$subDependencia = 'depe_nomb';
	if($_SESSION["codusuario"]!=1 && $_SESSION["usuario_reasignacion"] !=1)
	{
        /*Skina Modificacion*/
        /*Ing Camilo Pintor*/
        /*Se agrega filtro para que solo muestre las dependencias que esten activas*/
        /*$whereReasignar = " where depe_codi = $dependencia";*/
	  $whereReasignar = " where depe_codi = '$dependencia' and depe_estado=1";
	}
	else
	{
	  $whereReasignar = "where depe_estado=1";
	}
	$sql = "select $subDependencia, depe_codi from DEPENDENCIA $whereReasignar ORDER BY DEPE_NOMB";
	$rs = $db->query($sql);
//	error_log('-------> '.$sql.'-------> '.$dependencia);
	print $rs->GetMenu2('depsel',$dependencia,false,false,0," id=depsel class=select tabindex='-1' aria-label='Listado de dependencias para reasignar, seleccione una.' ");
	// genera las dependencias para informar
	$row1 = array();

	$dependencianomb=substr($dependencianomb,0,35);
	$subDependencia = 'depe_nomb';

        /*Skina Modificacion*/
        /*Ing Camilo Pintor*/
        /*Se agrega filtro para que solo muestre las dependencias que esten activas*/
        /*$sql = "select $subDependencia, depe_codi from DEPENDENCIA ORDER BY DEPE_NOMB";*/
	$sql = "select $subDependencia, depe_codi from DEPENDENCIA where depe_estado=1 ORDER BY DEPE_NOMB";
	$rs = $db->conn->Execute($sql);
	print $rs->GetMenu2('depsel8[]',$dependencia,false,true,5," id='depsel8' class='select' tabindex='-1' aria-label='Listado de dependencias para informar, seleccione una.' ");
	// Aqui se muestran las carpetas Personales

	$dependencianomb=substr($dependencianomb,0,35);
	$datoPersonal = "(Personal)";
	$nombreCarpeta = $db->conn->Concat("' $datoPersonal'",'nomb_carp');
	//$db->conn->debug = true;
	 //by skina
	switch ($driver){
             case 'mssql':
                 $codigoCarpetaGen = $db->conn->Concat("10000","carp_codi");
                 $codigoCarpetaPer = $db->conn->Concat("11000","codi_carp");
                 break;
             case 'ocipo':
                break;
            case 'mysql':
                 $codigoCarpetaGen = $db->conn->Concat("cast(10000 as char(5))","carp_codi");
                 $codigoCarpetaPer = $db->conn->Concat("cast(11000 as char(5))","codi_carp");
                 break;
             case 'postgres':
                 $codigoCarpetaGen = $db->conn->Concat("cast(10000 as varchar(5))","carp_codi");
                 $codigoCarpetaPer = $db->conn->Concat("cast(11000 as varchar(5))","codi_carp");
                break;
        }

	$sql = "select carp_desc as nomb_carp,$codigoCarpetaGen as carp_codi, 0 as orden from carpeta where carp_codi <> 11 "
                . "union select $nombreCarpeta as nomb_carp,$codigoCarpetaPer as carp_codi,1 as orden from carpeta_per "
                . "where usua_codi = $codusuario and depe_codi ='". $dependencia."' order by orden, carp_codi";
	$rs = $db->conn->Execute($sql);
	print $rs->GetMenu2('carpSel',1,false,false,0," id=carpper class=select tabindex='-1' aria-label='Listado de carpetas disponibles del usuario para mover documentos' ");

	// Fin de Muestra de Carpetas personales
	?>
		<INPUT TYPE=hidden name=enviara value=9>
		<INPUT TYPE=hidden name=EnviaraV id=EnviaraV value=''>
		</td>
		<td width='5%'class="titulos2" align="right">
			<input type=button value='Realizar' name=Enviar id=Enviar valign='middle' class='botones' aria-label='Enviar transacción documental'  onClick="envioTx();">
			<input type=hidden name=codTx value=9>
		</td>
<?php
/* Fin no mostrar opc_envio*/
}
?>
</TR>
</TABLE>
<?php
/**  FIN DE VISTA DE TRANSACCIONES
  *
  *
  */
?>
