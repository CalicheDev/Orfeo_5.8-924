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
$url_raiz="..";
$dir_raiz=$_SESSION['dir_raiz'];
$ESTILOS_PATH2 =$_SESSION['ESTILOS_PATH2'];

/* ---------------------------------------------------------+
  |                       MAIN                               |
  +--------------------------------------------------------- */


/* Hecho por skina technologies ltda 2010 */
//session_start();
//error_reporting(7);
//$ruta_raiz = "..";
define('ADODB_ASSOC_CASE', 0);
include_once $dir_raiz."/include/db/ConnectionHandler.php";
include_once($dir_raiz . "/include/PHPMailer/class.phpmailer.php");
include_once($dir_raiz . "/config.php");

$db = new ConnectionHandler("$dir_raiz");
$mail = new PHPMailer();

//$db->conn->debug=true;
$fechahoy = date("Y-m-d");
$sqlFecha = $db->conn->SQLDate("Y-m-d", "RADI_FECH_RADI");
$order = " b.RADI_DEPE_ACTU";
$nombre = 'ADMINISTRADOR';
$apellido = 'SGD ORFEO';
$dependencia = "b.radi_depe_actu";
$whereUsuario = "";
$whereFiltro = '';
$whereCarpeta = '';
$sqlAgendado = '';
$orderTipo = '';
$db->conn->SetFetchMode(ADODB_FETCH_ASSOC);

//Para los que no tienen flujo
echo "Alertas para los documentos que no tienen flujo $fechahoy";
echo "<br>";
$redondeo = "date_part('days', radi_fech_radi-" . $db->conn->sysTimeStamp . ")+floor(dt.dias_termino * 7/5)+(select count(*) from sgd_noh_nohabiles where NOH_FECHA between radi_fech_radi and " . $db->conn->sysTimeStamp . ")";

$isql = 'select ' . $sqlFecha . ' as "DAT_Fecha Radicado", b.RA_ASUN  as "HID_ASUN"' . $colAgendado .
        ',d.SGD_DIR_NOMREMDES  as "Remitente/Destinatario"
                                ,c.SGD_TPR_DESCRIP as "Tipo_Documento"
                                ,' . $redondeo . ' as "HID_DIAS_R"
                                ,b.RADI_USUA_ACTU as "HID_USUA"
                                ,b.RADI_DEPE_ACTU as "HID_DEPE"
                                ,b.RADI_NUME_RADI as "CHK_CHKANULAR"
	from
                 radicado b left outer join SGD_TPR_TPDCUMENTO c on b.tdoc_codi=c.sgd_tpr_codigo
        		    left outer join SGD_DIR_DRECCIONES d on b.radi_nume_radi=d.radi_nume_radi
		            left outer join SGD_DT_RADICADO dt on b.radi_nume_radi=dt.radi_nume_radi
         where
                b.radi_nume_radi is not null
                and b.radi_depe_actu=' . $dependencia .
        $whereUsuario . $whereFiltro . ' ' . $whereCarpeta . ' ' . $sqlAgendado . '
          order by ' . $order . ' ' . $orderTipo;

//$db->conn->SetFetchMode(ADODB_FETCH_ASSOC);
$rs = $db->conn->query($isql);
$array = array();

//AQUI INSERTO EL RESULTADO DEL QUERY EN EL ARRAY
while ($agrupado = $rs->FetchRow()) {
    //AQUI HAGO LA AGRUPACION DE RADICADOS POR DEPENDENCIA Y POR USUARIO
    //AQUI HACEMOS LA VALIDACION DE DIAS DE TERMINO.
    if ($agrupado['hid_dias_r'] <= 2) {
        $array [$agrupado['hid_depe']][$agrupado['hid_usua']][] = $agrupado;
    }
}

foreach ($array as $iddependencia => $dependencia) {
    foreach ($dependencia as $idusuario => $usuario) {
        //PASO LAS VARIABLES DEL ARCHIVO CONFIG Y DEL ARREGLO.
        enviarcorreo($idusuario, $iddependencia, $usuario, $db, $entidad, $servidor_mail_smtp, $puerto_mail_smtp, $cuenta_mail, $contrasena_mail);
    }
}

function enviarcorreo($idusuario, $iddependencia, $arrayusuarios, $db, $entidad, $servidor_mail_smtp, $puerto_mail_smtp, $cuenta_mail, $contrasena_mail) {
    $mail = new PHPMailer();

    $usua_codi = $idusuario;
    $depe_codi = $iddependencia;
    if ($diasr <= 3 and $depe_codi != '0999') {

        echo "<br>";
        $sql_mail = "SELECT USUA_EMAIL FROM USUARIO WHERE USUA_CODI=$usua_codi AND DEPE_CODI='$depe_codi'";
        $db->conn->SetFetchMode(ADODB_FETCH_ASSOC);
        $rs_mail = $db->conn->query($sql_mail);
        $mail_usu = $rs_mail->fields["usua_email"];
        $usua_codi_envio = $rs_mail->fields["usua_nomb"];
        $depe_codi_envio = $rs_mail->fields["depe_nomb"];
        $fecha = date("F j, Y H:i:s");

        echo "mail usu $mail_usu <br>";
        if ($usua_codi != 1) {
            $sql_mail = "SELECT USUA_EMAIL FROM USUARIO WHERE USUA_CODI=1 AND DEPE_CODI='$depe_codi'";
            $db->conn->SetFetchMode(ADODB_FETCH_ASSOC);
            $rs_mail = $db->conn->query($sql_mail);
            $mail_jefe = $rs_mail->fields["usua_email"];
        }

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
        $usuarios = "select USUA_NOMB from usuario where usua_login='$krd'";
        $db->conn->SetFetchMode(ADODB_FETCH_ASSOC);
        $rsUsuario = $db->conn->query($usuarios);
        $usuariors = $rsUsuario->fields["usua_nomb"];

        if ($mail_usu == ' ' or $mail_correcto == 0) {
            echo "No se pudo enviar notificacion, el usuario no tiene correo electronico o tiene un formato incorrecto, comuniquese con el administrador del sistema";
        } else {
            $usMailSelect = $cuenta_mail;
            list($a, $b) = split("@", $usMailSelect);
            $userName = $a;
            $fecha = date("F j, Y H:i:s");
            $mail->IsSMTP(); // telling the class to use SMTP
            $mail->SetFrom($usMailSelect, "SGD Orfeo 5");
            $mail->Host = $servidor_mail_smtp;
            $mail->Port = $puerto_mail_smtp;
            $mail->SMTPDebug = "1";  // 1 = errors and messages // 2 = messages only 
            $mail->SMTPAuth = "true";
            $mail->SMTPSecure = "";
            $mail->Username = $usMailSelect;   // SMTP account username
            $mail->Password = $contrasena_mail; // SMTP account password
            $mail->Subject = "Tiene un documento vencido en Orfeo";
            $mail->AltBody = "Para ver el mensaje, por favor use un visor de E-mail compatible!";
            $mail->AddAddress($mail_usu);

            $asu .= "<hr>SGD Orfeo 5";
            $mensaje = "
                <html>
                    <head>
                        <title>CORRESPONDENCIA EN SGD ORFEO 5</title>
                    </head>
                    <body><p>
                        " . $entidad . " , " . $fecha . " <br>
                        <br></br>
                        Señor(a): " . $usua_codi_envio . " de la dependencia: " . $depe_codi_envio . "<br><br>
                        A continuación se presenta un listado con los radicados vencidos y/o proxímos a vencer en 2 días, se requiere gestión de su parte. 
                        <br>Ingrese a Orfeo y realice el trámite correspondiente.<br><br>";
            $mensaje .= "
                        <table border = 1>
                            <thead>
                                <tr>
                                    <th>Radicado</th>
                                    <th>Fecha</th>
                                    <th>Días Restantes</th>
                                    <th>Tipo Documental</th>
                                    <th>Enviado Por</th>
                                    <th>Asunto</th>
                                </tr>
                            </thead>";
                            //AQUI CONSTRUIMOS EL CONTENIDO DE LA TABLA.
                            foreach ($arrayusuarios as $arrayusuario) {
                                //AQUI TRAIGO LOS VALORES DEL ARREGLO
                                //QUITO EL utf8_decode YA QUE LOS VALORES LLEGAN BIEN
                                $radi_nume = $arrayusuario['chk_chkanular'];
                                $asunto = $arrayusuario['hid_asun'];
                                //$asunto = utf8_decode($asunto);
                                $diasr = $arrayusuario['hid_dias_r'];
                                $tipodoc = $arrayusuario['tipo_documento'];
                                //$tipodoc = utf8_decode($tipodoc);
                                $fecha_rad = $arrayusuario['dat_fecha radicado'];
                                $usuariors = $arrayusuario['remitente/destinatario'];
                                //$usuariors = utf8_decode($usuariors);
                                //AQUI SE PONEN LOS VALORES DEL RADICADO.       
                                $mensaje .= "   
                                    <tr>
                                        <td><a href='".$url_raiz."/verradicado.php?verrad=" . $radi_nume . "'> " . $radi_nume . " </a></td>
                                        <td>" . $fecha_rad . "</td>
                                        <td>" . $diasr . "</td>
                                        <td>" . $tipodoc . "</td>
                                        <td>" . $usuariors . "</td>
                                        <td>" . $asunto . "</td>
                                    </tr>";
                            }

            $mensaje .= "</table>
                         <br><br>Cordialmente,
                         <br>Sistema de Gestión Documental Orfeo  </p>
                    </body>
                </html>";
            $mail->MsgHTML(utf8_decode($mensaje));

            while ((!$exito) && ($intentos < 5) && $mail_usu != "") {
                echo $mensaje;
                $mail->ErrorInfo;
                //AQUI ENVIAMOS EL CORREO SI TODO ESTA BIEN.
                $exito = $mail->Send();
                if (!$exito) {
                    echo ("<br> No se pudo enviar correo");
                } else {

                    echo("<br> Se ha enviado una notificación a $mail_usu");
                }
                $intentos = $intentos + 1;
                sleep(7);
            }
        }
        echo "<br>";
    }
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

