class Game
	constructor:(@hero, @context)->
		@objects = [@hero]
		@polices = []
	addObject : (object)->
		@objects.push(object)
	addPolice : (police)->
		@polices.push(police)
		@addObject(police)
	checkCollision:->
		theHero = @hero
		@polices.any (police)->
			police.overlapWith(theHero)
	render:->
		@context.clearRect(0, 0, GlobalConfig.width, GlobalConfig.height)
		object.draw(@context, 30) for object in @objects
	failScreen:->
		alpha = 100
		delta = 5
		self = this
		fadeOut = ->
			alpha -= delta
			self.context.globalAlpha = alpha / 100
			self.render()
			if(alpha > 0)
				setTimeout(fadeOut, 50)
			else
				self.context.globalAlpha = 1
				self.context.font = 'italic 40pt Calibri'
				self.context.drawImage(ImageManager.getImageByName("fail"), 0, 0, 350, 300)
				self.context.fillText("You are arrested!!!!", 400, 150)
		setTimeout(fadeOut ,50)

	start:->
		@render();
		if @checkCollision()
			@failScreen()
		else
			self = this
			setTimeout(()->
				self.start()
			, 30)

window.Game = Game