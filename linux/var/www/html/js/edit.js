function mysqlData(json) {
  console.log(json);
  if (json != undefined) {
    document.getElementById("T1").innerHTML = json[0].T1;
    document.getElementById("T2").innerHTML = json[0].T2;
    document.getElementById("R").innerHTML = json[0].R;
    document.getElementById("dt").innerHTML = json[0].Dt;
    document.getElementById("Rmax").innerHTML = json[0].Rmax;
  } else return console.log("ERREUR : réception des données vide");
}

function statusCirculateur(status) {
  document.getElementById("statusCirculateur").innerHTML = status;
}

function updatedton(data) {
  document.getElementById("Dton").innerHTML = data;
  document.getElementById("dtonSlider").value = data;
}

function updatedtoff(data) {
  document.getElementById("Dtoff").innerHTML = data;
  document.getElementById("dtoffSlider").value = data;
}

function updatermin(data) {
  document.getElementById("Rmin").innerHTML = data;
  document.getElementById("rminSlider").value = data;
  console.log("rmin="+data);
}

function updatedt(data) {
  document.getElementById("dt").innerHTML = data;
}

function updateTpanneau(data) {
  document.getElementById("T1").innerHTML = data;
  document.getElementById("TpanneauSlider").value = data;
  console.log("tpann=" + data);
}

function updateTballon(data) {
  document.getElementById("T2").innerHTML = data;
  document.getElementById("TballonSlider").value = data;
  console.log("tball=" + data);

}

function custom(data) {
  document.getElementById("dtonSlider").value = data;
}
