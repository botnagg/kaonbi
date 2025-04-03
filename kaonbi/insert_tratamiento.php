<?php
		include("includes/connect.php");

		$id_animal = addslashes(htmlentities($_POST["id_animal"], ENT_QUOTES));
		$fecha_Inicio = addslashes(htmlentities($_POST["fecha_Inicio"], ENT_QUOTES));
		$fecha_fin = addslashes(htmlentities($_POST["fecha_fin"], ENT_QUOTES));
		$observaciones = addslashes(htmlentities($_POST["observaciones"], ENT_QUOTES));
		$causa = addslashes(htmlentities($_POST["causa"], ENT_QUOTES));
		$tratamiento = addslashes(htmlentities($_POST["tratamiento"], ENT_QUOTES));
		
		if(empty($fecha_fin)){
			$fecha_fin = "NULL";
		}else{
			$fecha_fin = "'$fecha_fin'";
		}

		try {
			mysqli_query($link, "INSERT INTO `tratamiento` (  `id_animal` , `fecha_Inicio` , `fecha_fin` , `observaciones` , `causa` , `tratamiento` ) VALUES ( '".$id_animal."' , '".$fecha_Inicio."' , ".$fecha_fin." , '".$observaciones."' , '".$causa."' , '".$tratamiento."' ) ");
			header("location:"."select_tratamiento.php");
		} catch (Exception $e) {
			header("location:"."new_tratamiento.php?errorMsg=" . $e->getMessage());
		}

		
?>