app = Framer.Importer.load "imported/f-piapp"

# DEFAULTS
app.appbg.y = -38
app.hover1.opacity = 0
app.hover2.opacity = 0
app.hover3.opacity = 0
app.hover4.opacity = 0

# ORIGIN POINTS
o1 = new Layer
	x: 573
	y: 223
	width: 20
	height: 20
	borderRadius: 10
	backgroundColor: "#334249"
	opacity: 1
o2 = new Layer
	x: 1073
	y: 223
	width: 20
	height: 20
	borderRadius: 10
	backgroundColor: "#334249"
	opacity: 0
o3 = new Layer
	x: 573
	y: 720
	width: 20
	height: 20
	borderRadius: 10
	backgroundColor: "#334249"
	opacity: 0
o4 = new Layer
	x: 1073
	y: 720
	width: 20
	height: 20
	borderRadius: 10
	backgroundColor: "#334249"
	opacity: 0
	
# HOVER STATES

app.hover1.states.add
	hover:
		opacity: 1
app.hover2.states.add
	hover:
		opacity: 1
app.hover3.states.add
	hover:
		opacity: 1
app.hover4.states.add
	hover:
		opacity: 1

# ORIGIN STATES
o1.states.add
	click:
		opacity: 1
		backgroundColor: "#FF3817"
		scale: 1.125
	clickend1: 
		scale: 1
		opacity: 1
		backgroundColor: "#334249"
	hover:
		opacity: .25
		backgroundColor: "#334249"
	dis:
		opacity: 0
		backgroundColor: "#334249"
		
o2.states.add
	click:
		opacity: 1
		scale: 1.125
		backgroundColor: "#FF3817"
	clickend1: 
		scale: 1
		opacity: 1
		backgroundColor: "#334249"
	hover:
		opacity: .25
		backgroundColor: "#334249"
	dis:
		opacity: 0
		backgroundColor: "#334249"
o3.states.add
	click:
		opacity: 1
		backgroundColor: "#FF3817"
		scale: 1.125
	clickend1: 
		scale: 1
		opacity: 1
		backgroundColor: "#334249"
	hover:
		opacity: .25
		backgroundColor: "#334249"
	dis:
		opacity: 0
		backgroundColor: "#334249"
		
o4.states.add
	click:
		opacity: 1
		scale: 1.125
		backgroundColor: "#FF3817"
	clickend1: 
		scale: 1
		opacity: 1
		backgroundColor: "#334249"
	hover:
		opacity: .25
		backgroundColor: "#334249"
	dis:
		opacity: 0
		backgroundColor: "#334249"

# ORIGIN ANIMATION SHIT
o1.states.animationOptions =
	curve: "spring(1000,100,50)"
o2.states.animationOptions =
	curve: "spring(1000,100,50)"
o3.states.animationOptions =
	curve: "spring(1000,100,50)"
o4.states.animationOptions =
	curve: "spring(1000,100,50)"

app.hover1.states.animationOptions =
	curve: "spring(1000,100,50)"
app.hover2.states.animationOptions =
	curve: "spring(1000,100,50)"	
app.hover3.states.animationOptions =
	curve: "spring(1000,100,50)"	
app.hover4.states.animationOptions =
	curve: "spring(1000,100,50)"	
	
# ORIGIN INTERACTIONS
# ORIGIN ONE
o1.on Events.MouseOver, ->
	o1.states.next("hover")
	app.hover1.states.next("hover")
o1.on Events.MouseOut, ->
	app.hover1.states.next("default")
o1.on Events.TouchStart, ->
	o1.states.next("click")
o1.on Events.TouchEnd, ->
	o1.states.next("clickend1")
	o2.states.next("dis")
	o3.states.next("dis")
	o4.states.next("dis")
# ORIGIN TWO
o2.on Events.MouseOver, ->
	o2.states.next("hover")
	app.hover2.states.next("hover")
o2.on Events.MouseOut, ->
	app.hover2.states.next("default")
o2.on Events.TouchStart, ->
	o2.states.next("click")
o2.on Events.TouchEnd, ->
	o2.states.next("clickend1")
	o1.states.next("dis")
	o3.states.next("dis")
	o4.states.next("dis")
# ORIGIN THREE
o3.on Events.MouseOver, ->
	o3.states.next("hover")
	app.hover3.states.next("hover")
o3.on Events.MouseOut, ->
	app.hover3.states.next("default")
o3.on Events.TouchStart, ->
	o3.states.next("click")
o3.on Events.TouchEnd, ->
	o3.states.next("clickend1")
	o1.states.next("dis")
	o2.states.next("dis")
	o4.states.next("dis")
# ORIGIN FOUR
o4.on Events.MouseOver, ->
	o4.states.next("hover")
	app.hover4.states.next("hover")
o4.on Events.MouseOut, ->
	app.hover4.states.next("default")
o4.on Events.TouchStart, ->
	o4.states.next("click")
o4.on Events.TouchEnd, ->
	o4.states.next("clickend1")
	o1.states.next("dis")
	o2.states.next("dis")
	o3.states.next("dis")
