//------------------------------------------------------------------
var http = require('http');
var fs2=require('fs');
var requete = require('request');
var path = require('path');
var mysql = require('mysql');
var fs = require('fs');
var apiKey = 'c96b92753ab4e8221464c9c1c4f0a675'; //APIKEY météo
var unites='metric';                             // système de mesure "métrique" ou impérial...
// let city = 'La Roche-sur-Yon';                   // Ville
var city = 'La Roche-sur-Yon';                   // Ville
var nomVille='La Roche sur Yon';
var temperature=0;

var ville='La Roche sur Yon';
var TEMP='0';
var UVI='0';



var id=0;



var connexionBDD=`use BDDCube;`;
var connexionSQL = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "snir",
  database : "BDDCube"
});




//API METEO

function meteo(){

  //-------------------- préparation de l'url...  --------------------
  let url = `https://api.openweathermap.org/data/2.5/onecall?lat=46.6667&lon=-1.4333&exclude=hourly,daily&appid=c96b92753ab4e8221464c9c1c4f0a675`;
  //-------------------- appel de la requête -------------------------
  requete(url, function (err, response, body) {//appel de l'API
    console.log('test'+body);
    if(err){
      console.log('error:', err);
    } else {
      var meteo = JSON.parse(body) //récupération du JSON
      //---- sauvegarde des trois données météo dans 3 variables
      ville='La Roche sur Yon';
      TEMP=meteo.current.temp;
      TEMPC=TEMP-273.15;
      UVI=meteo.current.uvi;

      //----- debug
      let message = `Actuellement à ${ville}, il fait ${TEMPC} °C, l'indice UV est de ${UVI}`;
      console.log(message);               //message avec les datas extraites
      //--- fin debug
      connexionSQL.query(`INSERT INTO METEO (VILLE,TEMP,UVI) VALUES`+`('`+ ville +`',`+ TEMPC +`,`+ UVI +`);` , function(error, results, fields) {
  if (error) throw error;
  });
    }
  });

}
// ---------- Appel de l'API météo

meteo();
// --------  Construction de la requête MySQL pour l'insertion de la dernière mesure...

// -------- Requête MySQL pour l'insertion de la dernière mesure dans la BDD


// ----- on selectionne la dernière entrée (ORDER BY id DESC LIMIT 1) et on fabrique le fichier mesuresTotal.js
//connexionSQL.query("SELECT * FROM METEO ORDER BY id DESC LIMIT 1", function (err, result, fields) {
  //if (err) console.log('Problème d\'extraction des données de la table \"METEO\" :'+err.message);
  //console.log(result[0].id);
  //initialiserMesuresTotal(result[0].id, result[0].DATE, result[0].VILLE, result[0].TEMP, result[0].UVI);
//});






//);
