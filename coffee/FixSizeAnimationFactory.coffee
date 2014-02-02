class FixSizeAnimiationFactory
	constructor: (@imageName, @frameWidth, @frameHeight)->

	createWithFrames:(frames) ->
		new Animation(@imageName, frames, @frameWidth, @frameHeight)

window.FixSizeAnimiationFactory = FixSizeAnimiationFactory