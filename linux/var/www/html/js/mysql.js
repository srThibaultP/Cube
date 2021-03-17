function mysqlPos(pos) {
  dernier = pos[0].id_modele - 1; //On commence à 0
  return dernier;
} 

function mysqlData(json, dernier) {
  //console.log(json);
  //console.log(dernier);
  if (json[dernier] != undefined) {
    document.getElementById("carb").innerHTML = json[dernier].carburant;
    document.getElementById("id").innerHTML = json[dernier].id_modele;
    document.getElementById("mod").innerHTML = json[dernier].modele;
  } else {
    return console.log("ERREUR : dernier undefined");
  }
}
