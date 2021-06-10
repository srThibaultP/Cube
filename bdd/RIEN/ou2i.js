//------------------------------------------------------------------
var http = require('http');
var fs2=require('fs');
var requete = require('request');
var path = require('path');
var mysql = require('mysql');
var fs = require('fs');
var mysql = require('mysql');

let apiKey = 'c96b92753ab4e8221464c9c1c4f0a675'; //APIKEY météo
let unites='metric';                             // système de mesure "métrique" ou impérial...
// let city = 'La Roche-sur-Yon';                   // Ville
let city = 'La Roche-sur-Yon';                   // Ville
var nomVille='La Roche sur Yon';
var temperature=0;

var UVI=0;

var id=0;



let connexionBaseMesures=`use BDDCube;`;
var connexionSQL = mysql.createConnection({
   host: "localhost",
   user: "root",
  password: "snir",
database : "BDDCube"
});




API METEO
//
// Fonction appelée à chaque récéption de data de l'arduino (à peaufiner...)
//------------------------------------------------------------------
function meteo(){
 //-------------------- préparation de l'url...  --------------------
 let url = `https://api.openweathermap.org/data/2.5/onecall?lat=46.6667&lon=-1.4333&exclude=hourly,daily&appid=c96b92753ab4e8221464c9c1c4f0a675`;
 //-------------------- appel de la requête -------------------------
 requete(url, function (err, response, body) {//appel de l'API
 if(err){
    console.log('error:', err);
 } else {
    let meteo = JSON.parse(body)
    //---- sauvegarde des trois données météo dans 3 variables
    VILLE="La Roche sur Yon";
    TEMP=current.temp;
    UVI=current.uvi;

    //----- debug
    // let message = `Actuellement à ${nomVille}, il fait ${meteo.main.temp} degrés, le vent souffle à ${meteo.wind.speed}km/h et a une direction de ${meteo.wind.deg}°`;
    // console.log(message);               //message avec les datas extraites
    //--- fin debug
 }
});

// ---------- Appel de l'API météo
  meteo();
  // --------  Construction de la requête MySQL pour l'insertion de la dernière mesure...
  let insertionMesure=`INSERT INTO METEO (DATE, VILLE, TEMP, UVI)
  VALUES`+`(now(),`+VILLE+`,`+TEMP+`,`+UVI+`);`;
  // -------- Requête MySQL pour l'insertion de la dernière mesure dans la BDD
  connexionSQL.query(insertionMesure, function(err, results, fields) {
     if (err) console.log('Problème lors de l\'insertion d\'une mesure dans la table tableMesures : '+err.message);
  });
// ----- on selectionne la dernière entrée (ORDER BY id DESC LIMIT 1) et on fabrique le fichier mesuresTotal.js
  connexionSQL.query("SELECT * FROM METEO ORDER BY id DESC LIMIT 1", function (err, result, fields) {
     if (err) console.log('Problème d\'extraction des données de la table \"tableMesures\" :'+err.message);
         //console.log(result[0].id);
         initialiserMesuresTotal(result[0].id, result[0].DATE, result[0].VILLE, result[0].TEMP, result[0].UVI);
       });





};//);
