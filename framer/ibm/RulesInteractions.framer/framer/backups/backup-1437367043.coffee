document.body.style.cursor = "auto"

Background = new Layer
	x: 0
	y: 0
	width: 1440
	height: 900*2
	backgroundColor: "#FFFFFF"

Ra = Framer.Importer.load "imported/RaRaNewPaging"

Ra.RulesConsole.draggable.enabled = true
Ra.UnhoveredRemoveCondition.opacity = 0
Ra.RemoveCriteria.opacity = 0
Ra.UnhoveredRemoveAction.opacity = 0 
Ra.RemoveAction.opacity = 0
Ra.UnhoveredRemoveCriteria.opacity = 0
Ra.RemoveCondition.opacity = 0
Ra.UnhoveredRemoveCondition.opacity = 0
Ra.RuleGrid.opacity = 0
Ra.RulesConsole.opacity = 0
Ra.RulesConsoleButton.opacity = .5

#Rules Console Button
Ra.RulesConsoleButton.states.add
	hover: {opacity: 1}
Ra.RulesConsoleButton.states.animationOptions =
	curve: "spring(1000,80,10)"
Ra.RulesConsoleButton.on Events.MouseOver, ->
	Ra.RulesConsoleButton.states.next("hover")
Ra.RulesConsoleButton.on Events.MouseOut, ->
	Ra.RulesConsoleButton.states.next("default")
Ra.RulesConsoleButton.on Events.Click, ->
	Ra.RulesConsole.states.next("open", "default")
	
#Rules Console Button
Ra.CloseConsole.on Events.Click, ->
	Ra.RulesConsole.states.next("default")

#Rules Console
Ra.RulesConsole.center()
Ra.RulesConsole.shadowColor = "rgba(0, 0, 000, 0.20)"
Ra.RulesConsole.states.add
	open: {opacity: 1, visible: true}
	elevatedZ4:  shadowX: 0, shadowY: 0, shadowBlur:20, shadowColor: "rgba(50, 50, 255, 0.10)", scale: 1.001,
	hide: {opacity: 0, visible: false}

Ra.RulesConsole.states.animationOptions =
	curve: "spring(1000,80,10)"
Ra.RulesConsole.draggable.enabled = true
Ra.RulesConsole.on Events.DragStart, ->
  Ra.RulesConsole.states.switch("elevatedZ4")
Ra.RulesConsole.on Events.DragEnd, ->
  Ra.RulesConsole.states.switch("open")

# Bubble 1
Ra.Bubble1.opacity = 0
Ra.Bubble1.originX = .5
Ra.Bubble1.originY = 0
Ra.Bubble1.scale = 0
Ra.Bubble1.states.add
	appear: {opacity: 1, scale: 1}
Ra.Bubble1.states.animationOptions =
	curve: "spring(1500,60,10)"
Ra.Attendee.on Events.Click, ->
	Ra.Bubble1.states.next("appear", "default")
	Ra.Bubble2.states.next("default")
	Ra.Bubble3.states.next("default")
	Ra.Bubble4.states.next("default")
	
# Bubble 2
Ra.Bubble2.opacity = 0
Ra.Bubble2.originX = .5
Ra.Bubble2.originY = 0
Ra.Bubble2.scale = 0
Ra.Bubble2.states.add
	appear: {opacity: 1, scale: 1}
Ra.Bubble2.states.animationOptions =
	curve: "spring(1500,60,10)"
Ra.CRUD.on Events.Click, ->
	Ra.Bubble2.states.next("appear", "default")
	Ra.Bubble1.states.next("default")
	Ra.Bubble3.states.next("default")
	Ra.Bubble4.states.next("default")
	
# Bubble 3
Ra.Bubble3.opacity = 0
Ra.Bubble3.originX = .5
Ra.Bubble3.originY = 0
Ra.Bubble3.scale = 0
Ra.Bubble3.states.add
	appear: {opacity: 1, scale: 1}
Ra.Bubble3.states.animationOptions =
	curve: "spring(1500,60,10)"
Ra.SendEmail.on Events.Click, ->
	Ra.Bubble3.states.next("appear", "default")
	Ra.Bubble2.states.next("default")
	Ra.Bubble1.states.next("default")
	Ra.Bubble4.states.next("default")
	
# Bubble 4
Ra.Bubble4.opacity = 0
Ra.Bubble4.originX = .5
Ra.Bubble4.originY = 0
Ra.Bubble4.scale = 0
Ra.Bubble4.states.add
	appear: {opacity: 1, scale: 1}
Ra.Bubble4.states.animationOptions =
	curve: "spring(1500,60,10)"
Ra.Employee.on Events.Click, ->
	Ra.Bubble4.states.next("appear", "default")
	Ra.Bubble2.states.next("default")
	Ra.Bubble3.states.next("default")
	Ra.Bubble1.states.next("default")

# EmailContent
#Ra.EmailContent.opacity =  0
Ra.EmailContent.scale =  0
Ra.EmailContent.originX = 0
Ra.EmailContent.originY = 0.53

Ra.EmailContent.states.add
	appear: {opacity: 1, scale: 1, x: 	1037}
Ra.EmailContent.states.animationOptions =
	curve: "spring(1500,80,10)"
Ra.Bubble3.on Events.Click, ->
	Ra.EmailContent.states.next("appear", "default")
	Ra.Bubble3.states.next("default")

# TRIGGERS TRIGGERS TRIGGERS
# Trigger Conditions are hovered over 
Ra.UnhoveredRemoveCondition.states.add
	hover: {opacity: 1}
Ra.UnhoveredRemoveCondition.states.animationOptions =
	curve: "spring(1000,80,10)"
Ra.ConditionDeleted.on Events.MouseOver, ->
	Ra.UnhoveredRemoveCondition.states.next("hover")
Ra.ConditionDeleted.on Events.MouseOut, ->
	Ra.UnhoveredRemoveCondition.states.next("default")
# Remove Button is hovered-over
Ra.RemoveCondition.states.add
	hover: {opacity: 1}
Ra.RemoveCondition.states.animationOptions =
	curve: "spring(1000,80,10)"	
Ra.ConditionDeleted.states.add
	scooch: {opacity: .5}
	erased: {opacity: 0}
Ra.ConditionDeleted.states.animationOptions =
	curve: "spring(1000,80,10)"
Ra.RemoveCondition.on Events.MouseOver, ->
	Ra.RemoveCondition.states.next("hover")
	Ra.ConditionDeleted.states.next("scooch")
Ra.RemoveCondition.on Events.MouseOut, ->
	Ra.RemoveCondition.states.next("default")
	Ra.ConditionDeleted.states.next("default")
Ra.RemoveCondition.on Events.Click, ->
	Ra.RemoveCondition.states.switch("default")
	Ra.ConditionDeleted.states.switch("erased")
	
# ACTION ONE
# Action Header is hovered over 
Ra.NewActionButton.opacity = .6

Ra.NewActionButton.states.add
	hover: {opacity: 1}
	scooch: {opacity: .5}
	erased: {opacity: 0}
Ra.NewActionButton.states.animationOptions =
	curve: "spring(1000,80,10)"

Ra.NewActionButton.on Events.MouseOver, ->
	Ra.NewActionButton.states.next("hover")
Ra.NewActionButton.on Events.MouseOut, ->
	Ra.NewActionButton.states.next("default")

# Remove Action Button is hovered/clicked
Ra.RemoveAction.states.add
	hover: {opacity: 1}
Ra.RemoveAction.states.animationOptions =
	curve: "spring(1000,80,10)"	
	
Ra.ActionHeader.states.add
	scooch: {opacity: .5}
	erased: {opacity: 0}
Ra.ActionHeader.states.animationOptions =
	curve: "spring(1000,80,10)"
	
Ra.ActionPhrase.states.add
	scooch: {opacity: .5}
	erased: {opacity: 0}
Ra.ActionPhrase.states.animationOptions =
	curve: "spring(1000,80,10)"	
	
Ra.SendEmail.states.add
	scooch: {opacity: .5}
Ra.SendEmail.states.animationOptions =
	curve: "spring(1000,80,10)"		
Ra.Employee.states.add
	scooch: {opacity: .5}
Ra.Employee.states.animationOptions =
	curve: "spring(1000,80,10)"	
	
Ra.RemoveAction.on Events.MouseOver, ->
	Ra.RemoveAction.states.next("hover")
	Ra.ActionHeader.states.next("scooch")
	Ra.NewActionButton.states.next("scooch")
	Ra.ActionPhrase.states.next("scooch")
	Ra.SendEmail.states.next("scooch")
	Ra.Employee.states.next("scooch")
	
Ra.RemoveAction.on Events.MouseOut, ->
	Ra.RemoveAction.states.next("default")
	Ra.ActionHeader.states.next("default")
	Ra.NewActionButton.states.next("default")
	Ra.ActionPhrase.states.next("default")
	Ra.SendEmail.states.next("default")
	Ra.Employee.states.next("default")

Ra.RemoveAction.on Events.Click, ->
	Ra.RemoveAction.states.next("default")
	Ra.ActionHeader.states.next("erased")
	Ra.NewActionButton.states.next("erased")
	Ra.ActionPhrase.states.next("erased")

# Action Criteria is hovered over 
Ra.UnhoveredRemoveCriteria.states.add
	hover: {opacity: 1}
Ra.UnhoveredRemoveCriteria.states.animationOptions =
	curve: "spring(1000,80,10)"
	
Ra.AddCriteriaButton.states.add
	scooch: {opacity: .5}
	erased: {opacity: 0}
Ra.AddCriteriaButton.states.animationOptions =
	curve: "spring(1000,80,10)"		
	
Ra.CriteriaPhrase.on Events.MouseOver, ->
	Ra.UnhoveredRemoveCriteria.states.next("hover")
Ra.CriteriaPhrase.on Events.MouseOut, ->
	Ra.UnhoveredRemoveCriteria.states.next("default")

# RemoveCriteria Button is hovered-over
Ra.RemoveCriteria.states.add
	hover: {opacity: 1}

Ra.RemoveCriteria.states.animationOptions =
	curve: "spring(1000,80,10)"	

Ra.CriteriaPhrase.states.add
	scooch: {opacity: .5}
	erased: {opacity: 0}

Ra.CriteriaPhrase.states.animationOptions =
	curve: "spring(1000,80,10)"

Ra.RemoveCriteria.on Events.MouseOver, ->
	Ra.RemoveCriteria.states.next("hover")
	Ra.CriteriaPhrase.states.next("scooch")

Ra.RemoveCriteria.on Events.MouseOut, ->
	Ra.RemoveCriteria.states.next("default")
	Ra.CriteriaPhrase.states.next("default")
	Ra.UnhoveredRemoveCriteria.states.next("default")

Ra.RemoveCriteria.on Events.Click, ->
	Ra.RemoveCriteria.states.next("default")
	Ra.CriteriaPhrase.states.next("erased")

# Click 'NewActionButton'
Ra.ActionTwo.opacity = 0
Ra.CriteriaOne.opacity = 0
Ra.RemoveAction2.opacity = 0
Ra.UnhoveredRemoveAction2.opacity = 0

Ra.ActionTwo.states.add
	summoned: {opacity: 1, x: 288}
Ra.ActionTwo.states.animationOptions =
	curve: "spring(500,80,10)"	
Ra.CriteriaOne.states.add
	summoned: {opacity: 1, x: 288}
Ra.CriteriaOne.states.animationOptions =
	curve: "spring(500,80,10)"		
	
Ra.NewActionButton.on Events.Click, ->
	Ra.ActionTwo.states.next("summoned")
	Ra.CriteriaOne.states.next("summoned")
	
# Action Two
Ra.UnhoveredRemoveAction2.states.animationOptions =
	curve: "spring(1000,80,10)"
Ra.ActionHeader2.on Events.MouseOver, ->
	Ra.UnhoveredRemoveAction2.states.next("hover")
Ra.ActionHeader2.on Events.MouseOut, ->
	Ra.UnhoveredRemoveAction2.states.next("default")

# Remove Action Button is hovered-over
Ra.UnhoveredRemoveAction2.states.add
	hover: {opacity: 1}
Ra.UnhoveredRemoveAction2.states.animationOptions =
	curve: "spring(1000,80,10)"	

Ra.RemoveAction2.states.add
	hover: {opacity: 1}
Ra.RemoveAction2.states.animationOptions =
	curve: "spring(1000,80,10)"	

Ra.ActionPhrase2.states.add
	scooch: {opacity: .5}
	erased: {opacity: 0}
Ra.ActionPhrase2.states.animationOptions =
	curve: "spring(1000,80,10)"	

Ra.ActionHeader2.states.add
	scooch: {opacity: .5}
	erased: {opacity: 0}
Ra.ActionHeader2.states.animationOptions =
	curve: "spring(1000,80,10)"
	
Ra.RemoveAction2.on Events.MouseOver, ->
	Ra.RemoveAction2.states.next("hover")
	Ra.ActionHeader2.states.next("scooch")
	Ra.ActionPhrase2.states.next("scooch")
	Ra.CriteriaPhrase.states.next("scooch")
	Ra.AddCriteriaButton.states.next("scooch")

Ra.RemoveAction2.on Events.MouseOut, ->
	Ra.RemoveAction2.states.next("default")
	Ra.ActionHeader2.states.next("default")
	Ra.ActionPhrase2.states.next("default")	
	Ra.CriteriaPhrase.states.next("default")
	Ra.AddCriteriaButton.states.next("default")
	
Ra.RemoveAction2.on Events.Click, ->
	Ra.RemoveAction2.states.next("default")
	Ra.ActionHeader2.states.next("erased")
	Ra.ActionPhrase2.states.next("erased")
	Ra.CriteriaPhrase.states.next("erased")
	Ra.AddCriteriaButton.states.next("erased")

