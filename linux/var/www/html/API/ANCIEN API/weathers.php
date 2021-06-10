<!doctype html>
<html lang="fr">
<head>
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,900" rel="stylesheet">
  <meta charset="utf-8">
  <title>API METEO</title>
  <link rel="stylesheet" style="text/css" href="style.css" />
</head>
<body>



  <?php
  $servername = 'localhost';
  $username = 'root';
  $password = 'snir' ;
  try {
    $conn = new PDO("mysql:host=$servername; dbname=BDDCube", $username, $password);
    echo 'Connexion réussie!';
  }
  catch(PDOExeption $e){
    echo "Erreur : " . $e->getMessage();
  }
   ?>



  <div id="weather">
    <div id="description"></div>
    <h1 id="temp"></h1>
    <div id="location"></div>
    <div id="uvi"></div> <!--Nouveau-->
  </div>
  <script lang="text/javascript">
    // future javascript
    function weatherBalloon( cityID ) {
  //var key = '1c1e1e0bb151b9276325f35227431a36';
  //fetch('https://api.openweathermap.org/data/2.5/weather?id=' + cityID+ '&appid=' + key)
    fetch('https://api.openweathermap.org/data/2.5/onecall?lat=46.6667&lon=-1.4333&exclude=hourly,daily&appid=c96b92753ab4e8221464c9c1c4f0a675')<!--Nouveau-->
	.then(function(resp) { return resp.json() }) // Convert data to json
	.then(function(data) {
		drawWeather(data); // Call drawWeather
	})
	.catch(function() {
		// catch any errors
	});
}

window.onload = function() { //appel lien API
weatherBalloon( 3006767 ); //ID LRSY useless
}
function drawWeather( d ) {
	var celcius = Math.round(parseFloat(d.main.temp)-273.15);
	var fahrenheit = Math.round(((parseFloat(d.main.temp)-273.15)*1.8)+32);

	document.getElementById('description').innerHTML = d.weather[0].description;
	document.getElementById('temp').innerHTML = celcius + '&deg;C';
	document.getElementById('location').innerHTML = d.name;
	document.getElementById('uvi').innerHTML = d.current.uvi;<!--Nouveau-->
}
  </script>
</body>
</html>
