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
	render:()->
		@context.clearRect(0, 0, GlobalConfig.width, GlobalConfig.height)
		object.draw(@context, 30) for object in @objects
	start:->
		@render();
		if @checkCollision()
			alert("collision")
		else
			self = this
			setTimeout(()->
				self.start()
			, 30)

window.Game = Game