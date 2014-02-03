// Generated by CoffeeScript 1.4.0
(function() {
  var Animation;

  Animation = (function() {

    function Animation(imageName, frames, frameWidth, frameHeigth) {
      this.imageName = imageName;
      this.frames = frames;
      this.frameWidth = frameWidth;
      this.frameHeigth = frameHeigth;
      this.currentFrame = this.frames[0];
      this.currentFrameIndex = 0;
      this.currentFrameElapseTime = 0;
      this.image = ImageManager.getImageByName(this.imageName);
    }

    Animation.prototype.update = function(deltaTime) {
      if (this.currentFrameElapseTime + deltaTime >= this.currentFrame.duration) {
        this.currentFrameIndex = (this.currentFrameIndex + this.frames.length + 1) % this.frames.length;
        this.currentFrame = this.frames[this.currentFrameIndex];
        return this.currentFrameElapseTime = 0;
      } else {
        return this.currentFrameElapseTime += deltaTime;
      }
    };

    Animation.prototype.drawOn = function(context, dx, dy) {
      return context.drawImage(this.image, this.currentFrame.left, this.currentFrame.top, this.frameWidth, this.frameHeigth, dx, dy, this.frameWidth, this.frameHeigth);
    };

    return Animation;

  })();

  window.Animation = Animation;

}).call(this);
