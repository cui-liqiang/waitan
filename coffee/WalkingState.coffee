class LeftState
	getNextPosition: (x, y, distance) ->
		{x: x - distance, y: y}
	opposite:->
		return new RightState();

class UpState
	getNextPosition: (x, y, distance) ->
		{x: x, y: y - distance}
	opposite:->
		return new DownState();

class RightState
	getNextPosition: (x, y, distance) ->
		{x: x + distance, y: y}
	opposite:->
		return new LeftState();

class DownState
	getNextPosition: (x, y, distance) ->
		{x: x, y: y + distance}
	opposite:->
		return new UpState();

window.LeftState = LeftState
window.UpState = UpState
window.RightState = RightState
window.DownState = DownState