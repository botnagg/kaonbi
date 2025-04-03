<?php
		include("includes/connect.php");

		$nombre = addslashes(htmlentities($_POST["nombre"], ENT_QUOTES));
		$sexo = addslashes(htmlentities($_POST["sexo"], ENT_QUOTES));
		$color = addslashes(htmlentities($_POST["color"], ENT_QUOTES));
		$num_chip = addslashes(htmlentities($_POST["num_chip"], ENT_QUOTES));
		$fecha_nacimiento = addslashes(htmlentities($_POST["fecha_nacimiento"], ENT_QUOTES));
		$castrado = addslashes(htmlentities($_POST["castrado"], ENT_QUOTES));
        $id_tipo_animal = addslashes(htmlentities($_POST["id_tipo_animal"], ENT_QUOTES));
		

		try {
			mysqli_query($link, "INSERT INTO `animal` (  `nombre` , `sexo` , `color` ,`num_chip` , `fecha_nacimiento` , `castrado` , `id_tipo_animal`) VALUES ( '".$nombre."' , '".$sexo."' , '".$color."', '".$num_chip."' ,'".$fecha_nacimiento."' , '".$castrado."' , '".$id_tipo_animal."' ) ");
			header("location:"."animal_informacion.php");
		} catch (Exception $e) {
			header("location:"."animal_nuevo.php?errorMsg=" . $e->getMessage());
		}
		?>