<?php
				include "includes/header.php";
?>
				<form method="post" action="animal_insert.php" enctype='multipart/form-data'>
					<fieldset>
						<legend>Nuevo Animal</legend>
				
							<label>Nombre</label>
							<input class="ckeditor form-control" name="nombre"></input><br>

                            <label>Sexo (Macho o Hembra)</label>
                            <input class="form-control" type="text" name="sexo"></input><br>

                            <label>Color</label>
							<input class="ckeditor form-control" type="text" name="color"></input><br>

                            <label>Numero Chip (15 numeros)</label>
							<input class="form-control" type="text" name="num_chip"><br>
							
							<label>Fecha Nacimiento</label>
							<input class="form-control" type="date" min="01-01-2000" max="31-12-2099" name="fecha_nacimiento" value="" pattern="[0-9]{2}-[0-9]{2}-[0-9]{4}" /><br>

							<label>Castrado (SI o NO)</label>
							<input class="form-control" type="text" name="castrado"></input><br>

                            <label>Tipo animal</label>
                            <select class="form-control" name="id_tipo_animal" required>
								<option value="0">Seleccione tipo animal</option>
								<?php
								  $query = $link -> query("SELECT * FROM tipo_animal");
									while($row = mysqli_fetch_array($query)){
									  echo '<option value="'.$row['id'].'">'.$row['tipo'].'</option>';
									}
								?>
							</select><br>
					<br>
					<input type="submit" value=" Guardar " class="btn btn-success">
					</form>
					<?php include "includes/footer.php";?>