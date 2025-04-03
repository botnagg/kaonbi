<?php include "includes/header.php"; ?>

<form method="post" action="economico_insert_pago.php" enctype='multipart/form-data'>
    <fieldset>
        <legend class="hidden-first">Nuevo pago</legend>

        <label for="id_colaborador">Nombre colaborador (id.cuenta)</label>
        <select name="id_colaborador" class="form-control">
            <option value="">Seleccione...</option>
            <?php
            $query = $link->query("SELECT DISTINCT id, nombre, apellido1, apellido2 FROM colaborador");
            while ($row = mysqli_fetch_array($query)) {
                echo '<option value="' . $row['id'] . '">' . $row['id'] . ' - ' . $row['nombre'] . ' - ' . $row['apellido1'] . ' - ' . $row['apellido2'] . '</option>';
            }
            ?>
        </select>

        <label for="id_cuenta">Nombre cuenta (id.cuenta)</label>
        <select name="id_cuenta" class="form-control">
            <option value="">Seleccione...</option>
            <?php
            $query = $link->query("SELECT DISTINCT id, nombre FROM cuenta");
            while ($row = mysqli_fetch_array($query)) {
                echo '<option value="' . $row['id'] . '">' . $row['id'] . ' - ' . $row['nombre'] . '</option>';
            }
            ?>
        </select>

        <label for="id_tipo_ingreso">Método de ingreso (id.tipo.ingreso)</label>
        <select name="id_tipo_ingreso" class="form-control">
            <option value="">Seleccione...</option>
            <?php
            $queryIdTipoIngreso = $link->query("SELECT DISTINCT id_tipo_ingreso FROM colaborador_ingresa_cuenta");
            while ($rowIdTipoIngreso = mysqli_fetch_array($queryIdTipoIngreso)) {
                echo '<option value="' . $rowIdTipoIngreso['id_tipo_ingreso'] . '">' . $rowIdTipoIngreso['id_tipo_ingreso'] . '</option>';
            }
            ?>
        </select>

        <label for="cantidad">Cantidad</label>
        <input id="cantidad" type="text" class="ckeditor form-control" name="cantidad"><br>

        <label for="observaciones">Observaciones (Bizum/Transferencia)</label>
        <select name="observaciones" class="form-control">
            <option value="">Seleccione...</option>
            <?php
            $queryObservaciones = $link->query("SELECT DISTINCT observaciones FROM colaborador_ingresa_cuenta");
            while ($rowObservaciones = mysqli_fetch_array($queryObservaciones)) {
                echo '<option value="' . $rowObservaciones['observaciones'] . '">' . $rowObservaciones['observaciones'] . '</option>';
            }
            ?>
        </select>
        <br><br>
        <input type="submit" value="Guardar" class="btn btn-success">
    </fieldset>
</form>

<?php include "includes/footer.php"; ?>
