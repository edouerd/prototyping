document.body.style.cursor = "auto"
# This imports all the layers for "f-pi-navigation" into fPiNavigationLayers
nav = Framer.Importer.load "imported/f-pi-navigation"

# This is all chunked out thematically as follows:
#
# 1. Defaults
# 2. Element States
# 3. Animation Properties
# 4. Interactions

###### Defaults: Button States, Menu Opacities, etc.
#
###### Dropdown Menus
nav.ddorganization.opacity = 0
nav.ddusermenu.opacity = 0
#
###### Individual Buttons
# Organization Dropdown Menu
nav.labelorg.opacity = .5
nav.org1.opacity = .5
nav.org2.opacity = 1
nav.org3.opacity = .5
nav.labelneworg.opacity = .5
# Content Navigation
nav.labeldashboard.opacity = 1
nav.labelmanagement.opacity = .5
nav.btnsettings.opacity = .5
# User Dropdown Menu
nav.btndocs.opacity = .5
nav.btndownloads.opacity = .5
nav.btncommunity.opacity = .5
nav.labelbuiltonbm.opacity = .5

############ — "INTERACTING WITH THE ORG MENU"
#
###### 2. Element States
#
# Organization Label hovers
nav.labelorg.states.add
	hover:
		opacity: 1
nav.ddorganization.states.add
	summon:
		opacity: 1
nav.ddusermenu.states.add
	summon:
		opacity: 1
nav.org1.states.add
	hover:
		opacity: 1
nav.org2.states.add
	hover:
		opacity: 1
	kindahighlight:
		opacity: .8
	unhighlight:
		opacity: .5
nav.org3.states.add
	hover:
		opacity: 1
nav.selectionorg.states.add
	org1:
		y: 14
	org2:
		y: 64
	org3:
		y: 114
#
###### 3. Animation Properties
#
# Organization Labels
nav.ddorganization.states.animationOptions =
	curve: "spring(1000,80,10)"
nav.labelorg.states.animationOptions =
	curve: "spring(2000,80,10)"
nav.org1.states.animationOptions =
	curve: "spring(1000,80,10)"
nav.org2.states.animationOptions =
	curve: "spring(1000,80,10)"
nav.org3.states.animationOptions =
	curve: "spring(1000,80,10)"
# Selection thing
nav.selectionorg.states.animationOptions =
	curve: "spring(2000,80,10)"

###### 4. Interactions
#
# I hover over the organization button/label...
nav.btnorganizations.on Events.MouseOver, ->
	nav.labelorg.states.next("hover")
# ...maybe hover outside of it...
nav.btnorganizations.on Events.MouseOut, ->
	nav.labelorg.states.next("default")
# ...maybe click on it...
nav.btnorganizations.on Events.Click, ->
	nav.ddorganization.states.next("summon")
# ...each label item lights up when hovered...
nav.org1.on Events.MouseOver, ->
	nav.org1.states.next("hover")
	nav.org2.states.next("kindahighlight")
	nav.org3.states.next("default")
nav.org2.on Events.MouseOver, ->
	nav.org1.states.next("default")
	nav.org2.states.next("hover")
	nav.org3.states.next("default")
nav.org3.on Events.MouseOver, ->
	nav.org1.states.next("default")
	nav.org2.states.next("kindahighlight")
	nav.org3.states.next("hover")
# ...and unhighlights if nothing's selected...
nav.org1.on Events.MouseOut, ->
	nav.org1.states.next("default")
	nav.org2.states.next("default")
	nav.org3.states.next("default")
nav.org2.on Events.MouseOut, ->
	nav.org1.states.next("default")
	nav.org2.states.next("default")
	nav.org3.states.next("default")
nav.org3.on Events.MouseOut, ->
	nav.org1.states.next("default")
	nav.org2.states.next("default")
	nav.org3.states.next("default")
# ...if I click on anything, move the selection...
nav.org1.on Events.Click, ->
	nav.org1.states.next("hover")
	nav.selectionorg.states.next("org1")
nav.org2.on Events.Click, ->
	nav.org2.states.next("hover")
	nav.selectionorg.states.next("org2")
nav.org3.on Events.Click, ->
	nav.org3.states.next("hover")
	nav.selectionorg.states.next("org3")
# ...when I'm done, I can click out to exit this.
nav.content.on Events.Click, ->
	nav.ddorganization.states.next("default")