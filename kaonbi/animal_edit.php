<?php
				include "includes/header.php";
					$id = $_GET['id'];	
					$query = $link -> query("SELECT * FROM animal where id = " . $id);
					$animal = mysqli_fetch_array($query);
				?>

				<form method="post" action="animal_update.php" enctype='multipart/form-data'>
					<fieldset>
						<legend class="hidden-first">Modificar Animal</legend>
						<input name="id" type="hidden" value="<?=$id?>">
						<input name="id_animal" type="hidden" value="<?=$animal['id']?>">
				
							<label>Animal</label>
							<select class="form-control" required disabled>
								<option value="">Seleccione...</option>
								<?php
								  $query = $link -> query("SELECT * FROM animal a");
									while($row = mysqli_fetch_array($query)){
									  
									    if($row['id'] == $animal['id']){ 
											echo '<option value="'.$row['id'].'" selected>'.$row['sexo'].' - '.$row['color'].'</option>';
										}else{
											echo '<option value="'.$row['id'].'">'.$row['sexo'].' - '.$row['color'].'</option>';
										}
									}
								?>
							</select><br>
							
							<label>Fecha Nacimiento</label>
							<input class="form-control" type="date" name="fecha_nacimiento"></input><br>

							<label>Castrado (SI o NO)</label>
							<input class="form-control" type="text" name="castrado"></input><br>

							<label>Fecha fallecimiento</label>
							<input class="form-control" type="date" name="fecha_fallecimiento"></input><br>
							
							<br>
					<input type="submit" value=" Save " class="btn btn-success">
					</form>
					<?php include "includes/footer.php";?>
				