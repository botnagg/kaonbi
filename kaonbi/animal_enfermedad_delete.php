<?php
		include("includes/connect.php");
		
		$id = $_GET['id'];

		try {
			mysqli_query($link, "DELETE FROM `animal_contrae_enfermedad` WHERE id = '".$id."' ");
			header("location:"."animal_enfermedades.php");
		} catch (Exception $e) {
            $msg = "";
            if(str_contains($e->getMessage(), "foreign key constraint fails")){
                $msg = "Existen datos relacionados con este animal, primero debe borrar sus dependencias.";
            }else{
                $msg = $e->getMessage();
            }
			header("location:"."animal_enfermedades.php?errorMsg=" . $msg);
		}

?>