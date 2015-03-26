<?php include('includes/header.php'); ?>

<div id="content">
    <h2>Munkalapok</h2>

    <?php if (isset($_SESSION['msg'])) : ?>

        <p><?php
            print($_SESSION['msg']);
            unset($_SESSION['msg']);
            ?></p>
        <br>


    <?php endif; ?>

    <?php if ($_SESSION['rights'] == 1 || $_SESSION['rights'] == 2) : ?>
        <table class="munkalapok">
            <tr>
                <th>ID</th>
                <th>Cím</th>
                <th>Ügyfél</th>
                <th>Bejelentés ideje</th>
                <th>Állapot</th>
                <th>Műveletek</th>

                <?php
                while ($lap = $munkalapok->fetch_assoc()) {
                    $allapot = 'Lezárt';
                    $allapot_class = 'lezart';
                    // Állapot kiválasztása:
                    if ($lap['atvetel_ideje'] == NULL) {
                        $allapot = 'Javítva';
                        $allapot_class = 'javitva';
                    }
                    if ($lap['javitas_befejezese'] == NULL) {
                        $allapot = 'Javítás alatt';
                        $allapot_class = 'javitas_alatt';
                    }
                    if ($lap['javitas_kezdete'] == NULL) {
                        $allapot = 'Új';
                        $allapot_class = 'uj';
                    }

                    echo '<tr class="' . $allapot_class . '">';
                    echo '<td>' . $lap['id'];
                    echo '<td><a href="?q=munkalapreszletei&id='.$lap['id'].'">' . $lap['cim'].'</a>';
                    echo '<td>' . $lap['nev'];
                    echo '<td>' . $lap['bejelentes_ideje'];
                    echo '<td>' . $allapot;
                    echo '<td>';
                    if ($allapot == 'Új') {
                        echo '<form method="POST">';
                        echo '<input type="hidden" name="munkalapid" value="' . $lap['id'] . '">';
                        echo '<input type="submit" name="javitaskezdes" value="javítás megkezdése">';
                        echo '</form>';
                    }
                    if ($allapot == 'Javítás alatt') {
                        echo '<form method="POST" action="?q=javitasbefejezese">';
                        echo '<input type="hidden" name="munkalapid" value="' . $lap['id'] . '">';
                        echo '<input type="submit" name="javitasvege" value="javítás befejezése">';
                        echo '</form>';
                    }
                    if ($allapot == 'Javítva') {
                        echo '<form method="POST">';
                        echo '<input type="hidden" name="munkalapid" value="' . $lap['id'] . '">';
                        echo '<input type="submit" name="lezaras" value="Lezárás">';
                        echo '</form>';
                    }
                }
                ?>
        </table>

        <form name="munkalapForm" method="post" id="munkalapForm">
            <label>Cím:</label>
            <br>
            <input type="text" name="cim" class="shortText">
            <br>
            <label>Ügyfél:</label>
            <br>

            <select name="ugyfel_id" class="selecttext">
                <?php
                foreach ($ugyfelek as $ugyfel) {
                    echo '<option value="' . $ugyfel['id'] . '">' . $ugyfel['nev'] . '</option>';
                }
                ?>
            </select>
            <br>
            <label>Hibaleírás:</label>
            <br>
            <textarea name="hibaleiras" rows="4" cols="50"></textarea>
            <br>
            <label>Eszközök:</label>
            <br>
            <textarea name="eszkozok" rows="4" cols="50"></textarea>
            <br>


            <br>
            <input type="submit" name="munkalapSubmit" value="Rögzités">
        </form>



    <?php else : ?>

        <p>Nincs jogosultsága az oldal megtekintéséhez.</p>

    <?php endif; ?>



</div>

<?php
include('includes/footer.php');
