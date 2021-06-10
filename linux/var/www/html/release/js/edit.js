function mysqlData(json) {
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
    switch (status) {
        case "Le circulateur est mis en marche à R=Rmax pendant 10 secondes, puis à R=Rmin pendant 1 minute.":
            document.getElementById("statusCirculateur").style.color = "red";
            console.log("Le circulateur est mis en marche à R=Rmax pendant 10 secondes, puis à R=Rmin pendant 1 minute.");
            break;

        default:
            document.getElementById("statusCirculateur").style.color = "black";
            break;
    }
}

function updatedton(data) {
    document.getElementById("Dton").innerHTML = data;
    document.getElementById("dtonSlider").value = data;
    console.log("dton=" + data);

}

function updatedtoff(data) {
    document.getElementById("Dtoff").innerHTML = data;
    document.getElementById("dtoffSlider").value = data;
    console.log("dtoff=" + data);

}

function updatermin(data) {
    document.getElementById("Rmin").innerHTML = data;
    document.getElementById("rminSlider").value = data;
    console.log("rmin=" + data);
}

function updatedt(data) {
    document.getElementById("dt").innerHTML = data;
    console.log("dt=" + data);

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
    console.log("dtonSlider=" + data);

}

function appointStatus() {
    var x = document.getElementById("appointValue");
    if (x.style.display === "none") {
        x.style.display = "block";
        console.log("Appoint on");
        x.innerHTML = "Appoint on";
        x.style.color = "red"
        socket.emit('appointStatus', "on");
    } else {
        x.style.display = "none";
        console.log("Appoint off");
        x.innerHTML = "Appoint off";
        x.style.color = "black"
        socket.emit('appointStatus', "off");
    }
}