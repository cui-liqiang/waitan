class Police
	@speed = 100;#px/s
	@img = "image/jingcha.jpg";
	@width = 60;#px
	@height = 100;#px
	constructor:(@x, @y)->
		@state = new UpState()
		@image = ImageManager.getImageByName("police");

	udpateState:(state) ->
		@state = state

	withinBoundary:(newPosition)->
		x = newPosition.x
		y = newPosition.y
		x > 0 && x < GlobalConfig.width - @width && y > 0 && y < GlobalConfig.height - @height

	draw: (context, delta) ->
		newPosition = @state.getNextPosition(@x, @y, Hero.speed * delta / 1000)
		if @withinBoundary(newPosition)
			@x = newPosition.x
			@y = newPosition.y
		else
			@state = @state.opposite()
		context.drawImage(@image, @x, @y, Police.width, Police.height)

window.Police = Police