function insertVideojs() {
  var id = 'refinerycms-videojs';
  var videojs = document.querySelector('script#' + id);
  var videocss = document.querySelector('link#' + id);

  if (videojs) videojs.remove();
  if (videocss) videocss.remove();

  var head = document.getElementsByTagName('head')[0];
  var link = document.createElement('link');
  var script = document.createElement('script');

  link.id = id;
  link.rel = 'stylesheet';
  link.type = 'text/css';
  link.href = 'https://vjs.zencdn.net/7.6.6/video-js.css';
  script.id = id;
  script.src = 'https://vjs.zencdn.net/7.6.6/video.js';

  head.appendChild(link);
  head.appendChild(script);
};

document.addEventListener("DOMContentLoaded", insertVideojs);
document.addEventListener("turbolinks:load", insertVideojs);
