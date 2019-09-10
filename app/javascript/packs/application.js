import "bootstrap";
import { initMapbox } from '../plugins/init_mapbox';
import 'mapbox-gl/dist/mapbox-gl.css';
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

