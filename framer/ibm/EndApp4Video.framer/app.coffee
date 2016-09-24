# Background Layer
BG = new Layer {
	width: 640, 
	height: 1136, 
	backgroundColor: '#FDFBFB'
}
# Header Layer
Header = new Layer {
	width: 640, 
	height: 160, 
	backgroundColor: '#1DA2CA',
	shadowY: 6,
	shadowBlur: 1,
	shadowColor: "rgba(21, 95, 126, 1)",
}
# Header Text
Header.html = 'Lab Advocates'
Header.style = {
	fontSize: '34px'
	textAlign: 'center'
	lineHeight: '170px'
	color: '#FFFFFF'
}
# Header States
Header.states.add
	press: {y: 205, shadowY: 0}
	move: {x: -640}
Header.states.animationOptions =
	curve: "spring(2000,80,10)"	

# Add Lab Advocate Header
AddHeader = new Layer {
	x: 640,
	width: 640, 
	height: 160, 
	backgroundColor: '#1DA2CA',
	shadowY: 6,
	shadowBlur: 1,
	shadowColor: "rgba(21, 95, 126, 1)",
}
# Add Header Text
AddHeader.html = 'Add New Advocate'
AddHeader.style = {
	fontSize: '34px'
	textAlign: 'center'
	lineHeight: '170px'
	color: '#FFFFFF'
}
# Add Header States
AddHeader.states.add
	move: {x: 0}
AddHeader.states.animationOptions =
	curve: "spring(2000,80,10)"	

# ButtonOne - Search By Customer
# ButtonOne - Search By Customer
ButtonOne = new Layer {
	x: 20,
	y: 200,
	width: 600, 
	height: 160, 
	backgroundColor: '#dadada',
	shadowY: 6,
	shadowBlur: 1,
	shadowColor: "rgba(100, 110, 100, 1)",
}
# ButtonOne Text
ButtonOne.html = 'Search by Customer'
ButtonOne.style = {
	fontSize: '34px'
	textAlign: 'center'
	lineHeight: '170px'
	color: '#212121'
}
# ButtonOne States
ButtonOne.states.add
	press: {y: 205, scale: .98, shadowY: 0}
	move: {x: -600}
ButtonOne.states.animationOptions =
	curve: "spring(2000,80,10)"	
# ButtonOne Interactions
ButtonOne.on Events.TouchStart, ->
	ButtonOne.states.switch("press")
ButtonOne.on Events.TouchEnd, ->
	ButtonOne.states.switch("default")

# ButtonTwo - Search By Lab Advocate
# ButtonTwo - Search By Lab Advocate
ButtonTwo = new Layer {
	x: 20,
	y: 380,
	width: 600, 
	height: 160, 
	backgroundColor: '#dadada',
	shadowY: 6,
	shadowBlur: 1,
	shadowColor: "rgba(100, 110, 100, 1)",
}
# ButtonTwo Text
ButtonTwo.html = 'Search by Lab Advocate'
ButtonTwo.style = {
	fontSize: '34px'
	textAlign: 'center'
	lineHeight: '170px'
	color: '#212121'
}
# ButtonTwo States
ButtonTwo.states.add
	press: {y: 385, scale: .98, shadowY: 0}
	move: {x: -600}
ButtonTwo.states.animationOptions =
	curve: "spring(2000,80,10)"	
# ButtonTwo Interactions
ButtonTwo.on Events.TouchStart, ->
	ButtonTwo.states.switch("press")
ButtonTwo.on Events.TouchEnd, ->
	ButtonTwo.states.switch("default")
	
# ButtonThree - Search By Lab Advocate
# ButtonThree - Search By Lab Advocate
ButtonThree = new Layer {
	x: 20,
	y: 560,
	width: 600, 
	height: 160, 
	backgroundColor: '#dadada',
	shadowY: 6,
	shadowBlur: 1,
	shadowColor: "rgba(100, 110, 100, 1)",
}
# ButtonThree Text
ButtonThree.html = 'Search by Executive Advocates'
ButtonThree.style = {
	fontSize: '34px'
	textAlign: 'center'
	lineHeight: '170px'
	color: '#212121'
}
# ButtonThree States
ButtonThree.states.add
	press: {y: 565, scale: .98, shadowY: 0}
	move: {x: -600}
ButtonThree.states.animationOptions =
	curve: "spring(2000,80,10)"	
# ButtonThree Interactions
ButtonThree.on Events.TouchStart, ->
	ButtonThree.states.switch("press")
ButtonThree.on Events.TouchEnd, ->
	ButtonThree.states.switch("default")
	
# ButtonFour - Search By Lab Advocate
# ButtonFour - Search By Lab Advocate
ButtonFour = new Layer {
	x: 20,
	y: 740,
	width: 600, 
	height: 160, 
	backgroundColor: '#dadada',
	shadowY: 6,
	shadowBlur: 1,
	shadowColor: "rgba(100, 110, 100, 1)",
}
# ButtonFour Text
ButtonFour.html = 'Search by Extra Advocates'
ButtonFour.style = {
	fontSize: '34px'
	textAlign: 'center'
	lineHeight: '170px'
	color: '#212121'
}
# ButtonFour States
ButtonFour.states.add
	press: {y: 745, scale: .98, shadowY: 0}
	move: {x: -600}
ButtonFour.states.animationOptions =
	curve: "spring(2000,80,10)"	
# ButtonFour Interactions
ButtonFour.on Events.TouchStart, ->
	ButtonFour.states.switch("press")
ButtonFour.on Events.TouchEnd, ->
	ButtonFour.states.switch("default")
	
# AddButton - Search By Lab Advocate
# AddButton - Search By Lab Advocate
AddButton = new Layer {
	x: 20,
	y: 920,
	width: 600, 
	height: 160, 
	backgroundColor: '#1DB58E',
	shadowY: 6,
	shadowBlur: 1,
	shadowColor: "rgba(100, 110, 100, 1)",
}
# AddButton Text
AddButton.html = 'Add New Advocates'
AddButton.style = {
	fontSize: '34px'
	textAlign: 'center'
	lineHeight: '170px'
	color: '#082818'
}
# AddButton States
AddButton.states.add
	press: {y: 925, scale: .98, shadowY: 0}
	move: {x: -600}
AddButton.states.animationOptions =
	curve: "spring(2000,80,10)"	
# AddButton Interactions
AddButton.on Events.TouchStart, ->
	AddButton.states.switch("press")
AddButton.on Events.TouchEnd, ->
	Header.states.switch("move")
	AddHeader.states.switch("move")
	ButtonOne.states.switch("move")
	ButtonTwo.states.switch("move")
	ButtonThree.states.switch("move")
	ButtonFour.states.switch("move")
	AddButton.states.switch("move")