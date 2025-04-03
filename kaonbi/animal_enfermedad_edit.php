<?php
				include "includes/header.php";
					$id = $_GET['id'];
					$query = $link -> query("SELECT * FROM animal_contrae_enfermedad where id = " . $id);
					$animal_contrae_enfermedad = mysqli_fetch_array($query);
				?>

				<form method="post" action="animal_enfermedad_update.php" enctype='multipart/form-data'>
					<fieldset>
						<legend class="hidden-first">Modificar Enfermedad</legend>
						<input name="id" type="hidden" value="<?=$id?>">
						<input name="id_animal" type="hidden" value="<?=$animal_contrae_enfermedad['id_animal']?>">
			
							
							<label>Observaciones</label>
							<input class="form-control" type="text" name="observaciones"></input><br>

							<label>Fecha Inicio</label>
							<input class="form-control" type="date" name="fecha_inicio"></input><br>

							<label>Fecha final</label>
							<input class="form-control" type="date" name="fecha_fin"></input><br>
							
							<br>
					<input type="submit" value=" Save " class="btn btn-success">
					</form>
					<?php include "includes/footer.php";?>
				