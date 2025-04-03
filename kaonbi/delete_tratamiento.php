<?php
		include("includes/connect.php");
		
		$id = $_GET['id'];

		try {
			mysqli_query($link, "DELETE FROM `tratamiento` WHERE id = '".$id."' ");
			header("location:"."select_tratamiento.php");
		} catch (Exception $e) {
			header("location:"."select_tratamiento.php?errorMsg=" . $e->getMessage());
		}

?>