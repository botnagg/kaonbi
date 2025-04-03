<?php
include("includes/connect.php");

if (isset($_GET['id'])) {
    $id_cic = $_GET['id'];

    try {
        mysqli_query($link, "DELETE FROM `colaborador_ingresa_cuenta` WHERE `id` = '" . $id_cic . "'");
        header("location:" . "economico_seccion.php");
    } catch (Exception $e) {
        header("location:" . "select_tratamiento.php?errorMsg=" . $e->getMessage());
    }
} else {
    header("location:" . "economico_seccion.php");
}
?>