<?php
include("includes/connect.php");

$id_cic = $_POST['id_cic'];
$cantidad = $_POST["cantidad"];
$observaciones = $_POST["observaciones"];

try {
    // Update colaborador_ingresa_cuenta
    mysqli_query($link, "UPDATE `colaborador_ingresa_cuenta` SET
        `cantidad` = '".$cantidad."',
        `observaciones` = '".$observaciones."'
        WHERE `id` = '".$id_cic."'"
    );

    header("location: economico_seccion.php");
} catch (Exception $e) {
    header("location: economico_new_pago.php?errorMsg=" . $e->getMessage());
}
?>
