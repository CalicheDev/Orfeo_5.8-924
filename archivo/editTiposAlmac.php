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
$url_raiz = "..";
$dir_raiz = $_SESSION['dir_raiz'];
$ESTILOS_PATH2 = $_SESSION['ESTILOS_PATH2'];
$driver = $_SESSION['driver'];
$assoc = $_SESSION['assoc'];
/* ---------------------------------------------------------+
  |                       MAIN                               |
  +--------------------------------------------------------- */

$krd = $_SESSION['krd'];
$krdOld = $krd;

if (!$krd)
    $krd = $krdOld;
if (!$dir_raiz)
    $dir_raiz = "..";

foreach ($_GET as $key => $valor)   ${$key} = $valor;
foreach ($_POST as $key => $valor)   ${$key} = $valor;


//$cod = $_GET['cod'];
//$tipo = $_GET['tipo'];
//$codp = $_GET['codp'];
//$grabar = $_POST['grabar'];

//include "$ruta_raiz/rec_session.php";
include_once("$dir_raiz/include/db/ConnectionHandler.php");
$db = new ConnectionHandler("$dir_raiz");
$db->conn->SetFetchMode(ADODB_FETCH_ASSOC);
$db->conn->debug = false;
$encabezadol = "$PHP_SELF?" . session_name() . "=" . session_id() . "&dependencia=$dependencia&krd=$krd&cod=$cod&codp=$codp&tipo=2";
?>
<html>
    <head>
        <title>EDICION TIPOS DE ALMACENAMIENTO</title>
        <link rel="stylesheet" href="../estilos/orfeo.css">
    </head>
    <body bgcolor="#FFFFFF">
        <form name="relacionTiposAlmac" action="<?= $encabezadol ?>" method="POST" >
            <?php
            if ($grabar) {
                $nom = strtoupper($nombre);
                $sig = strtoupper($sigla);
                $squ = "update sgd_eit_items set SGD_EIT_COD_PADRE='$cod_pa',SGD_EIT_NOMBRE='$nom',SGD_EIT_SIGLA='$sig' WHERE SGD_EIT_CODIGO = '$cod'";
$db->conn->debug=false;
                $rs = $db->conn->Execute($squ);
                if ($rs->EOF)
                    echo "Achivo Modificado";
                else
                    echo "No se pudo modificar";
            }
            ?>
            <table border="0" width="90%" cellpadding="0" class="borde_tab">
                <tr>
                    <?php
                    $sql = "select * from sgd_eit_items where sgd_eit_codigo = '$cod'";
                    $rs = $db->conn->Execute($sql);
                    if (!$rs->EOF) {
                        $cod_pa = $rs->fields['sgd_eit_cod_padre'];
                        $sqlp = "select SGD_EIT_NOMBRE,sgd_eit_cod_padre from sgd_eit_items where sgd_eit_codigo = '$cod_pa'";
                        $rsp = $db->conn->Execute($sqlp);
                        if (!$rsp->EOF) {
                            $cod_p = $rsp->fields['sgd_eit_cod_padre'];
                            $nom_pa = $cod_p . "-" . $cod_pa . "-" . $rsp->fields['SGD_EIT_NOMBRE'];
                        }
                        ?>
                        <td class="titulos2">Nombre Padre:<br>
                            Cod_pa-Cod-Nombre
                            <?php
                            $i = 1;
                            $sqml1 = "select SGD_EIT_NOMBRE,sgd_eit_cod_padre from sgd_eit_items where sgd_eit_codigo = '$codig'";
                            $rse = $db->conn->Execute($sqml1);
                            if (!$rse->EOF) {
                                $nom[$i] = $rse->fields['sgd_eit_cod_padre'] . "-" . $codig . "-" . $rse->fields['SGD_EIT_NOMBRE'];
                                $codi[$i] = $codp;
                                $i++;
                            }
                            $sqm1 = "select * from sgd_eit_items where sgd_eit_cod_padre = '$codig'";

                            $rs1 = $db->conn->Execute($sqm1);
                            while (!$rs1->EOF) {
                                $cod_p = $rs1->fields['sgd_eit_codigo'];
                                $nom[$i] = $codig . "-" . $cod_p . "-" . $rs1->fields['sgd_eit_nombre'];
                                $codi[$i] = $rs1->fields['sgd_eit_codigo'];
                                $sqm2 = "select * from sgd_eit_items where sgd_eit_cod_padre = '" . $codi[$i] . "'";
                                $rs2 = $db->conn->Execute($sqm2);
                                $i++;
                                while (!$rs2->EOF) {
                                    $cod_p = $rs2->fields['sgd_eit_codigo'];
                                    $cod_p2 = $rs2->fields['sgd_eit_cod_padre'];
                                    $codi[$i] = $rs2->fields['sgd_eit_codigo'];
                                    $nom[$i] = $cod_p2 . "-" . $cod_p . "-" . $rs2->fields['sgd_eit_nombre'];
                                    $sqm3 = "select * from sgd_eit_items where sgd_eit_cod_padre = '" . $codi[$i] . "'";
                                    $rs3 = $db->conn->Execute($sqm3);
                                    $i++;
                                    while (!$rs3->EOF) {
                                        $cod_p = $rs3->fields['sgd_eit_codigo'];
                                        $codi[$i] = $rs3->fields['sgd_eit_codigo'];
                                        $cod_p2 = $rs3->fields['sgd_eit_cod_padre'];
                                        $nom[$i] = $cod_p2 . "-" . $cod_p . "-" . $rs3->fields['sgd_eit_nombre'];
                                        $sqm4 = "select * from sgd_eit_items where sgd_eit_cod_padre = '" . $codi[$i] . "'";
                                        $rs4 = $db->conn->Execute($sqm4);
                                        $i++;
                                        while (!$rs4->EOF) {
                                            $cod_p = $rs4->fields['sgd_eit_codigo'];
                                            $codi[$i] = $rs4->fields['sgd_eit_codigo'];
                                            $cod_p2 = $rs4->fields['sgd_eit_cod_padre'];
                                            $nom[$i] = $cod_p2 . "-" . $cod_p . "-" . $rs4->fields['sgd_eit_nombre'];
                                            $sqm5 = "select * from sgd_eit_items where sgd_eit_cod_padre = '" . $codi[$i] . "'";
                                            $rs5 = $db->conn->Execute($sqm5);
                                            $i++;
                                            while (!$rs5->EOF) {
                                                $cod_p = $rs5->fields['sgd_eit_codigo'];
                                                $codi[$i] = $rs5->fields['sgd_eit_codigo'];
                                                $cod_p2 = $rs5->fields['sgd_eit_cod_padre'];
                                                $nom[$i] = $cod_p2 . "-" . $cod_p . "-" . $rs5->fields['sgd_eit_nombre'];
                                                $sqm6 = "select * from sgd_eit_items where sgd_eit_cod_padre = '" . $codi[$i] . "'";
                                                $rs6 = $db->conn->Execute($sqm6);
                                                $i++;
                                                while (!$rs6->EOF) {
                                                    $cod_p = $rs6->fields['sgd_eit_codigo'];
                                                    $codi[$i] = $rs6->fields['sgd_eit_codigo'];
                                                    $cod_p2 = $rs6->fields['sgd_eit_cod_padre'];
                                                    $nom[$i] = $cod_p2 . "-" . $cod_p . "-" . $rs6->fields['sgd_eit_nombre'];
                                                    $i++;
                                                    $rs6->MoveNext();
                                                }
                                                $rs5->MoveNext();
                                            }
                                            $rs4->MoveNext();
                                        }
                                        $rs3->Movenext();
                                    }
                                    $rs2->MoveNext();
                                }
                                $rs1->MoveNext();
                            }

                            $nombre = $rs->fields['sgd_eit_nombre'];
                            $sigla = $rs->fields['sgd_eit_sigla'];
                            ?>
                        </td>
                        <td height="30" class="titulos5">
                            <div align="center">
                                <select name="cod_pa" class="select">
                                    <option value="<?= $cod_pa ?>" >  <?= $nom_pa ?> </option>
                                    <?php
                                    echo $i;
                                    for ($p = 1; $p < $i; $p++) {
                                        if ($nom[$p] != $nom_pa)
                                            print "<option value='" . $codi[$p] . "'>" . $nom[$p] . " </font></option>";
                                    }
                                    ?>
                                </select>
                            </div>
                        </td>
                        <td class="titulos5">Hijo:
                            <input type="text" name="nombre" value="<?= $nombre ?>" class="listado5">
                        </td>
                        <td class="titulos5">Sigla:
                            <input type="text" name="sigla" value="<?= $sigla ?>" class="listado5">
                        </td>
                    <?php } ?>
                </tr>
                <tr>
                    <td class="titulos5" colspan="4" align="center">
                        <input type="submit" name="grabar" class="botones" value="GRABAR">
                        <input type="button" name="cerrar" class="botones" value="SALIR" onClick="window.close();opener.regresar();">
                    </td>
                </tr>
            </table>

        </form>
    </body>
</html>
