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


        /*---------------------------------------------------------+
        |                       MAIN                               |
        +---------------------------------------------------------*/

//Envio de mail by skinatech
session_start();
error_reporting(7);
$ruta_raiz = "..";
define('ADODB_ASSOC_CASE', 0);
include_once "../include/db/ConnectionHandler.php";
include_once($ruta_raiz."/include/PHPMailer/class.phpmailer.php");
include_once($ruta_raiz."/config.php");

$db = new ConnectionHandler("$ruta_raiz");
$mail = new PHPMailer();

//$db->conn->debug=true;
$fechahoy=date("Y-m-d"); 
$sqlChar = $db->conn->SQLDate("Y-m-d","SGD_AGEN_FECHPLAZO");
$tx='Agendado';
$nombre='ADMINISTRADOR';
$apellido='SGD ORFEO';
//Busco los documentos agendados vencidos
echo "Alertas para los documentos agendados vencidos";
echo "<br>";

$sql="SELECT RADI_NUME_RADI AS RADICADO, SGD_AGEN_OBSERVACION, USUA_DOC, SGD_AGEN_FECHPLAZO AS PLAZO, round(SGD_AGEN_FECHPLAZO-current_date) as HID_DIAS_R, 		DEPE_CODI, SGD_AGEN_ACTIVO FROM SGD_AGEN_AGENDADOS WHERE SGD_AGEN_ACTIVO=1";
//AND  $sqlChar = '$fechahoy'";
$rs=$db->conn->query($sql);
while(!$rs->EOF){
	$radi_nume=$rs->fields["radicado"];
	$asunto=$rs->fields["sgd_agen_observacion"];
	$usua_doc=$rs->fields["usua_doc"];
	$plazo=$rs->fields["plazo"];
	$diasr=$rs->fields["hid_dias_r"];
	$depe_codi=$rs->fields["depe_codi"];
	
	echo "<br> rad $radi_nume plazo $plazo dias $diasr"; 
	//Envio correo para los responsables de los documentos
	if($diasr<=0 AND $depe_codi!='0999'){ 

	$sql_mail="SELECT USUA_EMAIL FROM USUARIO WHERE USUA_DOC='$usua_doc'";
	echo "usua-doc  $usua_doc";
	$db->conn->SetFetchMode(ADODB_FETCH_ASSOC);
	$rs_mail=$db->conn->query($sql_mail);
	$mail_usu=$rs->fields["usua_email"];
	
	//SE VERIFICA SI ES EMAIL
    	$mail_correcto = 0;
    	//compruebo unas cosas primeras
    	if ((strlen($mail_usu) >= 6) && (substr_count($mail_usu,"@") == 1) && (substr($mail_usu,0,1) != "@") && (substr($mail_usu,strlen($mail_usu)-1,1) != "@")){
       		if ((!strstr($mail_usu,"'")) && (!strstr($mail_usu,"\"")) && (!strstr($mail_usu,"\\")) && (!strstr($mail_usu,"\$")) && (!strstr($mail_usu," "))) {
          		//miro si tiene caracter .
         		if (substr_count($mail_usu,".")>= 1){
             			//obtengo la terminacion del dominio
             			$term_dom = substr(strrchr ($mail_usu, '.'),1);
             			//compruebo que la terminación del dominio sea correcta
             			if (strlen($term_dom)>1 && strlen($term_dom)<5 && (!strstr($term_dom,"@")) ){
                			//compruebo que lo de antes del dominio sea correcto
                			$antes_dom = substr($mail_usu,0,strlen($mail_usu) - strlen($term_dom) - 1);
                			$caracter_ult = substr($antes_dom,strlen($antes_dom)-1,1);
                			if ($caracter_ult != "@" && $caracter_ult != "."){
                   				$mail_correcto = 1;
                			}
             			}
          		}	
       		}
    	}

$usuarios = "select USUA_NOMB from usuario where usua_login='$krd'";
$db->conn->SetFetchMode(ADODB_FETCH_ASSOC);
$rsUsuario = $db->conn->query($usuarios);
$usuariors = $rsUsuario->fields["USUA_NOMB"];

	if($mail_usu==' ' or $mail_correcto==0){
	   echo "No se pudo enviar notificacion, el usuario no tiene correo electronico o tiene un formato incorrecto, comuniquese con el administrador del sistema";
	}
	else{

    		$usMailSelect  = $cuenta_mail;
    		list($a,$b)=split("@",$usMailSelect);
    		$userName=$a;
    		$fecha=date("F j, Y H:i:s");

    		$mail->IsSMTP(); // telling the class to use SMTP
    		/*$mail->AddReplyTo($usMailSelect);*/
    		$mail->SetFrom($usMailSelect,"Sistema Gestion documental ORFEO");
    		$mail->Host       = $servidor_mail_smtp;
    		$mail->Port       = $puerto_mail_smtp;
    		$mail->SMTPDebug  = "1";  // 1 = errors and messages // 2 = messages only 
    		$mail->SMTPAuth   = "true";
    		$mail->SMTPSecure = "";
    		/*$mail->AuthType   = $tipoAutenticacion;*/
    		$mail->Username   = $usMailSelect;   // SMTP account username
    		$mail->Password   = $contrasena_mail; // SMTP account password
    		$mail->Subject    = "Tiene un documento Agendado vencido en Orfeo";
    		$mail->AltBody    = "Para ver el mensaje, por favor use un visor de E-mail compatible!";
    		/*$url=true;*/
    		$mail->AddAddress($mail_usu);
    		$expCant = explode("','",$verrad." ".$radi_nume);

    		$asu .= "<hr>Sistema de gestion documental Orfeo.";
   		$mensaje = "<html>
	        	<head>
        		<title>CORRESPONDENCIA EN ORFEO</title>
        		</head>
        		<body><p>
        		".$entidad." , ".$fecha." <br>
        		<br></br>
			Tiene un documento agendado vencido en el Sistema de Gestion Documental Orfeo. Ingrese a su Orfeo ";
		
			// By Skina - jmgamez@skinatech.com - 22 de Julio 2016
        		// Se agrega el ciclo para validar la URL por cada radicado que se notifique, este cambio aplica para Informados, Radicacion, Reasignacion      
        		for($i=0; $i<count($expCant); $i++){
         			$bodytag = str_replace("'", "", $expCant[$i]);
         			$mensaje .=  'al radicado <a href="http://190.131.237.28:81/pruebas/verradicado.php?verrad='.$bodytag.'"> '.$bodytag.' </a> , ';
        		}
        	$mensaje .= "enviado por " . $usuariors . " <br></br>	
		<br>Asunto:  ".$asunto."</br>
        		<br></br>
        		<br>Cordialmente, </br>
        		<br>Sistema de Gestion Documental Orfeo
        		</p>
        		</body>
        		</html>";
		$mail->MsgHTML(utf8_decode($mensaje));
		while ((!$exito) && ($intentos < 5) && $mail_usu!="") {
            		$mail->ErrorInfo;
            		$exito = $mail->Send();
           		if (!$exito){
                		echo ("<br> No se pudo enviar correo");
              		}else{
                		echo("<br> Se ha enviado una notificaci&oacute;n a $mail_usu");
              		}
            		$intentos=$intentos+1;
            		sleep(7);
         	}

	}
	echo "<br>";
	}
	$rs->MoveNext();
} 	
?>
<html>
<HEAD>
<TITLE>Envio de Notificacion a Email
</TITLE></HEAD>
<BODY>
<script>
        //window.close();
</script>
</BODY>
</html>
