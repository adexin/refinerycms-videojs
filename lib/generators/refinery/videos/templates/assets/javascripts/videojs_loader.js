window.onload = function ()
{
    if ($('video').is('*')) {
        $('body').append('<link href="http://vjs.zencdn.net/c/video-js.css" rel="stylesheet">')
        $('body').append('<script src="http://vjs.zencdn.net/c/video.js"></script>')
    }
};