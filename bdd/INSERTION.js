//-----------------------------------MODULES------------------------------------
var http = require('http');//Créer un serveur HTTP
var fs2=require('fs');
var requete = require('request');
var path = require('path');
var mysql = require('mysql');
var fs = require('fs');

//------------------------DECLARATION VARIABLES METEOS--------------------------
var id=0;
var TEMP='0';
var UVI='0';
var DescCu='0';
var DescJ1='0';
var DescJ2='0';
var DescJ3='0';

//------------------------------CONNEXION BDDCUBE-------------------------------
var connexionBDD=`use BDDCube;`;
var connexionSQL = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "snir",
  database : "BDDCube"
});

//-------------------------PREPARATION FONCTION METEO---------------------------
function meteo(){

  let url = `https://api.openweathermap.org/data/2.5/onecall?lat=46.6667&lon=-1.4333&exclude=hourly&appid=c96b92753ab4e8221464c9c1c4f0a675`; //URL CALL API
  //let url = `https://api.openweathermap.org/data/2.5/onecall?lat=46.6667&lon=-1.4333&exclude=hourly,daily&appid=c96b92753ab4e8221464c9c1c4f0a675`; EXCLUDE les prévisions sur plusieurs jours

//----------------------------APPEL DE LA REQUETE-------------------------------
  requete(url, function (err, response, body) {//REQUETE QUI APELLE L'API
    //console.log(body);
    if(err){
      console.log('error:', err);
    } else {
      var meteo = JSON.parse(body) //récupération du JSON du call de l'API

//-----------IMPLEMENTATION DANS LES VARIABLES DEPUIS LE JSON-------------------
      ville='La Roche-Sur-Yon';
      TEMP=meteo.current.temp;
      TEMPC=TEMP-273.15; //CONVERT °F TO °C
      UVI=meteo.current.uvi;
      DescCu=meteo.daily[0].weather[0].description;
      DescJ1=meteo.daily[1].weather[0].description;
      DescJ2=meteo.daily[2].weather[0].description;
      DescJ3=meteo.daily[3].weather[0].description;

//--------------INSERTION DE SES VARIABLES DANS LA TABLE METEO------------------
      connexionSQL.query(`INSERT INTO METEO (VILLE,TEMP,UVI,DescCu,DescJ1,DescJ2,DescJ3) VALUES`+`('`+ ville +`',`+ TEMPC +`,`+ UVI +`,'`+ DescCu +`','`+ DescJ1 +`','`+ DescJ2 +`','`+ DescJ3 +`');` , function(error, results, fields) {
  if (error) throw error;
  process.exit();
  });
    }
  });
//process.exit();
}
//-----------------------APPEL DE LA FONCTION METEO-----------------------------
meteo();
