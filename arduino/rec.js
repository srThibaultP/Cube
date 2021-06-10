var fs = require('fs');
var mysql = require('mysql');
const serialport=require("serialport");
const readline = require('@serialport/parser-readline');
const SP1=new serialport("/dev/ttyACM0",{
//baudrate
baudRate:9600
});

//événement sur l'ouverture du port SP1
SP1.on('open', function () {
  console.log('Port com ouvert...')
})

let connexionBaseMesures=`use S;`;
var connexionSQL = mysql.createConnection({
  host: "Localhost",
   user: "ARDUINO",
  password: "snir",
database : "BDDCube"
});

connexionSQL.connect(function(err) {
 if (err) throw err;
  console.log("Connected!");
});

//création du parser "retour ligne"
const parser = new readline();
//On crée le flux SP1 ---> parser
SP1.pipe(parser)
//événement sur la reception de données sur le parser
parser.on('data', function(data){

	SP1.write('x');

 T1 = data.substr(0,3);
   T2 = data.substr(6,10);




console.log("Tpanneau : "+T1)
console.log("Tballon : "+T2)




let insertionMesure=`INSERT INTO S (T1,T2)
VALUES`+`('`+T1+`',`+T2+`);`;

connexionSQL.query(insertionMesure, function(err, results, fields) {
  if (err) console.log('Erreur  '+err.message);
  });
});
