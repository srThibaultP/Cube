<!DOCTYPE html>

<?php

require_once "./pdo.php";
if ( isset($_POST) ){
	if($_POST["action"] == "create"){
	$query = $pdo->prepare("INSERT INTO `HeureOccupation` (`DEBUT`, `FIN`, `HEUREAJOUT`, `NOM`) VALUES ( :debut, :fin, :heureajout, :nom )");
	$query->execute(['debut' => $_POST["start_time"],
		'fin' => $_POST["end_time"],
		'heureajout' => time('Y/m/d H:i:s O', time()),
		'nom' => $_POST["nom"]
	]);}else if ($_POST["action"] == "delete"){
	$query = $pdo->prepare("DELETE FROM `HeureOccupation` WHERE `ID` = :id");
    $query->execute(['id' => $_POST["row_id"]]);
	}
}


?>

<html>
	<head>

		<meta charset="utf-8">

		<title>Cube SA</title>

		<link href="style/style.css" rel="stylesheet" >
		<link rel="icon" type="image/jpg" href="images/logoCubeSA.jpg" />
		<link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A==" crossorigin=""/>

		<script language="javascript" src="js/horloge.js" ></script>
		<script language="javascript" src="js/gestionWEBSOCKET.js"></script>
		<script language="javascript" src="js/dessiner.js"></script>
		<script language="javascript" src="js/modification.js"></script>
		<script src="socket.io/socket.io.js"></script>
	<link href="style/api.css" rel="stylesheet" >
	</head>
	<!-- <body onload="gererWS();mettreAJourData();Clock()" > -->

	<body onload="gererWS();Clock()" >

		<a href="index.php">
		<img class= retour src=images/LogoSN.png alt=LogoSN align=right position=absolute style="width: 100px;"height: 80px /></a>

		<nav>
			<br>
			<p id="presentationVille"> Projet CUBE </p>
			<br>
			<a href="index.php">
			<img class= retour src=images/logoCubeSA.jpg alt=LogoSN align=right position=absolute style="width: 55px;"height: 55px /></a>
      <!--Début de pied de page-->

		</nav>


		<main>
			 <form action="" method="post">
				<label for="start_time">Heure de début</label>
				<input type="time" name="start_time">
				<br>
				<label for="end_time">Heure de fin</label>
				<input type="time" name="end_time">
				<label for="nom">Nom</label>
				<input name="nom">
				<input type="submit">
				<input type="hidden" name="action" value="create">
			</form>
			<table>
				<thead>
				  <tr>
				    <th>Nom</th>
				    <th>Heure de début</th>
				    <th>Heure de fin</th>
				    <th>Heure de création</th>
				    <th></th>
				  </tr>
				</thead>
				<tbody>
				<?php
$query = $pdo->prepare("SELECT * FROM `HeureOccupation`");
    $query->execute();
    $row = $query->fetchAll();

    if (empty($row)) {
        msg("Wrong email or password");
    }
    foreach ($row as $r) {
	echo "<tr>";
	echo "<td>". $r["NOM"] ."</td>";
	echo "<td>". $r["DEBUT"] ."</td>";
	echo "<td>". $r["FIN"] ."</td>";
	echo "<td>". $r["HEUREAJOUT"] ."</td>";
	echo "<td><form action=\"\" method=\"post\" ><input type=\"hidden\" name=\"action\" value=\"delete\"><input type=\"hidden\" name=\"row_id\" value=\"". $r["ID"] ."\"><input type=\"submit\" value=\"Delete\"></form>";
	echo"			    </tr>";

        }

?>				</tbody>
			</table>
		</main>

<footer>
			<nav>
				<p id="presentationVille"> Projet CCF - Supervision chauffe-eau solaire </p>
			</nav>
</footer>
	<!--Fin de pied de page-->
	</body>
</html>
