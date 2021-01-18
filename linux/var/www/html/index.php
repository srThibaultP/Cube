<!DOCTYPE html>
<html>
  <head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width">
  <title id="pageName">Apache</title>
  <script src="/socket.io/socket.io.js"></script>
  <script src="/js/status.js"></script>
  <script src="/js/mysql.js"></script>
  </head>

<body>
  <script>
  const socket = io();
  socket.on('status', function(msg) {status(msg)});
  socket.on('mysqlPos', function(msg) {mysqlPos(msg)});
  socket.on('mysqlData', function(msg) {mysqlData(msg, dernier);});
  </script>


  <h1 id="title">Hello apache</h1>
  <ul id="list">
    <li id="carb">Premier élément</li>
    <li id="id">2nd élément</li>
    <li id="mod">3 élément</li>
  </ul>
</body>
</html>
