BgBg = new Layer
	width: 1440
	height: 900
	backgroundColor: "#fafafa"
	
# Nav Text
textStyle = 
  "font-size": "13px"
  "text-align": "left"
  "line-height":"16px"
  
One = new Layer 
	x:336, y:52, width:140, height: 20, backgroundColor:"FFF"
One.color = "#1DA2CA"
One.opacity = .5
One.html = "Content"
One.style = textStyle
One.states.add
	hover: {opacity: 1, scale: 1.025}
	selected: {opacity: 1, scale: 1}
One.states.animationOptions =
	curve: "spring(800,80,20)"

Two = new Layer 
	x:410, y:52, width:140, height: 20, backgroundColor:"FFF"
Two.color = "#1DA2CA"
Two.opacity = .5
Two.html = "Extensions"
Two.style = textStyle
Two.states.add
	hover: {opacity: 1, scale: 1.025}
	selected: {opacity: 1, scale: 1}
Two.states.animationOptions =
	curve: "spring(800,80,20)"

Three = new Layer 
	x:490, y:52, width:140, height: 20, backgroundColor:"FFF"
Three.color = "#1DA2CA"
Three.opacity = .5
Three.html = "Project Settings"
Three.style = textStyle
Three.states.add
	hover: {opacity: 1, scale: 1.025}
	selected: {opacity: 1, scale: 1}
Three.states.animationOptions =
	curve: "spring(800,80,20)"
	
# Top Indicator
Top = new Layer
	x: 330
	y: 76
	z: 0
	width: 60
	height: 2
	backgroundColor: "#29A2C8"
	shadowColor: "rgba(0, 0, 0, 1)"
Top.states.add
	one: {x: 330, width: 60}
	two: {x: 408, width: 70}
	three: {x: 488, width: 100}
Top.states.animationOptions =
	curve: "spring(1000,80,50)"

# LHN Indicator
LH = new Layer
	x: 228
	y: 159
	width: 2
	height: 30
	backgroundColor: "#29A2C8"
	shadowColor: "rgba(0, 0, 0, 1)"
LH.states.add
	one: {y: 159}
	two: {y: 189}
	three: {y: 219}
LH.states.animationOptions =
	curve: "spring(1000,80,50)"

# Imported Layers, Navigation Interactions
Ra = Framer.Importer.load "imported/Ra"

One.on Events.Click, ->
	Top.states.next("one")
	One.states.next("selected")
Two.on Events.Click, ->
	Top.states.next("two")
	Two.states.next("selected")
Three.on Events.Click, ->
	Top.states.next("three")
	Three.states.next("selected")
# Hover
One.on Events.MouseOver, ->
	One.states.next("hover")
Two.on Events.MouseOver, ->
	Two.states.next("hover")
Three.on Events.MouseOver, ->
	Three.states.next("hover")
# Out
One.on Events.MouseOut, ->
	One.states.next("default")
Two.on Events.MouseOut, ->
	Two.states.next("default")
Three.on Events.MouseOut, ->
	Three.states.next("default")				
			
Ra.Applications.on Events.Click, ->
	LH.states.next("one")
Ra.Data.on Events.Click, ->
	LH.states.next("two")
Ra.Rules.on Events.Click, ->
	LH.states.next("three")

# Settings Gear
Ra.Settings.states.add
	one: {opacity: .8, rotationZ: 90}
Ra.Settings.states.animationOptions =
	curve: "spring(500,80,10)"
# Interaction OnHover
Ra.Settings.on Events.MouseOver, ->
	Ra.Settings.states.next("one")
Ra.Settings.on Events.MouseOut, ->
	Ra.Settings.states.next("default")
	
# Create
Ra.Create.opacity = .9
Ra.Create.states.add
	one: {scale: 1.025, opacity: 1}
	recede: {opacity: .5, blur: 3}
Ra.Create.states.animationOptions =
	curve: "spring(1500,50,25)"
# Interaction OnHover
Ra.Create.on Events.MouseOver, ->
	Ra.Create.states.next("one")
Ra.Create.on Events.MouseOut, ->
	Ra.Create.states.next("default")
	
# Dashboard Blur
Ra.Dashboard.states.add
	recede: {opacity: 1, blur: 3}	
Ra.Dashboard.states.animationOptions =
	curve: "spring(100,80,10)"

Ra.BlurContent.states.add
	recede: {opacity: 1, blur: 3}	
	Ra.BlurContent.states.animationOptions =
	curve: "spring(100,80,10)"
	
# STEP ONE CREATE NEW APP
Ra.NewApp.opacity = 0
Ra.NewApp.states.add
	summoned: {y: 50, opacity: .95, shadowX: 5, shadowY: 5, shadowBlur:20}	
Ra.NewApp.states.animationOptions =
	curve: "spring(600,80,10)"
	
Ra.Demo.opacity = 0
Ra.Demo.blur = 1
Ra.Demo.states.add
	summoned: {y: 275, opacity: 1, blur: 0}
Ra.Demo.states.animationOptions =
	curve: "spring(600,80,10)"
	
# STEP TWO HERE IT IS
Ra.App.opacity = 0
Ra.App.blur = 3
Ra.App.states.add
	summoned: {y: 50, opacity: 1, blur: 0}
Ra.App.states.animationOptions =
	curve: "spring(200,80,10)"
	
# NEW NAV
Ra.AppNav.opacity = 0
Ra.AppNav.states.add
	summoned: {x: 338, y: 75, opacity: 1, blur: 0}
Ra.AppNav.states.animationOptions =
	curve: "spring(200,80,10)"
	
# CREATENEW BUTTON
Ra.CreateNew.opacity = 0
Ra.CreateNew.blur = 3
Ra.CreateNew.states.add
	summoned: {opacity: 1, blur: 0}
Ra.CreateNew.states.animationOptions =
	curve: "spring(200,80,10)"
	
# Exit Button
Ra.Exit.opacity = 0

Ra.Exit.states.add
	summoned: {y: 72, opacity: 1}

Ra.Exit.states.animationOptions =
	curve: "spring(100,45,10)"
	
# Choose Template 
Ra.ChooseTemplate.opacity = 0

Ra.ChooseTemplate.states.add
	summoned:
	 {opacity: 1, shadowX: 5, shadowY: 5, shadowBlur:20, shadowColor: "rgba(0, 0, 0, 0.5)"}
	
Ra.ChooseTemplate.states.animationOptions =
	curve: "spring(800,80,10)"
	
# Bubble Popup
Ra.Bubble.opacity = 0

Ra.Bubble.states.add
	summoned:
	 {opacity: 1, shadowX: 5, shadowY: 5, shadowBlur:20, shadowColor: "rgba(0, 0, 0, 0.5)"}
	
Ra.Bubble.states.animationOptions =
	curve: "spring(1000,80,10)"
	
# Generate Button
Ra.Generate.opacity = 0
Ra.Generate.states.add
	summoned: {y: 675, opacity: 1, scale: 1}
	hover: {scale: 1.025}
	
Ra.Generate.states.animationOptions =
	curve: "spring(800,80,10)"
	
Ra.Generate.on Events.MouseOver, ->
	Ra.Generate.states.next("hover")
Ra.Generate.on Events.MouseOut, ->
	Ra.Generate.states.next("summoned")
	
# Phone
Ra.Phone.opacity = 0
Ra.Phone.states.add
	summoned: {y: 200, opacity: .5, shadowX: 5, shadowY: 5, shadowBlur:20, shadowColor: "rgba(0, 0, 0, 0.5)"}
	rested: {z: 1, opacity: .5, shadowX: 0, shadowY: 0, shadowBlur:20, shadowColor: "rgba(50, 50, 255, 0.50)", scale: 1}
	off: {opacity: 0}
	
Ra.Phone.states.animationOptions =
	curve: "spring(600,80,10)"
	
# Builder
Ra.Builder.opacity = 0
Ra.Builder.states.add
	summoned: {y: 55, opacity: 1}	
Ra.Builder.states.animationOptions =
	curve: "spring(800,80,10)"

# Dispell Button
Ra.Dispell.states.add
	summoned: {y: 67} 
	hover: {scale: 1.1}

Ra.Dispell.on Events.MouseOver, ->
	Ra.Dispell.states.next("hover")	
Ra.Dispell.on Events.MouseOut, ->
	Ra.Dispell.states.next("default")	
	
Ra.Dispell.states.animationOptions =
	curve: "spring(1000,80,10)"

# Interactivities
Ra.Create.on Events.Click, ->
	Ra.Create.states.next("recede")
	Ra.Dashboard.states.next("recede")
	Ra.BlurContent.states.next("recede")
	Ra.NewApp.states.next("summoned")
	Ra.ChooseTemplate.states.next("summoned")
	Ra.Dispell.states.next("summoned")
	Ra.Generate.states.next("summoned")
	Ra.Phone.states.next("summoned")
	
Ra.ChooseTemplate.on Events.Click, ->
	Ra.Bubble.states.next("summoned", "default")
	
Ra.CreateNew.on Events.Click, ->
	Ra.Builder.states.next("summoned")
	Ra.Phone.states.next("off")
	
Ra.Dispell.on Events.Click, ->
	Ra.NewApp.states.next("default")
	Ra.Builder.states.next("default")
	Ra.Dispell.states.next("default")
	Ra.Phone.states.next("off")
	Ra.Generate.states.next("default")
	Ra.App.states.next("default")
	Ra.Dashboard.states.next("default")
	Ra.BlurContent.states.next("default")
	Ra.Create.states.next("default")
	Ra.Bubble.states.next("default")
	Ra.ChooseTemplate.states.next("default")
	Ra.CreateNew.states.next("default")
	
Ra.Generate.on Events.Click, ->
	Ra.NewApp.states.next("default")
	Ra.Dispell.states.next("default")
	Ra.Generate.states.next("default")
	Ra.App.states.next("summoned")
	Ra.Exit.states.next("summoned")
	Ra.CreateNew.states.next("summoned")
	Ra.AppNav.states.next("summoned")
	Ra.Demo.states.next("summoned")
	Ra.Dashboard.states.next("default")
	Ra.Bubble.states.next("default")
	Ra.ChooseTemplate.states.next("default")
	
Ra.Generate.on 'end', ->
	Ra.Phone.states.next("rested")
	
Logo = new VideoLayer 
	x:10, y:10, width:30, height:30, video:"images/Loading.mov",
Logo.player.play()
