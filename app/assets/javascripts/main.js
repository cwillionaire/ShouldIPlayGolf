$(document).ready(function() {
  $('.datetimepicker').datetimepicker({
    format: 'dddd, MMMM Do, YYYY h:mm A',
    useCurrent: true,
    maxDate: moment().add(10, 'days'),
    stepping: 15,
    sideBySide: true,
    icons: {
      time: "fa fa-lg fa-clock-o",
      date: "fa fa-lg fa-calendar",
      up: "fa fa-lg fa-arrow-up",
      down: "fa fa-lg fa-arrow-down",
      previous: 'fa fa-lg fa-chevron-left',
      next: 'fa fa-lg fa-chevron-right',
      today: 'fa fa-lg fa-rocket',
      clear: 'fa fa-lg fa-trash',
      close: 'fa fa-lg fa-remove'
    }
  });
});

// Initialize Google Maps Javascript API Autocomplete feature
function initialize() {
  var input = document.getElementById('location-input');

  var bounds;

  // Try HTML5 geolocation.
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var pos = {
        lat: position.coords.latitude,
        lng: position.coords.longitude
      };

      var bounds = new google.maps.LatLngBounds(
        new google.maps.LatLng(position.coords.latitude, position.coords.longitude)
      );
    });
  };

  var autocomplete = new google.maps.places.Autocomplete(input, { bounds: bounds });

  google.maps.event.addListener(autocomplete, 'place_changed', function () {
    var place = autocomplete.getPlace();
    document.getElementById('location-input').value = place.name;
    document.getElementById('locationLat').value = place.geometry.location.lat();
    document.getElementById('locationLong').value = place.geometry.location.lng();
  });
}
