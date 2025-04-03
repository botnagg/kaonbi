<?php
    include("includes/connect.php");

    $id_cuenta = $_POST["id_cuenta"];
    $id_colaborador = $_POST["id_colaborador"];
    $id_tipo_ingreso = $_POST["id_tipo_ingreso"];
    $cantidad = $_POST["cantidad"];
    $observaciones = $_POST["observaciones"];
    

		try {
			mysqli_query($link, "INSERT INTO `colaborador_ingresa_cuenta` ( `id_cuenta`, `id_colaborador`, `id_tipo_ingreso`, `cantidad`, `observaciones` ) VALUES ('".$id_cuenta."', '".$id_colaborador."', '".$id_tipo_ingreso."', '".$cantidad."', '".$observaciones."') ");
			header("location:"."economico_seccion.php");
		} catch (Exception $e) {
			header("location:"."economico_new_pago.php?errorMsg=" . $e->getMessage());
		}

		
?>