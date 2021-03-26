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
//Envio de mail by skinatech
session_start();
error_reporting(7);
$ruta_raiz = "..";
define('ADODB_ASSOC_CASE', 0);
include_once "../include/db/ConnectionHandler.php";
include_once($ruta_raiz . "/include/PHPMailer/class.phpmailer.php");
include_once($ruta_raiz . "/config.php");

/* ---------------------------------------------------------+
  |                    DEFINICIONES                          |
  +--------------------------------------------------------- */
$db = new ConnectionHandler("$ruta_raiz");
$mail = new PHPMailer();

foreach ($_GET as $key => $valor)
    ${$key} = $valor;
foreach ($_POST as $key => $valor)
    ${$key} = $valor;
/* ---------------------------------------------------------+
  |                       MAIN                               |
  +--------------------------------------------------------- */

$tx = $_GET['tx'];
$codusu = $_GET['codusu'];
$verrad = $_GET['verrad'];
$asunto = $_GET['asunto'];
$nombre = $_GET['nombre'];
$apellido = $_GET['apellido'];
$krd = $_SESSION['krd'];
$usunom = $_GET['usunom'];
$count = $_GET['count'];

$usuarios = "select USUA_NOMB from usuario where usua_login='$krd'";
$db->conn->SetFetchMode(ADODB_FETCH_ASSOC);
$rsUsuario = $db->conn->query($usuarios);
$usuariors = $rsUsuario->fields["USUA_NOMB"];

$usaurioExplode = explode(',', $usunom);
$array = array();

$fecha = date("F j, Y H:i:s");
$usMailSelect = $cuenta_mail;
list($a, $b) = split("@", $usMailSelect);
$userName = $a;

$mail->IsSMTP(); // telling the class to use SMTP
$mail->SetFrom($usMailSelect, "SGD Orfeo 5.5");
$mail->Host = $servidor_mail_smtp;
$mail->Port = $puerto_mail_smtp;
$mail->SMTPDebug = "1";  // 1 = errors and messages // 2 = messages only 
$mail->SMTPAuth = "true";
$mail->SMTPSecure = $protocolo_smtp;
$mail->Username = $usMailSelect;   // SMTP account username
$mail->Password = $contrasena_mail; // SMTP account password
$mail->Subject = "Ha recibido un documento en orfeo";
$mail->AltBody = "Para ver el mensaje, por favor use un visor de E-mail compatible!";

for ($x = 0; $x < count($usaurioExplode); $x++) {
    
    if ($usaurioExplode[$x] != '') {
        $sql = "SELECT USUA_EMAIL FROM USUARIO WHERE USUA_NOMB='" . trim($usaurioExplode[$x]) . "'";
        $db->conn->SetFetchMode(ADODB_FETCH_ASSOC);
        $rs = $db->conn->query($sql);
        $mail_usu = isset($rs->fields["USUA_EMAIL"]) ? $rs->fields["USUA_EMAIL"] : $rs->fields["usua_email"];

        //SE VERIFICA SI ES EMAIL
        $mail_correcto = 0;
        //compruebo unas cosas primeras
        if ((strlen($mail_usu) >= 6) && (substr_count($mail_usu, "@") == 1) && (substr($mail_usu, 0, 1) != "@") && (substr($mail_usu, strlen($mail_usu) - 1, 1) != "@")) {
            if ((!strstr($mail_usu, "'")) && (!strstr($mail_usu, "\"")) && (!strstr($mail_usu, "\\")) && (!strstr($mail_usu, "\$")) && (!strstr($mail_usu, " "))) {
                //miro si tiene caracter .
                if (substr_count($mail_usu, ".") >= 1) {
                    //obtengo la terminacion del dominio
                    $term_dom = substr(strrchr($mail_usu, '.'), 1);
                    //compruebo que la terminación del dominio sea correcta
                    if (strlen($term_dom) > 1 && strlen($term_dom) < 5 && (!strstr($term_dom, "@"))) {
                        //compruebo que lo de antes del dominio sea correcto
                        $antes_dom = substr($mail_usu, 0, strlen($mail_usu) - strlen($term_dom) - 1);
                        $caracter_ult = substr($antes_dom, strlen($antes_dom) - 1, 1);
                        if ($caracter_ult != "@" && $caracter_ult != ".") {
                            $mail_correcto = 1;
                        }
                    }
                }
            }
        } 
        
        if ($mail_usu == ' ' or $mail_correcto == 0) {
            echo "No se pudo enviar notificacion, el usuario " . $mail_usu . " no tiene correo electronico o tiene un formato incorrecto, comuniquese con el administrador del sistema<br>";
        } else {
            $array[] = $mail_usu;
        }
    }    
}
$mensage = '';
$encabezado = session_name() . "=" . session_id() . "&depeBuscada=$depeBuscada&filtroSelect=$filtroSelect&tpAnulacion=$tpAnulacion&carpeta=$carpeta&tipo_carp=$tipo_carp&chkCarpeta=$chkCarpeta&busqRadicados=$busqRadicados&nomcarpeta=$nomcarpeta&agendado=$agendado&";

foreach ($array as $email) {
    $mail->AddAddress($email);
    
    $expCant = explode("','", $verrad . " " . $radi_nume);

    $asu .= "<hr>SGD Orfeo 5.5";
    $mensaje = "<html>
        <head>
        <title>Correspondencia en el sistema de gesti&oacute;n documental Orfeo</title>
        </head>
        <body><p>
        " . $entidad . " , " . $fecha . " <br>
        <br></br>
        Ha recibido un <b>documento " . $tx . "</b> en el Sistema de Gesti&oacute;n Documental Orfeo. Ingrese ";

    // By Skina - jmgamez@skinatech.com - 22 de Julio 2016
    // Se agrega el ciclo para validar la URL por cada radicado que se notifique, 
    // este cambio aplica para Informados, Radicacion, Reasignacion 	
    for ($i = 0; $i < count($expCant); $i++) {
        $bodytag = str_replace("'", "", $expCant[$i]);
        $datosRad = "select ra_asun from radicado where radi_nume_radi='" . trim($bodytag) . "'";
        $rsdatosRad = $db->conn->query($datosRad);
        $asunto = substr($rsdatosRad->fields['ra_asun'], 1, 300);
        $mensaje .= 'al radicado <a href="https://skina.orfeoexpress.com/' . $ambiente . '/verradicado.php?verrad=' . trim($bodytag) . '&'.$encabezado. '"> ' . $bodytag . ' </a> , ';
    }

    $mensaje .= "enviado por " . $usuariors . " <br></br>
    <br>Asunto:  " . $asunto . "</br>
    <br>
    <br>Cordialmente, </br>
    <br>Sistema de Gestion Documental Orfeo
    </p>
    </body>
    </html>
    ";
    $mail->MsgHTML(utf8_decode($mensaje));

    $mail->ErrorInfo;
    $exito = $mail->Send();
    
    if (!$exito) {
        $mensage .= "- No se pudo enviar correo <b>".$email."</b> <br><br>";
    } else {
        $mensage .= '- Se envio notificación al siguiente correo <b>'.$email."</b> <br><br>";
    }
    $mail->ClearAddresses();
}

?>
<html>
    <HEAD>
        <TITLE>Envio de Notificacion a Email
        </TITLE></HEAD>
    <BODY>
        <?php echo ' '.$mensage ?>
    </BODY>
</html>
