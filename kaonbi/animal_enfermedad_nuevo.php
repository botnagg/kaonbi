<?php
				include "includes/header.php";
?>
				<form method="post" action="animal_enfermedad_insert.php" enctype='multipart/form-data'>
					<fieldset>
						<legend class="hidden-first">Enfermedad contraida por animal</legend>
				
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
							<input class="form-control" type="date" min="01-01-2000" max="31-12-2099" name="fecha_inicio" value="" pattern="[0-9]{2}-[0-9]{2}-[0-9]{4}" /><br>
							
							<label>Fecha fin</label>
							<input class="form-control" type="date" min="01-01-2000" max="31-12-2099" name="fecha_fin" value="" pattern="[0-9]{2}-[0-9]{2}-[0-9]{4}" /><br>
							

							
							<label>Observaciones</label>
							<textarea class="ckeditor form-control" name="observaciones"></textarea><br>

							<label>Nombre enfermedad</label>
                            <select class="form-control" name="id_enfermedad" required>
								<option value="0">Seleccione enfermedad</option>
								<?php
								  $query = $link -> query("SELECT * FROM enfermedad");
									while($row = mysqli_fetch_array($query)){
									  echo '<option value="'.$row['id'].'">'.$row['nombre'].'</option>';
									}
								?>
							</select><br>
					<br>
					<input type="submit" value=" Guardar " class="btn btn-success">
					</form>
					<?php include "includes/footer.php";?>
				