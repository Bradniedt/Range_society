const options = {
  enableHighAccuracy: true,
  timeout: 7000,
  maximumAge: 0
}
const currLocationBtn = document.querySelector('#current-location')
const currLocationInput = document.querySelector('#zip-search');

function success(position) {
  return position.latitude, position.longitude;
};
function error(err) {
  return `ERROR code: ${err.code}, message: ${err.message}`;
};
currLocationBtn.addEventListener('click', () => {
  lat, long = navigator.geolocation.getCurrentPosition(success, error, options);
  currLocationInput.innerHTML = `${lat} ${long}`;
});
