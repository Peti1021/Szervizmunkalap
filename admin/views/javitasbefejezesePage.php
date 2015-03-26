<?php include('includes/header.php'); ?>

<div id="content">
    <h2>Javítás Befejezése </h2>

    <?php if (isset($_SESSION['msg'])) : ?>

        <p><?php
            print($_SESSION['msg']);
            unset($_SESSION['msg']);
            ?></p>
        <br>


    <?php endif; ?>

    <?php if ($_SESSION['rights'] == 1 || $_SESSION['rights'] == 2) : ?>
       
        <form name="munkalapForm" method="post" id="munkalapForm">
            
            <label>Javítás Leírása:</label>
            <br>
            <textarea name="javitas_leirasa" rows="4" cols="50"></textarea>
            <br>
            <label>Ár:</label>
            <input type="text" name="ar" size="6">Ft
            <input type="hidden" name="munkalapid" value="<?php echo $_POST['munkalapid']; ?>">

            <br>
            <input type="submit" name="javitasbefejezeseSubmit" value="Mentés">
        </form>



    <?php else : ?>

        <p>Nincs jogosultsága az oldal megtekintéséhez.</p>

    <?php endif; ?>



</div>

<?php
include('includes/footer.php');
