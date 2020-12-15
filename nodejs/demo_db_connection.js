var mysql = require('mysql');
var fs = require('fs');

var con = mysql.createConnection({
  host: "localhost",
  user: "snir",
  password: "snirpass",
  database: "AssurVehicules"
});

con.connect(function(err) {
  if (err) throw err;
  con.query("SELECT * FROM Modele", function (err, result, fields) {
    if (err) throw err;
    console.log(result);
    parsed = JSON.stringify(result);
    fs.writeFile('bdd.json', parsed, (err) => {
      if (err) throw err;
      console.log('Data written to file');
    })
  });
});
