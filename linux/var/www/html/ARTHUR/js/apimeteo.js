const https = require('https');

var vitVent=0;
var dirVent = 0;
var nomVille = 0;
var temperature = 0;
https.get('https://api.openweathermap.org/data/2.5/weather?q=La Roche-sur-Yon&appid=3d25b2e171477a5d05d81a3b9d196cf5&lang=fr&units=metric',(resp) => {

let data ='';

resp.on('data', (chunk)=> {
  data+= chunk;
});

resp.on('end',() => {

var la_roche_sur_yon =JSON.parse(data)
vitVent = la_roche_sur_yon.wind.speed;
dirVent = la_roche_sur_yon.wind.deg;
nomVille = la_roche_sur_yon.name
temperature = la_roche_sur_yon.main.temp;
temperature = temperature;
console.log("Il fait actuellement "+temperature+" degrés à "+nomVille+"et le vent est à "+vitVent+" dans une direction de "+dirVent+".");
});
}).on("error", (err)=>{
  console.log("Error:" + err.message);
});
