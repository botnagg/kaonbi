<?php
				include "includes/header.php";
				?>

				<a class="btn btn-primary" href="animal_nuevo.php"> <i class="glyphicon glyphicon-plus-sign"></i> Añadir nuevo animal</a>

				<h1>Animales</h1>

				<table id="sorted" class="table table-striped table-bordered">
				<thead>
				<tr>
			<th>Id</th>
			<th>Nombre</th>
			<th>Sexo</th>
			<th>Color</th>
			<th>Fecha nacimiento</th>
			<th>Fecha fallecimiento</th>
			<th>Numero de chip</th>
			<th>Castrado</th>
			<th>Tipo animal</th>

				<th class="not">Edit</th>
				<th class="not">Delete</th>
				</tr>
				</thead>

				<?php
				$animal = $result = mysqli_query($link, 
				"SELECT a.id, a.nombre, a.fecha_nacimiento, a.sexo, a.color, a.num_chip, a.castrado, t.tipo,  a.fecha_fallecimiento
				FROM animal a
				left JOIN tipo_animal t ON a.id_tipo_animal=t.id
				ORDER BY a.id");
				if($animal) foreach ($animal as $animal):
					?>
					<tr>
						<td><?php echo $animal['id']?></td>
						<td><?php echo $animal['nombre']?></td>
						<td><?php echo $animal['sexo']?></td>
						<td><?php echo $animal['color']?></td>
						<td><?php echo $animal['fecha_nacimiento']?></td>
						<td><?php echo $animal['fecha_fallecimiento']?></td>
						<td><?php echo $animal['num_chip']?></td>
						<td><?php echo $animal['castrado']?></td>
						<td><?php echo $animal['tipo']?></td>



						<td><a href="animal_edit.php?id=<?php echo $animal['id']?>"><i class="glyphicon glyphicon-edit"></i></a></td>
						<td><a href="animal_delete.php?id=<?php echo $animal['id']?>" onclick="return navConfirm(this.href);"><i class="glyphicon glyphicon-trash"></i></a></td>
					</tr>
					<?php endforeach; ?>
				</table>
			<?php include "includes/footer.php";?>
				