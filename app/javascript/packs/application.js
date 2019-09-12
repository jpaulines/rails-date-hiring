import "bootstrap";
import { initMapbox } from '../plugins/init_mapbox';
import 'mapbox-gl/dist/mapbox-gl.css';
import { initSweetalert } from '../plugins/init_sweetalert';
// Algolia places

if (document.querySelector('#location-input')) {
var places = require('places.js');
places({
  appId: 'plIAULCHR775',
  apiKey: '85e799933c00b2920bf320a2eb51b31e',
  container: document.querySelector('#location-input'),
  type: 'city',
});
}

// Mapbox

initMapbox();



initSweetalert('#approve-request-sweet', {
  title: "Congrats, you found great company!",
  text: "Go to 'Events ahead' to find all details about your mate",
  icon: "success"
});

initSweetalert('#decline-request-sweet', {
  title: "You successfully decline this request!",
  icon: "success"
});

