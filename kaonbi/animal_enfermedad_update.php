<?php
		include("includes/connect.php");

		$id = $_POST['id'];
		
		$observaciones = addslashes(htmlentities($_POST["observaciones"], ENT_QUOTES));
		$fecha_fin = addslashes(htmlentities($_POST["fecha_fin"], ENT_QUOTES));
        $fecha_inicio = addslashes(htmlentities($_POST["fecha_inicio"], ENT_QUOTES));

		try {
			mysqli_query($link, "UPDATE `animal_contrae_enfermedad` SET   `observaciones` =  '".$observaciones."', `fecha_fin` =  '".$fecha_fin."', `fecha_inicio` =  '".$fecha_inicio."'  WHERE `id` = '".$id."' "); 
			header("location:"."animal_enfermedades.php");
		} catch (Exception $e) {
			header("location:"."animal_enfermedad_edit.php?id=" . $id . "&errorMsg=" . $e->getMessage());
		}
		
?>