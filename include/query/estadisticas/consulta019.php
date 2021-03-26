<?php

/** Estadistica de permisos por rol
 * 
 * @autor Jenny Gamez
 * @version ORFEO 5.5
 * 
 */
$coltp3Esp = '"' . $tip3Nombre[3][2] . '"';
if (!$orno)
    $orno = 2;

// Toma como criterio de busqueda la clasifiación
if ($s_clasificacion != '' && $dependencia_busq == '99999' && $tipoDocumento == '9999') {
    $fideicomiso = explode('-', $s_clasificacion);
    $sWhere = " and ra.cod_clasificacion =" . $fideicomiso[0];
}
// Toma como criterio de busqueda la clasifiación y dependencia que lo crea
elseif ($s_clasificacion != '' && $dependencia_busq != '99999' && $tipoDocumento == '9999') {
    $fideicomiso = explode('-', $s_clasificacion);
    $sWhere = " and ra.cod_clasificacion =" . $fideicomiso[0]. " and an.anex_depe_creador ='" . $dependencia_busq."'";
}
// Toma como criterio de busqueda la clasifiación y el tipo documental
elseif ($s_clasificacion != '' && $dependencia_busq == '99999' && $tipoDocumento != '9999') {
    $fideicomiso = explode('-', $s_clasificacion);
    $sWhere = " and ra.cod_clasificacion =" . $fideicomiso[0]. " and an.sgd_tpr_codigo =$tipoDocumento";
}
// Toma como criterio de busqueda la clasifiación, dependencia que lo crea y el tipo documental
elseif ($s_clasificacion != '' && $dependencia_busq != '99999' && $tipoDocumento != '9999') {
    $fideicomiso = explode('-', $s_clasificacion);
    $sWhere = " and ra.cod_clasificacion =" . $fideicomiso[0]. " and an.anex_depe_creador ='" . $dependencia_busq."' and an.sgd_tpr_codigo =$tipoDocumento";
}
// Toma como criterio de busqueda el tipo documental
elseif ($s_clasificacion == '' && $dependencia_busq == '99999' && $tipoDocumento != '9999') {
    $sWhere = " and an.sgd_tpr_codigo =$tipoDocumento";
}
// Toma como criterio de busqueda la  dependencia que lo crea 
elseif ($s_clasificacion == '' && $dependencia_busq != '99999' && $tipoDocumento == '9999') {
    $sWhere = " and an.anex_depe_creador ='" . $dependencia_busq."'";
}
else{
    $sWhere = " ";
}

switch ($db->driver) {
    case 'mssql': {
            $queryE = 'select an.anex_radi_nume as "Numero Radicado"'
                        . ', an.anex_codigo as "Codigo Anexo"'
                        . ', an.anex_nomb_archivo as "Nombre Anexo"'
                        . ', an.anex_desc as "Asunto Anexo"'
                        . ', an.anex_creador as "Usuario Cargo Anexo"'
                        . ', de.depe_nomb as "Dependencia Cargo Anexo"'
                        . ', an.anex_fech_anex as "Fecha Anexo"'
                        . ', tpr.sgd_tpr_descrip as "Tipo Documental"'
                        . ', cl.nom_claserie as "Clasificacion" '
                    . 'from anexos as an'
                        . ', radicado as ra'
                        . ', dependencia as de'
                        . ', usuario as us'
                        . ', sgd_tpr_tpdcumento as tpr'
                        . ', cla_serie as cl '
                    . 'where ra.radi_nume_radi=an.anex_radi_nume '
                        . 'and an.anex_depe_creador=de.depe_codi '
                        . 'and ra.radi_depe_actu=de.depe_codi '
                        . 'and ra.radi_usua_actu=us.usua_codi '
                        . 'and ra.radi_depe_actu=us.depe_codi '
                        . 'and an.sgd_tpr_codigo=tpr.sgd_tpr_codigo '
                        . 'and ra.cod_clasificacion=cl.consecutivo';
            $queryE .= " and " .$db->conn->SQLDate('Y/m/d', 'an.anex_fech_anex') . " BETWEEN '$fecha_ini' AND '$fecha_fin' ". $sWhere;
        }break;
}

$titulos = array("#", "1#N&uacute;mero Radicado", "2#C&oacute;digo Anexo", "3#Nombre Anexo", "4#Asunto Anexo", "5#Usuario Cargo Anexo", "6#Dependencia Cargo Anexo", "7#Fecha Anexo", "8#Tipo Documental","9#Clasificaci&oacute;n");

function pintarEstadisticaDetalle($fila, $indice, $numColumna) {
    global $ruta_raiz, $encabezado, $krd;
    switch ($numColumna) {
        case 0:
            $salida = $indice;
            break;
        case 1:
            $salida = $fila[0];
            break;
        case 2:
            $salida = $fila[1];
            break;
        case 3:
            $salida = $fila[2];
            break;
        case 4:
            $salida = $fila[3];
            break;
        case 5:
            $salida = $fila[4];
            break;
        case 6:
            $salida = $fila[5];
            break;
        case 7:
            $salida = $fila[6];
            break;
        case 8:
            $salida = $fila[7];
            break;
        case 9:
            $salida = $fila[8];
            break;
    }
    return $salida;
}

?>
