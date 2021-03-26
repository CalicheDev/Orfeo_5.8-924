<?php

// By Skinatech - 14/08/2018
// Para la construcción del número de radicado, esto indica la parte inicial del radicado.
if ($estructuraRad == 'ymd') {
    $num = 8;
} elseif ($estructuraRad == 'ym') {
    $num = 6;
} else {
    $num = 4;
}

if ($assoc == 0) {
    $radi_nume_iden = $rs->fields["radi_nume_iden"];
    $radi_fech_radi = $rs->fields["radi_fech_radi"];
    $mrec_codi = $rs->fields["mrec_codi"];
    $ra_asun = stripslashes($rs->fields["ra_asun"]);
    $radi_desc_anex = stripslashes($rs->fields["radi_desc_anex"]);
    $radi_rem = $rs->fields["radi_rem"];
    $radi_nume_hoja = TRIM($rs->fields["radi_nume_hoja"]);
    $cuentai = $rs->fields["radi_cuentai"];
    $radi_usua_ante = $rs->fields["radi_usu_ante"];
    $radi_usua_actu = $rs->fields["radi_usua_actu"];
    $radi_depe_actu = $rs->fields["radi_depe_actu"];
    $radi_depe_radicacion = substr($verradicado, $num, $longitud_codigo_dependencia);
    $radi_depe_radi = $rs->fields["radi_depe_radi"];
    $radi_usua_radi = $rs->fields["radi_usua_radi"];
    $preRadica = $rs->fields["usua_perm_preradicado"];
    $tipoUsuarioGrupo = $rs->fields["tipo_usario_interes"];
} else {
    $radi_nume_iden = $rs->fields["RADI_NUME_IDEN"];
    $radi_fech_radi = $rs->fields["RADI_FECH_RADI"];
    $mrec_codi = $rs->fields["MREC_CODI"];
    $ra_asun = stripslashes($rs->fields["RA_ASUN"]);
    $radi_desc_anex = stripslashes($rs->fields["RADI_DESC_ANEX"]);
    $radi_rem = $rs->fields["RADI_REM"];
    $radi_nume_hoja = TRIM($rs->fields["RADI_NUME_HOJA"]);
    $cuentai = $rs->fields["RADI_CUENTAI"];
    $radi_usua_ante = $rs->fields["RADI_USU_ANTE"];
    $radi_usua_actu = $rs->fields["RADI_USUA_ACTU"];
    $radi_depe_actu = $rs->fields["RADI_DEPE_ACTU"];
    $radi_depe_radicacion = substr($verradicado, $num, $longitud_codigo_dependencia);
    $radi_depe_radi = $rs->fields["RADI_DEPE_RADI"];
    $radi_usua_radi = $rs->fields["RADI_USUA_RADI"];
    $preRadica = $rs->fields["USUA_PERM_PRERADICADO"];
    $tipoUsuarioGrupo = $rs->fields["TIPO_USARIO_INTERES"];
}
?>