var mysql = require('mysql');
var fs = require('fs');
var io = require('socket.io')(8080, {
  cors: {
  origin: "http://localhost",
  methods: ["GET", "POST"],
  credentials: true
}
});

var con = mysql.createConnection({
  host: "localhost",
  user: "snir",
  password: "snirpass",
  database: "AssurVehicules"
});

// établissement de la connexion
io.on('connection', (socket) =>{
   console.log(`Connecté au client ${socket.id}`)
})

con.connect(function(err) {
  if (err) throw err;
  con.query("SELECT * FROM Modele", function (err, result, fields) {
    if (err) throw err;
    console.log(result);
    parsed = JSON.stringify(result);
/*    fs.writeFile('bdd.json', parsed, (err) => {
      if (err) throw err;
      console.log('Data written to file');
    })*/

    io.on('connection', (socket) =>{
       console.log(`Connecté au client ${socket.id}`);
       // émission d'un évènement
       io.emit('news','Voici un nouvel élément envoyé par le serveur');
       io.emit('news','bonsoir paris');
       io.emit('json','parsed');
    })
  });
});
