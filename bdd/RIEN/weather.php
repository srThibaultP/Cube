<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Current Weather</title>
</head>
<body>
  <?php
  $servername = 'localhost';
  $username = 'root';
  $password = '';
  try {
    $conn = new PDO("mysql:host=$servername; dbname=BDDCube", $username, $password);
    echo 'Connection réussie!';
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
  function weatherBalloon( cityID ) {
var key = '1c1e1e0bb151b9276325f35227431a36';
fetch('https://api.openweathermap.org/data/2.5/onecall?id=' + cityID+ '&appid=' + key)
.then(function(resp) { return resp.json() }) // Convert data to json
.then(function(data) {
  console.log(data);
})
.catch(function() {
  // catch any errors
});
}

window.onload = function() {
weatherBalloon( 6167865 );
}
  </script>
</body>
</html>
