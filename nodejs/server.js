const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const fs = require('fs');
const mysql = require('mysql');
// ajout de socket.io
const server = require('http').Server(app)
const io = require('socket.io')(server, { //server ou 8081
  cors: {
  origin: 'http://localhost',
  methods: ["GET", "POST"],
  credentials: true
}
})
var pool = mysql.createPool({
  host: "localhost",
  user: "snir",
  password: "snirpass",
  database: "AssurVehicules"
});
var bdddata = "./bdd.json"


app.use(bodyParser.json())
app.use(bodyParser.urlencoded({extended:true}))
app.use(express.static('public'))
app.get('/', function (req, res) {
   res.sendFile('index.html', { root: __dirname })
})

app.get('/json', function (req, res) {
   res.status(200).json({"message":"ok"})
})


// on change app par server
server.listen(8081, function () {
 console.log('Serveur WebSocket disponible sur localhost:8081 !')
})

function dbupdate() {
  pool.getConnection(function(err, connection) {
    if (err) throw err;
    connection.query("SELECT * FROM Modele", function (err, result, fields) {
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

// établissement de la connexion
io.on('connection', (socket) =>{
   console.log(`Connecté au client ${socket.id}`)
   // émission d'un évènement
   io.emit('status','Connecté au serveur WebSocket');
   dbupdate();
     fs.readFile('./bdd.json', function read(err, data) {
       if (err) throw err;
       jsonparsed = JSON.parse(data)
       io.emit('json',jsonparsed);
       console.log(`${socket.id} à jour`);
   })
})
         //setTimeout(dbupdate, 1000);
