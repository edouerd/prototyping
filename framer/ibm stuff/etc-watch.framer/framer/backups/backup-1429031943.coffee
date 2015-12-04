# This imports all the layers for "edouard-watch" into edouardWatchLayers
watch = Framer.Importer.load "imported/edouard-watch"

#—————————————————————————————————————————

ds = new VideoLayer({video: "images/ds.mp3"})
ds.opacity = 0

#—————————————————————————————————————————

# BUTTON STATES
## States
watch.Button.states.add
	pressed:
		scale: .60
	flip:
		rotationZ: 360
		scale: 1
## Animation	
watch.Button.states.animationOptions =
	curve: "spring(800,80,10)"
	
# BUTTON INTERACTIONS
## First Screen	
watch.Button.on Events.TouchStart, ->
	watch.Button.states.switch("pressed")
	ds.player.play()
watch.Button.on Events.TouchEnd, ->
	watch.Button.states.switch("default")
	ds.player.fastSeek(0)

#—————————————————————————————————————————