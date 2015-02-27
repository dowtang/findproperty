$(document).ready(function(){

  var map;
  var infowindow;
  var busy = false;
  var QUERY_DELAY = 400;
  var markersArray =[];

  function initialize() {
    var singapore = new google.maps.LatLng(1.3146631, 103.8454093);
    
    map = new google.maps.Map(document.getElementById('map-canvas'), {
      center: singapore,
      zoom: 11
    });

    var request = {
      location: singapore,
      radius: 8,
      types: ['store']
    };

    infowindow = new google.maps.InfoWindow();
    
    var service = new google.maps.places.PlacesService(map);
      service.nearbySearch(request, callback);

    bind_controls(map);
  }

// Goal: I must bind and setup search control for the map.param: map - the Google map object

var bind_controls = function(map) {
  // get the container for the search control and bind and event to it on submit
  var controlContainer = $('#control_container')[0];
  google.maps.event.addDomListener(controlContainer, 'submit', function(e) {
    e.preventDefault();
    search(map);
  });

  // get the search button and bind a click event to it for searching
  var searchButton = $('#map_search_submit')[0];
  google.maps.event.addDomListener(searchButton, 'click', function(e) {
    e.preventDefault();
    search(map);
  });

    // push the search controls onto the map
  map.controls[google.maps.ControlPosition.TOP_LEFT].push(controlContainer);
}

var search = function(map) {
  // Grab search term
  var searchTerm = $('#map_search input[type=text]').val();

  if (busy === true) { return };

  // post to the search with the search term, take the response data
  // and process it
  // $.post('/search', { term: searchTerm }, function(data) {
    // busy = true;

  // Construct the URL you are going to send
  // url = '/search?param1=value1&param2=value2'
  // url = '/search ? label = value'
  // url = '/search ? name = harry'
  
  var url = '/search?term='+searchTerm;
  // Send a GET rquest with the URL
  $.get(url, function(data) {
    busy = true;

    // do some clean up
    $('#results').show();
    $('#results').empty();
    clearMarkers();

    // iterate through each business in the response capture the data
    // within a closure.
    data['businesses'].forEach(function(business, index) {
      capture(index, map, business);
    });
  });
};

  var capture = function(i, map, business) {
    setTimeout(function() {
      if (i === 15) {
        busy = false;
      }

      $('#results').append(build_results_container(business));

      // get the geocoded address for the business's location
      geocode_address(map, business['name'], business['location']);
    }, QUERY_DELAY * i); // the delay on the timeout
  };

  var build_results_container = function(business) {
    return [
      '<div class="result">',
        '<img class="biz_img" src="', business['image_url'], '">',
        '<h5><a href="', business['url'] ,'" target="_blank">', business['name'], '</a></h5>',
        '<img src="', business['rating_img_url'], '">',
        '<p>', business['review_count'], ' reviews</p>',
        '<p class="clear-fix"></p>',
      '</div>'
    ].join('');
  };

  var geocode_address = function(map, name, location_object) {
  var geocoder = new google.maps.Geocoder();

  var address = [
    location_object['address'][0],
    location_object['city'],
    location_object['country_code']
  ].join(', ');

  // geocode the address and get the lat/lng
  geocoder.geocode({address: address}, function(results, status) {
    if (status === google.maps.GeocoderStatus.OK) {

      // create a marker and drop it on the name on the geocoded location
      var marker = new google.maps.Marker({
        animation: google.maps.Animation.DROP,
        map: map,
        position: results[0].geometry.location,
        title: name
      });

      // save the marker object so we can delete it later
      markersArray.push(marker);
    } else {
      console.log("Geocode was not successful for the following reason: " + status);
    }
  });
};

var clearMarkers = function() {
  markersArray.forEach(function(marker) {
    marker.setMap(null);
  });

  markersArray = [];
};


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

  // var geocoder;
  // var map;
  // function initialize() {
  //   geocoder = new google.maps.Geocoder();
  //   var latlng = new google.maps.LatLng(-34.397, 150.644);
  //   var mapOptions = {
  //     zoom: 8,
  //     center: latlng
  //   }
  //   map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
  // }

  function codeAddress() {
    var geocoder = new google.maps.Geocoder();
    var address = $('#address').val();

    console.log(address);

    geocoder.geocode( { 'address': address}, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {

        console.log(results[0].geometry.location);

        map.setCenter(results[0].geometry.location);
        var marker = new google.maps.Marker({
          map: map,
          position: results[0].geometry.location
        });
      } 
      else {
        alert('Geocode was not successful for the following reason: ' + status);
      }
    });
  }

  var controlContainer = $('#geocode_submit')[0];
  google.maps.event.addDomListener(controlContainer, 'click', function(e) {
    console.log("button clicked");
    codeAddress();
  });

  google.maps.event.addDomListener(window, 'load', initialize);

});