class Police
	@img = "image/jingcha.jpg";
	@width = 60;#px
	@height = 100;#px
	constructor:(@x, @y, @speed)->
		@state = new UpState()
		@image = ImageManager.getImageByName("police");

	udpateState:(state) ->
		@state = state

	withinBoundary:(newPosition)->
		x = newPosition.x
		y = newPosition.y
		x > 0 && x < GlobalConfig.width - Police.width && y > 0 && y < GlobalConfig.height - Police.height

	overlapWith:(hero)->
		tolerant = GlobalConfig.collisionTolerant
		!(@x + tolerant > Hero.width + hero.x || @x + Police.width < hero.x + tolerant \
		|| @y + tolerant > Hero.height + hero.y \
		|| @y + Police.height < hero.y + tolerant)

	draw: (context, delta) ->
		newPosition = @state.getNextPosition(@x, @y, @speed * delta / 1000)
		if @withinBoundary(newPosition)
			@x = newPosition.x
			@y = newPosition.y
		else
			@state = @state.opposite()
		context.drawImage(@image, @x, @y, Police.width, Police.height)

window.Police = Police