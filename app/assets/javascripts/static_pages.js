$(document).ready(function(){

  var map;
  var infowindow;

  function initialize() {
    var singapore = new google.maps.LatLng(1.3146631, 103.8454093);
    map = new google.maps.Map(document.getElementById('map-canvas'), {
      center: singapore,
      zoom: 11
    });

    var request = {
      location: Singapore,
      radius: 8,
      types: ['store']
    };
    infowindow = new google.maps.InfoWindow();
    var service = new google.maps.places.PlacesService(map);
    service.nearbySearch(request, callback);
  }

  function callback(results, status) {
    if (status == google.maps.places.PlacesServiceStatus.OK) {
      for (var i = 0; i < results.length; i++) {
        createMarker(results[i]);
      }
    }
  }

  function createMarker(place) {
    var placeLoc = place.geometry.location;
    var marker = new google.maps.Marker({map: map, position: place.geometry.location
    });

    google.maps.event.addListener(marker, 'click', function() {infowindow.setContent(place.name); infowindow.open(map, this);
    });
  }

google.maps.event.addDomListener(window, 'load', initialize);

});