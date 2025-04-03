<?php
include "includes/header.php";

if (isset($_GET['id'])) {
    $id_cic = intval($_GET['id']); 

    $query = mysqli_prepare($link, "SELECT cic.id AS id_cic, cue.id AS id_cuenta, colab.id AS id_colaborador, 
    cue.nombre, colab.nombre AS nombre_colaborador, cue.iban, cic.cantidad, cic.observaciones 
        FROM colaborador_ingresa_cuenta cic
        JOIN colaborador colab ON cic.id_colaborador = colab.id
        JOIN cuenta cue ON cic.id_cuenta = cue.id
        WHERE cic.id = ?");
    mysqli_stmt_bind_param($query, "i", $id_cic);
    mysqli_stmt_execute($query);
    $result = mysqli_stmt_get_result($query);

    if ($row = mysqli_fetch_array($result)) {
?>
        <form method="post" action="economico_update.php" enctype='multipart/form-data'>
            <fieldset>
                <legend class="hidden-first">Modificar Pago</legend>
                <input name="id_cic" type="hidden" value="<?php echo $row['id_cic']; ?>">

                <label for="nombre_colaborador">Nombre colaborador</label>
                <select id="nombre_colaborador" class="form-control" name="nombre_colaborador" disabled>
                    <option value="<?php echo $row['id_colaborador']; ?>"><?php echo $row['nombre_colaborador']; ?></option>
                    <?php
                    $queryColaborador = $link->query("SELECT DISTINCT id, nombre, apellido1, apellido2 FROM colaborador");
                    while ($rowColaborador = mysqli_fetch_array($queryColaborador)) {
                        echo '<option value="' . $rowColaborador['id'] . '">' . $rowColaborador['id'] . ' - ' . $rowColaborador['nombre'] . ' - ' . $rowColaborador['apellido1'] . ' - ' . $rowColaborador['apellido2'] . '</option>';
                    }
                    ?>
                </select>


                <label for="nombre_cuenta">Nombre cuenta</label>
                <select id="nombre_cuenta" class="form-control" name="nombre_cuenta" disabled>
                    <option value="<?php echo $row['id_cuenta']; ?>"><?php echo $row['nombre']; ?></option>
                    <?php
                    $queryCuenta = $link->query("SELECT DISTINCT id, nombre FROM cuenta");
                    while ($rowCuenta = mysqli_fetch_array($queryCuenta)) {
                        echo '<option value="' . $rowCuenta['id'] . '">' . $rowCuenta['id'] . ' - ' . $rowCuenta['nombre'] . '</option>';
                    }
                    ?>
                </select>

                <label for="iban">Iban</label>
                <input id="iban" type="text" class="form-control" name="iban" value="<?php echo $row['iban']; ?> " disabled>

                <label for="cantidad">Cantidad</label>
                <input id="cantidad" type="text" class="ckeditor form-control" name="cantidad" value="<?php echo $row['cantidad']; ?>">

                <label for="observaciones">Observaciones</label>
                <textarea id="observaciones" class="ckeditor form-control" name="observaciones"><?php echo $row['observaciones']; ?></textarea>
                <br><br>
                <input type="submit" value="Guardar" class="btn btn-success">
            </fieldset>
        </form>
<?php
    } else {
        echo "Error fetching payment details.";
    }
} else {
    echo "Payment ID not provided.";
}

include "includes/footer.php";
?>
