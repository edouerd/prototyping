# This imports all the layers for "f-pi-ipadsetupapp" into fPiIpadsetupappLayers3
setup = Framer.Importer.load "imported/f-pi-ipadsetupapp"

# —————————————————————————————————————————————————————————————— MAPSCREEN STATE MACHINE

setup.mapscreen.states.add
	summoned: {x: 0}
# ———————————————————————————— MAPSCREEN ANIMATON OPTIONS
setup.mapscreen.states.animationOptions =
	curve: "spring(1000,80,10)"
# ———————————————————————————— MAPSCREEN INTERACTIONS
setup.green.on Events.TouchEnd, ->
	setup.mapscreen.states.next("summoned","default")

# —————————————————————————————————————————————————————————————— MAPVIEW STATE MACHINE

setup.mapview.draggable.enabled = true
setup.mapview.states.add
	dragging: {scale: 1.025}
# ———————————————————————————— MAPVIEW ANIMATON OPTIONS
setup.mapview.states.animationOptions =
	curve: "spring(800,80,10)"
# ———————————————————————————— MAPVIEW INTERACTIONS
setup.mapview.on Events.TouchStart, ->
	setup.mapview.states.next("dragging")
setup.mapview.on Events.TouchEnd, ->
	setup.mapview.states.next("default")
	
# —————————————————————————————————————————————————————————————— TOOLBAR STATE MACHINE

setup.toolbar.states.add
	summoned: {y: 618}
# ———————————————————————————— MAPVIEW ANIMATON OPTIONS
setup.toolbar.states.animationOptions =
	curve: "spring(1000,80,10)"	
# ———————————————————————————— MAPVIEW INTERACTIONS
setup.green.on Events.TouchEnd, ->
	setup.toolbar.states.next("summoned","default")

# —————————————————————————————————————————————————————————————— ADDBEACON STATE MACHINE

# set attributes
setup.addbeacon.draggable.enabled = true
# store original location
originX = setup.addbeacon.x
originY = setup.addbeacon.y
# states
setup.addbeacon.states.add
	pressed: {scale:1.125, shadowY:8, shadowBlur:20}
	placed: {scale:.5, shadowY:1, shadowBlur:3}
	dispelled: {scale:1, x:originX, y:originY, shadowY:1, shadowBlur:3}
setup.addbeacon.states.animationOptions =
	curve: "spring(1000,20,10)"	
# RapidApps Interaction
setup.addbeacon.on Events.TouchStart, ->
	setup.addbeacon.states.next("pressed")
setup.addbeacon.on Events.TouchEnd, ->
	setup.addbeacon.states.next("placed","dispelled")
	newicon.states.next("summoned")
# replacement icon	
newicon = new Layer
	x: 37
	y: 656
	borderRadius: 38
	width: 75
	height: 75
	backgroundColor: '#F288AE'
# set attributes	
newicon.scale = 0
newicon.draggable.enabled = true
# states
newicon.states.add
	summoned: {scale:1}
	
newicon.states.animationOptions =
	curve: "spring(1000,20,10)"	
	

	
# —————————————————————————————————————————————————————————————— ADDSENSOR STATE MACHINE

# Enable dragging
setup.addsensor.draggable.enabled = true
# store original location
originX = setup.addsensor.x
originY = setup.addsensor.y
# states
setup.addsensor.states.add
	pressed: {scale:1.125, shadowY:8, shadowBlur:20}
	dispelled: {scale:1, x:originX, y:originY, shadowY:1, shadowBlur:3}
setup.addsensor.states.animationOptions =
	curve: "spring(1000,20,10)"	
# RapidApps Interaction
setup.addsensor.on Events.TouchStart, ->
	setup.addsensor.states.next("pressed")
setup.addsensor.on Events.TouchEnd, ->
	setup.addsensor.states.next("dispelled")
	
# —————————————————————————————————————————————————————————————— Green STATE MACHINE	
setup.green.states.add
	pressed: {scale: .9}
setup.green.states.add
	summoned: {y: 0}
	dispelled: {y: 1136}
setup.green.states.animationOptions =
	curve: "spring(1000,20,10)"	
# RapidApps Interaction
setup.green.on Events.TouchStart, ->
	setup.green.states.next("pressed")
setup.green.on Events.TouchEnd, ->
	setup.green.states.next("default")