<?php
				include "includes/header.php";
				?>

				<a class="btn btn-primary" href="animal_tratamiento_nuevo.php"> <i class="glyphicon glyphicon-plus-sign"></i> Nuevo Tratamiento</a>

				<h1>Tratamientos</h1>

				<table id="sorted" class="table table-striped table-bordered">
				<thead>
				<tr>
			<th>Id</th>
			<th>Id animal</th>
			<th>Fecha Inicio</th>
			<th>Fecha fin</th>
			<th>Observaciones</th>
			<th>Causa</th>
			<th>Tratamiento</th>

				<th class="not">Edit</th>
				<th class="not">Delete</th>
				</tr>
				</thead>

				<?php
				$tratamiento = $result = mysqli_query($link, 
				"SELECT t.id, a.nombre, t.fecha_Inicio, t.fecha_fin, t.observaciones, t.causa, t.tratamiento
					FROM tratamiento t 
					JOIN animal a on t.id_animal = a.id 
					ORDER BY t.id");
				if($tratamiento) foreach ($tratamiento as $tratamiento):
					?>
					<tr>
						<td><?php echo $tratamiento['id']?></td>
						<td><?php echo $tratamiento['nombre']?></td>
						<td><?php echo $tratamiento['fecha_Inicio']?></td>
						<td><?php echo $tratamiento['fecha_fin']?></td>
						<td><?php echo $tratamiento['observaciones']?></td>
						<td><?php echo $tratamiento['causa']?></td>
						<td><?php echo $tratamiento['tratamiento']?></td>


						<td><a href="animal_tratamiento_edit.php?id=<?php echo $tratamiento['id']?>"><i class="glyphicon glyphicon-edit"></i></a></td>
						<td><a href="animal_tratamiento_delete.php?id=<?php echo $tratamiento['id']?>" onclick="return navConfirm(this.href);"><i class="glyphicon glyphicon-trash"></i></a></td>
					</tr>
					<?php endforeach; ?>
				</table>
			<?php include "includes/footer.php";?>