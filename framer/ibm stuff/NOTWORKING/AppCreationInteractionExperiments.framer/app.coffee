# This imports all the layers for "AC" into AC
AC = Framer.Importer.load "imported/AC"

# Indicator
Hi = new Layer
	x: 250
	y: 75
	width: 60
	height: 3
	backgroundColor: "#29A2C8"
	shadowColor: "rgba(0, 0, 0, 1)"

Hi.states.add
	one: {x: 250, width: 60}
	two: {x: 330, width: 65}
	three: {x: 405, width: 100}
Hi.states.animationOptions =
	curve: "spring(1000,80,0)"

AC.One.on Events.Click, ->
	Hi.states.next("one")
AC.Two.on Events.Click, ->
	Hi.states.next("two")
AC.Three.on Events.Click, ->
	Hi.states.next("three")
	
# LHN Indicator
LH = new Layer
	x: 147
	y: 125	
	width: 3
	height: 30
	backgroundColor: "#29A2C8"
	shadowColor: "rgba(0, 0, 0, 1)"

LH.states.add
	one: {y: 125}
	two: {y: 168}
	three: {y: 210}
LH.states.animationOptions =
	curve: "spring(1000,80,0)"

AC.Applications.on Events.Click, ->
	LH.states.next("one")
AC.Data.on Events.Click, ->
	LH.states.next("two")
AC.Rules.on Events.Click, ->
	LH.states.next("three")

# Logotype
AC.Logotype.states.add
	one: {scale: 1.05, opacity: .8}
AC.Logotype.states.animationOptions =
	curve: "spring(1000,80,0)"

AC.Logotype.on Events.MouseOver, ->
	AC.Logotype.states.next("one")
AC.Logotype.on Events.MouseOut, ->
	AC.Logotype.states.next("default")
	
# Create
AC.Create.states.add
	one: {scale: 1.025, opacity: .8}
AC.Create.states.animationOptions =
	curve: "spring(1000,80,0)"

AC.Create.on Events.MouseOver, ->
	AC.Create.states.next("one")
AC.Create.on Events.MouseOut, ->
	AC.Create.states.next("default")
	
# Settings
AC.Settings.states.add
	one: {scale: 1.5, opacity: .8, rotationZ: 180}
AC.Settings.states.animationOptions =
	curve: "spring(1000,80,10)"

AC.Settings.on Events.MouseOver, ->
	AC.Settings.states.next("one")
AC.Settings.on Events.MouseOut, ->
	AC.Settings.states.next("default")
	
# One
AC.One.states.add
	one: {scale: 1.05, opacity: .8}
AC.One.states.animationOptions =
	curve: "spring(1000,80,0)"

AC.One.on Events.MouseOver, ->
	AC.One.states.next("one")
AC.One.on Events.MouseOut, ->
	AC.One.states.next("default")
	
# Two
AC.Two.states.add
	one: {scale: 1.05, opacity: .5}
AC.Two.states.animationOptions =
	curve: "spring(1000,80,0)"

AC.Two.on Events.MouseOver, ->
	AC.Two.states.next("one")
AC.Two.on Events.MouseOut, ->
	AC.Two.states.next("default")
	
# Three
AC.Three.states.add
	one: {scale: 1.05, opacity: .5}
AC.Three.states.animationOptions =
	curve: "spring(1000,80,0)"

AC.Three.on Events.MouseOver, ->
	AC.Three.states.next("one")
AC.Three.on Events.MouseOut, ->
	AC.Three.states.next("default")
	
# Front Layer
	
Front = new Layer
	x: 1280
	y: 50
	width: 1280
	height: 650
	backgroundColor: "#607777"
	
Front.states.add
	one: {x: 0, shadowX: 5, shadowY: 5, shadowBlur:20, shadowColor: "rgba(0, 0, 0, 0.5)"}
	two: {y: 900, shadowX: 0, shadowY: 0, shadowBlur:20, shadowColor: "rgba(0, 0, 0, 0.7)"}
	
Front.states.animationOptions =
	curve: "spring(800,80,0)"
	
#Phone
# Settings
AC.Phone.states.add
	one: {scale: 1.5, opacity: 0}
AC.Phone.states.animationOptions =
	curve: "spring(1000,80,10)"

AC.Phone.on Events.MouseOver, ->
	AC.Phone.states.next("one")
	
# Dispell Button
	
Dispell = new Layer
	x: -1220
	y: 95
	width: 25
	height: 25
	backgroundColor: "#fafafa"
	
Dispell.states.add
	summoned: {x: 1220, y: 100, shadowX: 0, shadowY: -20, shadowBlur:20, shadowColor: "rgba(0, 0, 0, 0.7)"}
	
Dispell.states.animationOptions =
	curve: "spring(800,80,0)"
	
# Interact6ivities
AC.Create.on Events.Click, ->
	AC.Phone.states.next("default")
	Front.states.next("one")
	Dispell.states.next("summoned")

	
Dispell.on Events.Click, ->
	Front.states.next("two")
	Dispell.states.next("default")