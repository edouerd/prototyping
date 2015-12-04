# This imports all the layers for "f-pi-enduseapp" into 'enduse'
enduse = Framer.Importer.load "imported/f-pi-enduseapp"

# —————————————————————————————————————————————————————————————— NOTIFICATION + HOMESCREEN STATE MACHINE

enduse.notification.states.add
	summoned: {y: 0}
	tap: {opacity: .5}
	
enduse.homescreen.states.add
	dispelled: {x: -640}

# ———————————————————————————— NOTIFICATION + HOMESCREEN ANIMATON OPTIONS
	
enduse.notification.states.animationOptions =
	curve: "spring(800,80,10)"
	
enduse.homescreen.states.animationOptions =
	curve: "spring(1000,80,10)"

# ———————————————————————————— NOTIFICATION INTERACTIONS

enduse.homescreen.on Events.TouchEnd, ->
	enduse.notification.states.next("summoned")

# Figure out a visual change for the notification upon tapping?
# enduse.notification.on Events.TouchStart, ->
# 	enduse.notification.states.next("tap")
	
enduse.notification.on Events.TouchEnd, ->
	enduse.offerhome.states.next("summoned")
	enduse.notification.states.next("default")
	enduse.homescreen.states.next("dispelled")
	
# —————————————————————————————————————————————————————————————— APPICON STATE MACHINE

enduse.appicon.states.add
	tap: {opacity: .5}
	
# ———————————————————————————— APPICON ANIMATON OPTIONS
	
enduse.appicon.states.animationOptions =
	curve: "spring(1000,80,10)"

# ———————————————————————————— APPICON INTERACTIONS

enduse.appicon.on Events.TouchStart, ->
	enduse.appicon.states.next("tap")
	
enduse.appicon.on Events.TouchEnd, ->
	enduse.appicon.states.next("default")
	enduse.offerhome.states.next("summoned")
	
# —————————————————————————————————————————————————————————————— OFFERHOME STATE MACHINE

enduse.offerhome.states.add
	summoned: {x: 0}
	
# ———————————————————————————— OFFERHOME ANIMATON OPTIONS
	
enduse.offerhome.states.animationOptions =
	curve: "spring(1000,80,10)"

# ———————————————————————————— OFFERHOME INTERACTIONS

enduse.appicon.on Events.TouchEnd, ->
	enduse.appicon.states.next("default")