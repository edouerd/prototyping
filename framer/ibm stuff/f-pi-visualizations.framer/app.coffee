# Ready Document
document.body.style.cursor = "auto"
visualizations = Framer.Importer.load "imported/f-pi-visualizations"

# Switches and Viewer

# Create ScrollComponent
viewer = new ScrollComponent
	width: 940
	height: 801
	scrollHorizontal: false
	backgroundColor: "rgba(255,255,255,0)"
# Center ScrollComponent
viewer.center()
# Viewer
for i in [0..2]
	layerA = new Layer
		width: 940, height: 801
		y: 900 * i 
		backgroundColor: "#333"
		superLayer: viewer.content
		
# Add Hover State
visualizations.switch2bars.states.add
	hover: {scale: 1.05}
visualizations.switch2heatmap.states.add
	hover: {scale: 1.05}
visualizations.switch2chloro.states.add
	hover: {scale: 1.05}
# Hover State Animation
visualizations.switch2bars.states.animationOptions =
	curve: "spring(1000,80,10)"	
visualizations.switch2heatmap.states.animationOptions =
	curve: "spring(1000,80,10)"	
visualizations.switch2chloro.states.animationOptions =
	curve: "spring(1000,80,10)"	
# Switch Interactions
visualizations.switch2bars.on Events.MouseOver, ->
	visualizations.switch2bars.states.next("hover")
visualizations.switch2heatmap.on Events.MouseOver, ->
	visualizations.switch2heatmap.states.next("hover")
visualizations.switch2chloro.on Events.MouseOver, ->
	visualizations.switch2chloro.states.next("hover")
visualizations.switch2bars.on Events.MouseOut, ->
	visualizations.switch2bars.states.next("default")
visualizations.switch2heatmap.on Events.MouseOut, ->
	visualizations.switch2heatmap.states.next("default")
visualizations.switch2chloro.on Events.MouseOut, ->
	visualizations.switch2chloro.states.next("default")
# Switch Interactions
visualizations.switch2bars.on Events.TouchEnd, ->
	viewer.scrollToPoint({x:0, y:0}, true, {curve:"spring(600,50,10)"})
visualizations.switch2heatmap.on Events.TouchEnd, ->
	viewer.scrollToPoint({x:0, y:900}, true, {curve:"spring(600,50,10)"})
visualizations.switch2chloro.on Events.TouchEnd, ->
	viewer.scrollToPoint({x:0, y:1800}, true, {curve:"spring(600,50,10)"})
	
visualizations.v1.superLayer = viewer.content
visualizations.v2.superLayer = viewer.content
visualizations.v3.superLayer = viewer.content

visualizations.v1.x = -5
visualizations.v1.y = 0

visualizations.v2.x = -5
visualizations.v2.y = 895

visualizations.v3.x = -1
visualizations.v3.y = 1800