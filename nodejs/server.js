const config = require("./config.json");
const express = require('express');
const mysql = require('mysql');
const MySQLEvents = require('@rodrigogs/mysql-events');
const server = require('http').Server(express)
const io = require('socket.io')(server, config.cors);
var pool = mysql.createPool(config.mysql);

const program = async () => {
  const instance = new MySQLEvents(pool, {
    startAtEnd: true
  });

  await instance.start();

  instance.addTrigger({
    name: 'monitoring all statments',
    expression: config.mysql.database,
    statement: MySQLEvents.STATEMENTS.ALL,
    onEvent: e => {
      dbupdate();
    }
  })

  instance.on(MySQLEvents.EVENTS.CONNECTION_ERROR, console.error);
  instance.on(MySQLEvents.EVENTS.ZONGJI_ERROR, console.error);

}

program().catch(console.error);

io.on('connection', (socket) => {
  console.log(`Connecté au client ${socket.id}`)
  io.emit('status', 'Connecté au serveur WebSocket');
  dbupdate();
})

server.listen(config.port, function() {
  console.log('Serveur WebSocket disponible sur localhost:' + config.port)
})







function dbupdate() {
  pool.getConnection(function(err, connection) {
    if (err) throw err; //Pas de connection

    connection.query("SELECT * FROM " + config.mysqlTable + " ORDER BY " + config.mysqlId + " DESC LIMIT 1", function (err, pos) {
      if (err) throw err;
      io.emit('mysqlPos', pos);
      console.log(pos);
    });

    connection.query("SELECT * FROM " + config.mysqlTable, function(err, result) {
        if (err) throw err;
        io.emit('mysqlData', result);
        connection.release();
        if (err) throw err;
    });
  })
}
