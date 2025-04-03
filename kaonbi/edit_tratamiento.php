<?php
	include "includes/header.php";
		$id = $_GET['id'];
		$query = $link -> query("SELECT * FROM tratamiento where id = " . $id);
		$tratamiento = mysqli_fetch_array($query);
	?>

	<form method="post" action="update_tratamiento.php" enctype='multipart/form-data'>
		<fieldset>
			<legend class="hidden-first">Modificar Tratamiento</legend>
			<input name="id" type="hidden" value="<?=$id?>">
			<input name="id_animal" type="hidden" value="<?=$tratamiento['id_animal']?>">
	
				<label>Animal</label>
				<select class="form-control" required disabled>
					<option value="">Seleccione...</option>
					<?php
						$query = $link -> query("SELECT * FROM animal");
						while($row = mysqli_fetch_array($query)){
							
							if($row['id'] == $tratamiento['id_animal']){ 
								echo '<option value="'.$row['id'].'" selected>'.$row['nombre'].' - '.$row['sexo'].' - '.$row['color'].'</option>';
							}else{
								echo '<option value="'.$row['id'].'">'.$row['nombre'].' - '.$row['sexo'].' - '.$row['color'].'</option>';
							}
						}
					?>
				</select><br>
				
			<label>Fecha Inicio</label>
			<input class="form-control" type="date" min="2000-01-01" max="2099-12-31" name="fecha_Inicio" value="<?=$tratamiento['fecha_Inicio']?>" pattern="[0-9]{2}-[0-9]{2}-[0-9]{4}"/><br>
			
			<label>Fecha fin</label>
			<input class="form-control" type="date" min="2000-01-01" max="2099-12-31" name="fecha_fin" value="<?=$tratamiento['fecha_fin']?>" pattern="[0-9]{2}-[0-9]{2}-[0-9]{4}"/><br>
			

			<label>Observaciones</label>
			<textarea class="ckeditor form-control" name="observaciones"><?=$tratamiento['observaciones']?></textarea><br>
			
			<label>Causa</label>
			<textarea class="ckeditor form-control" name="causa"><?=$tratamiento['causa']?></textarea><br>
			
			<label>Tratamiento</label>
			<textarea class="ckeditor form-control" name="tratamiento"><?=$tratamiento['tratamiento']?></textarea><br>
			
			<br>
	<input type="submit" value=" Save " class="btn btn-success">
	</form>
<?php include "includes/footer.php";?>
	