# This imports all the layers for "FTeams" into fteamsLayers
Teams = Framer.Importer.load "imported/FTeams"

# AddButton
Teams.AddButton.states.add
	pressed: {scale: .9}
	CardSummoned: {rotationZ: 45}
	CardDispelled: {rotationZ: 0}
Teams.AddButton.states.animationOptions =
	curve: "spring(800,80,10)"
# AddButton Interaction
Teams.AddButton.on Events.TouchStart, ->
	Teams.AddButton.states.next("pressed")
Teams.AddButton.on Events.TouchEnd, ->
	Teams.VirtualStudioCard.states.next("dispelled")
	Teams.RaCard.states.next("dispelled")
	Teams.AddButton.states.next("default")
	Teams.Footer.states.next("dispelled")
# Footer
Teams.Footer.states.add
	summoned:{y: 913}
	dispelled:{y: 2049}
Teams.Footer.states.animationOptions =
	curve: "spring(600,80,10)"

# ———————————————————————————————————————————————————————————— Teams (Buttons, Cards)

#RapidApps States & Animations
Teams.RapidAppsGroup.states.add
	pressed: {scale: .9}
Teams.RaCard.states.add
	summoned: {y: 0}
	dispelled: {y: 1136}
Teams.RapidAppsGroup.states.animationOptions =
	curve: "spring(1000,20,10)"	
Teams.RaCard.states.animationOptions =
	curve: "spring(800,80,10)"
# RapidApps Interaction
Teams.RapidAppsGroup.on Events.TouchStart, ->
	Teams.RapidAppsGroup.states.next("pressed")
Teams.RapidAppsGroup.on Events.TouchEnd, ->
	Teams.RapidAppsGroup.states.next("default")
	Teams.RaCard.states.next("summoned")
	Teams.AddButton.states.next("CardSummoned")
	Teams.Footer.states.next("summoned")
	
#VirtualStudio States & Animations
Teams.VirtualStudioGroup.states.add
	pressed: {scale: .9}
Teams.VirtualStudioCard.states.add
	summoned: {y: 0}
	dispelled: {y: 1136}
Teams.VirtualStudioGroup.states.animationOptions =
	curve: "spring(1000,20,10)"	
Teams.VirtualStudioCard.states.animationOptions =
	curve: "spring(800,80,10)"
# VirtualStudio Interaction
Teams.VirtualStudioGroup.on Events.TouchStart, ->
	Teams.VirtualStudioGroup.states.next("pressed")
Teams.VirtualStudioGroup.on Events.TouchEnd, ->
	Teams.VirtualStudioGroup.states.next("default")
	Teams.VirtualStudioCard.states.next("summoned")
	Teams.AddButton.states.next("CardSummoned")
	Teams.Footer.states.next("summoned")
	
#IBM States & Animations
Teams.IBMDesignGroup.states.add
	pressed: {scale: .9}
Teams.IBMDesignGroup.states.animationOptions =
	curve: "spring(1000,20,10)"	
# IBM Interaction
Teams.IBMDesignGroup.on Events.TouchStart, ->
	Teams.IBMDesignGroup.states.next("pressed")
Teams.IBMDesignGroup.on Events.TouchEnd, ->
	Teams.IBMDesignGroup.states.next("default")
	
#DesignCamp States & Animations
Teams.DesignCampGroup.states.add
	pressed: {scale: .9}
Teams.DesignCampGroup.states.animationOptions =
	curve: "spring(1000,20,10)"	
# DesignCamp Interaction
Teams.DesignCampGroup.on Events.TouchStart, ->
	Teams.DesignCampGroup.states.next("pressed")
Teams.DesignCampGroup.on Events.TouchEnd, ->
	Teams.DesignCampGroup.states.next("default")
	
#TeamX States & Animations
Teams.TeamXGroup.states.add
	pressed: {scale: .9}
Teams.TeamXGroup.states.animationOptions =
	curve: "spring(1000,20,10)"	
# TeamX Interaction
Teams.TeamXGroup.on Events.TouchStart, ->
	Teams.TeamXGroup.states.next("pressed")
Teams.TeamXGroup.on Events.TouchEnd, ->
	Teams.TeamXGroup.states.next("default")
	
# ———————————————————————————————————————————————————————————— Scrolling Containers

# Virtual Studio Group Container
# Scrolling Convo
contentLayer = new Layer
	opacity: 0
	width:  552
	height: 400 * 3
	superLayer: Teams.VSConvo
Teams.VSConvo.scrollVertical = true

contentLayer = new Layer
	opacity: 0
	width:  552
	height: 400 * 3
	superLayer: Teams.RaConvo
Teams.RaConvo.scrollVertical = true

# ———————————————————————————————————————————————————————————— Universal Elements

# Add Content Button
Teams.AddContentButton.states.add
	pressed: {scale: .9}
	FooterSummoned: {scale: 1, rotationZ: 45}
	FooterDispelled: {rotationZ: 0}
Teams.AddContentButton.states.animationOptions =
	curve: "spring(800,80,10)"
# AddButton Interaction
Teams.AddContentButton.on Events.TouchStart, ->
	Teams.AddContentButton.states.next("pressed")
Teams.AddContentButton.on Events.TouchEnd, ->
	Teams.FooterMenu.states.next("summoned")
	Teams.AddContentButton.states.next("FooterSummoned")

# FooterMenu
Teams.FooterMenu.opacity = 0
Teams.FooterMenu.originX = .10
Teams.FooterMenu.originY = 1
Teams.FooterMenu.scale = 0
Teams.FooterMenu.states.add
	summoned: {opacity: 1, scale: 1}
Teams.FooterMenu.states.animationOptions =
	curve: "spring(1500,80,10)"
	
# Take Picture Button
Teams.TakePicture.states.add
	pressed: {scale: .9}
Teams.TakePicture.states.animationOptions =
	curve: "spring(800,80,10)"
# Take Picture Interactiona
Teams.TakePicture.on Events.TouchStart, ->
	Teams.TakePicture.states.next("pressed")
Teams.TakePicture.on Events.TouchEnd, ->
	Teams.TakePicture.states.next("default")
	Teams.AddContentButton.states.next("FooterDispelled")
	Teams.FooterMenu.states.next("default")
