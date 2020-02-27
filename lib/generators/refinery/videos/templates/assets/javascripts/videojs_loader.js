window.onload = function () {
  var video = document.getElementsByTagName('video')[0];

  if (!video) return;

  var head = document.getElementsByTagName('head')[0];
  var link = document.createElement('link');
  var script = document.createElement('script');

  link.rel = 'stylesheet';
  link.type = 'text/css';
  link.href = 'https://vjs.zencdn.net/7.6.6/video-js.css';
  script.src = 'https://vjs.zencdn.net/7.6.6/video.js';

  head.appendChild(link);
  head.appendChild(script);
};
