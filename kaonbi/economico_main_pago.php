<?php include "includes/header.php";?>
<a class="btn btn-primary" href="economico_new_pago.php"><i class="glyphicon glyphicon-plus-sign"></i> Nuevo pago</a>
<h1>Económico</h1>
<div style=" margin-bottom: 20px;">
    <div>
        <h2>Pagos</h2>
        <table id="sorted" class="table table-striped table-bordered">
            <thead>
                <tr>
                    <th>Id cic</th>
                    <th>Nombre colaborador</th>
                    <th>Nombre cuenta</th>
                    <th>iban</th>
                    <th>Cantidad</th>
                    <th>Método de ingreso</th>
                    <th class="not">Observaciones</th>
                    <th class="not">Delete</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $result = mysqli_query($link,
                    "SELECT
                        cic.id AS id_cic,
                        cue.id AS id_cuenta,
                        colab.id AS id_colaborador,
                        cue.nombre,
                        colab.nombre AS nombre_colaborador,
                        cue.iban,
                        cic.cantidad,
                        cic.observaciones
                    FROM
                        colaborador_ingresa_cuenta cic
                    JOIN
                        colaborador colab ON cic.id_colaborador = colab.id
                    JOIN
                        cuenta cue ON cic.id_cuenta = cue.id
                    ORDER BY
                        cue.id;"
                );

                if ($result) {
                    foreach ($result as $row):
                        ?>
                        <tr>
                            <td><?php echo $row['id_cic'] ?></td>
                            <td><?php echo $row['nombre_colaborador'] ?></td>
                            <td><?php echo $row['nombre'] ?></td>
                            <td><?php echo $row['iban'] ?></td>
                            <td><?php echo $row['cantidad'] ?></td>
                            <td><?php echo $row['observaciones'] ?></td>
                            <td><a href="economico_edit.php?id=<?php echo $row['id_cic'] ?>"><i class="glyphicon glyphicon-edit"></i></a></td>
                            <td><a href="economico_delete_cuenta.php?id=<?php echo $row['id_cic'] ?>" onclick="return navConfirm(this.href);"><i class="glyphicon glyphicon-trash"></i></a></td>
                        </tr>
                    <?php endforeach;
                }
                ?>
            </tbody>
        </table>
    </div>
</div>

<?php include "includes/footer.php"; ?>
