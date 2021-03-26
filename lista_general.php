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


/* ---------------------------------------------------------+
  |                       MAIN                               |
  +--------------------------------------------------------- */


include_once "class_control/AplIntegrada.php";
$objApl = new AplIntegrada($db);
$lkGenerico = "&usuario=$krd&nsesion=" . trim(session_id()) . "&nro=$verradicado" . "$datos_envio";
?>
<script src="js/popcalendar.js"></script>
<script>
    function regresar()
    {	//window.history.go(0);
        window.location.reload();
    }
</script>
<table width="100%" border="0" cellpadding="0" cellspacing="5" >
    <tr> 
        <td class="titulos2" colspan="6" ><b>Informaci&oacute;n general </bl></td>
    </tr>
</table>

<table border=1 cellspace=2 cellpad=2 WIDTH=100% align="left" class="borde_tab" id=tb_general>
    <tr> 
        <td  height="25" class="listado1" >Fecha de radicado</td>
        <td  width="25%" height="25" class="listado2"><?= $radi_fech_radi ?></td>
        <td  width="25%" align="right" height="25"  class="listado1" >Referencia Radicado Cliente Externo</td>
        <td class='listado2' colspan="3" width="25%"><?= $radicadoReferenciaCliente ?></td>
    </tr>
    <tr> 
        <td  width="25%" align="right" height="25"  class="listado1" >Asunto</td>
        <td class='listado2' colspan="5" width="25%"><?= $ra_asun ?></td>
    </tr>
    <tr> 
        <?php
//        error_log('------------ '.$isql);
        if (isset($nombret_us1)) {
            ?>
            <td align="right"  height="25"  class="listado1"><?= $tip3Nombre[1][$ent] ?></td>
            <td class='listado2' width="25%" height="25"><?= $nombret_us1 ?></td>
            <td width="25%" align="right" height="25"  class="listado1" >Direcci&oacute;n de correspondencia</td>
            <td class='listado2' width="25%"><?= $direccion_us1 ?> / <?= $telefono_us1 ?> </td>
            <td width="25%" align="right" height="25"  class="listado1" >Mun/Dpto</td>
            <td class='listado2' width="25%"><?= $dpto_nombre_us1 . "/" . $muni_nombre_us1 ?></td>
            <?php
        } elseif (isset($nombret_us2)) {
            ?>
            <td align="right"   height="25"  class="listado1"><?= $tip3Nombre[2][$ent] ?></td>
            <td class='listado2' width="25%" height="25"> <?= $nombret_us2 ?></td>
            <td   width="25%" align="right" height="25"  class="listado1">Direcci&oacute;n de correspondencia </td>
            <td class='listado2' width="25%"> <?= $direccion_us2 ?></td>
            <td   width="25%" align="right" height="25"  class="listado1">Mun/Dptop</td>
            <td class='listado2' width="25%"> <?= $dpto_nombre_us2 . "/" . $muni_nombre_us2 ?></td>
            <?php
        } elseif (isset($nombret_us3)) {
            ?>
            <td align="right"   height="25"  class="listado1"><?= $tip3Nombre[3][$ent] ?></td>
            <td class='listado2' width="25%" height="25"> <?= $nombret_us3 ?></td>
            <td   width="25%" align="right" height="25"  class="listado1">Direcci&oacute;n de correspondencia</td>
            <td class='listado2' width="25%"> <?= $direccion_us3 ?></td>
            <td   width="25%" align="right" height="25"  class="listado1">Mun/Dpto</td>
            <td class='listado2' width="25%"> <?= $dpto_nombre_us3 . "/" . $muni_nombre_us3 ?></td>
            <?php
        }
        ?>
    </tr>
    <tr>
        <td height="25"   align="right"  class="listado1">N&ordm; de p&aacute;ginas</td>
        <td class='listado2' width="25%" height="25"> <?= $radi_nume_hoja ?></td>
        <td   width="25%" height="25" align="right"  class="listado1"> 'Descripci&oacute;n Anexos </td>
        <td class='listado2'  width="25%" height="11"> <?= $radi_desc_anex ?></td>
        <td   width="25%" align="right" height="25"  class="listado1"><?= $ent == 4 ? 'Tipo Usuario/Grupo Interes':'Dignatario' ?></td>
        <td class='listado2' width="25%"><?= $otro ?><?= $ent == 4 ? $tipoUsuarioGrupoNombre : $otro ?></td>
    </tr>
    <tr> 
        <td align="right"   height="25"  class="listado1">Documento<br>Anexo/Asociado</td>
        <td class='listado2' width="25%" height="25">
            <?php
            if ($radi_tipo_deri != 1 and $radi_nume_deri) { //echo $radi_nume_deri;
                //echo "<br>(<a class='vinculos' href='$ruta_raiz/verradicado.php?verrad=$radi_nume_deri &session_name()=session_id()&krd=$krd' target='VERRAD$radi_nume_deri_" . date("Ymdhi") . "'>Padre $radi_nume_deri</a>)";
            }
            if ($verradPermisos == "Full" or $datoVer == "985") {
                ?>
                <input type=button name=mostrar_anexo value='...' class=botones_2 onClick="verVinculoDocto();" aria-label="Botón para vincular documentos al radicado">
                <?php
            }
            ?>
        </td>
        <td   width="25%" align="right" height="25"  class="listado1">Identificaci&oacute;n/correo</td>
        <td class='listado2' width="25%"><?= $cc_documento_us1 ?> / <?= $mail_us1 ?></td>
        <td width="25%" height="25" align="right" class="listado1">Nivel de Seguridad</td>
        <td class='listado2' width="25%" height="11">
            <?php
            if ($nivelRad == 1) {
                echo "Confidencial";
            } else {
                echo "P&uacute;blico";
            }
            if ($verradPermisos == "Full" or $datoVer == "985") {
                $varEnvio = "krd=$krd&numRad=$verrad&nivelRad=$nivelRad";
                ?>
                <input type=button name=mostrar_causal value='...' class=botones_2 onClick="window.open('<?= $ruta_raiz ?>/seguridad/radicado.php?<?= $varEnvio ?>', 'Cambio Nivel de Seguridad Radicado', 'height=310, width=460,left=350,top=300')" aria-label="Botón para cambiar nivel de seguridad del radicado">
                <?php
            }
            ?>
        </td>
    </tr>
    <tr> 
        <td align="right" height="25"  class="listado1">Imagen</td>
        <td class='listado2' colspan="1">
            <?php
            if ($carpeta_rad == 3) {
                $sqlServerAnex = "select COUNT(anex_radi_nume) as numero from anexos where anex_radi_nume='".$verradicado."'";
                $db->conn->SetFetchMode(ADODB_FETCH_ASSOC);
                $rsAnex = $db->query($sqlServerAnex);
                if($rsAnex->fields["numero"] == 0){
                    echo "<span class='vinculos'>$imagenv</span>";
                }else{
                    echo "<span class='vinculos'>Ya cuenta con una actualizaci&oacute;n de tarjeta de firma</span>";
                }
            }else{
                echo "<span class='vinculos'>$imagenv</span>";
            }
            ?>
        </td>
        
        
        <td width="25%" height="25" align="right"  class="listado1"> TRD</td>
        <td class='listado2' colspan="5">
            <?php
            if (!$codserie)
                $codserie = "0";
            if (!$tsub)
                $tsub = "0";
            if (trim($val_tpdoc_grbTRD) == "///")
                $val_tpdoc_grbTRD = "";
            ?>
            <?= $serie_nombre ?><font color=black>/</font><?= $subserie_nombre ?><font color=black>/</font><?= $tpdoc_nombreTRD ?>
            <?php
            if ($verradPermisos == "Full" or $datoVer == "985") {
                ?>
                <input type=button name=mosrtar_tipo_doc2 value='...' class=botones_2 onClick="ver_tipodocuTRD(<?= $codserie ?>,<?= $tsub ?>);" aria-label="Botón para aplicar una TRD al radicado">
        </td>
    </tr>
        <?php
    }
    ?>
</table>
</form>
