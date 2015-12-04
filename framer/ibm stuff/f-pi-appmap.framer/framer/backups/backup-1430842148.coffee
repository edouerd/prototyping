app = Framer.Importer.load "imported/f-piapp"

# DEFAULTS
app.appbg.y = -38

# ORIGIN POINTS
origin1 = new Layer
	x: 573
	y: 223
	width: 20
	height: 20
	borderRadius: 10
	backgroundColor: "#334249"
	opacity: 1
origin2 = new Layer
	x: 1073
	y: 223
	width: 20
	height: 20
	borderRadius: 10
	backgroundColor: "#334249"
	opacity: 0

	
# ORIGIN HOVERAREAS
origin1hover = new Layer
	x: 563
	y: 213
	width: 40
	height: 40
	borderRadius: 20
	opacity: .1
origin2hover = new Layer
	x: 1063
	y: 213
	width: 40
	height: 40
	borderRadius: 20
	opacity: .1

# ORIGIN STATES
origin1.states.add
	highlight: {
		backgroundColor: "#FF3817"
		opacity: 1
	}
	summoned: {
		scale: 1.125
	}

origin2.states.add
	highlight: {
		backgroundColor: "#FF3817"
		opacity: 1
	}
	summoned: {
		scale: 1.25
		opacity: 1
	}

# ORIGIN ANIMATION SHIT
origin1.states.animationOptions =
	curve: "spring(1000,80,10)"	
	
origin2.states.animationOptions =
	curve: "spring(1000,80,10)"	
	
# ORIGIN INTERACTIONS
origin1hover.on Events.MouseOver, ->
	origin1.states.next("highlight")
origin1hover.on Events.MouseOut, ->
	origin1.states.next("default")
	
origin1.on Events.Click, ->
	origin1.states.next("summoned")
origin1.on Events.Click, ->
	origin1.states.next("summoned")

origin2.on Events.MouseOver, ->
	origin2.states.next("highlight")
origin2.on Events.Click, ->
	origin2.states.next("summoned")
origin2.on Events.TouchEnd, ->
	origin2.states.next("summoned")
	