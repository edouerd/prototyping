# This imports all the layers for "vs-mvp-one" into vsMvpOneLayers
vsMvpOneLayers = Framer.Importer.load "imported/vs-mvp-one"

Back = new Layer
	x: 0
	y: 0
	width: 1440
	height: 900
	backgroundColor: "#008749"
	
Back.states.add
	one: {x: 100}
	two: {x: 200}
	
# Video Layer
	
Vid = new VideoLayer 
	x:0, 
	y:-50, 
	width:1440, 
	height:900, 
	video:"images/Playback.mp4"
	
Vid.player.play()

Vid.states.add
	fade: {opacity: .1}
	
Vid.states.animationOptions =
	curve: "spring(800,80,0)"
	
Vs = Framer.Importer.load "imported/vs-mvp-one"
Vs.Story.opacity = 0
Vs.Popup.opacity = 0
Vs.Rest.opacity = 0	
# Summoning Button
	
#Summon = new Layer
#	x: 400
#	y: 400
#	width: 1440/2
#	height: 50
#	backgroundColor: "#fafafa"
#	shadowColor: "rgba(0, 0, 0, 1)"
	
Vs.Summon.states.add
	one: {scale: 1.01, opacity: .6}
Vs.Summon.states.animationOptions =
	curve: "spring(1000,80,0)"

Vs.Summon.on Events.MouseOver, ->
	Vs.Summon.states.next("one")
Vs.Summon.on Events.MouseOut, ->
	Vs.Summon.states.next("default")
	
# Front Layer
	
Front = new Layer
	x: 0
	y: 850
	width: 1440
	height: 2000
	backgroundColor: "#1DB58E"
	
Front.states.add
	one: {y: 80, shadowX: 5, shadowY: 5, shadowBlur:20, shadowColor: "rgba(0, 0, 0, 0.5)"}
	two: {y: 900, shadowX: 0, shadowY: 0, shadowBlur:20, shadowColor: "rgba(0, 0, 0, 0.7)"}
	random1: {backgroundColor: "#fafafa"}
	
Front.states.animationOptions =
	curve: "spring(800,80,0)"
	
# Dispell Button
	
Dispell = new Layer
	x: 1440-100
	y: 950
	width: 25
	height: 25
	backgroundColor: "#008749"
	
Dispell.states.add
	summoned: {x: 1440-50, y: 110, shadowX: 0, shadowY: -20, shadowBlur:20, shadowColor: "rgba(0, 0, 0, 0.7)"}
	
Dispell.states.animationOptions =
	curve: "spring(800,80,0)"
	
# The Interactive Shit

Vs.Summon.on Events.Click, ->
	Front.states.next("one")
	Dispell.states.next("summoned")
	Vid.states.next("fade")
	
Dispell.on Events.Click, ->
	Front.states.next("two")
	Dispell.states.next("default")
	Vid.states.next("default")
	
Front.on Events.Click, ->
	Front.states.next("random1")
