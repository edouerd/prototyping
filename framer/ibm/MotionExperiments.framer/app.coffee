# App Background
NavBG = new Layer
		height:1024, width: 1440, x: 0, y: 0, backgroundColor: "#fafafa"

# Nav Background
NavBG = new Layer
		height:120, width: 1440, x: 0, y: 0, backgroundColor: "#007EE5"
	
# Left Hand Panel
LHPane = new Layer
			height:844, width: 467, x: 30, y: 150, backgroundColor: "#F89C26"

# Right Hand Panel
RHPane = new Layer
			height:844, width: 883, x: 527, y: 150,  backgroundColor: "#007EE5",

# Draggable Module
#Module = new Layer
			#height:200, width: 200, x: 537, y: 160,  backgroundColor: "#007EE5"
	
# This imports all the layers for "Ra" into raLayers
raLayers = Framer.Importer.load "imported/Ra"
document.body.style.webkitPerspective = 1000

# raLayers.ConsoleToolTip.visible = false
# raLayers.HelpToolTip.visible = false
raLayers.NavBackground.visible = false
raLayers.RaBgBg.visible = false

###### Below is actual interactive crap

# Employee Card Effects

raLayers.Employee.center()
raLayers.Employee.shadowColor = "rgba(0, 0, 000, 0.50)"

raLayers.Employee.states.add
  elevatedZ4: 
  	rotationZ: -0, 
  	rotationY: -100, 
  	rotationX: -0, 
  	shadowX: 0, 
  	shadowY: 0, 
  	shadowBlur:20, 
  	shadowColor: "rgba(50, 50, 255, 0.50)", 
  	scale: 1.1,

		
raLayers.Employee.states.animationOptions =
	curve: "spring(1000,80,10)"
	
raLayers.Employee.draggable.enabled = true

raLayers.Employee.on Events.DragStart, ->
  raLayers.Employee.states.switch("elevatedZ4")

raLayers.Employee.on Events.DragEnd, ->
  raLayers.Employee.states.switch("default")

#Logotype Effects
raLayers.Logotype.states.add
	one: {scale: 1.05, opacity: .5}
raLayers.Logotype.states.animationOptions =
	curve: "spring(1000,80,0)"

raLayers.Logotype.on Events.MouseOver, ->
	raLayers.Logotype.states.next("one")
raLayers.Logotype.on Events.MouseOut, ->
	raLayers.Logotype.states.next("default")

# Back Button + Effects
raLayers.BackToDashboard.states.add
	one: {scale: 1.1, opacity: .5, rotationZ: 90}
raLayers.BackToDashboard.states.animationOptions =
	curve: "spring(1000,80,10)"

raLayers.BackToDashboard.on Events.Click, ->
	raLayers.BackToDashboard.states.next("one", "default")

# Rule Console Button + Effects
raLayers.RulesConsole.states.add
	one: {scale: 1.1, opacity: .5}
	two: {scale: 1.1, opacity: 1}	
raLayers.RulesConsole.states.animationOptions =
	curve: "spring(1000,80,10)"
	
raLayers.ConsoleToolTip.states.add
	one: {opacity: 0}
raLayers.ConsoleToolTip.states.animationOptions =
	curve: "spring(1000,80,0)"
	
raLayers.ConsoleToolTip.opacity = 0

raLayers.RulesConsole.on Events.Click, ->
	raLayers.RulesConsole.states.next("one", "default")
	raLayers.ConsoleToolTip.states.next("one", "default")
	
raLayers.RulesConsole.on Events.MouseOver, ->
	raLayers.ConsoleToolTip.states.next("default")
	raLayers.RulesConsole.states.next("two")
raLayers.RulesConsole.on Events.MouseOut, ->
	raLayers.ConsoleToolTip.states.next("one")
	raLayers.RulesConsole.states.next("default")

# Help/Tutorial Button + Effects
raLayers.HelpTutorials.states.add
	one: {scale: 1.1, opacity: .2}
	two: {scale: 1.1, opacity: 1}	
raLayers.HelpTutorials.states.animationOptions =
	curve: "spring(1000,80,10)"
	
raLayers.HelpToolTip.states.add
	one: {opacity: 0}
raLayers.HelpToolTip.states.animationOptions =
	curve: "spring(1000,80,0)"
	
raLayers.HelpToolTip.opacity = 0
	
raLayers.HelpTutorials.on Events.Click, ->
	raLayers.HelpTutorials.states.next("one", "default")
	raLayers.HelpToolTip.states.next("one", "default")
	
raLayers.HelpTutorials.on Events.MouseOver, ->
	raLayers.HelpToolTip.states.next("default") 
	raLayers.HelpTutorials.states.next("two")
raLayers.HelpTutorials.on Events.MouseOut, ->
	raLayers.HelpToolTip.states.next("one")
	raLayers.HelpTutorials.states.next("default")
