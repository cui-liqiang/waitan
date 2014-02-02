class Animation
	constructor:(@imageName, @frames, @frameWidth, @frameHeigth) ->
		@currentFrame = @frames[0]
		@currentFrameIndex = 0
		@currentFrameElapseTime = 0
		@image = ImageManager.getImageByName(@imageName)
	
	update:(deltaTime) ->
		if(@currentFrameElapseTime + deltaTime >= @currentFrame.duration)
			@currentFrameIndex = (@currentFrameIndex + @frames.length + 1) % @frames.length
			@currentFrame = @frames[@currentFrameIndex]
			@currentFrameElapseTime = 0
		else
			@currentFrameElapseTime += deltaTime

	drawOn:(context, dx, dy) ->
		context.drawImage(@image, @currentFrame.left, @currentFrame.top, \
			@frameWidth, @frameHeigth, dx, dy, @frameWidth, @frameHeigth)

window.Animation = Animation