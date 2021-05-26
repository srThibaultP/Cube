<?php
$conn = new mysqli("localhost", "root", "snir", "BDDCube");
$sql = "SELECT * FROM REGULATION INNER JOIN S";
$result = $conn->query($sql);
$row = $result->fetch_assoc();
//var_dump($row);
?>

<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<title>Cube SA</title>
	<link href="css/style.css" rel="stylesheet">
	<script src="/socket.io/socket.io.js"></script>
	<script src="js/edit.js"></script>
	<script src="js/status.js"></script>
	<script src="js/jquery.min.js"></script>
</head>

<body>
	<script>
		const socket = io();
		socket.on('status', function(msg) {
			status(msg)
		});
		socket.on('mysqlData', function(msg) {
			mysqlData(msg);
		});
		socket.on('customData', function(msg) {
			customData(msg);
		});
		socket.on('dton', function(msg) {
			updatedton(msg);
		});
		socket.on('dtoff', function(msg) {
			updatedtoff(msg);
		});
		socket.on('rmin', function(msg) {
			updatermin(msg);
		});
		socket.on('dt', function(msg) {
			updatedt(msg);
		});
		socket.on('Tpanneau', function(msg) {
			updateTpanneau(msg);
		});
		socket.on('Tballon', function(msg) {
			updateTballon(msg);
		});
		socket.on('statusCirculateur', function(msg) {
			statusCirculateur(msg);
		});
	</script>
	<header>
		<img src="./images/logoCubeSA.jpg" alt=logoCubeSA width=50px height=50px align="left">
		cube
	</header>


	<aside id="parametres">
		<script>
			$(function() {
				var slider = document.getElementById('dtonSlider');
				slider.addEventListener('input', function() {
					setFade(slider.value);
				});

				var setFade = function(fadeValue) {
					socket.emit('dton', fadeValue);
				}
				setFade(<?php echo $row["Dton"]; ?>);
			});

			$(function() {
				var slider = document.getElementById('dtoffSlider');
				slider.addEventListener('input', function() {
					setFade(slider.value);
				});

				var setFade = function(fadeValue) {
					socket.emit('dtoff', fadeValue);
				}
				setFade(<?php echo $row["Dtoff"]; ?>);
			});

			$(function() {
				var slider = document.getElementById('rminSlider');
				slider.addEventListener('input', function() {
					setFade(slider.value);
				});

				var setFade = function(fadeValue) {
					socket.emit('rmin', fadeValue);
				}
				setFade(<?php echo $row["Rmin"]; ?>);
			});

			$(function() {
				var slider = document.getElementById('TpanneauSlider');
				slider.addEventListener('input', function() {
					setFade(slider.value);
				});

				var setFade = function(fadeValue) {
					socket.emit('Tpanneau', fadeValue);
				}
				setFade(<?php echo $row["T1"]; ?>);
			});

			$(function() {
				var slider = document.getElementById('TballonSlider');
				slider.addEventListener('input', function() {
					setFade(slider.value);
				});

				var setFade = function(fadeValue) {
					socket.emit('Tballon', fadeValue);
				}
				setFade(<?php echo $row["T2"]; ?>);
			});
			
		</script>

		<tr>
			<td><input id="dtonSlider" type="range" min="0" max="100" value="0" /></td>
		</tr>
		<tr>
			<td>delta Ton</td>
		</tr>
		<tr>
			<td><input id="dtoffSlider" type="range" min="0" max="100" value="0" /></td>
		</tr>
		<tr>
			<td>delta Toff</td>
		</tr>
		<tr>
			<td><input id="rminSlider" type="range" min="0" max="100" value="0" /></td>
		</tr>
		<tr>
			<td>Rmin</td>
		</tr>
		<p>Sondes</p>
		<tr>
			<td><input id="TpanneauSlider" type="range" min="0" max="100" value="0" /></td>
		</tr>
		<tr>
			<td>Tpanneau</td>
		</tr>
		<tr>
			<td><input id="TballonSlider" type="range" min="0" max="100" value="0" /></td>
		</tr>
		<tr>
			<td>Tballon</td>
		</tr>

	</aside>
	<!--AFFICHAGE INFORMATION VOLET-->

	<aside id="affichage">
		<h1 id="statusCirculateur">STATUS DU SYSTEME</h1>
		<div>
			<label>CALCUL DES SONDES T1 - T2 dt=</label>
			<label id="dt">dt</label>
		</div>
		<div>
			<label>SLIDER dton=</label>
			<label id="Dton">dton</label>
		</div>
		<div>
			<label>SLIDER dtoff=</label>
			<label id="Dtoff">dtoff</label>
		</div>
		<div>
			<label>R=</label>
			<label id="R">R</label>
		</div>
		<div>
			<label>Rmax=</label>
			<label id="Rmax">Rmax</label>
		</div>
		<div>
			<label>CALCUL 30% DE Rmax SLIDER Rmin=</label>
			<label id="Rmin">Rmin</label>
		</div>
		<div>
			<label>Tpanneau (T1)=</label>
			<label id="T1">T1</label>
		</div>
		<div>
			<label>Tballon (T2)=</label>
			<label id="T2">T2</label>
		</div>
	</aside>
	<!--Fin de la partie aside-->

</body>

</html>