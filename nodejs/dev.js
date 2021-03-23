//--CODE CAPTEUR
var DeltaT = 0;
const serialport=require("serialport");
const readline = require('@serialport/parser-readline');
const SP1=new serialport("/dev/ttyACM0",{
baudRate:115200
});
// CODE CAPTEUR--

const config = require("./config.json");
const express = require("express");
const mysql = require("mysql");
const MySQLEvents = require("@rodrigogs/mysql-events");
const server = require("http").Server(express);
const io = require("socket.io")(server, config.cors);
var pool = mysql.createPool(config.mysql);

//événement sur l'ouverture du port SP1
SP1.on('open', function () {
  console.log('Port com ouvert...')
})

server.listen(config.port, function () {
  console.log("Serveur WebSocket disponible sur localhost:" + config.port);
});


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

const dbevent = async () => {
  const instance = new MySQLEvents(pool, {
    startAtEnd: true,
  });

  await instance.start();

  instance.addTrigger({
    name: "monitoring all statments",
    expression: config.mysql.database,
    statement: MySQLEvents.STATEMENTS.ALL,
    onEvent: (e) => {
      clientWebUpdate();
    },
  });

  instance.on(MySQLEvents.EVENTS.CONNECTION_ERROR, console.error);
  instance.on(MySQLEvents.EVENTS.ZONGJI_ERROR, console.error);
};

dbevent().catch(console.error);

io.on("connection", (socket) => {
  console.log(`Connecté au client ${socket.id}`);
  io.emit("status", "Connecté au serveur WebSocket");
  clientWebUpdate();
  receptionClientInput(socket);
  circulateur10pcrequalrmax();
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

//Affichage des data de l'arduino
/*
console.log("Tpanneau : "+T1)
console.log("Tballon : "+T2)
console.log("DeltaT : "+DeltaT)
*/


let insertionMesure=`INSERT INTO S (T1,T2)
VALUES`+`('`+T1+`',`+T2+`);`;

connexionSQL.query(insertionMesure, function(err, results, fields) {
  if (err) console.log('Erreur  '+err.message);
  });
});


// FONCTIONS

function clientWebUpdate() {
  pool.getConnection(function (err, connection) {
    //if (err) throw err; //Pas de connection
    connection.query(
      "SELECT REGULATION.*, S.* FROM REGULATION INNER JOIN S ORDER BY S.ID DESC LIMIT 1",
      function (err, result) {
        deltat = result[0].T1 - result[0].T2; //ΔT : la différence de température entre T1, la température de sonde « capteur thermique » S1 et T2, la température de la « sonde ballon » S2.
        Rmax = result[0].Rmin * 0.7;
        io.emit("mysqlData", result);
        io.emit("customData", {
          dt : deltat,
          R : 9600,
          Rmax : Rmax
        })
        connection.release();
      }
    );
  });
}

function variablesRegulation() {
  pool.getConnection(function (err, connection) {
    if (err) throw err;
    connection.query(
      "SELECT S.*, REGULATION.* FROM S INNER JOIN REGULATION ORDER BY S.ID DESC LIMIT 1",
      function (err, data) {
        io.emit("mysqlData", data);
      }
    );
  });
}

function circulateur10s1m() {
  pool.getConnection(function (err, connection) {
    if (err) throw err;
    connection.query(
      "SELECT S.*, REGULATION.* FROM S INNER JOIN REGULATION ORDER BY S.ID DESC LIMIT 1",
      function (err, data) {
        data = data[0];
        deltat = data.T1 - data.T2; //ΔT : la différence de température entre T1, la température de sonde « capteur thermique » S1 et T2, la température de la « sonde ballon » S2.
        if (deltat > data.Dton) {
          //Le circulateur est mis en marche à R=Rmax pendant 10 secondes, puis à R=Rmin pendant 1 minute.
          console.log(
            "Le circulateur est mis en marche à R=Rmax pendant 10 secondes, puis à R=Rmin pendant 1 minute."
          );
          circulateurStatus = 1;
        }
      }
    );
  });
}

function circulateur10pcrequalrmax() {
  pool.getConnection(function (err, connection) {
    if (err) throw err;
    connection.query(
      "SELECT S.*, REGULATION.* FROM S INNER JOIN REGULATION ORDER BY S.ID DESC LIMIT 1",
      function (err, data) {
        data = data[0];
        deltat = data.T1 - data.T2; //ΔT : la différence de température entre T1, la température de sonde « capteur thermique » S1 et T2, la température de la « sonde ballon » S2.
        if (deltat > 10) {
          //R=R + 10% toutes les minutes jusqu'à R=Rmax.
          console.log("R=R + 10% toutes les minutes jusqu'à R=Rmax.");
          while (data.R != data.Rmax) {
            circulateur = circulateur * 1.1;
          }
        }
      }
    );
  });
}

function circulateuroff() {
  pool.getConnection(function (err, connection) {
    if (err) throw err;
    connection.query(
      "SELECT S.*, REGULATION.* FROM S INNER JOIN REGULATION ORDER BY S.ID DESC LIMIT 1",
      function (err, data) {
        data = data[0];
        deltat = data.T1 - data.T2; //ΔT : la différence de température entre T1, la température de sonde « capteur thermique » S1 et T2, la température de la « sonde ballon » S2.
        if (deltat < data.Dtoff) {
          //Le circulateur est mise à l'arrêt.
          console.log("Le circulateur est mise à l'arrêt.");
        }
      }
    );
  });
}

function receptionClientInput(socket) {
  socket.on("dton", function (data) {
    console.log("dton:", data);
    pool.query(
      "UPDATE REGULATION SET Dton = ?",
      [data],
      function (err) {
        if (err) throw err;
      }
    );
  });
}
