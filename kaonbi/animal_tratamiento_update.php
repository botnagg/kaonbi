<?php
		include("includes/connect.php");

		$id = $_POST['id'];
		
		$observaciones = addslashes(htmlentities($_POST["observaciones"], ENT_QUOTES));
		$fecha_fin = addslashes(htmlentities($_POST["fecha_fin"], ENT_QUOTES));

		try {
			mysqli_query($link, "UPDATE `tratamiento` SET   `observaciones` =  '".$observaciones."', `fecha_fin` =  '".$fecha_fin."'  WHERE `id` = '".$id."' "); 
			header("location:"."animal_tratamiento.php");
		} catch (Exception $e) {
			header("location:"."animal_tratamiento_edit.php?id=" . $id . "&errorMsg=" . $e->getMessage());
		}
		
?>