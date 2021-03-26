<?php

/** RADICADOS DE ENTRADA RECIBIDOSç
 * 
 * @autor JAIRO H LOSADA - SSPD
 * @version ORFEO 3.1
 * 
 */
$coltp3Esp = '"' . $tip3Nombre[3][2] . '"';
if (!$orno)
    $orno = 2;

$whereTipoRadicado = str_replace("A.", "r.", $whereTipoRadicado);
$whereTipoRadicado = str_replace("a.", "r.", $whereTipoRadicado);
$rangoFechas = $db->conn->SQLDate('Y/m/d', 'r.radi_fech_radi') . " BETWEEN '$fecha_ini' AND '$fecha_fin'";

switch ($db->driver) {
    case 'oracle':
    case 'oci8':
    case 'oci805':
    case 'ocipo': {
            if ($dependencia_busq != '99999') {
                $condicionE = " AND h.DEPE_CODI_DEST='$dependencia_busq' AND b.DEPE_CODI='$dependencia_busq' ";
            }
            $queryE = "
		    SELECT MIN(b.USUA_NOMB) USUARIO
		    , count(r.RADI_NUME_RADI) RADICADOS
		    , MIN(b.USUA_CODI) HID_COD_USUARIO
		    , MIN(b.depe_codi) HID_DEPE_USUA
		    FROM RADICADO r, USUARIO b, HIST_EVENTOS h, SGD_TPR_TPDCUMENTO t
		    WHERE h.HIST_DOC_DEST=b.usua_doc
		    AND r.tdoc_codi=t.sgd_tpr_codigo 
		    $condicionE
		    AND h.RADI_NUME_RADI=r.RADI_NUME_RADI
		    AND h.SGD_TTR_CODIGO in(2,9,12,16)
		    AND TO_CHAR(r.radi_fech_radi,'yyyy/mm/dd') BETWEEN '$fecha_ini'  AND '$fecha_fin' 
		    $whereTipoRadicado 
		    ";

            if ($codEsp)
                $queryE .= " AND r.EESP_CODI = $codEsp ";
            $queryE .= " GROUP BY b.USUA_LOGIN  ORDER BY $orno $ascdesc ";
            /** CONSULTA PARA VER DETALLES 
             */
            //by skina
            $dias_rad = "to_number(to_char(" . $db->conn->sysTimeStamp . ", 'DD')) - to_number(to_char(r.radi_fech_radi, 'DD'))";
            $queryEDetalle = "SELECT 
		    r.RADI_NUME_RADI RADICADO
		    , b.USUA_NOMB USUARIO_ACTUAL
		    , r.RA_ASUN ASUNTO 
		    , TO_CHAR(r.RADI_FECH_RADI, 'DD/MM/YYYY HH24:MM:SS') AS FECHA_RADICACION
		    , TO_CHAR(h1.HIST_FECH, 'DD/MM/YYYY HH24:MM:SS') AS FECHA_DIGITALIZACION
		    , r.RADI_PATH HID_RADI_PATH{$seguridad}
		    , an.RADI_NUME_SALIDA
		    , TO_CHAR(an.ANEX_RADI_FECH, 'DD/MM/YYYY HH24:MM:SS') AS ANEX_RADI_FECH 
		    , TO_CHAR(an.ANEX_FECH_ENVIO, 'DD/MM/YYYY HH24:MM:SS') AS ANEX_FECH_ENVIO
		    , t.SGD_TPR_TERMINO
		    , t.SGD_TPR_DESCRIP
		    , an.anex_radi_fech-r.RADI_FECH_RADI AS DIAS_TRAMITE
		    , an.anex_fech_envio-r.RADI_FECH_RADI AS DIAS_TRAMITE_ENVIO
		    , $dias_rad DIAS_RAD
		    , (Select bod.nombre_de_la_empresa from BODEGA_EMPRESAS bod where bod.identificador_empresa=r.eesp_codi) Entidad
		    , (Select bod1.nit_de_la_empresa from BODEGA_EMPRESAS bod1 where bod1.identificador_empresa=r.eesp_codi) NITENTIDAD
		    FROM USUARIO b, HIST_EVENTOS h, SGD_TPR_TPDCUMENTO t
		    , RADICADO r left outer join anexos an 
		    ON (R.RADI_NUME_RADI=an.ANEX_RADI_NUME ANd an.anex_estado>=3) 
		    left join HIST_EVENTOS h1 on r.RADI_NUME_RADI=h1.RADI_NUME_RADI and h1.SGD_TTR_CODIGO IN (22,42)
		    WHERE 
		    r.tdoc_codi=t.sgd_tpr_codigo 
		    AND h.HIST_DOC_DEST=b.usua_doc
		    $condicionE
		    AND h.RADI_NUME_RADI=r.RADI_NUME_RADI
		    AND h.SGD_TTR_CODIGO in(2,9,12,16)
		    AND TO_CHAR(r.radi_fech_radi,'yyyy/mm/dd') BETWEEN '$fecha_ini'  AND '$fecha_fin' 
		    $whereTipoRadicado ";
            if ($codEsp)
                $queryEDetalle .= " AND r.EESP_CODI = $codEsp ";
            $condicionUS = " AND b.USUA_CODI=$codUs
		     AND b.depe_codi = '$depeUs' ";
            $orderE = " ORDER BY $orno $ascdesc";
            /** CONSULTA PARA VER TODOS LOS DETALLES 
             */
            $queryETodosDetalle = $queryEDetalle . $orderE;
            $queryEDetalle .= $condicionUS . $orderE;
            break;
        }
    case 'postgres': {
            if ($dependencia_busq != '99999') {
                $condicionE = " AND h.DEPE_CODI_DEST='$dependencia_busq' AND b.DEPE_CODI='$dependencia_busq' ";
            }
            $queryE = "
          SELECT MIN(b.USUA_NOMB) USUARIO
          , count(r.RADI_NUME_RADI) RADICADOS
          , MIN(b.USUA_CODI) HID_COD_USUARIO
          , MIN(b.depe_codi) HID_DEPE_USUA
        FROM RADICADO r, USUARIO b, HIST_EVENTOS h, SGD_TPR_TPDCUMENTO t
        WHERE 
          h.HIST_DOC_DEST=b.usua_doc
          AND r.tdoc_codi=t.sgd_tpr_codigo 
          $condicionE
          AND h.RADI_NUME_RADI=r.RADI_NUME_RADI
          AND h.SGD_TTR_CODIGO in(2,9,12,16)
          AND TO_CHAR(r.radi_fech_radi,'yyyy/mm/dd') BETWEEN '$fecha_ini'  AND '$fecha_fin' 
        $whereTipoRadicado 
        ";

            if ($codEsp)
                $queryE .= " AND r.EESP_CODI = $codEsp ";
            $queryE .= " GROUP BY b.USUA_LOGIN  ORDER BY $orno $ascdesc ";
            /** CONSULTA PARA VER DETALLES 
             */
            //by skina
            $dias_rad = "date_part('days'," . $db->conn->sysTimeStamp . " -r.radi_fech_radi)";
            $queryEDetalle = "SELECT 
          distinct r.RADI_NUME_RADI RADICADO
          , b.USUA_NOMB USUARIO_ACTUAL
          , r.RA_ASUN ASUNTO 
          , TO_CHAR(r.RADI_FECH_RADI, 'DD/MM/YYYY HH24:MM:SS') FECHA_RADICACION
          , TO_CHAR(h1.HIST_FECH, 'DD/MM/YYYY HH24:MM:SS') FECHA_DIGITALIZACION
          , r.RADI_PATH HID_RADI_PATH{$seguridad}
          , an.RADI_NUME_SALIDA
          , an.ANEX_RADI_FECH 
          , an.ANEX_FECH_ENVIO
          , t.SGD_TPR_TERMINO
          , t.SGD_TPR_DESCRIP
          , an.anex_radi_fech-r.RADI_FECH_RADI DIAS_TRAMITE
          , an.anex_fech_envio-r.RADI_FECH_RADI DIAS_TRAMITE_ENVIO
          , $dias_rad DIAS_RAD
	  , (Select bod.nombre_de_la_empresa from BODEGA_EMPRESAS bod where bod.identificador_empresa=r.eesp_codi) Entidad
	  , (Select bod1.nit_de_la_empresa from BODEGA_EMPRESAS bod1 where bod1.identificador_empresa=r.eesp_codi) NITENTIDAD
        FROM USUARIO b, HIST_EVENTOS h, SGD_TPR_TPDCUMENTO t
          , RADICADO r left outer join anexos an 
          ON (R.RADI_NUME_RADI=an.ANEX_RADI_NUME ANd an.anex_estado>=3) 
           left join HIST_EVENTOS h1 on r.RADI_NUME_RADI=h1.RADI_NUME_RADI and h1.SGD_TTR_CODIGO IN (22,42)
        WHERE 
          r.tdoc_codi=t.sgd_tpr_codigo 
          AND h.HIST_DOC_DEST=b.usua_doc
          $condicionE
          AND h.RADI_NUME_RADI=r.RADI_NUME_RADI
          AND h.SGD_TTR_CODIGO in(2,9,12,16)

          AND TO_CHAR(r.radi_fech_radi,'yyyy/mm/dd') BETWEEN '$fecha_ini'  AND '$fecha_fin' 
        $whereTipoRadicado ";
            if ($codEsp)
                $queryEDetalle .= " AND r.EESP_CODI = $codEsp ";
            $condicionUS = " AND b.USUA_CODI=$codUs
                     AND b.depe_codi = '$depeUs' ";
            $orderE = " ORDER BY $orno $ascdesc";
            /** CONSULTA PARA VER TODOS LOS DETALLES 
             */
            $queryETodosDetalle = $queryEDetalle . $orderE;
            $queryEDetalle .= $condicionUS . $orderE;
        }break;
    case'mssql':
    case 'mysql': {
            if ($dependencia_busq != '99999') {
                $condicionE = " AND h.DEPE_CODI_DEST='$dependencia_busq' AND b.DEPE_CODI='$dependencia_busq' ";
            }
            $queryE = "SELECT MIN(b.USUA_NOMB) USUARIO
                  , count(r.RADI_NUME_RADI) RADICADOS
                  , MIN(b.USUA_CODI) HID_COD_USUARIO
                  , MIN(b.depe_codi) HID_DEPE_USUA
            FROM RADICADO r, USUARIO b, HIST_EVENTOS h, SGD_TPR_TPDCUMENTO t
            WHERE 
              h.HIST_DOC_DEST=b.usua_doc
              AND r.tdoc_codi=t.sgd_tpr_codigo 
              $condicionE
              AND h.RADI_NUME_RADI=r.RADI_NUME_RADI
              AND h.SGD_TTR_CODIGO in(2,9,12,16)
              AND " . $db->conn->SQLDate('Y/m/d', 'r.radi_fech_radi') . " BETWEEN '$fecha_ini' AND '$fecha_fin'
        $whereTipoRadicado  ";

            if ($codEsp)
                $queryE .= " AND r.EESP_CODI = $codEsp ";
            $queryE .= " GROUP BY b.USUA_LOGIN  ORDER BY $orno $ascdesc ";
            /** CONSULTA PARA VER DETALLES   */
            //by skina

            $dias_rad = "DATENAME(dw," . $db->conn->sysTimeStamp . " -r.radi_fech_radi)";
            $queryEDetalle = "SELECT 
                      r.RADI_NUME_RADI RADICADO
                      , b.USUA_NOMB USUARIO_ACTUAL
                      , r.RA_ASUN ASUNTO 
                      , " . $db->conn->SQLDate('Y/m/d H:i:s', 'r.RADI_FECH_RADI') . " FECHA_RADICACION
                      , " . $db->conn->SQLDate('Y/m/d H:i:s', 'h1.HIST_FECH') . " FECHA_DIGITALIZACION
                      , r.RADI_PATH HID_RADI_PATH{$seguridad}
                      , an.RADI_NUME_SALIDA
                      , an.ANEX_RADI_FECH 
                      , an.ANEX_FECH_ENVIO
                      , t.SGD_TPR_TERMINO
                      , t.SGD_TPR_DESCRIP
                      , an.anex_radi_fech-r.RADI_FECH_RADI DIAS_TRAMITE
                      , an.anex_fech_envio-r.RADI_FECH_RADI DIAS_TRAMITE_ENVIO
                      , $dias_rad DIAS_RAD
                      , (Select bod.nombre_de_la_empresa from BODEGA_EMPRESAS bod where bod.identificador_empresa=r.eesp_codi) Entidad
                      , (Select bod1.nit_de_la_empresa from BODEGA_EMPRESAS bod1 where bod1.identificador_empresa=r.eesp_codi) NITENTIDAD
                FROM USUARIO b, HIST_EVENTOS h, SGD_TPR_TPDCUMENTO t
                      , RADICADO r left outer join anexos an 
                      ON (R.RADI_NUME_RADI=an.ANEX_RADI_NUME ANd an.anex_estado>=3) 
                       left join HIST_EVENTOS h1 on r.RADI_NUME_RADI=h1.RADI_NUME_RADI and h1.SGD_TTR_CODIGO IN (22,42)
                WHERE 
                      r.tdoc_codi=t.sgd_tpr_codigo 
                      AND h.HIST_DOC_DEST=b.usua_doc
                      $condicionE
                      AND h.RADI_NUME_RADI=r.RADI_NUME_RADI
                      AND h.SGD_TTR_CODIGO in(2,9,12,16)
                      AND " . $db->conn->SQLDate('Y/m/d', 'r.radi_fech_radi') . " BETWEEN '$fecha_ini' AND '$fecha_fin'
                $whereTipoRadicado ";

            if ($codEsp)
                $queryEDetalle .= " AND r.EESP_CODI = $codEsp ";
            $condicionUS = " AND b.depe_codi = '$depeUs' ";
            $orderE = " ORDER BY $orno $ascdesc";
            /** CONSULTA PARA VER TODOS LOS DETALLES 
             */
            $queryETodosDetalle = $queryEDetalle . $orderE;
            $queryEDetalle .= $condicionUS . $orderE;
        }break;
}
if (isset($_GET['genDetalle']) && $_GET['denDetalle'] = 1)
    $titulos = array("#", "1#RADICADO", "2#USUARIO DIGITALIZADOR", "3#ASUNTO", "4#FECHA RADICACI&Oacute;N", "5#FECHA DIGITALIZACI&Oacute;N", "6#RADICADO_SALIDA", "8#FECHA ENV&Iacute;O", "9#TIPO DOCUMENTO", "10#TERMINO", "11#DIAS DE RESPUESTA", "12#DIAS A ENVIO");
else
    $titulos = array("#", "1#Usuario", "2#Radicados");

//    $titulos = array("#", "1#Usuario", "2#Radicados", "3#HOJAS DIGITALIZADAS");

function pintarEstadistica($fila, $indice, $numColumna) {
    global $ruta_raiz, $_POST, $_GET, $krd;

    if (isset($fila['USUARIO'])) {
        $usuario = $fila['USUARIO'];
        $radicados = $fila['RADICADOS'];
        $hidCodUs = $fila['HID_COD_USUARIO'];
        $hidDepUsua = $fila['HID_DEPE_USUA'];
    } else {
        $usuario = $fila[0];
        $radicados = $fila[1];
        $hidCodUs = $fila[2];
        $hidDepUsua = $fila[3];
    }

    $salida = "";
    switch ($numColumna) {
        case 0:
            $salida = $indice;
            break;
        case 1:
            $salida = $usuario;
            break;
        case 2:
            $datosEnvioDetalle = "tipoEstadistica=" . $_POST['tipoEstadistica'] . "&amp;genDetalle=1&amp;usua_doc=" . urlencode($fila['HID_USUA_DOC']) . "&amp;dependencia_busq=" . $_POST['dependencia_busq'] . "&amp;fecha_ini=" . $_POST['fecha_ini'] . "&amp;fecha_fin=" . $_POST['fecha_fin'] . "&amp;tipoRadicado=" . $_POST['tipoRadicado'] . "&amp;tipoDocumento=" . $_POST['tipoDocumento'] . "&amp;codUs=" . $hidCodUs . "&amp;depeUs=" . $hidDepUsua;
            $datosEnvioDetalle = (isset($_POST['usActivos'])) ? $datosEnvioDetalle . "&codExp=$codExp&amp;usActivos=" . $_POST['usActivos'] : $datosEnvioDetalle;
            $salida = "<a href=\"genEstadistica.php?{$datosEnvioDetalle}&codEsp=" . $_POST["codEsp"] . "&amp;krd={$krd}\"  target=\"detallesSec\" >" . $radicados . "</a>";
            break;
//        case 3:
//            $salida = $fila['HOJAS_DIGITALIZADAS'];
//            break;
        default: $salida = false;
    }
    return $salida;
}

//$db->conn->debug = true;
function pintarEstadisticaDetalle($fila, $indice, $numColumna) {
    global $ruta_raiz, $encabezado, $krd;

    if (isset($fila['RADICADO'])) {
        $numRadicado = $fila['RADICADO'];
        $usuaActual = $fila['USUARIO_ACTUAL'];
        $asnto = $fila['ASUNTO'];
        $fechRadica = $fila['FECHA_RADICACION'];
        $fechDigita = $fila['FECHA_DIGITALIZACION'];
        $radiNumSal = $fila['RADI_NUME_SALIDA'];
        $anxRadiFech = $fila['ANEX_RADI_FECH'];
        $anxFechEnvi = $fila['ANEX_FECH_ENVIO'];
        $sgdTprTerm = $fila['SGD_TPR_TERMINO'];
        $sgdTprDesc = $fila['SGD_TPR_DESCRIP'];
        $diasTerm = $fila['DIAS_TRAMITE'];
        $diasTraENvi = $fila['DIAS_TRAMITE_ENVIO'];
        $diasRad = $fila['DIAS_RAD'];
        $entidad = $fila['Entidad'];
        $nitEntidad = $fila['NITENTIDAD'];
    } else {
        $numRadicado = $fila[0];
        $usuaActual = $fila[1];
        $asnto = $fila[2];
        $fechRadica = $fila[3];
        $fechDigita = $fila[4];
        $radiPath = $fila[5];
        $radiNumSal = $fila[6];
        $anxRadiFech = $fila[7];
        $anxFechEnvi = $fila[8];
        $sgdTprTerm = $fila[9];
        $sgdTprDesc = $fila[10];
        $diasTerm = $fila[11];
        $diasTraENvi = $fila[12];
        $diasRad = $fila[13];
        $entidad = $fila[14];
        $nitEntidad = $fila[15];
    }

    $verImg = ($fila['SGD_SPUB_CODIGO'] == 1) ? ($usuaActual != $_SESSION['usua_nomb'] ? false : true) : ($fila['USUA_NIVEL'] > $_SESSION['nivelus'] ? false : true);
//    $numRadicado = $fila['RADICADO'];
    switch ($numColumna) {
        case 0:
            $salida = $indice;
            break;
        case 1:
            if ($radiPath && $verImg)
            //$salida="<center><a href=\"{$ruta_raiz}bodega".$fila['HID_RADI_PATH']."\">".$fila['RADICADO']."</a>aaaa".$fila['HID_RADI_PATH']."vvvv</center>";
                $salida = "<center><a href=\"{$ruta_raiz}bodega" . $radiPath . "\">" . $numRadicado . "</a></center>";
            else
                $salida = "<center class=\"leidos\">{$numRadicado}</center>";
            break;
        case 2:
            $salida = "<center class=\"leidos\">" .$usuaActual . "</center>";
            break;
        case 3:
            $salida = "<center class=\"leidos\">" . $asnto . "</center>";
            break;
        case 4:
            if ($verImg)
                $salida = "<a class=\"vinculos\" href=\"{$ruta_raiz}verradicado.php?verrad=" . $numRadicado . "&amp;" . session_name() . "=" . session_id() . "&amp;krd=" . $_GET['krd'] . "&amp;carpeta=8&amp;nomcarpeta=Busquedas&amp;tipo_carp=0 \" >" . $fechRadica . "</a>";
            else
                $salida = "<a class=\"vinculos\" href=\"#\" onclick=\"alert(\"ud no tiene permisos para ver el radicado\");\">" . $fechRadica . "</a>";
            break;
        case 5:
            $salida = "<center class=\"leidos\">" . $fechDigita. "</center>";
            break;
        case 6:
            $salida = "<center class=\"leidos\">" . $radiNumSal . "</center>";
            break;
//        case 7:
//            $salida = "<center class=\"leidos\">" . $anxRadiFech. "</center>";
//            break;
        case 8:
            $salida = "<center class=\"leidos\">" .$anxFechEnvi . "</center>";
            break;
        case 9:
            $salida = "<center class=\"leidos\">" . $sgdTprDesc . "</center>";
            break;
        case 10:
            $salida = "<center class=\"leidos\">" . $sgdTprTerm . "</center>";
            break;
        case 11:
            $salida = "<center class=\"leidos\">" . $diasTerm . "</center>";
            break;
        case 12:
            $salida = "<center class=\"leidos\">" . $diasTraENvi . "</center>";
            break;
    }
    return $salida;
}

//echo $queryEDetalle;
?>
