class Hero
	@speed:150 #px/s 
	@width:60
	@height:100

	constructor: (@x, @y) ->
		@factory = new FixSizeAnimiationFactory("hero", Hero.width, Hero.height)
		@up = @factory.createWithFrames(upFrames())
		@left = @factory.createWithFrames(leftFrames())
		@right = @factory.createWithFrames(rightFrames())
		@down = @factory.createWithFrames(downFrames())

		@state = @downState
		@animation = @factory.createWithFrames(upFrames())

	updateState: () ->
		@walking = KeyEvent.check('VK_UP') || KeyEvent.check('VK_LEFT') ||
				KeyEvent.check('VK_RIGHT') || KeyEvent.check('VK_DOWN')
		if KeyEvent.check('VK_UP')
			@state = new UpState()
			@animation = @up
		if KeyEvent.check('VK_LEFT')
			@state = new LeftState()
			@animation = @left
		if KeyEvent.check('VK_RIGHT')
			@state = new RightState()
			@animation = @right
		if KeyEvent.check('VK_DOWN')
			@state = new DownState()
			@animation = @down

	withinBoundary:(newPosition) ->
		#hard coded for now
		x = newPosition.x
		y = newPosition.y
		x > 0 && x < GlobalConfig.width - 60 && y > 0 && y < GlobalConfig.height - 100

	updatePosition:(delta) ->
		newPosition = @state.getNextPosition(@x, @y, Hero.speed * delta / 1000)
		if(@withinBoundary(newPosition))
			@x = newPosition.x
			@y = newPosition.y

	draw: (context, delta) ->
		@updateState()
		if(@walking)
			@animation.update(delta) 
			@updatePosition(delta)
		@animation.drawOn(context, @x, @y)

window.Hero = Hero