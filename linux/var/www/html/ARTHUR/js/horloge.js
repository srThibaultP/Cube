setInterval(function Clock() {
    var today = new Date();
    var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
    document.getElementById("insererHorloge").innerHTML = time;
}, 1000);