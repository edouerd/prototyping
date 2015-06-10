# This imports all the layers for "Cards" into cardsLayers
cardsLayers = Framer.Importer.load "imported/Cards"

# So to hide the layer for a group named "Main Screen" you can do:
# cardsLayers["Main Screen"].visible = false

# Help Button
cardsLayers.ButtonHelp.states.add
	one: {scale: 1.1, opacity: .2}
	two: {scale: 1.1, opacity: 1}	
cardsLayers.ButtonHelp.states.animationOptions =
	curve: "spring(1000,80,10)"
	
cardsLayers.ButtonHelp.on Events.Click, ->
	cardsLayers.ButtonHelp.states.next("one", "default")
	
cardsLayers.ButtonHelp.on Events.MouseOver, ->
	cardsLayers.ButtonHelp.states.next("default") 
	cardsLayers.ButtonHelp.states.next("two")

cardsLayers.ButtonHelp.on Events.MouseOut, ->
	cardsLayers.ButtonHelp.states.next("default")
	
	
# Cards Button	
cardsLayers.ButtonCards.states.add
	one: {scale: 1.1, opacity: .2}
	two: {scale: 1.1, opacity: 1}	
cardsLayers.ButtonCards.states.animationOptions =
	curve: "spring(1000,80,10)"
	
cardsLayers.ButtonCards.on Events.Click, ->
	cardsLayers.ButtonCards.states.next("one", "default")
	
cardsLayers.ButtonCards.on Events.MouseOver, ->
	cardsLayers.ButtonCards.states.next("default") 
	cardsLayers.ButtonCards.states.next("two")

cardsLayers.ButtonCards.on Events.MouseOut, ->
	cardsLayers.ButtonCards.states.next("default") 
