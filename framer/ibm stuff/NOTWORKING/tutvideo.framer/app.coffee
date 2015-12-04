VidBG = new Layer
	y: 50,
	width: 1440
	height: 404
	backgroundColor:"#333333"
VidBG.states.add
	initiated: {opacity: 1,	z: 1}	
VidBG.states.animationOptions =
	curve: "spring(800)"	
	
Vid = new VideoLayer 
	opacity: 0,
	x: 350,
	y: 50,
	width: 710, 
	height: 404, 
	video:"images/ibmdesignstudio.mp4",
	backgroundColor:"#333333"
Vid.states.add
	initiated: {opacity: 1,	z: 2}	
Vid.states.animationOptions =
	curve: "spring(1000,80,10)"
	
Vid.player.play()

Bg = new Layer
	width: 1440
	height: 900
	backgroundColor: "#fafafa"
	
Ra = Framer.Importer.load "imported/video" 

# BACKGROUND
Ra.BACKGROUND.states.add
	initiated: {opacity: 0, z: -1}
Ra.BACKGROUND.states.animationOptions =
	curve: "spring(1000,80,10)"
	
# YES BUTTON

Ra.YES.states.add
	hover: {opacity: .5}
	
Ra.YES.on Events.MouseOver, ->	
	Ra.YES.states.next("hover")
	
Ra.YES.on Events.MouseOut, ->	
	Ra.YES.states.next("default")
	
Ra.YES.states.animationOptions =
	curve: "spring(1000,80,10)"	
	
# NO BUTTON
Ra.NO.z = 5
Ra.NO.states.add
	hovered: {opacity: .5, z: 5}
	
Ra.NO.on Events.MouseOver, ->	
	Ra.NO.states.next("hovered")
Ra.NO.on Events.MouseOut, ->	
	Ra.NO.states.next("default")
	
Ra.NO.states.animationOptions =
	curve: "spring(1000,80,10)"	
	
# EXIT BUTTON
Ra.EXIT.opacity = 0

Ra.EXIT.states.add
	hovered: {opacity: .9, z: 4}
Ra.EXIT.on Events.MouseOver, ->	
	Ra.EXIT.states.next("hovered")
Ra.EXIT.on Events.MouseOut, ->	
	Ra.EXIT.states.next("default")
	
Ra.EXIT.states.animationOptions =
	curve: "spring(1000,80,10)"	
	
#INTERACTION

Ra.YES.on Events.Click, ->	
	Ra.BACKGROUND.states.next("initiated")
	Vid.states.next("initiated")
	VidBG.states.next("initiated")
	Ra.EXIT.states.next("hovered")

Ra.NO.on Events.Click, ->	
	Ra.BACKGROUND.states.next("initiated")
	Vid.states.next("initiated")
	VidBG.states.next("initiated")
	Ra.EXIT.states.next("hovered")

Ra.EXIT.on Events.Click, ->	
	Ra.BACKGROUND.states.next("default")
	Vid.states.next("default")

