//---ASYNCHRONE---//

  //Fichier 1Mo
const http = require('http');
var options = {
  host: "192.168.10.254", //Adresse d'hébergement (adresse proxy)
  port: 3128, //port proxy
  path: "http://bouygues.testdebit.info/1M.iso", //Chemin - Localisation du fichier 1M.iso
  headers: {
    Host: "http://bouygues.testdebit.info/1M.iso" //Hébergement du téléchargement fichier
  }
};

  //Fichier 10Mo
  var options2 = {
    host: "192.168.10.254", //Adresse d'hébergement (adresse proxy)
    port: 3128, //port proxy
    path: "http://bouygues.testdebit.info/10M.iso", //Chemin - Localisation du fichier 10M.iso
    headers: {
      Host: "http://bouygues.testdebit.info/10M.iso" //Hébergement du téléchargement fichier
    }
  };

  //Fichier 100Mo
    var options3 = {
      host: "192.168.10.254", //Adresse d'hébergement (adresse proxy)
      port: 3128, //port proxy
      path: "http://bouygues.testdebit.info/100M.iso", //Chemin - Localisation du fichier 100M.iso
      headers: {
        Host: "http://bouygues.testdebit.info/100M.iso" //Hébergement du téléchargement fichier
      }
    };

console.log("Lecture du fichier de 100Mo : " + new Date().getHours() + ":" + new Date().getMinutes() + ":" + new Date().getSeconds() + ":" + new Date().getMilliseconds());
http.get(options3, function(resp) {
  var deb3 = Date.now();
  let data = '';

  resp.on('data', (chunk) => { //Récupération flux
    data += chunk;
  });
  resp.on('end', () => {
    var fin3 = Date.now();
    console.log("Fin de lecture du fichier de 100Mo : " + new Date().getHours() + ":" + new Date().getMinutes() + ":" + new Date().getSeconds() + ":" + new Date().getMilliseconds());
    console.log("Temps total : " + (fin3 - deb3) + "ms");
    console.log("");
  });
}).on("error", (err) => {
  console.log("Error: " + err.message);
});



console.log("Lecture du fichier de 10Mo : " + new Date().getHours() + ":" + new Date().getMinutes() + ":" + new Date().getSeconds() + ":" + new Date().getMilliseconds());
http.get(options2, function(resp) {
  var deb2 = Date.now();
  let data = '';

  resp.on('data', (chunk) => { //Récupération flux
    data += chunk;
  });
  resp.on('end', () => {
    var fin2 = Date.now();
    console.log("Fin de lecture du fichier de 10Mo : " + new Date().getHours() + ":" + new Date().getMinutes() + ":" + new Date().getSeconds() + ":" + new Date().getMilliseconds());
    console.log("Temps total : " + (fin2 - deb2) + "ms");
    console.log("");
  });
}).on("error", (err) => {
  console.log("Error: " + err.message);
});



console.log("Lecture du fichier de 1Mo : " + new Date().getHours() + ":" + new Date().getMinutes() + ":" + new Date().getSeconds() + ":" + new Date().getMilliseconds());
http.get(options, function(resp) {
  var deb1 = Date.now();
  let data = '';

  resp.on('data', (chunk) => { //Récupération flux
    data += chunk;
  });
  resp.on('end', () => {
    var fin1 = Date.now();
    console.log("Fin de lecture du fichier de 1Mo : " + new Date().getHours() + ":" + new Date().getMinutes() + ":" + new Date().getSeconds() + ":" + new Date().getMilliseconds());
    console.log("Temps total : " + (fin1 - deb1) + "ms");
    console.log("");
  });
}).on("error", (err) => {
  console.log("Error: " + err.message);
});
