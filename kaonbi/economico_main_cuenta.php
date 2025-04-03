<?php include "includes/header.php";?>
<a class="btn btn-primary" href="economico_new_cuenta.php"><i class="glyphicon glyphicon-plus-sign"></i> Nueva cuenta</a>

<h1>Económico</h1>
<div style="display: flex; justify-content: space-between; margin-bottom: 20px;">
    <div>
        <h2>Cuentas</h2>
        <table id="sorted2" class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th>id cuenta</th>
                        <th>nombre cuenta</th>
                        <th>iban</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $result = mysqli_query($link,
                        "SELECT
                            cue.id AS id_cuenta,
                            cue.nombre AS nombre_cuenta,
                            cue.iban AS iban
                        FROM
                            cuenta cue
                        ORDER BY
                            cue.id;"
                    );
                    if($result){
                        foreach($result as $row):
                            ?>
                            <tr>
                                <td><?php echo $row['id_cuenta']?></td>
                                <td><?php echo $row['nombre_cuenta']?></td>
                                <td><?php echo $row['iban']?></td>
                            </tr>
                        <?php endforeach;
                    }
                    ?>

                </tbody>
        </table>
    </div>
</div>
<?php include "includes/footer.php"; ?>
