refreshInterval = 100;//ms
moveInterval = 20;//ms

function addPolices(game) {
	for(var i = 0;i < 8;i++) {
		game.addPolice(new Police(i * 100 + 200, Math.round(Math.random() * 200),
			Math.round(Math.random() * 100) + 100))
	}
}

function loadGame() {
	KeyEvent.addListener();
	ImageManager.load([{name:"hero", url:"image/hero1.png"}])
	ImageManager.load([{name:"police", url:"image/jingcha.jpg"}])
	ImageManager.load([{name:"fail", url:"image/arrested.jpg"}])
	ImageManager.load([{name:"win", url:"image/fullscreen.jpg"}])


	var context = document.getElementById("bound").getContext("2d");
	var hero = new Hero(100, 100);
	var game = new Game(hero, context);
	addPolices(game);
	game.start();
}


