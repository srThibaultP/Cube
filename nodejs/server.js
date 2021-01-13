const express = require('express');
const app = express();
const fs = require('fs');
const mysql = require('mysql');
const MySQLEvents = require('@rodrigogs/mysql-events');
const server = require('http').Server(app)
var bdddata = "./bdd.json"
const io = require('socket.io')(server, {
  cors: {
    origin: 'http://localhost',
    methods: ["GET", "POST"],
    credentials: true
  }
})
var pool = mysql.createPool({
  connexionLimit: 10,
  host: "localhost",
  user: "snir",
  password: "snirpass",
  database: "AssurVehicules"
});

const program = async () => {
  connection = pool;
  const instance = new MySQLEvents(connection, {
    startAtEnd: true
  });

  await instance.start();

  instance.addTrigger({
    name: 'monitoring all statments',
    expression: 'AssurVehicules',
    statement: MySQLEvents.STATEMENTS.ALL,
    onEvent: e => {
      dbupdate();
    }
  })

  instance.on(MySQLEvents.EVENTS.CONNECTION_ERROR, console.error);
  instance.on(MySQLEvents.EVENTS.ZONGJI_ERROR, console.error);

}

io.on('connection', (socket) => {
  console.log(`Connecté au client ${socket.id}`)
  io.emit('status', 'Connecté au serveur WebSocket');
  dbupdate();
})



server.listen(8081, function() {
  console.log('Serveur WebSocket disponible sur localhost:8081 !')
})
program().catch(console.error);






function dbupdate() {
  pool.getConnection(function(err, connection) {
    if (err) throw err;
    connection.query("SELECT * FROM Modele", function(err, result, fields) {
      if (err) throw err;
      io.emit('mysqlData', result);
    })
  })
}
