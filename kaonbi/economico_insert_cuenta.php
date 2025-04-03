<?php
    include("includes/connect.php");

    $nombre = addslashes(htmlentities($_POST["nombre"], ENT_QUOTES));
    $iban = addslashes(htmlentities($_POST["iban"], ENT_QUOTES));

    try{
        mysqli_query($link, "INSERT INTO `cuenta` (`nombre`, `iban`) VALUES ('".$nombre."', '".$iban."') ");
        header("location:"."economico_seccion.php");
    } catch (Exception $e){
        header("location:"."economico_new_cuenta.php?errorMsg=");
    }
?>