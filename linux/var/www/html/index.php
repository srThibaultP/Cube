<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<title>Cube SA</title>
	<link href="css/style.css" rel="stylesheet">
	<script src="/socket.io/socket.io.js"></script>
	<script src="./js/edit.js"></script>
	<script src="/js/status.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
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
	</script>
	<header>
		<img src="./images/logoCubeSA.jpg" alt=logoCubeSA width=50px height=50px align="left">
		cube
	</header>


	<aside id="parametres">
		<br>
		<form>
			<label>delta Ton</label>
			<input type="number" id="dton" min="0" max="999">
			<input type="button" value="Modifier" onClick="sendData('dton')">
		</form>
		<form>
			<label>delta Toff</label>
			<input type="number" id="dtoff" min="0" max="999">
			<input type="button" value="Modifier" onClick="sendData('dtoff')">
		</form>
		<form>
			<label>Rmin</label>
			<input type="number" id="rmin" min="0" max="999">
			<input type="button" value="Modifier" onClick="sendData('rmin')">
		</form>

		<script>
			$(function() {

				// Installation d'un écouteur sur le slider
				var slider = document.getElementById('lightSlider');
				slider.addEventListener('input', function() {
						setFade(slider.value);
				});

				var setFade = function (fadeValue) {
						// La valeur lue dans le slider est convertie en caractère
						var fadeAscii = String.fromCharCode(fadeValue);
						// ... affichée sous le curseur
						$('#log').html(fadeValue+" %");
						// ... puis envoyée au serveur Node
						socket.emit('dton', fadeValue);
						console.log(fadeValue);
				}
				// Initialisation
				setFade(0);
			});
		</script>

					<tr>
				<td><input id="lightSlider" type="range" min="0" max="100" value="0" /></td>
			</tr>
			<tr>
				<td id="log">0 %</td>
			</tr>



	</aside>
	<!--AFFICHAGE INFORMATION VOLET-->

	<aside id="affichage">
	<h1 id="status">STATUS</h1>
		<div>
			<label>dt=</label>
			<label id="dt">dt</label>
		</div>
		<div>
			<label>dton=</label>
			<label id="Dton">dton</label>
		</div>
		<div>
			<label>dtoff=</label>
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
			<label>Rmin=</label>
			<label id="Rmin">Rmin</label>
		</div>
		<div>
			<label>T1=</label>
			<label id="T1">T1</label>
		</div>
		<div>
			<label>T2=</label>
			<label id="T2">T2</label>
		</div>
		<div>
		<label>ID=</label>
		<label id="ID">ID</label>
		<p>Bonjour. Souhaitez-vous consulter <a href="page2.html">la page 2</a> ?</p>
		</div>
	</aside>
	<!--Fin de la partie aside-->

</body>

</html>
