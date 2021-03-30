const config = require("./config.json");
const express = require("express");
const mysql = require("mysql");
const MySQLEvents = require("@rodrigogs/mysql-events");
const server = require("http").Server(express);
const io = require("socket.io")(server, config.cors);
var pool = mysql.createPool(config.mysql);

server.listen(config.port, function () {
  console.log("Serveur WebSocket disponible sur localhost:" + config.port);
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
      ordreExecution();
    },
  });

  instance.on(MySQLEvents.EVENTS.CONNECTION_ERROR, console.error);
  instance.on(MySQLEvents.EVENTS.ZONGJI_ERROR, console.error);
};

dbevent().catch(console.error);

io.on("connection", (socket) => {
  console.log(`Connecté au client ${socket.id}`);
  io.to(socket.id).emit("status", "Connecté au serveur WebSocket");
  clientWebUpdate();
  receptiondton(socket);
  receptiondtoff(socket);
  receptionrmin(socket);
});

// FONCTIONS

function clientWebUpdate() {
  pool.query(
    "SELECT S.*, PARAMETRE.*, REGULATION.* FROM S INNER JOIN PARAMETRE INNER JOIN REGULATION ORDER BY S.ID DESC LIMIT 1;",
    function (err, result) {
      deltat = result[0].T1 - result[0].T2; //ΔT : la différence de température entre T1, la température de sonde « capteur thermique » S1 et T2, la température de la « sonde ballon » S2.
      Rmax = result[0].Rmin * 0.7;
      pool.query("UPDATE PARAMETRE SET Dt = ?, Rmax = ? WHERE ID = '1'", [deltat, Rmax]);
    }
  );
  pool.query(
    "SELECT S.*, PARAMETRE.*, REGULATION.* FROM S INNER JOIN PARAMETRE INNER JOIN REGULATION ORDER BY S.ID DESC LIMIT 1;",
    function (err, result) {
      io.emit("mysqlData", result);
    }
  );
}

function ordreExecution() {
  circulateur10s1m();
  circulateur10pcrequalrmax();
}

function circulateur10s1m() {
  pool.query(
    "SELECT PARAMETRE.Dt, REGULATION.Dton FROM PARAMETRE INNER JOIN REGULATION WHERE PARAMETRE.ID = 1 AND REGULATION.ID = 1",
    function (err, data) {
      if (data[0].Dt > data[0].Dton) {
        //Le circulateur est mis en marche à R=Rmax pendant 10 secondes, puis à R=Rmin pendant 1 minute.
        console.log(
          "Le circulateur est mis en marche à R=Rmax pendant 10 secondes, puis à R=Rmin pendant 1 minute."
        );
        //circulateurStatus = 1; //VOIR STATUS AVEC JAOUEN ET NICO
        io.emit("statusCirculateur", "Le circulateur est mis en marche à R=Rmax pendant 10 secondes, puis à R=Rmin pendant 1 minute.")

      } else io.emit("statusCirculateur", "STATUS DU SYSTEME");
    }
  );
}

function circulateur10pcrequalrmax() {
  pool.query(
    "SELECT Dt FROM PARAMETRE WHERE ID = 1",
    function (err, data) {
      if (data[0].Dt > 10) {
        //R=R + 10% toutes les minutes jusqu'à R=Rmax.
        console.log("R=R + 10% toutes les minutes jusqu'à R=Rmax.");
        io.emit("statusCirculateur", "R=R + 10% toutes les minutes jusqu'à R=Rmax.");
        while (data.R != data.Rmax) {
          circulateur = circulateur * 1.1;
        }
      } else io.emit("statusCirculateur", "STATUS DU SYSTEME");
    }
  );
}

function circulateuroff() {
  pool.query(
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
}

function receptiondton(socket) {
  socket.on("dton", function (dton) {
    console.log("dton:", dton);
    pool.query(
      "UPDATE REGULATION SET Dton = ? WHERE ID = '1'",
      [dton],
      function (err, result) {
        //console.log(result);
        io.emit("dton", dton)
      }
    );
  });
}

function receptiondtoff(socket) {
  socket.on("dtoff", function (dtoff) {
    console.log("dtoff:", dtoff);
    pool.query(
      "UPDATE REGULATION SET Dtoff = ? WHERE ID = '1'",
      [dtoff],
      function (err, result) {
        //console.log(result);
        io.emit("dtoff", dtoff)
      }
    );
  });
}

function receptionrmin(socket) {
  socket.on("rmin", function (rmin) {
    console.log("rmin:", rmin);
    pool.query(
      "UPDATE REGULATION SET Rmin = ? WHERE ID = '1'",
      [rmin],
      function (err, result) {
        //console.log(result);
        io.emit("rmin", rmin)
      }
    );
  });
}