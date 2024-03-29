// On initialise la latitude et la longitude de La roche sur yon (centre de la carte)
var lat = 46.6667;
var lon = -1.4333;
var macarte = null;

var villes = {
	"Paris": { "lat": 48.852969, "lon": 2.349903 },
    "La roche sur yon": { "lat": 46.6667, "lon": -1.4333 },
};

// Fonction d'initialisation de la carte
function initMap() {
// Créer l'objet "macarte" et l'insérer dans l'élément HTML qui a l'ID "map"
    macarte = L.map('map').setView([lat, lon], 11);
    // Leaflet ne récupère pas les cartes (tiles) sur un serveur par défaut. Nous devons lui préciser où nous souhaitons les récupérer. Ici, openstreetmap.fr
    L.tileLayer('https://{s}.tile.openstreetmap.fr/osmfr/{z}/{x}/{y}.png', {
        // Il est toujours bien de laisser le lien vers la source des données
        attribution: 'données © <a href="//osm.org/copyright">OpenStreetMap</a>/ODbL - rendu <a href="//openstreetmap.fr">OSM France</a>',
            minZoom: 1,
            maxZoom: 20
        }).addTo(macarte);
    }
    window.onload = function(){
  // Fonction d'initialisation qui s'exécute lorsque le DOM est chargé
    initMap();

    for (ville in villes) {
        var marker = L.marker([villes[ville].lat, villes[ville].lon]).addTo(macarte);
        marker.bindPopup(ville);
	}

};
