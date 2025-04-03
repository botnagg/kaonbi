<?php
				include "includes/header.php";
?>
				<form method="post" action="animal_tratamiento_insert.php" enctype='multipart/form-data'>
					<fieldset>
						<legend class="hidden-first">Nuevo Tratamiento</legend>
				
							<label>Animal</label>
							<select class="form-control" name="id_animal" required>
								<option value="">Seleccione...</option>
								<?php
								  $query = $link -> query("SELECT * FROM animal");
									while($row = mysqli_fetch_array($query)){
									  echo '<option value="'.$row['id'].'">'.$row['nombre'].' - '.$row['sexo'].' - '.$row['color'].'</option>';
									}
								?>
							</select><br>
							
							<label>Fecha Inicio</label>
							<input class="form-control" type="date" min="01-01-2000" max="31-12-2099" name="fecha_Inicio" value="" pattern="[0-9]{2}-[0-9]{2}-[0-9]{4}" /><br>
							
							<label>Fecha fin</label>
							<input class="form-control" type="date" min="01-01-2000" max="31-12-2099" name="fecha_fin" value="" pattern="[0-9]{2}-[0-9]{2}-[0-9]{4}" /><br>
							

							
							<label>Observaciones</label>
							<textarea class="ckeditor form-control" name="observaciones"></textarea><br>
							
							<label>Causa</label>
							<textarea class="ckeditor form-control" name="causa"></textarea><br>

							<label>Tratamiento</label>
							<textarea class="ckeditor form-control" name="tratamiento"></textarea><br>
					<br>
					<input type="submit" value=" Guardar " class="btn btn-success">
					</form>
					<?php include "includes/footer.php";?>