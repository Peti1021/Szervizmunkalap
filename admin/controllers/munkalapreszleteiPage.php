<?php

$pageTitle = "Munkalap részeletei:";

$munkalap = $db->query("select m.*,u.nev from munkalapok as m join ugyfelek as u on u.id=m.ugyfel_id WHERE m.id=" . $_GET['id'])->fetch_assoc();


$query = "SELECT * FROM `users` WHERE id=" . $munkalap['felvette'];
$felvette = $db->query($query)->fetch_assoc();
if ($db->errno) {
    die($db->error);
}

if ($munkalap['javito'] != null) {
    $query = "SELECT * FROM `users` WHERE id=" . $munkalap['javito'];
    $javito = $db->query($query)->fetch_assoc();
    if ($db->errno) {
        die($db->error);
    }
}


