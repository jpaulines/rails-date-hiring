import "bootstrap";


// Algolia places

var places = require('places.js');
places({
  appId: 'plIAULCHR775',
  apiKey: '85e799933c00b2920bf320a2eb51b31e',
  container: document.querySelector('#location-input'),
  type: 'city',
});

