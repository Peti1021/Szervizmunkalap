<?php

session_start();

require_once 'config.php';
$db = new mysqli($DB_HOST, $DB_USER, $DB_PASS, $DB_NAME);
$db->set_charset('utf8');

// Aktuális lap kiválasztása:
$page = 'kezdolap';
if (isset($_GET['q'])) {
    $page = $_GET['q'];
}

// Aktuális lap betöltése:
switch ($page) {
    case 'hirek':
        include('controllers/hirekPage.php');
        include('views/hirekPage.php');
        break;
    case 'bemutatkozas':
        include('controllers/introductionPage.php');
        include('views/introductionPage.php');
        break;
    case 'ellenorzo':
        $pageTitle = "Állapot ellenőrző";
        include('controllers/ellenorzoPage.php');
        include('views/ellenorzoPage.php');
        break;
    case 'kapcsolat':
        include('controllers/contactPage.php');
        include('views/contactPage.php');
        break;
    default:
        $pageTitle = "Oldal nem található";
        include('views/404Page.php');
    
}

$db->close();
