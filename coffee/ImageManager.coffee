class ImageManager
	@images:{}

	@loadImage:(image)->
		ImageManager.images[image.name] = new Image()

		ImageManager.images[image.name].addEventListener "load", ->
			ImageManager.images[image.name].loaded = true
		, false

		ImageManager.images[image.name].src = image.url

	#images = [{name:"hero", url="image/hero1.png"}]
	@load:(images)->
		ImageManager.loadImage(image) for image in images

		# while(true)
		# 	result = true
		# 	result = result && image.loaded for name, image of ImageManager.images
		# 	break if result

	@getImageByName:(name)->
		return ImageManager.images[name]

window.ImageManager = ImageManager