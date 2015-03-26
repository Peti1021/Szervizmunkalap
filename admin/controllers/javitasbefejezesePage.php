<?php

if (isset($_POST['javitasbefejezeseSubmit'])) {
    $id = $_POST['munkalapid'];
    $javitas_befejezese = date("Y-m-d H:i:s");
    $ar = $_POST['ar'];
    $javitas_leirasa = $_POST['javitas_leirasa'];
    
    $query = "UPDATE munkalapok SET javitas_befejezese='$javitas_befejezese', ar=$ar,javitas_leirasa='$javitas_leirasa' WHERE id=$id";
    $db->query($query);
    if ($db->errno) {
        die($db->error);
    }




    $_SESSION['msg'] = 'Javítás rögzitve.';

    header("Location: $HOST/admin/?q=munkalapok");
    exit;
}