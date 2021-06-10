<?php
    if (isset($_POST['mot_de_passe']) AND $_POST['mot_de_passe'] ==  "snir") // Si le mot de passe est bon
    {
    // On affiche les codes
    ?>

    <?php
    }
    else // Sinon, on affiche un message d'erreur
    {
        echo '<p>Mot de passe incorrect</p>';
    }
    ?>
