<?php
		include("includes/connect.php");

		$id_animal = addslashes(htmlentities($_POST["id_animal"], ENT_QUOTES));
		$fecha_inicio = addslashes(htmlentities($_POST["fecha_inicio"], ENT_QUOTES));
		$fecha_fin = addslashes(htmlentities($_POST["fecha_fin"], ENT_QUOTES));
		$observaciones = addslashes(htmlentities($_POST["observaciones"], ENT_QUOTES));
		$id_enfermedad = addslashes(htmlentities($_POST["id_enfermedad"], ENT_QUOTES));
		
		if(empty($fecha_fin)){
			$fecha_fin = "NULL";
		}else{
			$fecha_fin = "'$fecha_fin'";
		}

		try {
			mysqli_query($link, "INSERT INTO `animal_contrae_enfermedad` (  `id_animal` , `fecha_inicio` , `fecha_fin` , `observaciones` , `id_enfermedad`) VALUES ( '".$id_animal."' , '".$fecha_inicio."' , ".$fecha_fin." , '".$observaciones."' , '".$id_enfermedad."' ) ");
			header("location:"."animal_enfermedades.php");
		} catch (Exception $e) {
			header("location:"."animal_enfermedad_nuevo.php?errorMsg=" . $e->getMessage());
		}

		
?>