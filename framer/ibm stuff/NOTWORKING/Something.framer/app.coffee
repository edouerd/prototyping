bg = new Layer
	x: 0
	y: 0
	width: 1440
	height: 2048
	backgroundColor: "#FFFFFF"
Vs = Framer.Importer.load "imported/vs-mvp-one"

Vs.Popup.opacity = 0

Vs.Popup.states.add
	clicked: {opacity: 1}
	
Vs.Popup.states.animationOptions =
	curve: "spring(1000,80,10)"
	
Vs.Story.on Events.Click, ->
	Vs.Popup.states.next("clicked", "default")


