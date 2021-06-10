var http = require('http');
var fs = require('fs');

fs.readFile('./index.html', function (err, html) {
    if (err) {
        throw err;
    }
    http.createServer(function(request, response) {
        response.writeHeader(200, {"Content-Type": "text/html"});
        response.write(html);
        response.end();
    }).listen(8080);
});

var server81 = http.createServer(function (request, response) {
  //request.setHeader()
  response.write('<p>Bonjour les &eacute;tudiants en 8081</p>');
  response.end();
});
server81.listen(8081);
