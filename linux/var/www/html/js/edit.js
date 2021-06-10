function mysqlData(json) {
  console.log(json);
  if (json != undefined) {
    document.getElementById("dt").innerHTML = json[0].dt;
    document.getElementById("Dton").innerHTML = json[0].Dton;
    document.getElementById("Dtoff").innerHTML = json[0].Dtoff;
    document.getElementById("R").innerHTML = json[0].R;
    document.getElementById("Rmax").innerHTML = json[0].Rmax;
    document.getElementById("Rmin").innerHTML = json[0].Rmin;
    document.getElementById("T1").innerHTML = json[0].T1;
    document.getElementById("T2").innerHTML = json[0].T2;
    document.getElementById("ID").innerHTML = json[0].ID;
    console.log("data edited");
  } else return console.log("ERREUR : réception des données vide");
}

function customData(data) {
  console.log(data);
  document.getElementById("dt").innerHTML = data.dt;
  document.getElementById("R").innerHTML = data.R;
  document.getElementById("Rmax").innerHTML = data.Rmax;
}

function sendData(id) {
  msg = document.getElementById(id).value;
  console.log(id + "=" + msg);
  socket.emit(id, { message: msg });
}

function statust(status) {
  document.getElementById("status").innerHTML = "status[0].status";
}



