const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const fs = require('fs');

var bdddata = "./bdd.json"

// ajout de socket.io
const server = require('http').Server(app)
const io = require('socket.io')(server, {
  cors: {
  origin: "http://localhost",
  methods: ["GET", "POST"],
  credentials: true
}
})

app.use(bodyParser.json())
app.use(bodyParser.urlencoded({extended:true}))
app.use(express.static('public'))
app.get('/', function (req, res) {
   res.sendFile('index.html', { root: __dirname })
})

app.get('/json', function (req, res) {
   res.status(200).json({"message":"ok"})
})

// établissement de la connexion
io.on('connection', (socket) =>{
   console.log(`Connecté au client ${socket.id}`)
})

// on change app par server
server.listen(8080, function () {
 console.log('Votre app est disponible sur localhost:8080 !')
})
// établissement de la connexion

io.on('connection', (socket) =>{
   console.log(`Connecté au client ${socket.id}`)
   // émission d'un évènement
   io.emit('news','Voici un nouvel élément envoyé par le serveur');
   io.emit('news','bonsoir paris');
   fs.readFile('./bdd.json', function read(err, data) {
     if (err) {
       throw err;
   }
       const content = data;
       const parsed = JSON.parse(content);
       console.log(content);
       console.log(parsed);
       io.emit('json',parsed);

   });
   io.emit('json','pas vraiment');
   io.emit('news','not json data');
   setTimeout(function() {
      socket.send('4s plus tard');
      io.emit("futurrrr");
   }, 4000);

})
