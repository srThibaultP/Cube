<script src="http://code.jquery.com/jquery-1.6.1.min.js"></script>
    <script src="http://code.jquery.com/ui/1.10.2/jquery-ui.min.js"></script>
  <style type="text/css">]</style>
    <link rel="stylesheet" href="style/api.css" />
    <meta charset="utf-8">
</head>
<body>
  <!--<FONT face="arial">-->
  <?php
            $servername = 'localhost';
            $username = 'WEB';
            $password = 'snir';

            //On essaie de se connecter
            try{
                $conn = new PDO("mysql:host=$servername;dbname=BDDCube", $username, $password);
                //On définit le mode d'erreur de PDO sur Exception
                $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                echo 'Connexion réussie';
            }

            /*On capture les exceptions si une exception est lancée et on affiche
             *les informations relatives à celle-ci*/
            catch(PDOException $e){
              echo "Erreur : " . $e->getMessage();
            }

  <div class="app-wrap">
    <header>
      <p>&ensp; &ensp; &ensp; &ensp; &ensp;
        <div id="location"><input type="text" name="location" placeholder="Entrez la ville">
          <input type="button" value="GO"<div id="weatherLocation"></div>
        </p>
      </header>
      <main>
        <section class="location">
          <div class="showCity"></div>
        </section>
        <section class="current">
          <div class="showTemp"></div>
          <div class="showHumidity"></div>
        </section>

        <script type="text/javascript">
        $(document).ready(function() {
          $('#weatherLocation').click(function() {
            var city = $('input:text').val();
            let request = new XMLHttpRequest();
            let url = `http://api.openweathermap.org/data/2.5/weather?q=${city}&units=metric&appid=c96b92753ab4e8221464c9c1c4f0a675`;


            request.onreadystatechange = function() {
              if (this.readyState === 4 && this.status === 200) {
                let response = JSON.parse(this.responseText);
                getElements(response);
              }
            }

            request.open("GET", url, true);
            request.send();

            getElements = function(response) {
              $('.showCity').text(`${city}`);
              $('.showTemp').text(`${response.main.temp} °C`);
              $('.showHumidity').text(`${response.main.humidity}% d'humidité`);

            }
          });
        });
      </script>
      <!--</FONT>-->
    </main>
