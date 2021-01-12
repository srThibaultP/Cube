const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const fs = require('fs');
const mysql = require('mysql');
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

// on change app par server
server.listen(8081, function() {
  console.log('Serveur WebSocket disponible sur localhost:8081 !')
})

function dbupdate() {
  pool.getConnection(function(err, connection) {
    if (err) throw err;
    connection.query("SELECT * FROM Modele", function(err, result, fields) {
      if (err) throw err;
      //      console.log(result);
      bddparsed = JSON.stringify(result);
      fs.writeFile('bdd.json', bddparsed, (err) => {
        if (err) throw err;
        console.log('Base de donnée mise à jour');
        connection.release();
      })
    })
  })
}

io.on('connection', (socket) => {
  console.log(`Connecté au client ${socket.id}`)
  io.emit('status', 'Connecté au serveur WebSocket');
  dbupdate();
  fs.readFile('./bdd.json', function read(err, data) {
    if (err) throw err;
    jsonparsed = JSON.parse(data)
    io.emit('mysqlData', jsonparsed);
    console.log(`${socket.id} à jour`);
  })
})
