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
      clientwebupdate();
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
});

function clientWebUpdate() {
  pool.getConnection(function (err, connection) {
    if (err) throw err; //Pas de connection
    connection.query(
      "SELECT S.*, REGULATION.* FROM S INNER JOIN REGULATION ON S.ID = REGULATION.ID ORDER BY S.ID DESC LIMIT 1",
      function (err, result) {
        io.emit("mysqlData", result);
        //connection.release();
        if (err) throw err;
      }
    );
  });
}

function variablesRegulation() {
  pool.getConnection(function (err, connection) {
    if (err) throw err;
    connection.query(
      "SELECT S.*, REGULATION.* FROM S INNER JOIN REGULATION ON S.ID = REGULATION.ID ORDER BY S.ID DESC LIMIT 1",
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
      "SELECT S.*, REGULATION.* FROM S INNER JOIN REGULATION ON S.ID = REGULATION.ID ORDER BY S.ID DESC LIMIT 1",
      function (err, data) {
        data = data[0];
        deltat = data.T1 - data.T2; //ΔT : la différence de température entre T1, la température de sonde « capteur thermique » S1 et T2, la température de la « sonde ballon » S2.
        if (deltat > data.Dton) {
          //Le circulateur est mis en marche à R=Rmax pendant 10 secondes, puis à R=Rmin pendant 1 minute.
          console.log(
            "Le circulateur est mis en marche à R=Rmax pendant 10 secondes, puis à R=Rmin pendant 1 minute."
          );
        }
      }
    );
  });
}

function circulateur10pcrequalrmax() {
  pool.getConnection(function (err, connection) {
    if (err) throw err;
    connection.query(
      "SELECT S.*, REGULATION.* FROM S INNER JOIN REGULATION ON S.ID = REGULATION.ID ORDER BY S.ID DESC LIMIT 1",
      function (err, data) {
        data = data[0];
        deltat = data.T1 - data.T2; //ΔT : la différence de température entre T1, la température de sonde « capteur thermique » S1 et T2, la température de la « sonde ballon » S2.
        if (deltat > 10) {
          //R=R + 10% toutes les minutes jusqu'à R=Rmax.
          console.log("R=R + 10% toutes les minutes jusqu'à R=Rmax.");
        }
      }
    );
  });
}

function circulateuroff() {
  pool.getConnection(function (err, connection) {
    if (err) throw err;
    connection.query(
      "SELECT S.*, REGULATION.* FROM S INNER JOIN REGULATION ON S.ID = REGULATION.ID ORDER BY S.ID DESC LIMIT 1",
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
    console.log("dton:", data.message);
    pool.query(
      "UPDATE REGULATION SET Dton = ?",
      [data.message],
      function (err) {
        if (err) throw err;
      }
    );
  });
  socket.on("dtoff", function (data) {
    console.log("dton:", data.message);
  });
  socket.on("rmin", function (data) {
    console.log("dton:", data.message);
  });
}
