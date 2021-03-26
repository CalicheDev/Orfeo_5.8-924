<?php

/* * ********************************************************************************** */
/* ORFEO GPL:Sistema de Gestion Documental		http://www.orfeogpl.org	     */
/* 	Idea Original de la SUPERINTENDENCIA DE SERVICIOS PUBLICOS DOMICILIARIOS     */
/* 				COLOMBIA TEL. (57) (1) 6913005  orfeogpl@gmail.com   */
/* ===========================                                                       */
/*                                                                                   */
/* Este programa es software libre. usted puede redistribuirlo y/o modificarlo       */
/* bajo los terminos de la licencia GNU General Public publicada por                 */
/* la "Free Software Foundation"; Licencia version 2. 			             */
/*                                                                                   */
/* Copyright (c) 2005 por :	  	  	                                     */
/* SSPD "Superintendencia de Servicios Publicos Domiciliarios"                       */
/*   Jairo Hernan Losada  jlosada@gmail.com                Desarrollador             */
/*   Sixto Angel Pinzón López --- angel.pinzon@gmail.com   Desarrollador             */
/* C.R.A.  "COMISION DE REGULACION DE AGUAS Y SANEAMIENTO AMBIENTAL"                 */
/*   Liliana Gomez        lgomezv@gmail.com                Desarrolladora            */
/*   Lucia Ojeda          lojedaster@gmail.com             Desarrolladora            */
/* D.N.P. "Departamento Nacional de Planeación"                                      */
/*   Hollman Ladino       hladino@gmail.com                Desarrollador             */
/*                                                                                   */
/* Colocar desde esta lInea las Modificaciones Realizadas Luego de la Version 3.5    */
/*  Nombre Desarrollador   Correo     Fecha   Modificacion                           */
/* * ********************************************************************************** */

/** CONSULTA 011
 * Estadiscas de Numero de Radicados digitalizados y Hojas Digitalizadas.
 * @autor JAIRO H LOSADA - SSPD
 * @version ORFEO 3.1
 * 
 */
$coltp3Esp = '"' . $tip3Nombre[3][2] . '"';
if (!$orno)
    $orno = 2;
/**
 * $db-driver Variable que trae el driver seleccionado en la conexion
 * @var string
 * @access public
 */
/**
 * $fecha_ini Variable que trae la fecha de Inicio Seleccionada  viene en formato Y-m-d
 * @var string
 * @access public
 */
/**
 * $fecha_fin Variable que trae la fecha de Fin Seleccionada
 * @var string
 * @access public
 */
/**
 * $mrecCodi Variable que trae el medio de recepcion por el cual va a sacar el detalle de la Consulta.
 * @var string
 * @access public
 */
switch ($db->driver) {
    case 'mssql':
//        $fecha_ini = str_replace("/", "", $fecha_ini);
//        $fecha_fin = str_replace("/", "", $fecha_fin);
        $rangoFechas = $db->conn->SQLDate('Y/m/d', 'r.RADI_FECH_RADI') . " BETWEEN '$fecha_ini' AND '$fecha_fin'";
        $radiNumeRadi = "r.RADI_NUME_RADI";
        $whereDependencia = ($dependencia_busq != '99999') ? "AND h.DEPE_CODI = '" . $dependencia_busq . "'" : '';
        $whereUsua = ($codus != 0) ? "AND b.USUA_CODI = " . $codus : '';
        $whereTipoRadicado = ($tipoRadicado != '') ? "AND r.RADI_NUME_RADI LIKE '%" . $tipoRadicado . "'" : '';
        $whereTipoRadicado .= ($tipoDocumento &&
                ($tipoDocumento != '9999' and $tipoDocumento != '9998')) ? "AND s.SGD_TPR_CODIGO = $tipoDocumento " : '';

        $queryE = "SELECT b.USUA_NOMB AS NOMBRE, 
                        COUNT(r.RADI_NUME_RADI) AS TOTAL_MODIFICADOS,
                        b.USUA_DOC AS HID_COD_USUARIO,
                        r.radi_fech_radi AS RADI_FECH
                  FROM USUARIO b, RADICADO r, HIST_EVENTOS h, DEPENDENCIA d, SGD_TPR_TPDCUMENTO s
                  WHERE b.USUA_DOC = h.USUA_DOC
                        AND h.SGD_TTR_CODIGO = 32
                        AND h.HIST_OBSE LIKE '*Modificado TRD*%'
                        AND h.DEPE_CODI = d.DEPE_CODI
                        AND s.SGD_TPR_CODIGO = r.TDOC_CODI 
                        AND r.RADI_NUME_RADI = h.RADI_NUME_RADI
                        $whereDependencia
                        $whereUsua
                        $whereTipoRadicado
                        AND $rangoFechas
                  GROUP BY b.USUA_NOMB,b.USUA_DOC, r.radi_fech_radi";

        /** CONSULTA PARA VER DETALLES */
        $whereDependencia = (isset($dependencia_busq) && ($dependencia_busq != '99999')) ?
                'AND h.DEPE_CODI =\'' . $dependencia_busq . "'" : '';
        $whereUsua = ($codUs != 0) ? "AND b.USUA_DOC = '" . $codUs . "'" : '';
        $whereTipoRadicado = ($tipoDocumento &&
                ($tipoDocumento != '9999' and $tipoDocumento != '9998')) ? "AND r.TDOC_CODI = s.SGD_TPR_CODIGO (+) AND s.SGD_TPR_CODIGO = $tipoDocumento " : '';

        $queryEDetalle = "SELECT $radiNumeRadi RADICADO, 
                    r.RADI_FECH_RADI AS FECHA_RADICACION,
                    s.SGD_TPR_DESCRIP AS TIPO_DOCUMENTO, 
                    h.HIST_FECH AS FECHA_HISTORICO, 
                    h.HIST_OBSE AS OBSERVACION,
                    b.USUA_NOMB AS USUARIO, 
                    d.DEPE_NOMB AS DEPENDENCIA,
                    r.radi_path AS HID_RADI_PATH{$seguridad}
		FROM RADICADO r, HIST_EVENTOS h, DEPENDENCIA d, USUARIO b, 
                    SGD_TPR_TPDCUMENTO s
		WHERE 
                    r.RADI_NUME_RADI = h.RADI_NUME_RADI
                    AND h.SGD_TTR_CODIGO = 32
                    $whereDependencia
                    $whereUsua
                    $whereTipoRadicado
                    AND h.USUA_DOC = b.USUA_DOC
                    AND h.HIST_OBSE LIKE '*Modificado TRD*%'
                    AND h.DEPE_CODI = d.DEPE_CODI
                    AND $rangoFechas
                    AND s.SGD_TPR_CODIGO = r.TDOC_CODI";

        $queryETodosDetalle = $queryEDetalle;
        break;

    case 'postgres':
        global $orderby;
        $whereDependencia = ($dependencia_busq != '99999') ? "AND h.DEPE_CODI = '" . $dependencia_busq . "'" : '';
        $whereUsua = ($codus != 0) ? "AND b.USUA_CODI = " . $codus : '';
        $whereTipoRadicado = ($tipoRadicado != '') ? "AND r.RADI_NUME_RADI LIKE '%" . $tipoRadicado . "'" : '';
        $whereTipoRadicado .= ($tipoDocumento &&
                ($tipoDocumento != '9999' and $tipoDocumento != '9998')) ? "AND s.SGD_TPR_CODIGO = $tipoDocumento " : '';

        $queryE = "SELECT b.USUA_NOMB 			AS NOMBRE
                        , COUNT(r.RADI_NUME_RADI) 	AS TOTAL_MODIFICADOS
                        ,b.USUA_DOC 			AS HID_COD_USUARIO
                  FROM USUARIO b, RADICADO r
                        LEFT OUTER JOIN  SGD_TPR_TPDCUMENTO s ON s.SGD_TPR_CODIGO = r.TDOC_CODI,
                        HIST_EVENTOS h, DEPENDENCIA d
                  WHERE b.USUA_DOC = h.USUA_DOC
                    AND h.SGD_TTR_CODIGO = 32
                    AND h.HIST_OBSE LIKE '*Modificado TRD*%'
                    AND h.DEPE_CODI = d.DEPE_CODI
                    AND r.RADI_NUME_RADI = h.RADI_NUME_RADI
                    $whereDependencia
                        $whereUsua
                        $whereTipoRadicado
                        AND " . $db->conn->SQLDate('Y/m/d', 'h.HIST_FECH') . " BETWEEN '$fecha_ini'  AND '$fecha_fin'
                  GROUP BY b.USUA_NOMB,b.USUA_DOC";
        //Modificado skina 	 $orderby";

        /** CONSULTA PARA VER DETALLES */
        $whereDependencia = (isset($dependencia_busq) && ($dependencia_busq != '99999')) ?
                'AND h.DEPE_CODI =\'' . $dependencia_busq . "'" : '';
        $whereUsua = ($codUs != 0) ? "AND b.USUA_DOC = '" . $codUs . "'" : '';
        $whereTipoRadicado = ($tipoDocumento &&
                ($tipoDocumento != '9999' and $tipoDocumento != '9998')) ? "AND s.SGD_TPR_CODIGO = $tipoDocumento " : '';
        $queryEDetalle = "SELECT r.RADI_NUME_RADI  AS RADICADO
                            , r.RADI_FECH_RADI 	   AS FECHA_RADICACION
                            , s.SGD_TPR_DESCRIP    AS TIPO_DOCUMENTO
                            , h.HIST_FECH 	   AS FECHA_HISTORICO
                            , h.HIST_OBSE 	   AS OBSERVACION
                            , b.USUA_NOMB 	   AS USUARIO
                            , d.DEPE_NOMB 	   AS DEPENDENCIA
                            , r.radi_path 	   AS HID_RADI_PATH{$seguridad}
                        FROM RADICADO r
                        LEFT OUTER JOIN  SGD_TPR_TPDCUMENTO s ON s.SGD_TPR_CODIGO = r.TDOC_CODI, HIST_EVENTOS h, DEPENDENCIA d, USUARIO b
                        WHERE 
                        r.RADI_NUME_RADI = h.RADI_NUME_RADI
                        AND h.SGD_TTR_CODIGO = 32
                        $whereDependencia
                        $whereUsua
                        $whereTipoRadicado
                        AND h.USUA_DOC = b.USUA_DOC
                        AND h.HIST_OBSE LIKE '*Modificado TRD*%'
                        AND h.DEPE_CODI = d.DEPE_CODI
                        AND " . $db->conn->SQLDate('Y/m/d', 'h.HIST_FECH') . " BETWEEN '$fecha_ini'  AND '$fecha_fin'
                        AND s.SGD_TPR_CODIGO = r.TDOC_CODI";
        $queryETodosDetalle = $queryEDetalle;
        break;
    case 'mysql':
        global $orderby;
        $whereDependencia = ($dependencia_busq != '99999') ? "AND h.DEPE_CODI = '" . $dependencia_busq . "'" : '';
        $whereUsua = ($codus != 0) ? "AND b.USUA_CODI = " . $codus : '';
        $whereTipoRadicado = ($tipoRadicado != '') ? "AND r.RADI_NUME_RADI LIKE '%" . $tipoRadicado . "'" : '';
        $whereTipoRadicado .= ($tipoDocumento &&
                ($tipoDocumento != '9999' and $tipoDocumento != '9998')) ? "AND s.SGD_TPR_CODIGO = $tipoDocumento " : '';

        $queryE = "SELECT b.USUA_NOMB 			AS NOMBRE
                        , COUNT(r.RADI_NUME_RADI) 	AS TOTAL_MODIFICADOS
                        ,b.USUA_DOC 			AS HID_COD_USUARIO
                  FROM USUARIO b, RADICADO r
                        LEFT OUTER JOIN  SGD_TPR_TPDCUMENTO s ON s.SGD_TPR_CODIGO = r.TDOC_CODI,
                        HIST_EVENTOS h, DEPENDENCIA d
                  WHERE b.USUA_DOC = h.USUA_DOC
                    AND h.SGD_TTR_CODIGO = 32
                    AND h.HIST_OBSE LIKE '*Modificado TRD*%'
                    AND h.DEPE_CODI = d.DEPE_CODI
                    AND r.RADI_NUME_RADI = h.RADI_NUME_RADI
                    $whereDependencia
                        $whereUsua
                        $whereTipoRadicado
                        AND " . $db->conn->SQLDate('Y/m/d', 'h.HIST_FECH') . " BETWEEN '$fecha_ini'  AND '$fecha_fin'
                  GROUP BY b.USUA_NOMB,b.USUA_DOC";
        //Modificado skina 	 $orderby";

        /** CONSULTA PARA VER DETALLES */
        $whereDependencia = (isset($dependencia_busq) && ($dependencia_busq != '99999')) ?
                'AND h.DEPE_CODI =\'' . $dependencia_busq . "'" : '';
        $whereUsua = ($codUs != 0) ? "AND b.USUA_DOC = '" . $codUs . "'" : '';
        $whereTipoRadicado = ($tipoDocumento &&
                ($tipoDocumento != '9999' and $tipoDocumento != '9998')) ? "AND s.SGD_TPR_CODIGO = $tipoDocumento " : '';
        $queryEDetalle = "SELECT r.RADI_NUME_RADI  AS RADICADO
                            , r.RADI_FECH_RADI 	   AS FECHA_RADICACION
                            , s.SGD_TPR_DESCRIP    AS TIPO_DOCUMENTO
                            , h.HIST_FECH 	   AS FECHA_HISTORICO
                            , h.HIST_OBSE 	   AS OBSERVACION
                            , b.USUA_NOMB 	   AS USUARIO
                            , d.DEPE_NOMB 	   AS DEPENDENCIA
                            , r.radi_path 	   AS HID_RADI_PATH{$seguridad}
                        FROM RADICADO r
                        LEFT OUTER JOIN  SGD_TPR_TPDCUMENTO s ON s.SGD_TPR_CODIGO = r.TDOC_CODI, HIST_EVENTOS h, DEPENDENCIA d, USUARIO b
                        WHERE 
                        r.RADI_NUME_RADI = h.RADI_NUME_RADI
                        AND h.SGD_TTR_CODIGO = 32
                        $whereDependencia
                        $whereUsua
                        $whereTipoRadicado
                        AND h.USUA_DOC = b.USUA_DOC
                        AND h.HIST_OBSE LIKE '*Modificado TRD*%'
                        AND h.DEPE_CODI = d.DEPE_CODI
                        AND " . $db->conn->SQLDate('Y/m/d', 'h.HIST_FECH') . " BETWEEN '$fecha_ini'  AND '$fecha_fin'
                        AND s.SGD_TPR_CODIGO = r.TDOC_CODI";
        $queryETodosDetalle = $queryEDetalle;
        break;
    //modificado skina query postgres
    case 'postgres':
        global $orderby;
        $whereDependencia = ($dependencia_busq != '99999') ? "AND h.DEPE_CODI = '" . $dependencia_busq . "'" : '';
        $whereUsua = ($codus != 0) ? "AND b.USUA_CODI = " . $codus : '';
        $whereTipoRadicado = ($tipoRadicado != '') ? "AND r.RADI_NUME_RADI LIKE '%" . $tipoRadicado . "'" : '';
        $whereTipoRadicado .= ($tipoDocumento &&
                ($tipoDocumento != '9999' and $tipoDocumento != '9998')) ? "AND s.SGD_TPR_CODIGO = $tipoDocumento " : '';

        $queryE = "SELECT b.USUA_NOMB 			AS NOMBRE
					, COUNT(r.RADI_NUME_RADI) 	AS TOTAL_MODIFICADOS
					,b.USUA_DOC 			AS HID_COD_USUARIO
				  FROM USUARIO b, RADICADO r
					LEFT OUTER JOIN  SGD_TPR_TPDCUMENTO s ON s.SGD_TPR_CODIGO = r.TDOC_CODI,
					HIST_EVENTOS h, DEPENDENCIA d
				  WHERE b.USUA_DOC = h.USUA_DOC
				    AND h.SGD_TTR_CODIGO = 32
				    AND h.HIST_OBSE LIKE '*Modificado TRD*%'
				    AND h.DEPE_CODI = d.DEPE_CODI
				    AND r.RADI_NUME_RADI = h.RADI_NUME_RADI
				    $whereDependencia
					$whereUsua
					$whereTipoRadicado
					AND " . $db->conn->SQLDate('Y/m/d', 'h.HIST_FECH') . " BETWEEN '$fecha_ini'  AND '$fecha_fin'
				  GROUP BY b.USUA_NOMB,b.USUA_DOC";
        //Modificado skina 	 $orderby";

        /** CONSULTA PARA VER DETALLES 
         */
        $whereDependencia = (isset($dependencia_busq) && ($dependencia_busq != '99999')) ?
                'AND h.DEPE_CODI =\'' . $dependencia_busq . "'" : '';
        $whereUsua = ($codUs != 0) ? "AND b.USUA_DOC = '" . $codUs . "'" : '';
        $whereTipoRadicado = ($tipoDocumento &&
                ($tipoDocumento != '9999' and $tipoDocumento != '9998')) ? "AND s.SGD_TPR_CODIGO = $tipoDocumento " : '';
        $queryEDetalle = "SELECT r.RADI_NUME_RADI 		AS RADICADO
						, r.RADI_FECH_RADI 		AS FECHA_RADICACION
						, s.SGD_TPR_DESCRIP 		AS TIPO_DOCUMENTO
						, h.HIST_FECH 			AS FECHA_HISTORICO
						, h.HIST_OBSE 			AS OBSERVACION
		 				, b.USUA_NOMB 			AS USUARIO
						, d.DEPE_NOMB 			AS DEPENDENCIA
						, r.radi_path 			AS HID_RADI_PATH{$seguridad}
					FROM RADICADO r
					LEFT OUTER JOIN  SGD_TPR_TPDCUMENTO s ON s.SGD_TPR_CODIGO = r.TDOC_CODI, HIST_EVENTOS h, DEPENDENCIA d, USUARIO b
					WHERE 
					r.RADI_NUME_RADI = h.RADI_NUME_RADI
					AND h.SGD_TTR_CODIGO = 32
					$whereDependencia
					$whereUsua
					$whereTipoRadicado
					AND h.USUA_DOC = b.USUA_DOC
					AND h.HIST_OBSE LIKE '*Modificado TRD*%'
					AND h.DEPE_CODI = d.DEPE_CODI
					AND " . $db->conn->SQLDate('Y/m/d', 'h.HIST_FECH') . " BETWEEN '$fecha_ini'  AND '$fecha_fin'
					AND s.SGD_TPR_CODIGO = r.TDOC_CODI";

        $queryETodosDetalle = $queryEDetalle;
        break;

    case 'oracle':
    case 'oci8':
    case 'oci805':
    case 'ocipo':
        global $orderby;
        $whereDependencia = ($dependencia_busq != '99999') ? "AND h.DEPE_CODI = '" . $dependencia_busq . "'" : '';
        $whereUsua = ($codus != 0) ? "AND b.USUA_CODI = " . $codus : '';
        $whereTipoRadicado = ($tipoRadicado != '') ? "AND r.RADI_NUME_RADI LIKE '%" . $tipoRadicado . "'" : '';
        $whereTipoRadicado .= ($tipoDocumento &&
                ($tipoDocumento != '9999' and $tipoDocumento != '9998')) ? "AND s.SGD_TPR_CODIGO = $tipoDocumento " : '';

        $queryE = "SELECT b.USUA_NOMB NOMBRE, COUNT(r.RADI_NUME_RADI) TOTAL_MODIFICADOS
				  FROM USUARIO b, RADICADO r, HIST_EVENTOS h, DEPENDENCIA d, SGD_TPR_TPDCUMENTO s
				  WHERE b.USUA_DOC = h.USUA_DOC
				    AND h.SGD_TTR_CODIGO = 32
				    AND h.HIST_OBSE LIKE '*Modificado TRD*%'
				    AND h.DEPE_CODI = d.DEPE_CODI
				    AND s.SGD_TPR_CODIGO = r.TDOC_CODI (+)
				    AND r.RADI_NUME_RADI = h.RADI_NUME_RADI
				    $whereDependencia
					$whereUsua
					$whereTipoRadicado
					AND TO_CHAR(r.RADI_FECH_RADI,'yyyy/mm/dd') BETWEEN '$fecha_ini'  AND '$fecha_fin'
				  GROUP BY b.USUA_NOMB $orderby";

        /** CONSULTA PARA VER DETALLES 
         */
        /* $whereDependencia = (isset($depCodigo)) ? "AND h.DEPE_CODI = " . $depCodigo : '';
          $whereDependencia = (empty($depCodigo) && isset($HTTP_GET_VARS["genTodosDetalle"]) &&
          $tipoDocumento && ($tipoDocumento!='9999' && $tipoDocumento!='9998'))
          ? "AND h.DEPE_CODI = " . $dependencia_busq : ''; */

        $whereDependencia = (isset($dependencia_busq) && ($dependencia_busq != '99999')) ?
                'AND h.DEPE_CODI =\'' . $dependencia_busq . "'" : '';
        $whereUsua = ($codUs != 0) ? "AND b.USUA_DOC = '" . $codUs . "'" : '';
        $whereTipoRadicado = ($tipoDocumento &&
                ($tipoDocumento != '9999' and $tipoDocumento != '9998')) ? "AND r.TDOC_CODI = s.SGD_TPR_CODIGO (+) AND s.SGD_TPR_CODIGO = $tipoDocumento " : '';

        $queryEDetalle = "SELECT r.RADI_NUME_RADI RADICADO, r.RADI_FECH_RADI FECHA_RADICACION,
		s.SGD_TPR_DESCRIP TIPO_DOCUMENTO, 
		h.HIST_FECH FECHA_HISTORICO, h.HIST_OBSE OBSERVACION,
		 b.USUA_NOMB USUARIO, d.DEPE_NOMB DEPENDENCIA,r.radi_path HID_RADI_PATH{$seguridad}
		FROM RADICADO r, HIST_EVENTOS h, DEPENDENCIA d, USUARIO b, 
		SGD_TPR_TPDCUMENTO s
		WHERE 
			r.RADI_NUME_RADI = h.RADI_NUME_RADI
			AND h.SGD_TTR_CODIGO = 32
			$whereDependencia
			$whereUsua
			$whereTipoRadicado
			AND h.USUA_DOC = b.USUA_DOC
			AND h.HIST_OBSE LIKE '*Modificado TRD*%'
			AND h.DEPE_CODI = d.DEPE_CODI
			AND TO_CHAR(r.RADI_FECH_RADI,'yyyy/mm/dd') BETWEEN '$fecha_ini'  AND '$fecha_fin'
			AND s.SGD_TPR_CODIGO = r.TDOC_CODI";

        $queryETodosDetalle = $queryEDetalle;

        break;
}

if (isset($_GET['genDetalle']) && $_GET['denDetalle'] = 1)
    $titulos = array("#", "1#RADICADO", "2#FECHA DE RADICAI&Oacute;N", "3#TIPO DE DOCUMENTO", "4#FECHA H&Iacute;STORICO", "5#OBSERVACIONES", "6#USUARIO", "7#DEPENDENCIA");
else
    $titulos = array("#", "1#USUARIO", "2#TOTAL MODIFICADOS","3#FECHA RADICACI&Oacute;N");

function pintarEstadistica($fila, $indice, $numColumna) {
    global $ruta_raiz, $_POST, $_GET, $krd;
    
    if (isset($fila['NOMBRE'])) {
        $nombre = $fila['NOMBRE'];
        $totalModificacion = $fila['TOTAL_MODIFICADOS'];
        $codUsuario = $fila['HID_COD_USUARIO'];
        $radiFech = $fila['RADI_FECH'];
    } else {
        $nombre = $fila[0];
        $totalModificacion = $fila[1];
        $codUsuario = $fila[2];
        $radiFech = $fila[3];
    }
    
    $salida = "";
    switch ($numColumna) {
        case 0:
            $salida = $indice;
            break;
        case 1:
            $salida = $nombre;
            break;
        case 2:
            $datosEnvioDetalle = "tipoEstadistica=" . $_POST['tipoEstadistica'] . "&amp;genDetalle=1&amp;usua_doc=" . urlencode($codUsuario) . "&amp;dependencia_busq=" . $_POST['dependencia_busq'] . "&amp;fecha_ini=" . $_POST['fecha_ini'] . "&amp;fecha_fin=" . $_POST['fecha_fin'] . "&amp;tipoRadicado=" . $_POST['tipoRadicado'] . "&amp;tipoDocumento=" . $_POST['tipoDocumento'] . "&amp;codUs=" . $codUsuario . "&amp;depeUs=" . $fila['HID_DEPE_USUA'];
            $datosEnvioDetalle = (isset($_POST['usActivos'])) ? $datosEnvioDetalle . "&amp;usActivos=" . $_POST['usActivos'] : $datosEnvioDetalle;
            $salida = "<a href=\"genEstadistica.php?{$datosEnvioDetalle}&amp;krd={$krd}\" target=\"detallesSec\" >" . $totalModificacion . "</a>";
            break;
        case 3:
            $salida = $radiFech;
            break;
        default: $salida = false;
    }
    return $salida;
}

function pintarEstadisticaDetalle($fila, $indice, $numColumna) {
    global $ruta_raiz, $encabezado, $krd;
    
    if (isset($fila['RADICADO'])) {
        $radicado = $fila['RADICADO'];
        $fechaRadicacion = $fila['FECHA_RADICACION'];
        $tipoDoc = $fila['TIPO_DOCUMENTO'];
        $fechaHistorico = $fila['FECHA_HISTORICO'];
        $observaciones = $fila['OBSERVACION'];
        $usuario = $fila['USUARIO'];
        $dependencias = $fila['DEPENDENCIA'];
        $hidRadiPath = $fila['HID_RADI_PATH'];
        $Spub = $fila['SGD_SPUB_CODIGO'];
        $usuaNivel = $fila['USUA_NIVEL'];
    } else {
        $radicado = $fila[0];
        $fechaRadicacion = $fila[1];
        $tipoDoc = $fila[2];
        $fechaHistorico = $fila[3];
        $observaciones = $fila[4];
        $usuario = $fila[5];
        $dependencias = $fila[6];
        $hidRadiPath = $fila[7];
        $Spub = $fila[8];
        $usuaNivel = $fila[9];
    }
    
    $verImg = ($Spub == 1) ? ($usuario != $_SESSION['usua_nomb'] ? false : true) : ($usuaNivel > $_SESSION['nivelus'] ? false : true);
    $numRadicado = $radicado;
    switch ($numColumna) {
        case 0:
            $salida = $indice;
            break;
        case 1:
            if ($hidRadiPath && $verImg)
                $salida = "<center><a href=\"{$ruta_raiz}bodega" . $hidRadiPath . "\">" . $radicado . "</a></center>";
            else
                $salida = "<center class=\"leidos\">{$numRadicado}</center>";
            break;
        case 3:
            $salida = "<center class=\"leidos\">" . $tipoDoc. "</center>";
            break;
        case 4:
            $salida = "<center class=\"leidos\">" . $fechaHistorico . "</center>";
            break;
        case 5:
            $salida = "<center class=\"leidos\">" . $observaciones . "</center>";
            break;
        case 2:
            if ($verImg)
                $salida = "<a class=\"vinculos\" href=\"{$ruta_raiz}verradicado.php?verrad=" . $radicado . "&amp;" . session_name() . "=" . session_id() . "&amp;krd=" . $_GET['krd'] . "&amp;carpeta=8&amp;nomcarpeta=Busquedas&amp;tipo_carp=0 \" >" . $fechaRadicacion . "</a>";
            else
                $salida = "<a class=\"vinculos\" href=\"#\" onclick=\"alert(\"ud no tiene permisos para ver el radicado\");\">" . $fechaRadicacion . "</a>";
            break;
        case 6:
            $salida = "<center class=\"leidos\">" .$usuario . "</center>";
            break;
        case 7:
            $salida = "<center class=\"leidos\">" . $dependencias. "</center>";
            break;
    }
    return $salida;
}

?>
