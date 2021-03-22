function mysqlData(json) {
  console.log(json);
  if (json != undefined) {
    document.getElementById("dt").innerHTML = json[0].dt;
    document.getElementById("dton").innerHTML = json[0].Dton;
    document.getElementById("dtoff").innerHTML = json[0].Dtoff;
    document.getElementById("R").innerHTML = json[0].R;
    document.getElementById("Rmax").innerHTML = json[0].Rmax;
    document.getElementById("Rmin").innerHTML = json[0].Rmin;
    document.getElementById("T1").innerHTML = json[0].T1;
    document.getElementById("T2").innerHTML = json[0].T2;
    console.log("data edited");
  } else return console.log("ERREUR : réception des données vide");
}

function sendData(id) {
  msg = document.getElementById(id).value;
  console.log(id + "=" + msg);
  socket.emit(id, { message: msg });
}

function statust(status) {
  document.getElementById("status").innerHTML = "status[0].status";
}