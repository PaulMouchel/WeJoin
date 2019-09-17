var city = [48.1113387, -1.6800198]
var mymap = L.map('mapid').setView(city, 13);

L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
 attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
 maxZoom: 18,
 id: 'mapbox.streets',
 accessToken: ENV["MAP_KEY"],
}).addTo(mymap);

var marker = L.marker(city).addTo(mymap);

marker.bindPopup('<h6> Rennes, FRANCE. </h6>');