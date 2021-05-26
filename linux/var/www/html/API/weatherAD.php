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
  $username = 'ADMIN';
  $password = 'ADMIN' ;
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
  </div>
  <script lang="text/javascript">
    // future javascript
    function weatherBalloon( cityID ) {
  var key = '1c1e1e0bb151b9276325f35227431a36';
  fetch('https://api.openweathermap.org/data/2.5/weather?id=' + cityID+ '&appid=' + key)
	.then(function(resp) { return resp.json() }) // Convert data to json
	.then(function(data) {
		drawWeather(data); // Call drawWeather
	})
	.catch(function() {
		// catch any errors
	});
}

window.onload = function() {
  weatherBalloon( 3006767 ); //ID LRSY
}
function drawWeather( d ) {
	var celcius = Math.round(parseFloat(d.main.temp)-273.15);
	var fahrenheit = Math.round(((parseFloat(d.main.temp)-273.15)*1.8)+32);

	//document.getElementById('description').innerHTML = d.weather[0].description;
	document.getElementById('temp').innerHTML = celcius + '&deg;C';
	document.getElementById('location').innerHTML = d.name;
}
  </script>
</body>
</html>
