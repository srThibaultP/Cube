var fs = require('fs');
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



//création du parser "retour ligne"  
const parser = new readline();
//On crée le flux SP1 ---> parser
SP1.pipe(parser)
//événement sur la reception de données sur le parser
parser.on('data', function(data){
	console.log(data);
test_data = data.replace(/\n|\r/g,'');
	fs.writeFile('/home/pi/Desktop/Jaouen/var.json', "data_sonde_json = ['"+test_data+"'];", function (err) { // Ecriture dans le fichier JSON
                    if (err) return console.log(err);
                    //console.log('ECRITURE SONDE JSON OK');
                  });
	SP1.write('x');


connexionSQL.connect(function(err) {
   if (err) return console.error('Problème de connexion à la base de donnée : ' + err.message);
   else {
      console.log('connexion au serveur MySQL :                    ok');
      // ----------------- Connexion à la base de données "mesures"
      connexionSQL.query(connexionBaseS, function(err, results, fields) {
         if (err) console.log('Problème lors de la connexion à la base de données mesures : '+err.message);
         console.log('connexion à la base de donnée \"s\":        ok');
      });
    
let creationtableMesures = `create table if not exists tableS(
   id int primary key auto_increment,
   T1 smallint(1) not null default 0,
   T2 smallint(1) not null default 0,
)`;


  connexionSQL.query(creationtableMesures, function(err, results, fields) {
         if (err) console.log('Problème lors de la création de la table tableS : '+err.message);
      });
   }
});



})