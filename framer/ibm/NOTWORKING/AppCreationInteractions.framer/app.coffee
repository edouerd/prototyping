BgBg = new Layer
	width: 1440
	height: 900
	backgroundColor: "#fafafa"
	
# Top Indicator
Top = new Layer
	x: 330
	y: 77
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

Ra = Framer.Importer.load "imported/Motion"

Ra.Content.on Events.Click, ->
	Top.states.next("one")
Ra.Extensions.on Events.Click, ->
	Top.states.next("two")
Ra.ProjectSettings.on Events.Click, ->
	Top.states.next("three")
	
Ra.Applications.on Events.Click, ->
	LH.states.next("one")
Ra.Data.on Events.Click, ->
	LH.states.next("two")
Ra.Rules.on Events.Click, ->
	LH.states.next("three")

# Settings
Ra.Settings.states.add
	one: {opacity: .8, rotationZ: 180}
Ra.Settings.states.animationOptions =
	curve: "spring(1000,80,10)"

Ra.Settings.on Events.MouseOver, ->
	Ra.Settings.states.next("one")
Ra.Settings.on Events.MouseOut, ->
	Ra.Settings.states.next("default")
	
# Create
Ra.Create.states.add
	one: {scale: 1.025, opacity: .5, backgroundColor: "#FF056"}
Ra.Create.states.animationOptions =
	curve: "spring(800,80,0)"
	
Ra.Create.on Events.MouseOver, ->
	Ra.Create.states.next("one")
Ra.Create.on Events.MouseOut, ->
	Ra.Create.states.next("default")
	
# New App Panel
Ra.NewApp.opacity = .2
#Ra.NewApp.shadowColor = "rgba(0, 0, 0, .3)"

Ra.NewApp.states.add
	summoned: {y: 50, opacity: 1, shadowX: 5, shadowY: 5, shadowBlur:20}
	
Ra.NewApp.states.animationOptions =
	curve: "spring(800,80,10)"
	
# App
Ra.App.opacity = .2
#Ra.App.shadowColor = "rgba(0, 0, 0, .3)"

Ra.App.states.add
	summoned: {y: 50, opacity: 1, shadowX: 5, shadowY: 5, shadowBlur:20, shadowColor: "rgba(0, 0, 0, 0.5)"}

Ra.App.states.animationOptions =
	curve: "spring(200,45,10)"
	
# Generate Button
Ra.Generate.states.add
	summoned: {y: 675, shadowX: 5, shadowY: 5, shadowBlur:20, shadowColor: "rgba(0, 0, 0, 0.5)"}
	
Ra.Generate.states.animationOptions =
	curve: "spring(800,80,10)"
	
# Phone
Ra.Phone.opacity = .2

Ra.Phone.states.add
	summoned: {y: 200, opacity: 1, shadowX: 5, shadowY: 5, shadowBlur:20, shadowColor: "rgba(0, 0, 0, 0.5)"}
	elevated: {z: 2, opacity: 1, shadowX: 0, shadowY: 0, shadowBlur:20, shadowColor: "rgba(50, 50, 255, 1)", scale: 1.025}
	
	rested: {z: 1, opacity: 1, shadowX: 0, shadowY: 0, shadowBlur:20, shadowColor: "rgba(50, 50, 255, 0.50)", scale: 1}
	
Ra.Phone.states.animationOptions =
	curve: "spring(600,80,10)"


	
# Dispell Button
Ra.Dispell.states.add
	summoned: {y: 67, shadowX: 5, shadowY: 5, shadowBlur:20, shadowColor: "rgba(0, 0, 0, 0.5)"}
	hover: {scale: 1.1}

Ra.Dispell.on Events.MouseOver, ->
	Ra.Dispell.states.next("hover")	
Ra.Dispell.on Events.MouseOut, ->
	Ra.Dispell.states.next("summoned")	
	
Ra.Dispell.states.animationOptions =
	curve: "spring(800,80,10)"

# Interact6ivities
Ra.Create.on Events.Click, ->
	Ra.NewApp.states.next("summoned")
	Ra.Dispell.states.next("summoned")
	Ra.Generate.states.next("summoned")
	Ra.Phone.states.next("summoned")
	
Ra.Dispell.on Events.Click, ->
	Ra.NewApp.states.next("default")
	Ra.Dispell.states.next("default")
	Ra.Generate.states.next("default")
	Ra.App.states.next("default")
	
Ra.Generate.on Events.Click, ->
	Ra.NewApp.states.next("default")
	Ra.Dispell.states.next("default")
	Ra.Generate.states.next("default")
	Ra.Phone.states.next("elevated")
	Ra.App.states.next("summoned")
	
Ra.Generate.on 'end', ->
	Ra.Phone.states.next("rested")