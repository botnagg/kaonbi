<?php
				include "includes/header.php";
				?>

				<a class="btn btn-primary" href="new_tratamiento.php"> <i class="glyphicon glyphicon-plus-sign"></i> Nuevo Tratamiento</a>

				<h1>Tratamiento</h1>

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
				if($tratamiento) foreach ($tratamiento as $tratamientos):
					?>
					<tr>
						<td><?php echo $tratamientos['id']?></td>
						<td><?php echo $tratamientos['nombre']?></td>
						<td><?php echo $tratamientos['fecha_Inicio']?></td>
						<td><?php echo $tratamientos['fecha_fin']?></td>
						<td><?php echo $tratamientos['observaciones']?></td>
						<td><?php echo $tratamientos['causa']?></td>
						<td><?php echo $tratamientos['tratamiento']?></td>


						<td><a href="edit_tratamiento.php?id=<?php echo $tratamientos['id']?>"><i class="glyphicon glyphicon-edit"></i></a></td>
						<td><a href="delete_tratamiento.php?id=<?php echo $tratamientos['id']?>" onclick="return navConfirm(this.href);"><i class="glyphicon glyphicon-trash"></i></a></td>
					</tr>
					<?php endforeach; ?>
				</table>
			<?php include "includes/footer.php";?>
				