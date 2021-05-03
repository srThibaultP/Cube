<!DOCTYPE html>
<html>

<head>

	<meta charset="utf-8">

	<title>Cube SA</title>

	<link href="style/style.css" rel="stylesheet">
	<link rel="icon" type="image/jpg" href="images/logoCubeSA.jpg" />
	<link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A==" crossorigin="" />

	<script language="javascript" src="js/horloge.js"></script>
	<script language="javascript" src="js/gestionWEBSOCKET.js"></script>
	<script language="javascript" src="js/dessiner.js"></script>
	<script language="javascript" src="js/modification.js"></script>
	<script src="socket.io/socket.io.js"></script>
	<link href="style/api.css" rel="stylesheet">
</head>
<!-- <body onload="gererWS();mettreAJourData();Clock()" > -->

<body onload="gererWS();Clock()">

	<a href="index.php">
		<img class=retour src=images/LogoSN.png alt=LogoSN align=right position=absolute style="width: 100px;" height: 80px /></a>

	<nav>
		<br>
		<p id="presentationVille"> Projet CUBE </p>
		<br>
		<a href="index.php">
			<img class=retour src=images/logoCubeSA.jpg alt=LogoSN align=right position=absolute style="width: 55px;" height: 55px /></a>
		<!--Début de pied de page-->
		<footer>
			<nav>
				<p id="presentationVille"> Projet CCF - Supervision chauffe-eau solaire </p>
			</nav>
		</footer>
		<!--Fin de pied de page-->
</body>

</html>