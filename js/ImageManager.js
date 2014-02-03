// Generated by CoffeeScript 1.4.0
(function() {
  var ImageManager;

  ImageManager = (function() {

    function ImageManager() {}

    ImageManager.images = {};

    ImageManager.loadImage = function(image) {
      ImageManager.images[image.name] = new Image();
      ImageManager.images[image.name].addEventListener("load", function() {
        return ImageManager.images[image.name].loaded = true;
      }, false);
      return ImageManager.images[image.name].src = image.url;
    };

    ImageManager.load = function(images) {
      var image, _i, _len, _results;
      _results = [];
      for (_i = 0, _len = images.length; _i < _len; _i++) {
        image = images[_i];
        _results.push(ImageManager.loadImage(image));
      }
      return _results;
    };

    ImageManager.getImageByName = function(name) {
      return ImageManager.images[name];
    };

    return ImageManager;

  })();

  window.ImageManager = ImageManager;

}).call(this);
