$(document).ready(function(){

  $('.stick-man').stickThis();

  // $('.stick-man').stickThis({
  //     top: 200
  // });
  $(function() {
    $( "#slider-range" ).slider({
      range: true,
      min: 0,
      max: 500,
      values: [ 75, 300 ],
      slide: function( event, ui ) {
        $( "#amount" ).val( "$" + ui.values[ 0 ] + " - $" + ui.values[ 1 ] );
        // var slideVal = [ui.values[ 0 ], ui.values[ 1 ]]
      }
    });
    $( "#amount" ).val( "$" + $( "#slider-range" ).slider( "values", 0 ) +
      " - $" + $( "#slider-range" ).slider( "values", 1 ) );
  });

    $(function() {
    $( "#slider-range-square-feet" ).slider({
      range: true,
      min: 0,
      max: 500,
      values: [ 75, 300 ],
      slide: function( event, ui ) {
        $( "#amount" ).val( "$" + ui.values[ 0 ] + " - $" + ui.values[ 1 ] );
        // var slideVal = [ui.values[ 0 ], ui.values[ 1 ]]
      }
    });
    $( "#amount" ).val( "$" + $( "#slider-range" ).slider( "values", 0 ) +
      " - $" + $( "#slider-range-square-feet" ).slider( "values", 1 ) );
  });

});