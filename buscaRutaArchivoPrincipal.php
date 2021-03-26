<?php

session_start();
$dir_raiz = $_SESSION['dir_raiz'];
$longitud_codigo_dependencia = $_SESSION['longitud_codigo_dependencia'];
$estructuraRad = $_SESSION['estructuraRad'];

include_once dirname(__FILE__) . DIRECTORY_SEPARATOR . "." . DIRECTORY_SEPARATOR . "config.php";
include "./include/db/ConnectionHandler.php";
$db = new ConnectionHandler(".");
$db->conn->SetFetchMode(ADODB_FETCH_ASSOC);

if (empty($_SESSION)) {
    reportarErrores("Error de permisos: No se encuentran datos del usuario");
}

// By Skinatech - 14/08/2018
// Para la construcción del número de radicado, esto indica la parte inicial del radicado.
if ($estructuraRad == 'ymd') {
    $num = 8;
} elseif ($estructuraRad == 'ym') {
    $num = 6;
} else {
    $num = 4;
}

$dataReturn = [];
$token = "";

switch ($_POST['tipo']) {
    case 1: //Busqueda para los clientes
        $idRadicado = $_POST['id'];
        $consultaRadicados = "SELECT radi_path FROM radicado where radi_nume_radi='$idRadicado'";
        $rsConsulRadi = $db->conn->execute($consultaRadicados);
        
        $rutaPath = isset($rsConsulRadi->fields['radi_path']) ? $rsConsulRadi->fields['radi_path'] : $rsConsulRadi->fields['RADI_PATH'];

        if ($rutaPath != '') {
            if (file_exists('./bodega/' . $rutaPath)) {
                $rutaArchivo = './bodega/' . $rutaPath;
                $token = base64_encode(file_get_contents($rutaArchivo));

                $explodeArchivo = explode('.', $rutaPath);
                $extencion = base64_encode($rutaArchivo);

                if ($explodeArchivo[1] != 'pdf' && $explodeArchivo[1] != 'PDF') {
                    $mostrarArchivo = false;
                } else {
                    $mostrarArchivo = true;
                }

                $dataReturn = array('status' => true, 'message' => 'Ok', 'token' => $token, 'extencion' => $extencion, 'mostrar' => $mostrarArchivo);
            } else {
                $dataReturn = array('status' => false, 'message' => 'No hay imagen principal', 'token' => $token);
            }
        } else {
            $dataReturn = array('status' => false, 'message' => 'No hay imagen principal para esté radicado', 'token' => $token);
        }

        header('Content-Type: application/json');
        echo json_encode($dataReturn, JSON_FORCE_OBJECT);
        break;
        
    case 2: //Busqueda en anexos
        $idRadicado = $_POST['id'];
        $anexoNo = $_POST['anexo'];
        $consultaRadicados = "SELECT anex_nomb_archivo, anex_codigo  FROM anexos where anex_numero=$anexoNo and anex_radi_nume ='$idRadicado'";
        $rsConsulRadi = $db->conn->execute($consultaRadicados);
        $coddocu = isset($rsConsulRadi->fields['anex_codigo']) ? $rsConsulRadi->fields['anex_codigo'] : $rsConsulRadi->fields['ANEX_CODIGO'];
        $nomAnexo = isset($rsConsulRadi->fields["anex_nomb_archivo"]) ? $rsConsulRadi->fields["anex_nomb_archivo"] : $rsConsulRadi->fields["ANEX_NOMB_ARCHIVO"];
        
        $linkarchivo_vista = "$dir_raiz/bodega/" . substr(trim($coddocu), 0, 4) . "/" . strtoupper(substr(trim($coddocu), $num, $longitud_codigo_dependencia)) . "/docs/" . trim(strtoupper(stristr($nomAnexo, ".", true))) . trim(stristr($nomAnexo, "."));
        
        if ($nomAnexo != '') {
            if (file_exists($linkarchivo_vista)) {
                $rutaArchivo = $linkarchivo_vista;
                $token = base64_encode(file_get_contents($rutaArchivo));

                $explodeArchivo = explode('.', $nomAnexo);
                $extencion = base64_encode($rutaArchivo);

                if ($explodeArchivo[1] != 'pdf' && $explodeArchivo[1] != 'PDF') {
                    $mostrarArchivo = false;
                } else {
                    $mostrarArchivo = true;
                }

                $dataReturn = array('status' => true, 'message' => 'Ok', 'token' => $token, 'extencion' => $extencion, 'mostrar' => $mostrarArchivo);
            } else {
                $dataReturn = array('status' => false, 'message' => 'No hay imagen principal', 'token' => $token);
            }
        } else {
            $dataReturn = array('status' => false, 'message' => 'No hay imagen principal para esté radicado', 'token' => $token);
        }

        header('Content-Type: application/json');
        echo json_encode($dataReturn, JSON_FORCE_OBJECT);
        break;
        
    case 3: //Busqueda en expedientes
        $idRadicado = $_POST['id'];
        $anexoNo = $_POST['anexo'];
        $consultaRadicados = "SELECT anex_nomb_archivo, anex_codigo  FROM anexos where anex_numero=$anexoNo and anex_radi_nume ='$idRadicado'";
        $rsConsulRadi = $db->conn->execute($consultaRadicados);
        
        $coddocu = isset($rsConsulRadi->fields['anex_codigo']) ? $rsConsulRadi->fields['anex_codigo'] : $rsConsulRadi->fields['ANEX_CODIGO'];
        $nomAnexo = isset($rsConsulRadi->fields["anex_nomb_archivo"]) ? $rsConsulRadi->fields["anex_nomb_archivo"] : $rsConsulRadi->fields["ANEX_NOMB_ARCHIVO"];
       
        $linkarchivo_vista = "$dir_raiz/bodega/" . substr(trim($coddocu), 0, 4) . "/" . strtoupper(substr(trim($coddocu), $num, $longitud_codigo_dependencia)) . "/docs/" . trim(strtoupper(stristr($nomAnexo, ".", true))) . trim(stristr($nomAnexo, "."));
        
        if ($nomAnexo != '') {
            if (file_exists($linkarchivo_vista)) {
                $rutaArchivo = $linkarchivo_vista;
                $token = base64_encode(file_get_contents($rutaArchivo));

                $explodeArchivo = explode('.', $nomAnexo);
                $extencion = base64_encode($rutaArchivo);

                if ($explodeArchivo[1] != 'pdf' && $explodeArchivo[1] != 'PDF') {
                    $mostrarArchivo = false;
                } else {
                    $mostrarArchivo = true;
                }

                $dataReturn = array('status' => true, 'message' => 'Ok', 'token' => $token, 'extencion' => $extencion, 'mostrar' => $mostrarArchivo);
            } else {
                $dataReturn = array('status' => false, 'message' => 'No hay imagen principal', 'token' => $token);
            }
        } else {
            $dataReturn = array('status' => false, 'message' => 'No hay imagen principal para esté radicado', 'token' => $token);
        }

        header('Content-Type: application/json');
        echo json_encode($dataReturn, JSON_FORCE_OBJECT);
        break;
        
        case 4: //Despliege de anexos desde listado de busquedaOCR
        $rutaAnexo = "/var/www/html/".$ambiente.$_POST['rutaAnexo'];
        if ($rutaAnexo != '') {
            if (file_exists($rutaAnexo)) {
                $rutaArchivo = $rutaAnexo;
                $token = base64_encode(file_get_contents($rutaArchivo));
                $explodeArchivo = explode('.', $rutaAnexo);
                $extencion = base64_encode($rutaArchivo);
                if ($explodeArchivo[1] != 'pdf' && $explodeArchivo[1] != 'PDF') {
                    $mostrarArchivo = false;
                } else {
                    $mostrarArchivo = true;
                }

                $dataReturn = array('status' => true, 'message' => 'Ok', 'token' => $token, 'extencion' => $extencion, 'mostrar' => $mostrarArchivo);
            } else {
                $dataReturn = array('status' => false, 'message' => 'No hay imagen principal', 'token' => $token);
            }
        } else {
            $dataReturn = array('status' => false, 'message' => 'Ruta de anexo no válida', 'token' => $token);
        }

        header('Content-Type: application/json');
        echo json_encode($dataReturn, JSON_FORCE_OBJECT);
        break;
}
?>
