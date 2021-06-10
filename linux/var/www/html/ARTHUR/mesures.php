<?php
require_once "./pdo.php";

$query = $pdo->prepare("SELECT * FROM `S`");
$query->execute();

$data = $query->fetchAll();

$panneau = array_map(function($item){ return array("x" => strtotime($item["DATE"])*1000, "y" => (int)$item["T1"]); }, $data); // T1
$ballon = array_map(function($item){ return array("x" => strtotime($item["DATE"])*1000, "y" => (int)$item["T2"]); }, $data); // T2

?>
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

		<script>
			window.onload = function() {
				var panneau = <?php echo json_encode($panneau, JSON_NUMERIC_CHECK); ?>;
				var ballon = <?php echo json_encode($ballon, JSON_NUMERIC_CHECK); ?>;

				var chart = new CanvasJS.Chart("chartContainer", {
					zoomEnabled: true,
					axisX: {
						valueFormatString: "DD/MM"
					},
					axisY: {
						title: "Température",
						suffix: "°C"
					},
					toolTip: {
						shared: true
					},
					data: [
						{
							type: "line",
							name: "Panneau",
							xValueType: "dateTime",
							xValueFormatString: "HH:mm:ss",
							dataPoints: panneau
						},
						{
							type: "line",
							name: "Ballon",
							xValueType: "dateTime",
							dataPoints: ballon
						}
					]
				});

				chart.render();
			};
		</script>
	</head>
	<body>
		<a href="index.php">
			<img class= retour src=images/LogoSN.png alt=LogoSN align=right position=absolute style="width: 100px;"height: 80px />
		</a>

		<nav>
			<br />
			<p id="presentationVille"> Projet CUBE </p>
			<br />
			<a href="index.php">
			<img class= retour src=images/logoCubeSA.jpg alt=LogoSN align=right position=absolute style="width: 55px;"height: 55px /></a>
		</nav>

		<main>
			<div id="chartContainer" style="height: 370px; width: 100%;"></div>
		</main>

		<!--Début de pied de page-->
		<footer>
			<nav>
				<p id="presentationVille"> Projet CCF - Supervision chauffe-eau solaire </p>
			</nav>
		</footer>
		<!--Fin de pied de page-->

		<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
	</body>
</html>
