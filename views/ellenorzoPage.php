<?php include('includes/header.php'); ?>

<div id="content">
    <h2><?php echo $pageTitle; ?></h2>

    <?php
    
    if (isset($lap)) {
        $allapot = 'új munkalap';
        if ($lap['javitas_kezdete'] != NULL) $allapot = 'javítás alatt';
        if ($lap['javitas_befejezese'] != NULL) $allapot = 'javítás kész';
        if ($lap['atvetel_ideje'] != NULL) $allapot = 'átvéve, lezárva';
        
        echo '<p><b>'.$lap['id'].'. munkalap adatai:</b><ul>';
        echo '<li>Beadás ideje: ' . $lap['bejelentes_ideje'];
        echo '<li>A munkalap állapota: ' . $allapot;
        echo '<li>Javítás ára: ' .$lap["ar"];
        echo '</ul>';
    }
    
    ?>
    
    <form action="" method="post">
        Munkalap Azonositó:<br>
        <input type="text" name="azonosito">
        <br>

        <br><br>
        <input name="ellenoriz" type="submit" value="Ellenőriz">
    </form> 


</div>

<?php
include('includes/footer.php');
