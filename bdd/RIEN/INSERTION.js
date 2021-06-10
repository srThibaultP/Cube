var mysql = require('mysql');
var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "snir",
  database: "BDDCube"
});

con.connect(function(err) {
  if (err) throw err;
  console.log("Connecté à la BDD");
  var sql = "INSERT INTO METEO (id, DATE, VILLE, TEMP, UVI) VALUES ('3', CURRENT_TIME(), 'La Roche-Sur-Yon', '27', '5')";
  con.query(sql, function (err, result) {
    if (err) throw err;
    console.log("Ligne insérée");
  });

  });
//donner df variables 
