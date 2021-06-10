//------------------------------------------------------------------
var http = require('http');
var requete = require('request');
var path = require('path');
var mysql = require('mysql');
var fs = require('fs');
const serialport=require("serialport");
const readline = require('@serialport/parser-readline');
const SP1=new serialport("/dev/ttyACM0",{
//baudrate
baudRate:9600
});



let apiKey = 'c96b92753ab4e8221464c9c1c4f0a675'; //APIKEY météo
let unites='metric';                             // système de mesure "métrique" ou impérial...
// let city = 'La Roche-sur-Yon';                   // Ville
let city = 'La Roche-sur-Yon';                   // Ville
var nomVille='La Roche sur Yon';
var temperature=0;
var humidite=0;
var tempSonde1=0;
var tempSonde2=0;
var id=0;
var horodatage;


//événement sur l'ouverture du port SP1
SP1.on('open', function () {
  console.log('Port com ouvert...')
})

let connexionBaseMesures=`use S;`;
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
  tempSonde1 = data.substr(0,4);
  tempSonde2 = data.substr(6,4);
  // --------  Construction de la requête MySQL pour l'insertion de la dernière mesure...
  let insertionMesure=`INSERT INTO METEO (ID, DATE, VILLE,TEMP, HUMIDITY)
  VALUES`+`('`+nomVille+`',now(),`+temperature+`,`+humidite+`);`;
  // -------- Requête MySQL pour l'insertion de la dernière mesure dans la BDD
  connexionSQL.query(insertionMesure, function(err, results, fields) {
     if (err) console.log('Problème lors de l\'insertion d\'une mesure dans la table tableMesures : '+err.message);
  });


       //création du parser "retour ligne"
       const parser = new readline();
       //On crée le flux SP1 ---> parser
       SP1.pipe(parser)
       //événement sur la reception de données sur le parser
       parser.on('data', function(data){

       	SP1.write('x');
 
        T1 = data.substr(0,3);
          T2 = data.substr(5,10);

       DeltaT = T1 - T2



       console.log("Tpanneau : "+T1)
       console.log("Tballon : "+T2)
       console.log("DeltaT : "+DeltaT)



       let insertionMesure=`INSERT INTO S (T1,T2)
       VALUES`+`('`+T1+`',`+T2+`);`;

       connexionSQL.query(insertionMesure, function(err, results, fields) {
         if (err) console.log('Erreur  '+err.message);
                                                                          });

});
