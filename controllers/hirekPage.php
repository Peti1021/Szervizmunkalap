<?php

$pageTitle = "Hírek";
// Hírek kiolvasása adatbázisból:

$query = "SELECT * FROM `news`";
$news = $db->query($query);
if ($db->errno) {
  die($db->error);
}

