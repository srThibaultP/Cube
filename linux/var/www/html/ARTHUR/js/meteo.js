var input = document.querySelector('.input_text');
var main = document.querySelector('#name');
var temp = document.querySelector('.temp');
var desc = document.querySelector('.desc');
var clouds = document.querySelector('.clouds');
var button= document.querySelector('.submit');


button.addEventListener('click', function(name){
fetch('//api.openweathermap.org/data/2.5/weather?q='+input.value+'&appid=1944b3bc684960e04c1788d7aec6da6b&lang=fr&units=metric')
.then(response => response.json())
.then(data => {
  var tempValue = data['main']['temp'];
  var nameValue = data['name'];
  var descValue = data['weather'][0]['description'];
  var windValue = data['wind']['speed'];
  var windDirValue = data['wind']['deg'];
  main.innerHTML = nameValue;
  desc.innerHTML = "Description : "+descValue;
  Temperature.innerHTML = tempValue.toFixed(1)+"°C";
  VitesseVent.innerHTML = windValue+"m/s";
  DirectionVent.innerHTML = windDirValue+"°";
})

.catch(err => alert("Ville inconnue ou non prise en charge."));
})
