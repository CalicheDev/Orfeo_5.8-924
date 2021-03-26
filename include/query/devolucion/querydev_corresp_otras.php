<?php

/**
 * CONSULTA VERIFICACION PREVIA A LA RADICACION
 */
$sqlConcatC = $tmp_hlp;
$condicion = $tmp_hlp;
switch ($db->driver) {
    case 'mssql': {
            $nombre = "(a.radi_nume_sal)";
            $nombre2 = $db->conn->Concat("radi_nume_sal", "'-'", "cast(sgd_renv_codigo as varchar)");
        }break;
    case 'oracle':
    case 'oci8':
    case 'oci805': {
            $nombre = "(a.radi_nume_sal)";
            $nombre2 = $db->conn->Concat("radi_nume_sal", "'-'", "sgd_renv_codigo");
        }break;
    case 'mysql': {
            $nombre = "(a.radi_nume_sal)";
            $nombre2 = $db->conn->Concat("radi_nume_sal", "'-'", "sgd_renv_codigo");
        }break;
    default: {
            $nombre = "(a.radi_nume_sal)";
            $nombre2 = $db->conn->Concat("radi_nume_sal", "'-'", "sgd_renv_codigo");
        }break;
}
?>
