const config = require("./config.json");
const express = require("express");
const mysql = require("mysql");
const MySQLEvents = require("@rodrigogs/mysql-events");
const server = require("http").Server(express);
const io = require("socket.io")(server, config.cors);
const SerialPort = require('serialport');
var pool = mysql.createPool(config.mysql);
var sp = new SerialPort("/dev/ttyACM0", {
    baudRate: 9600,
});

server.listen(config.port, function() {
    console.log('\x1b[33m%s\x1b[0m', "Serveur WebSocket disponible sur localhost:" + config.port);
});

const dbevent = async() => {
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
            circulateur10s1m();
            //circulateuroff();
            //ordreExecution();
        },
    });

    instance.on(MySQLEvents.EVENTS.CONNECTION_ERROR, console.error);
    instance.on(MySQLEvents.EVENTS.ZONGJI_ERROR, console.error);
};

dbevent().catch(console.error);

io.on("connection", (socket) => {
    console.log('\x1b[36m%s\x1b[0m', `Connecté au client ${socket.id}`);
    io.to(socket.id).emit("status", "Connecté au serveur WebSocket");
    clientWebUpdate();
    receptiondton(socket);
    receptiondtoff(socket);
    receptionrmin(socket);
    receptionTpanneau(socket);
    receptionTballon(socket);
    receptionappointStatus(socket);
});

// FONCTIONS

function clientWebUpdate() {
    //console.log("**RECUPERATION VALEURS SQL**");
    pool.query(
        "SELECT S.*, PARAMETRE.*, REGULATION.* FROM S INNER JOIN PARAMETRE INNER JOIN REGULATION ORDER BY S.ID DESC LIMIT 1;",
        function(err, result) {
            deltat = result[0].T1 - result[0].T2; //ΔT : la différence de température entre T1, la température de sonde « capteur thermique » S1 et T2, la température de la « sonde ballon » S2.
            Rmax = result[0].Rmin * 0.7;
            pool.query("UPDATE PARAMETRE SET Dt = ?, Rmax = ? WHERE ID = '1'", [deltat, Rmax]);
        }
    );
    pool.query(
        "SELECT S.*, PARAMETRE.*, REGULATION.* FROM S INNER JOIN PARAMETRE INNER JOIN REGULATION ORDER BY S.ID DESC LIMIT 1;",
        function(err, result) {
            io.emit("mysqlData", result);
            //console.log("**ENVOI VALEURS CLIENT WEB**");
        }
    );
}

//CIRCULATEUR


function ordreExecution() {
    if (circulateur10s1m() != true) {
        circulateuroff();
    }
}


function circulateuroff() {
    pool.query(
        "SELECT S.*, REGULATION.* FROM S INNER JOIN REGULATION ORDER BY S.ID DESC LIMIT 1",
        function(err, data) {
            data = data[0];
            deltat = data.T1 - data.T2; //ΔT : la différence de température entre T1, la température de sonde « capteur thermique » S1 et T2, la température de la « sonde ballon » S2.
            if (deltat < data.Dtoff) {
                //Le circulateur est mise à l'arrêt.
                console.log("Le circulateur est mise à l'arrêt.");
                sp.on("open", function() {
                    sp.write("1", function(err, res) {
                        if (err) return console.log(err);
                    });
                });
            }
        }
    );
}


function circulateur10s1m() {
    console.log("Connexion à la Base de Données");
    pool.query(
        "SELECT PARAMETRE.Dt, REGULATION.Dton FROM PARAMETRE INNER JOIN REGULATION WHERE PARAMETRE.ID = 1 AND REGULATION.ID = 1",
        function(err, data) {
            console.log("Execution de la commande SQL")
            if (data[0].Dt > data[0].Dton) { //Mise en marche du circulateur
                //Le circulateur est mis en marche à R=Rmax pendant 10 secondes, puis à R=Rmin pendant 1 minute.
                console.log(
                    "Le circulateur est mis en marche à R=Rmax pendant 10 secondes, puis à R=Rmin pendant 1 minute."
                );
                io.emit("statusCirculateur", "Le circulateur est mis en marche à R=Rmax pendant 10 secondes, puis à R=Rmin pendant 1 minute.");
                sp.write("2", function() {
                    console.log("Envoi du chiffre 2, Déconnexion");
                });
                return true
            } else { //Arrêt du circulateur
                console.log("Dt n'est pas supérieur à Dton");
                io.emit("statusCirculateur", "ETAT DU SYSTEME (issu de la BDD)");
                sp.write("1", function() {
                    console.log("Envoi du chiffre 1, Déconnexion");
                });
            }
        }
    );
}

/*
function circulateur10pcrequalrmax() {
  pool.query(
    "SELECT * FROM PARAMETRE WHERE ID = 1",
    function (err, data) {
      if (data[0].Dt > 10) {
        //R=R + 10% toutes les minutes jusqu'à R=Rmax.
        //console.log("R=R + 10% toutes les minutes jusqu'à R=Rmax.");
        io.emit("statusCirculateur", "R=R + 10% toutes les minutes jusqu'à R=Rmax.");
        data = data[0];
        console.log("R=" + data.R);
        console.log("Rmax=" + data.Rmax);
        console.log(data);
        circulateur = 0;
        while (data.R != data.Rmax) {
          circulateur = circulateur * 1.1;
          sp.on("open", function () {
            sp.write("1", function (err, res) {
              if (err) return console.log(err);
              console.log("Valeur 1 envoyée sur le port série")
            });
          });
        }
      } else io.emit("statusCirculateur", "STATUS DU SYSTEME");
    }
  );
  return true;
}
*/

//APPOINT

function appointOn() {
    console.log("Envoi du chiffre 4");
    sp.write("4", function() {
        console.log(
            "Chauffage d'appoint ON"
        );
    });
}

function appointOff() {
    console.log("Envoi du chiffre 5");
    sp.write("5", function() {
        console.log(
            "Chauffage d'appoint OFF"
        );
    });
}

//RECEPTION DATA CLIENT WEB

function receptiondton(socket) {
    socket.on("dton", function(dton) {
        console.log("dton:", dton);
        pool.query(
            "UPDATE REGULATION SET Dton = ? WHERE ID = '1'", [dton],
            function(err, result) {
                //console.log(result);
                io.emit("dton", dton)
            }
        );
    });
}

function receptiondtoff(socket) {
    socket.on("dtoff", function(dtoff) {
        //console.log("**RECEPTION dtoff CLIENT**");
        console.log("dtoff:", dtoff);
        //console.log("**ENVOI VALEUR dtoff SQL**");
        pool.query(
            "UPDATE REGULATION SET Dtoff = ? WHERE ID = '1'", [dtoff],
            function(err, result) {
                //console.log(result);
                io.emit("dtoff", dtoff)
            }
        );
    });
}

function receptionrmin(socket) {
    socket.on("rmin", function(rmin) {
        console.log("rmin:", rmin);
        pool.query(
            "UPDATE REGULATION SET Rmin = ? WHERE ID = '1'", [rmin],
            function(err, result) {
                //console.log(result);
                io.emit("rmin", rmin)
            }
        );
    });
}

function receptionTpanneau(socket) {
    socket.on("Tpanneau", function(T1) {
        console.log("Tpanneau:", T1);
        pool.query(
            "UPDATE S SET T1 = ? ORDER BY ID DESC LIMIT 1", [T1],
            function(err, result) {
                //console.log(result);
                io.emit("Tpanneau", T1)
            }
        );
    });
}

function receptionTballon(socket) {
    socket.on("Tballon", function(T2) {
        console.log("Tballon:", T2);
        pool.query(
            "UPDATE S SET T2 = ? ORDER BY ID DESC LIMIT 1", [T2],
            function(err, result) {
                //console.log(result);
                io.emit("Tballon", T2)
            }
        );
    });
}

function receptionappointStatus(socket) {
    socket.on("appointStatus", function(data) {
        switch (data) {
            case "on":
                appointOn();
                break;

            case "off":
                appointOff();
                break;

            default:
                break;
        }
    });
}