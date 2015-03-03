$(document).ready(function(){

  $('.stick-man').stickThis();

  // $('.stick-man').stickThis({
  //     top: 200
  // });
  $(function() {
    $( "#slider-range" ).slider({
      range: true,
      min: 0,
      max: 20000000,
      values: [ 0 , 20000000 ],
      slide: function( event, ui ) {
        $( "#amount" ).val( "$" + ui.values[ 0 ] + " - $" + ui.values[ 1 ] );
        // var slideVal = [ui.values[ 0 ], ui.values[ 1 ]]
      }
    });
    console.log($( "#slider-range" ).slider( "values", 0 ));
    $( "#amount" ).val( "$" + $( "#slider-range" ).slider( "values", 0 ) +
      " - $" + $( "#slider-range" ).slider( "values", 1 ) );
  });

  $(function() {
    $( "#slider-range-square-feet" ).slider({
      range: true,
      min: 0,
      max: 8000,
      values: [ 0, 8000 ],
      slide: function( event, ui ) {
        $( "#amount-space" ).val(ui.values[ 0 ] + " - " + ui.values[ 1 ] );

        // var slideVal = [ui.values[ 0 ], ui.values[ 1 ]]
      }
    });
    $( "#amount-space" ).val($( "#slider-range-square-feet" ).slider( "values", 0 ) +
      " - " + $( "#slider-range-square-feet" ).slider( "values", 1 ) );

  });

  $(".btn-default.search-button").click(function(){
    // alert("the button is clicked");

    // grab each one of the 7 parameters,
    // var district =
    var district = "";
    var selectedDistrict = $("#district-param input[type='radio']:checked");
    
    minPrice = $( "#slider-range" ).slider( "values", 0 );
    maxPrice = $( "#slider-range" ).slider( "values", 1 );
    // console.log('minPrice', $( "#slider-range" ).slider( "values", 0 ));
    // console.log('maxPrice', $( "#slider-range" ).slider( "values", 1 ));
    var minFootage = $( "#slider-range-square-feet" ).slider( "values", 0 );
    var maxFootage = $( "#slider-range-square-feet" ).slider( "values", 1 );
    // console.log('minFootage', $( "#slider-range-square-feet" ).slider( "values", 0 ));
    // console.log('maxFootage', $( "#slider-range-square-feet" ).slider( "values", 1 ));

    var minBedroom = $("#min-bed :selected").text();
    var maxBedroom = $("#max-bed :selected").text();


    // store them in 7 variables
    // var minBedrooms = 1;
    // var maxBedrooms = 4;


    // generate the query url, by concatenating all the params
    url = "/listing-search";
    url += "?minPrice=" + minPrice;
    url += "&maxPrice=" + maxPrice;
    url += "&minFootage=" + minFootage;
    url += "&maxFootage=" + maxFootage;
    url += "&minBedroom=" + minBedroom;
    url += "&maxBedroom=" + maxBedroom;
    if (selectedDistrict.length > 0) {
      district = selectedDistrict.val();
      url += "&district=" + district;
    }

    // if there is a value for min beds --> add minBeds
    // if there is a value for max beds --> add maxBeds
    console.log('district', district);
    console.log('url', url);

    // do the ajax (get) request
    $.get(url, function(data) {
      // receive data in response --> will be an array
      // 
      for (var i=0; i < data.length; i++) {

        var searchTerm = '<div class="result">' +
            '<div class="row property-header">' +
              '<div class="col-xs-8">' +
                '<span class="property-name">Twin Regency</span>' + 
                '<span class="property-address">Jalan Membina, 098765 </span>' +  // VALUE HERE
              '</div>' +
              '<div class="col-xs-2 district-code">' +
                'District 11' +  // VALUE HERE
              '</div>' +
              '<div class="col-xs-2">' +
                '<span class="glyphicon glyphicon-heart-empty" aria-hidden="true"></span>' +
              '</div>' +
            '</div>' +
            '<div class="row filterBox">' +
              '<div class="row property-listing-body">' +
                '<div class="col-xs-6 property-picture">' +
                'image' +  // ACTUAL PICTURE HERE
                '</div>' +
                '<div class="col-xs-6">' +
                  '<p>Price: </p>' + 
                  '<p>Size: </p>' + data[i].apartment_size +
                  '<p>Price Per Square Foot: </p>' +  // VALUE HERE
                  '<p>Tenure: </p>' +  // VALUE HERE
                '</div>' +
              '</div>' +
            '</div>' +
          '</div>'
          
        $(searchTerm).appendTo("#search-results")  

        // console.log(searchTerm);

        console.log(data[i]);
        
    
      // for (var i in data) {
      //   console.log(i);
      // };
      
      // clear the list of results: .html('')

      
      // for each element in the array, loop and APPEND to the list of results!
        // LOOP
        // var parsed = "";
        // var 
        // for (var 


        //   var i=0; i <= data.length; i++) {
        //   console.log(data);
        // }


        

    };


  });

  });

});