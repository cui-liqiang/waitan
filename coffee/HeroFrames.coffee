frameWidth = 64
frameHeigth = 100

frames = (y)->
	{left: index * frameWidth, top: y, duration: 200} for index in [0, 1, 2, 3]

window.upFrames = ->
	frames(300)

window.leftFrames = ->
	frames(100)

window.rightFrames = ->
	frames(200)

window.downFrames = ->
	frames(0)