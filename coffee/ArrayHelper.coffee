Array.prototype.any = (func)->
	(1 for ele in this when func(ele)).length > 0