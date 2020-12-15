<?php
$sql = "SELECT * FROM test WHERE id=(SELECT MAX(id) FROM test)";
include($_SERVER['DOCUMENT_ROOT'].'/Database/login.php');
$db=connexion();
$req = mysqli_query($db,$sql) or die(mysqli_error());
while($data = mysqli_fetch_assoc($req)){
  $s1 = $data["s1"];
  $s2 = $data["s2"];
  $vit = $data["vit"];
  $dir = $data["dir"];
}
?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Cube SA</title>
	<link href="css/style.css" rel="stylesheet" >
	<link rel="icon" type="image/jpg" href="./images/logoCubeSA.jpg" />
	<script language="javascript" src="./js/gestionWEBSOCKET.js"></script>
	<script language="javascript" src="./js/dessiner.js"></script>
	<script src="/socket.io/socket.io.js"></script>
</head>
<!-- <body onload="gererWS();mettreAJourData();Clock()" > -->

<body onload="gererWS();Clock()" >
	<header>
		<img src="./images/logoCubeSA.jpg" alt=logoCubeSA width=50px height=50px align="left">
		Supervision chauffe eau solaire thermique
	</header>
	<!--Partie Navigation-->
	<nav>
		<p id="presentationVille"> Prévisions météorologiques</p>
	</nav>
	<!--Fin de la partie navigation-->

	<!--AFFICHAGE TEMPÉRATURE-->
	<aside id="TEMP"><div class="separation">	<a>Températures</a></div>
		<img src="./images/celsius.png" alt=celsius width=50px height=50px align="left" >
	</br>
</br>
<p id="nomMesure" position= "absolute" >Sonde 1: échangeur</p>
<p id="TemperatureSonde1" class="etiquette"></p>
</br>
</br>
<p id="nomMesure">Sonde 2 : ballon</p>
<p id="TemperatureSonde2" class="etiquette"></p>
</br>
</br>
<p id="nomMesure">Extérieure :</p>
<p id="Temperature" class="etiquette"></p>
</aside>
<!--AFFICHAGE INFORMATIONS VENT-->
<aside id="VENT">	<div class="separation"><a>Vent</a></div>
	<img src="./images/eolienne.gif " alt=éolienne width=50px height=50px align="left"  >	</br>
	<img src="./images/eolienne.gif " alt=éolienne width=30px height=30px align="left"  >
</br>
<p id="nomMesure">Vitesse :</p>
<p id="VitesseVent" class="etiquette"></p></br>
</br>
</br>
<p id="nomMesure">Direction :</p>
<p id="DirectionVent" class="etiquette"></p>
</aside>
<!--AFFICHAGE INFORMATION VOLET-->
<aside id="schemaVolet"> <div class="separation"><a>supervision</a></div>
</br>
<p id="nomMesure">R :</p>
<p id="varR" class="etiquette"></p>
</br></br>
<p id="nomMesure">Rmax :</p>
<p id="varRmax" class="etiquette"></p>
</br></br>
<p id="nomMesure">Rmin :</p>
<p id="varRmin" class="etiquette"></p>
</br></br>
<p id="nomMesure">T :</p>
<p id="varDeltaT" class="etiquette"></p>
</br></br>
<p id="nomMesure">Ton :</p>
<p id="varTon" class="etiquette"></p>
</br></br>
<p id="nomMesure">Toff :</p>
<p id="varToff" class="etiquette"></p>
</br></br>
<div>
	<!-- Insertion du canvas pour le dessin du toit -->
	<canvas id="myCanvas" width="350"	height="230";></canvas>
</br></br></br>
</div>

</aside>
<!--Fin de la partie aside-->

<!--Pied de page-->
<footer>
	<div>Lycée de Lattre de Tassigny 2019 		<p id="insererHorloge" ></p>
	</div>

</footer>
<!--Fin de pied de page-->
</body>
</html>
