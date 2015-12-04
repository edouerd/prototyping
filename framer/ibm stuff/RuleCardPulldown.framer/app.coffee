Background = new Layer
	x: 0
	y: 0
	width: 1440
	height: 900*2
	backgroundColor: "#FFFFFF"
	
Ra = Framer.Importer.load "imported/RaRaNewPaging"

Ra.UnhoveredRemoveCondition.opacity = 0
Ra.RemoveCriteria.opacity = 0
Ra.UnhoveredRemoveAction.opacity = 0
Ra.RemoveAction.opacity = 0
Ra.UnhoveredRemoveCriteria.opacity = 0
Ra.RemoveCondition.opacity = 0
Ra.UnhoveredRemoveCondition.opacity = 0
Ra.RuleGrid.opacity = 0
Ra.EmailContent.opacity = 0
Ra.RulesConsole.opacity = 0
Ra.RulesConsoleButton.opacity = .5

Ra.Bubble1.opacity = 0
Ra.Bubble2.opacity = 0
Ra.Bubble3.opacity = 0
Ra.Bubble4.opacity = 0

bg = new BackgroundLayer backgroundColor: "#C8C9C1"

Ra.RuleCard.draggable.enabled = true

# Parameters
originalX = Ra.RuleCard.x
originalY = Ra.RuleCard.y
springCurve = "spring(1000,80,0)"

# States  
Ra.RuleCard.states.add
  zoom:
    scale: 1
  drag:
    scale: 1
  exited:
  	y: 700 
  
Ra.RuleCard.states.animationOptions =
  curve: springCurve

# Events
Ra.RuleCard.on Events.TouchStart, ->
  Ra.RuleCard.states.switch("zoom")
  
Ra.RuleCard.on Events.DragStart, ->
  Ra.RuleCard.dragStartY = Ra.RuleCard.y
  Ra.RuleCard.dragStartX = Ra.RuleCard.x
  
Ra.RuleCard.on Events.DragMove, (event) ->
  velocity = Ra.RuleCard.draggable.calculateVelocity()
  Ra.RuleCardRotationY = Utils.modulate(velocity.x, [-5,5], [-15,15], true)
  Ra.RuleCardRotationX = Utils.modulate(velocity.y, [-5,5], [-15,15], true)
  Ra.RuleCard.states.switch("drag")  
  Ra.RuleCard.shadowX = (Ra.RuleCard.x - Ra.RuleCard.dragStartX) * -0.125
  Ra.RuleCard.shadowY = (Ra.RuleCard.y - Ra.RuleCard.dragStartY) * -0.125
  Ra.RuleCard.animate
    properties:
      rotationX: -Ra.RuleCardRotationX
      rotationY: Ra.RuleCardRotationY
    curve: "spring(900,80,0)"
      

Ra.RuleCard.on Events.DragEnd, ->
  Ra.RuleCard.animate
    properties:
      x: originalX
      y: originalY
      rotationX: 0
      rotationY: 0
      shadowX: 0
      shadowY: 0
    curve: springCurve

Ra.RuleCard.on Events.TouchEnd, ->
  Ra.RuleCard.states.switch("default")
  
 # Close the Rule
 
Ra.CloseRule.on Events.Click, ->
	Ra.RuleCard.states.next("exited")