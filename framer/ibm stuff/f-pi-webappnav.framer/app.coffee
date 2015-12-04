# Set Background
background = new BackgroundLayer backgroundColor: "#fff"
# Import Sketch Doc
nav = Framer.Importer.load "imported/f-pi-mobilenav"
nav.ddorg.opacity = 0
nav.ddsettings.opacity = 0
nav.ddtopnav.opacity = 0
nav.btnorg.opacity = .5
nav.btnsettings.opacity = .5

# # # # # # 

nav.ddtopnav.states.add
	summon:
		opacity: 1
		y: 155		
nav.ddtopnav.states.animationOptions =
	curve: "cubic-bezier(.5, .08, 0, 1)"
	time: .2
	
# # # # # # 
	
nav.ddorg.states.add
	summon:
		opacity: 1
		y: 155		
nav.ddorg.states.animationOptions =
	curve: "cubic-bezier(.5, .08, 0, 1)"
	time: .2

# # # # # # 
	
nav.ddsettings.states.add
	summon:
		opacity: 1
		y: 155		
nav.ddsettings.states.animationOptions =
	curve: "cubic-bezier(.5, .08, 0, 1)"
	time: .2
	
# # # # # # 
	
nav.btnorg.states.add
	summon:
		opacity: 1	
nav.btnorg.states.animationOptions =
	curve: "cubic-bezier(.5, .08, 0, 1)"
	time: .2
	
nav.btnsettings.states.add
	summon:
		opacity: 1	
nav.btnsettings.states.animationOptions =
	curve: "cubic-bezier(.5, .08, 0, 1)"
	time: .2

# # # # # 

nav.iconarrow.states.add
	summon:
		y: 15
		rotation: 180
nav.iconarrow.states.animationOptions =
	curve: "cubic-bezier(.5, .08, 0, 1)"
	time: .2

# # # # # 
	
nav.btntopnav.on Events.TouchEnd, ->
	nav.ddtopnav.states.next("summon", "default")
	nav.iconarrow.states.next("summon", "default")
	nav.ddorg.states.switch("default")
	nav.btnorg.states.switch("default")
	nav.ddsettings.states.switch("default")
	nav.btnsettings.states.switch("default")
nav.btnorg.on Events.TouchEnd, ->
	nav.ddorg.states.next("summon", "default")
	nav.btnorg.states.next("summon", "default")
	nav.ddsettings.states.switch("default")
	nav.btnsettings.states.switch("default")
	nav.ddtopnav.states.switch("default")
	nav.iconarrow.states.switch("default")
nav.btnsettings.on Events.TouchEnd, ->
	nav.ddsettings.states.next("summon", "default")
	nav.btnsettings.states.next("summon", "default")
	nav.ddorg.states.switch("default")
	nav.btnorg.states.switch("default")
	nav.ddtopnav.states.switch("default")
	nav.iconarrow.states.switch("default")
background.on Events.TouchEnd, ->
	nav.ddtopnav.states.switch("default")
	nav.ddorg.states.switch("default")
	nav.ddsettings.states.switch("default")
	nav.btnorg.states.switch("default")
	nav.btnsettings.states.switch("default")
	nav.iconarrow.states.next("default")
	
	