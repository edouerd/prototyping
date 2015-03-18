bg = new Layer width:640, height:1136, backgroundColor:'#FFFFFF'

SS = Framer.Importer.load "imported/Fstickies"

# —————————————————————————————————————————— Sticky Note States/Attribtues/Animation

## Defaults
SS.Sticky.shadowColor = "rgba(0, 0, 0, 0.30)"
## States
SS.Sticky.states.add
	tapped:
		rotationZ: -0, 
		rotationY: -0, 
		rotationX: -0, 
		shadowX: 0, 
		shadowY: 0, 
		shadowBlur:10, 
		shadowColor: "rgba(50, 50, 255, 0.50)", 
		scale: 1.025,
	summoned:
		x: 70
		y: 125
		#scale: 1.25
	prepped:
		y: 150
	send:
		y: -300
## Animation	
SS.Sticky.states.animationOptions =
	curve: "spring(800,80,10)"
	
# —————————————————————————————————————————— Editable States/Attribtues/Animation

## Defaults
SS.Editable.opacity = 0
## States
SS.Editable.states.add
	summoned:
		opacity: 1
## Animation	
SS.Editable.states.animationOptions =
	curve: "spring(800,80,10)"
	
# —————————————————————————————————————————— Keyboard States/Attribtues/Animation

## States
SS.Keyboard.states.add
	summoned:
		y: 695
## Animation	
SS.Keyboard.states.animationOptions =
	curve: "spring(800,80,10)"
	
# —————————————————————————————————————————— Masthead States/Attribtues/Animation

## States
SS.Masthead.states.add
	dispelled:
		y: -195
		opacity: .20
## Animation
SS.Masthead.states.animationOptions =
	curve: "spring(800,80,10)"
	
# —————————————————————————————————————————— ToolTray States/Attribtues/Animation

## Tray States
SS.ToolTray.states.add
	dispelled:
		y: 1140
## Animation
SS.ToolTray.states.animationOptions =
	curve: "spring(1000,80,10)"
	
# —————————————————————————————————————————— Buttons States/Attribtues/Animation
	
## ColorButton States
SS.StickyColor.states.add
	ontap:
		scale: .8
## Animation
SS.StickyColor.states.animationOptions =
	curve: "spring(1000,80,10)"
## ShapeButton States
SS.StickyShape.states.add
	ontap:
		scale: .8
## Animation
SS.StickyShape.states.animationOptions =
	curve: "spring(1000,80,10)"	
	
# —————————————————————————————————————————— SelectionTray States/Attribtues/Animation
## Defaults
SS.ShapeSelectionTray.opacity = 0

## Color Selection States
SS.SelectionTray.states.add
	dispelled:
		y: 1140
	unselected:
		opacity: 0
## Animation
SS.SelectionTray.states.animationOptions =
	curve: "spring(1000,80,10)"

## Shape Selection States
SS.ShapeSelectionTray.states.add
	summoned:
		opacity: 1
	dispelled:
		y: 1140
## Animation
SS.ShapeSelectionTray.states.animationOptions =
	curve: "spring(1000,80,10)"

## —————————————————————————————————————————— Sticky Note Interactions
	
SS.Sticky.draggable.enabled = true
SS.Sticky.on Events.TouchStart, ->
	SS.Sticky.states.switch("tapped")
SS.Sticky.on Events.TouchEnd, ->
	SS.Sticky.states.switch("summoned")
	SS.Keyboard.states.switch("summoned")
	SS.Editable.states.switch("summoned")
	SS.ToolTray.states.switch("dispelled")
	SS.SelectionTray.states.switch("dispelled")
	SS.Masthead.states.switch("dispelled")
SS.Return.on Events.TouchStart, ->
	SS.Sticky.states.switch("prepped")
SS.Return.on Events.TouchEnd, ->
	SS.Sticky.states.switch("send")
	SS.Keyboard.states.switch("default")
	SS.Masthead.states.switch("default")
	SS.ToolTray.states.switch("default")
	SS.SelectionTray.states.switch("default")
	SS.Editable.states.switch("default")
	
## —————————————————————————————————————————— Background Interactions
	
bg.on Events.TouchStart, ->
	SS.Sticky.states.switch("default")
	SS.Keyboard.states.switch("default")
	SS.Masthead.states.switch("default")
	SS.ToolTray.states.switch("default")
	SS.SelectionTray.states.switch("default")
	SS.Editable.states.switch("default")
	
## —————————————————————————————————————————— Button Interactions
# Sticky Note Color	
SS.StickyColor.on Events.TouchStart, ->
	SS.StickyColor.states.switch("ontap")
SS.StickyColor.on Events.TouchEnd, ->
	SS.StickyColor.states.switch("default")
	SS.SelectionTray.states.switch("default")
	SS.ShapeSelectionTray.states.switch("default")
# Sticky Note Shape
SS.StickyShape.on Events.TouchStart, ->
	SS.StickyShape.states.switch("ontap")
SS.StickyShape.on Events.TouchEnd, ->
	SS.StickyShape.states.switch("default")
	SS.ShapeSelectionTray.states.switch("summoned")
	SS.SelectionTray.states.switch("unselected")
