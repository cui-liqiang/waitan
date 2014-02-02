class Game
	constructor:->
		@objects = []
	addObject : (object)->
		@objects.push(object)
	render:(context, delta)->
		context.clearRect(0, 0, GlobalConfig.width, GlobalConfig.height)
		object.draw(context, delta) for object in @objects

window.Game = Game