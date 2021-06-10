<!DOCTYPE html>
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

		<?php
		require_once "./pdo.php";
		$query = $pdo->prepare("SELECT * FROM `HeureOccupation` WHERE id = 1");
		$value = $query->execute();
		echo("<h1>"+$value+"</h1>");

		/*
		if ( isset($_POST) ){
			if($_POST["action"] == "create"){
			$query = $pdo->prepare("INSERT INTO `HeureOccupation` (`DEBUT`, `FIN`) VALUES ( :debut, :fin)");
			$query->execute(['debut' => $_POST["start_date"],
				'fin' => $_POST["end_time"],
				'dateajout' => date('Y/m/d', time()),
				'nom' => $_POST["nom"]
			]);}else if ($_POST["action"] == "delete"){
			$query = $pdo->prepare("DELETE FROM `HeureOccupation` WHERE `ID` = :id");
		    $query->execute(['id' => $_POST["row_id"]]);
			}
		}

		*/
		?>
		<a href="index.php">
		<img class= retour src=images/LogoSN.png alt=LogoSN align=right position=absolute style="width: 100px;"height: 80px /></a>

		<nav>
			<br>
			<p id="presentationVille"> Projet CUBE </p>
<br>

			<a href="index.php">
			<img class= retour src=images/logoCubeSA.jpg alt=LogoSN align=right position=absolute style="width: 55px;"height: 55px /></a>
		</nav>

		<p>Lundi</p>
					<form action="" method="post">
				 	<label for="start_hours">Heure de début</label>
				 	<input type="time" name="start_hours">
				 	<br>
				 	<label for="end_hours">Heure de fin</label>
				 	<input type="time" name="end_hours">
				 </form>


				 <?php
 $query = $pdo->prepare("SELECT * FROM `HeureOccupation`");
     $query->execute();
     $row = $query->fetchAll();

     if (empty($row)) {
         msg("Wrong email or password");
     }
     foreach ($row as $r) {
 	echo "<tr>";
 	echo "<td>". $r["HeureDebut"] ."</td>";
 	echo "<td>". $r["HeureFin"] ."</td>";

 	echo "<td><form action=\"\" method=\"post\" ><input type=\"hidden\" name=\"action\" value=\"delete\"><input type=\"hidden\" name=\"row_id\" value=\"". $r["ID"] ."\"><input type=\"submit\" value=\"Delete\"></form>";
 	echo"			    </tr>";

         }

 ?>
      <!--Début de pied de page-->
<footer>
			<nav>
				<p id="presentationVille"> Projet CCF - Supervision chauffe-eau solaire </p>
			</nav>
</footer>
	<!--Fin de pied de page-->
	</body>
</html>
