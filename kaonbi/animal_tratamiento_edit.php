<?php
				include "includes/header.php";
					$id = $_GET['id'];
					$query = $link -> query("SELECT * FROM tratamiento where id = " . $id);
					$tratamiento = mysqli_fetch_array($query);
				?>

				<form method="post" action="animal_tratamiento_update.php" enctype='multipart/form-data'>
					<fieldset>
						<legend class="hidden-first">Modificar Tratamiento</legend>
						<input name="id" type="hidden" value="<?=$id?>">
						<input name="id_animal" type="hidden" value="<?=$tratamiento['id_animal']?>">

							
							<label>Observaciones</label>
							<input class="form-control" type="text" name="observaciones"></input><br>

							<label>Fecha final</label>
							<input class="form-control" type="date" name="fecha_fin"></input><br>
							
							<br>
					<input type="submit" value=" Save " class="btn btn-success">
					</form>
					<?php include "includes/footer.php";?>
				