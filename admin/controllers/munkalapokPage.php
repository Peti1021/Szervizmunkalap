<?php

if (isset($_POST['javitaskezdes'])) {
    $id = $_POST['munkalapid'];
    $javitas_kezdete = date("Y-m-d H:i:s");
    $javito = $_SESSION["id"];
    $query = "UPDATE munkalapok SET javitas_kezdete='$javitas_kezdete', javito=$javito WHERE id=$id";
    $db->query($query);
    if ($db->errno) {
        die($db->error);
    }
}

if (isset($_POST['lezaras'])) {
    $id = $_POST['munkalapid'];
    $atvetel_ideje = date("Y-m-d H:i:s");
    
    $query = "UPDATE munkalapok SET atvetel_ideje='$atvetel_ideje' WHERE id=$id";
    $db->query($query);
    if ($db->errno) {
        die($db->error);
    }
}


$pageTitle = "Munkalapok";

$munkalapok = $db->query("select m.*,u.nev from munkalapok as m join ugyfelek as u on u.id=m.ugyfel_id ORDER BY bejelentes_ideje");

//Ügyfelek kigyűjtése:
$query = "SELECT * FROM `ugyfelek`";
$result = $db->query($query);
if ($db->errno) {
    die($db->error);
}

$ugyfelek = array();
$c = 0;
while ($uData = $result->fetch_array()) {
    $ugyfelek[$c]['id'] = $uData['id'];
    $ugyfelek[$c]['nev'] = $uData['nev'];
    $c++;
}


// login form feldolgozása:
if (isset($_POST['munkalapSubmit'])) {

    $munkalapcim = $_POST['cim'];
    $munkalaphibaleiras = $_POST['hibaleiras'];
    $munkalapeszkozok = $_POST['eszkozok'];
    $munkalapbejeltes_ideje = date('Y-m-d H:i:s');
    $ugyfel_id = $_POST['ugyfel_id'];
    $felvette = $_SESSION['id'];

    // db-be írás:
    $query = "INSERT INTO munkalapok (cim, hibaleiras, eszkozok, bejelentes_ideje, ugyfel_id, felvette) "
            . "VALUES ('$munkalapcim', '$munkalaphibaleiras', '$munkalapeszkozok', '$munkalapbejeltes_ideje', '$ugyfel_id', '$felvette');";
    $result = $db->query($query);
    if ($db->errno) {
        die($db->error);
    }

    $_SESSION['msg'] = 'Munkalap rögzitve.';

    header("Location: $HOST/admin/?q=munkalapok");
    exit;
}
?>