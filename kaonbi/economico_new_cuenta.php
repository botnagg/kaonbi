<?php include "includes/header.php"; ?>

<form method="post" action="economico_insert_cuenta.php" enctype='multipart/form-data'>
    <fieldset>
        <legend class="hidden-first">Nueva cuenta</legend>

        <label for="nombre">Nombre</label>
        <textarea id="nombre" type="text" class="ckeditor form-control" name="nombre"></textarea><br>

        <label for="iban">Iban</label>
        <textarea id="iban" type="text" class="ckeditor form-control" name="iban"></textarea><br>

        <input type="submit" value="Guardar" class="btn btn-success">
    </fieldset>
</form>

<?php include "includes/footer.php"; ?>
