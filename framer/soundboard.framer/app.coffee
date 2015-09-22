# This imports all the layers for "soundboard" into soundboardLayers
board = Framer.Importer.load "imported/soundboard"
# Set background
bg = new BackgroundLayer backgroundColor: "#231E1E"
# Import module
{UISound} = require "uisound"

# Soundz
boop = new UISound("sounds/boop.mp3")
beep = new UISound("sounds/beep.mp3")
upstairs = new UISound("sounds/upstairs.mp3")
downstairs = new UISound("sounds/downstairs.mp3")
tweet = new UISound("sounds/tweet.mp3")
toot = new UISound("sounds/toot.mp3")

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