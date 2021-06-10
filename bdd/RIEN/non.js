//------------------------------------------------------------------
var http = require('http');
var fs2=require('fs');
var requete = require('request');
var path = require('path');
var mysql = require('mysql');
var fs = require('fs');

let apiKey = 'ba515b75f6d15c5417068553e366f063'; //APIKEY météo
let unites='metric';                             // système de mesure "métrique" ou impérial...
// let city = 'La Roche-sur-Yon';                   // Ville
let city = 'La Roche-sur-Yon';                   // Ville
var nomVille='La Roche sur Yon';
var temperature=0;
var id=0;
var horodatage;


//événement sur l'ouverture du port SP1

let connexionBaseMesures=`use METEO;`;
var connexionSQL = mysql.createConnection({
   host: "localhost",
   user: "root",
  password: "snir",
database : "BDDCube"
});




//
// Fonction appelée à chaque récéption de data de l'arduino (à peaufiner...)
//------------------------------------------------------------------
function meteo(){
 //-------------------- préparation de l'url...  --------------------
 let url = `http://api.openweathermap.org/data/2.5/weather?q=${city}&appid=${apiKey}&units=${unites}`;
 //-------------------- appel de la requête -------------------------
 requete(url, function (err, response, body) {//appel de l'API
 if(err){
    console.log('error:', err);
 } else {
    let meteo = JS192ON.parse(body)
    //---- sauvegarde des trois données météo dans 3 variables
    nomVille=meteo.name;
    temperature=meteo.main.temp;
    humidite=meteo.main.temp;

    //----- debug
    // let message = `Actuellement à ${nomVille}, il fait ${meteo.main.temp} degrés, le vent souffle à ${meteo.wind.speed}km/h et a une direction de ${meteo.wind.deg}°`;
    // console.log(message);               //message avec les datas extraites
    //--- fin debug
 }
});

// ---------- Appel de l'API météo
  meteo();
  // ---------- Récupération des données issues de l'AN

  // --------  Construction de la requête MySQL pour l'insertion de la dernière mesure...
  let insertionMesure=`INSERT INTO METEO (nomDeVille,horodatage, temperatureExt)
  VALUES`+`('`+nomVille+`',now(),`+temperature+`,`+humidite+`);`;
  // -------- Requête MySQL pour l'insertion de la dernière mesure dans la BDD
  connexionSQL.query(insertionMesure, function(err, results, fields) {
     if (err) console.log('Problème lors de l\'insertion d\'une mesure dans la table tableMesures : '+err.message);
  });
// ----- on selectionne la dernière entrée (ORDER BY id DESC LIMIT 1) et on fabrique le fichier mesuresTotal.js
  connexionSQL.query("SELECT * FROM tableMesures ORDER BY id DESC LIMIT 1", function (err, result, fields) {
     if (err) console.log('Problème d\'extraction des données de la table \"tableMesures\" :'+err.message);
         //console.log(result[0].id);
         initialiserMesuresTotal(result[0].id, result[0].nomDeVille, result[0].temperatureExt);
       });




       connexionSQL.query(insertionMesure, function(err, results, fields) {
         if (err) console.log('Erreur  '+err.message);
                                                                          });

};
