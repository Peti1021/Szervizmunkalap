<?php include('includes/header.php'); ?>

<div id="content">
    <h2>Munkalap részeletei:</h2>

    <?php if (isset($_SESSION['msg'])) : ?>

        <p><?php
            print($_SESSION['msg']);
            unset($_SESSION['msg']);
            ?></p>
        <br>


    <?php endif; ?>

    <?php if ($_SESSION['rights'] == 1 || $_SESSION['rights'] == 2) : ?> 

        <br>
        <div><b>id:</b> <?php echo $munkalap['id']; ?></div>
        <br>
        <div><b>Cím:</b> <?php echo $munkalap['cim']; ?></div>
        <br>
        <div><b>Hiba leírás:</b> <?php echo $munkalap['hibaleiras']; ?></div>
        <br>
        <div><b>Eszközök:</b> <?php echo $munkalap['eszkozok']; ?></div>
        <br>
        <div><b>Ügyfél:</b> <?php echo $munkalap['nev']; ?></div>
        <br>
        <div><b>Bejelentés ideje:</b> <?php echo $munkalap['bejelentes_ideje']; ?></div>
        <br>
        <div><b>Felvette:</b> <?php echo $felvette['name']; ?></div>
        <br>
        <?php if ($munkalap['javito'] != null) { ?>
            <div><b>Javítás kezdete:</b> <?php echo $munkalap['javitas_kezdete']; ?></div>
            <br>
            <div><b>Javító:</b> <?php echo $javito['name']; ?></div>
            <br>
            <div><b>Javítás befejezese:</b> <?php echo $munkalap['javitas_befejezese']; ?></div>
            <br>
            <div><b>Javítás leírása:</b> <?php echo $munkalap['javitas_leirasa']; ?></div>
            <br>
            <div><b>Ár:</b> <?php echo $munkalap['ar']; ?></div>
            <br>
            <div><b>Átvétel ideje:</b> <?php echo $munkalap['atvetel_ideje']; ?></div>
            <br>
        <?php } ?>

    <?php else : ?>

        <p>Nincs jogosultsága az oldal megtekintéséhez.</p>

    <?php endif; ?>



</div>

<?php
include('includes/footer.php');
