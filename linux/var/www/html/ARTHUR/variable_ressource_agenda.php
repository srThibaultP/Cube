<?php

  if(isset($_POST['nom']) && isset($_POST['date1']) && isset($_POST['début']) && isset($_POST['date2']) && isset($_POST['fin'])

$nom = $_POST['nom'];
$dateDebut = $_POST['date1'];
$heureDebut = $_POST['début'];
$dateFin = $_POST['date2'];
$heureFin = $_POST['fin'];


var resource = {
  'summary': nom,
  'start': {
  'dateTime': dateDebut,
  },
  'end':{
  'dateTime': dateFin,
  }
};

?>
