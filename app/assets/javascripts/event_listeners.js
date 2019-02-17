window.addEventListener("load", function(){
  const options = { enableHighAccuracy: true, timeout: 7000, maximumAge: 0 };
  const currLocationBtn = document.querySelector('#current-location');
  const currLocationInput = document.querySelector('#search-location');
  const submitSearchBtn = document.querySelector('#submit-search');
  const searchForm = document.querySelector('#search-form');

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

  function createCoordsCookie(coordinates) {
    const cookie = `coordinates=${coordinates.lat} ${coordinates.long}`;
    document.cookie = cookie;
  }

  function submitWithCurrent() {
    getLocation()
      .then(createCoordsCookie)
      .then(function() {
        submitSearchBtn.click();
      })
      .catch(function(error) {
        console.warn(error);
      });
  }

  if (currLocationBtn) {
    currLocationBtn.addEventListener('click', submitWithCurrent);
  }
});
