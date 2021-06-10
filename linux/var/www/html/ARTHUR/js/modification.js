function modiftitre() {
    document.getElementById("titre1").innerHTML = "Bienvenue !";
}
modiftitre();

function reverse() {
    document.getElementById("image1").style.cssFloat = "left";
    document.getElementById("image2").style.cssFloat = "right";
  }
reverse();

function reparertitre() {
    document.getElementById("titre1").innerHTML = "Bienvenue les enfants !";
}


function switchautomanu (){
    var isChecked = document.getElementById("switchautomanu").checked;

    if(isChecked){
        alert("Automatique");
        document.getElementById("meteo").style.display = "none";
        document.getElementById("slider1").style.display = "none";
        document.getElementById("schemaVolet").style.border = "1px solid #a29d9d";
    } else {
        alert("Manuel");
        document.getElementById("meteo").style.display = "block";
        document.getElementById("slider1").style.display = "block";
        document.getElementById("schemaVolet").style.border = "2px solid red";
    }
}
