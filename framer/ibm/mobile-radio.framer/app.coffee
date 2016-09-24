# Set device background 
Framer.Device.background.backgroundColor = "#FBE8D9"

# .sketch file
radio = Framer.Importer.load "imported/f-radio-phone"

# DISC

disc = new Animation
    layer: radio.disc
    properties:
        rotationZ: 360
    time: 10
    curve: "linear"
disc.start() # kick if off once
disc.on "end", ->
    radio.disc.rotationZ = 0     
    disc.start()
    
radio.disc.states.add
	pressed:
		opacity: .9
		scale: .95
		
radio.disc.states.animationOptions =
	curve: "cubic-bezier(.5, .08, 0, 1)"
	time: .4

# PLAYER

radio.player.states.add
	hide:
		opacity: 0
		scale: .95
		
radio.player.states.animationOptions =
	curve: "cubic-bezier(.5, .08, 0, 1)"
	time: .4

# SCHEDULE

# radio.schedule.draggable.enabled = true
# radio.schedule.draggable.horizontal = false
# radio.schedule.draggable.constraints = radio.player

radio.schedule.opacity = .9

radio.schedule.states.add
	summon:
		opacity: 1
		y: 0
	
radio.schedule.states.animationOptions =
	curve: "cubic-bezier(.5, .08, 0, 1)"
	time: .6
	
radio.schedule.on Events.AnimationEnd, ->
	if radio.schedule.states.current == "summon"
		radio.schedule.states.animationOptions =
			curve: "cubic-bezier(.5, .08, 0, 1)"
			time: .4
# ...otherwise, slide out slowly like normal.
	else 
		radio.schedule.states.animationOptions =
			curve: "cubic-bezier(.5, .08, 0, 1)"
			time: .6
			
# INTERACTIONS

radio.disc.on Events.TouchStart, ->
	if radio.disc.states.current == "default"
		radio.disc.states.switch("pressed")
			
radio.disc.on Events.TouchEnd, ->
	if radio.disc.states.current == "pressed"
		radio.disc.states.switch("default")
		
radio.schedule.on Events.TouchStart, ->
	if radio.schedule.states.current == "summon"
		radio.schedule.states.switch("default")
		radio.player.states.switch("default")
	else 
		radio.schedule.states.switch("summon")
		radio.player.states.switch("hide")