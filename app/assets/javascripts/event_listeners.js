self.addEventListener("load", function(){
  const options = { enableHighAccuracy: true, timeout: 7000, maximumAge: 0 };
  const currLocationBtn = document.querySelector('#current-location');
  const currLocationInput = document.querySelector('#search-location');

  function getLocation() {
    return new Promise(function(resolve, reject) {
      return navigator.geolocation.getCurrentPosition(function(position){
        const coords = position.coords;
        resolve({
          lat: coords.latitude,
          long: coords.longitude
        });
      }, function(err) {
        reject(`ERROR code: ${err.code}, message: ${err.message}`);
      }, options);
    });
  }

  function populateSearchLocation(coordinates) {
    currLocationInput.value = `${coordinates.lat} ${coordinates.long}`;
  }

  function fillCurrentLocation(event) {
    event.preventDefault();
    getLocation()
      .then(populateSearchLocation)
      .catch(function(error) {
        console.warn(error);
      });
  }

currLocationBtn.addEventListener('click', fillCurrentLocation);

});
