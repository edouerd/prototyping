# Let's Retina
Framer.Device.contentScale = 0.5

# Example Import
example = Framer.Importer.load "imported/example"
example.cards.center()

# By default, the expanded view is 0 opacity
example.expanded.opacity = 0

# Defining the States
example.shortened.states.add
	hide:
		opacity: 0
	reveal:
		opacity: 1
		
example.expanded.states.add
	reveal:
		opacity: 1

# Define animationOptions
example.shortened.states.animationOptions =
	curve: "spring(1500,60,10)"
example.expanded.states.animationOptions =
	curve: "spring(1500,60,10)"

# Switch states on click
example.shortened.on Events.Click, ->
	example.shortened.states.next("hide")
	example.expanded.states.next("reveal")
	
# Switch states on click
example.expanded.on Events.Click, ->
	example.shortened.states.next("default")
	example.expanded.states.next("default")