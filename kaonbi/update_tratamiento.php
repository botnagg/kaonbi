<?php
		include("includes/connect.php");

		$id = $_POST['id'];
		
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
			mysqli_query($link, "UPDATE `tratamiento` SET  `id_animal` =  '".$id_animal."' , `fecha_Inicio` =  '".$fecha_Inicio."' , `fecha_fin` =  ".$fecha_fin." , `observaciones` =  '".$observaciones."' , `causa` =  '".$causa."' , `tratamiento` =  '".$tratamiento."'  WHERE `id` = '".$id."' "); 
			header("location:"."select_tratamiento.php");
		} catch (Exception $e) {
			header("location:"."edit_tratamiento.php?id=" . $id . "&errorMsg=" . $e->getMessage());
		}
		
?>