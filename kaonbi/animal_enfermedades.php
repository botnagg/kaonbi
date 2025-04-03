<?php
				include "includes/header.php";
				?>

				<a class="btn btn-primary" href="animal_enfermedad_nuevo.php"> <i class="glyphicon glyphicon-plus-sign"></i> Nueva enfermedad </a>


				<h1>Enfermedades</h1>

				<table id="sorted" class="table table-striped table-bordered">
				<thead>
				<tr>

			<th>Id Animal</th>
			<th>Enfermedad</th>
			<th>Fecha inicio</th>
			<th>Fecha final</th>
			<th>Observaciones</th>

			
				<th class="not">Edit</th>
				<th class="not">Delete</th>
				</tr>
				</thead>

				<?php
				$enfermedad = $result = mysqli_query($link, 
				"SELECT distinct a.id, e.nombre, c.fecha_inicio, c.fecha_fin, c.observaciones
				FROM animal_contrae_enfermedad c
				 JOIN animal a ON a.id=c.id_animal
				 JOIN enfermedad e ON c.id_enfermedad=e.id
				ORDER BY a.id");
				if($enfermedad) foreach ($enfermedad as $enfermedad):
					?>
					<tr>
						<td><?php echo $enfermedad['id']?></td>
						<td><?php echo $enfermedad['nombre']?></td>
						<td><?php echo $enfermedad['fecha_inicio']?></td>
						<td><?php echo $enfermedad['fecha_fin']?></td>
						<td><?php echo $enfermedad['observaciones']?></td>

						<td><a href="animal_enfermedad_edit.php?id=<?php echo $enfermedad['id']?>"><i class="glyphicon glyphicon-edit"></i></a></td>
						<td><a href="animal_enfermedad_delete.php?id=<?php echo $enfermedad['id']?>" onclick="return navConfirm(this.href);"><i class="glyphicon glyphicon-trash"></i></a></td>
					</tr>
					<?php endforeach; ?>
				</table>
			<?php include "includes/footer.php";?>
				