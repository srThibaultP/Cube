<?php
$serveur = "locahost";
$base = "cube";
$user = "WEB";
$pass = "snir";

/* $mysqli est une nouvelle instance de la classe mysqli predefinie
 dans php et herite done de ses proprietes et methodes connexion à la base de donnees */

 $mysqli = new mysqli($serveur, $user, $pass, $base);
 // si la connexion se fait en UTF-8, sinon ne rien indiquer
$mysqli->set_charset("utf8");
/* utilisation de la methode connect_error qui renvoie un message d'erreur si la connexion echoue */
if ($mysqli->connect_error) {
die('Erreur de connexion ('.$mysqli->connect_error.')'. $mysqli->connect_error);
?>

<?php
if ($mysqli->connect_error) { echo 'connexion impossible'.$mysqli->connecterror;
}
else { echo 'connexion reussle : '.$mysqli->host_info;
}

?>


nom = "<?php echo $nom; ?>";
dateDebut = "<?php echo $dateDebut;?>T<?php echo $heureDebut;?> :00+01:00";
dateFin = "<?php echo $dateFin;?>T<?php echo $heureFin;?>:00+01:00";
