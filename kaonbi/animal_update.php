<?php
		include("includes/connect.php");

		$id = $_POST['id'];
		
		$id_animal = addslashes(htmlentities($_POST["id_animal"], ENT_QUOTES));
		$castrado = addslashes(htmlentities($_POST["castrado"], ENT_QUOTES));
		$fecha_fallecimiento = addslashes(htmlentities($_POST["fecha_fallecimiento"], ENT_QUOTES));

		try {
			mysqli_query($link, "UPDATE `animal` SET   `castrado` =  '".$castrado."', `fecha_fallecimiento` =  '".$fecha_fallecimiento."'  WHERE `id` = '".$id."' "); 
			header("location:"."animal_informacion.php");
		} catch (Exception $e) {
			header("location:"."animal_edit.php?id=" . $id . "&errorMsg=" . $e->getMessage());
		}
		
?>