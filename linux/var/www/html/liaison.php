<!doctype html>
<html lang="fr">
<head>
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,900" rel="stylesheet">
  <meta charset="utf-8">
  <title>API METEO</title>
  <link rel="stylesheet" style="text/css" href="style.css" />
</head>
<body>
  <div id="weather">
    <div id="description"></div>
    <h1 id="temp"></h1>
    <div id="location"></div>
    <div id="uvi"></div>
  </div>
  <script lang="text/javascript">
    // future javascript
    function weatherBalloon( cityID ) {
  var key = '1c1e1e0bb151b9276325f35227431a36';
  //fetch('https://api.openweathermap.org/data/2.5/weather?id=' + cityID+ '&appid=' + key)
  fetch('https://api.openweathermap.org/data/2.5/onecall?lat=46.6667&lon=-1.4333&exclude=hourly,daily&appid=c96b92753ab4e8221464c9c1c4f0a675')
  .then(function(resp) { return resp.json() }) // Convert data to json
  .then(function(data) {
    drawWeather(data); // Call drawWeather
    log(data);
  })
  .catch(function() {
    // catch any errors
  });
 }

 window.onload = function() {
  weatherBalloon( 3006767 ); //ID LRSY
 //  weatherBalloon( 5128581 ); New York

 }
 function drawWeather( d ) {
  var celcius = Math.round(parseFloat(d.current.temp)-273.15);
  var fahrenheit = Math.round(((parseFloat(d.current.temp)-273.15)*1.8)+32);

  document.getElementById('description').innerHTML = d.current.weather[0].description;
  document.getElementById('temp').innerHTML = celcius + '&deg;C';
  document.getElementById('location').innerHTML = d.timezone;
  document.getElementById('uvi').innerHTML = d.current.uvi;
 }
  </script>
  <?php
// déclaration des variable de connexion à la BDD
$servername = 'localhost';
$username = 'root';
$password = 'snir';
$insert = "INSERT INTO METEO (DATE, VILLE, TEMP, UVI) VALUES "
// Tentative de connection en PDO
try {
  $conn = new PDO("mysql:host=$servername; dbname=BDDCube", $username, $password);
  echo 'Connection réussie!'; //si
}
catch(PDOExeption $e){
  echo "Erreur : " . $e->getMessage();
}
 ?>
</body>
</html>
