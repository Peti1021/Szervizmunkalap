<?php

if (isset($_POST["ellenoriz"])) {
    $azonosito = $_POST["azonosito"];
    $query = "SELECT * FROM `munkalapok` WHERE `id`='$azonosito'";
    $lap = $db->query($query)->fetch_assoc();
    if ($db->errno) {
        die($db->error);
    }
    
    
    
}