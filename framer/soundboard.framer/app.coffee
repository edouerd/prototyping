# Import module
tabBarModule = require "tabs"
{UISound} = require "uisound"

# Create some views
exploreView = new Layer
	width: Screen.width
	height: Screen.height
	image: "images/I.png"
	z: -100
featuredView = new Layer
	width: Screen.width
	height: Screen.height
	image: "images/II.png"
	z: -100
searchView = new Layer
	width: Screen.width
	height: Screen.height
	image: "images/III.png"
	z: -100
	
tabBar = tabBarModule.tabBar
    A: {icon: "images/unselect.png", selectedIcon: "images/select.png", view: exploreView}
    B: {icon: "images/unselect.png", selectedIcon: "images/select.png", view: featuredView}
    C: {icon: "images/unselect.png", selectedIcon: "images/select.png", view: searchView}
    
tabBarModule.defaults.tintColor = "#CCC"
tabBarModule.defaults.backgroundColor = "#333"
tabBarModule.defaults.opacity = .50
tabBarModule.defaults.blur = 0

# This imports all the layers for "soundboard" into soundboardLayers
board = Framer.Importer.load "imported/soundboard"
# Set background
bg = new BackgroundLayer backgroundColor: "#231E1E"

# Soundz
boop = new UISound("sounds/boop.mp3")
beep = new UISound("sounds/beep.mp3")
upstairs = new UISound("sounds/upstairs.mp3")
downstairs = new UISound("sounds/downstairs.mp3")
tweet = new UISound("sounds/tweet.mp3")
toot = new UISound("sounds/toot.mp3")
notification = new UISound("sounds/notification.mp3")

# Yellow Button
board.yellow.on Events.MouseDown, ->
	boop.play()
	board.yellow.animate
		properties:
			scale: .8
		curve: "spring(1000,45,20)"
board.yellow.on Events.MouseUp, ->
	beep.play()
	board.yellow.animate
		properties:
			scale: 1
		curve: "spring(1000,25,20)"
		
# Blue Button
board.blue.on Events.MouseDown, ->
	upstairs.play()
	board.blue.animate
		properties:
			scale: 1.3
			rotation: 360
		curve: "spring(800,45,20)"
board.blue.on Events.MouseUp, ->
	downstairs.play()
	board.blue.animate
		properties:
			scale: 1
			rotation: 0
		curve: "spring(1000,25,20)"
		
# Red Button
board.red.on Events.MouseDown, ->
	tweet.play()
	board.red.animate
		properties:
			scale: 1.1
		curve: "spring(800,45,20)"
board.red.on Events.MouseUp, ->
	toot.play()
	board.red.animate
		properties:
			scale: 1
		curve: "spring(1000,25,20)"
		
# Summon Button
board.summon.on Events.MouseDown, ->
	
	board.summon.animate
		properties:
			scale: .9
		curve: "spring(800,45,20)"
board.summon.on Events.MouseUp, ->
	notification.play()
	board.summon.animate
		properties:
			scale: 1
		curve: "spring(1000,25,20)"
	board.notification.animate
		properties:
			y: 60
		curve: "spring(1000,50,20)"
		
# Tabs
tabBar.on "tabBarDidSwitch", (name) ->
	toot.play()
