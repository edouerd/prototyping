DeepBackground = new Layer
	z: -10
	width: 640
	height: 1136
	backgroundColor:"#FFFFFF"
Background = new Layer
	z: -8
	width: 640
	height: 1136
	backgroundColor:"#FFF"
Background.states.add
	beeclicked: {opacity: .5}
	GO: {backgroundColor:"#333333"}
Background.states.animationOptions =
	curve: "spring(1000,100,10)"	
	
notification = new Layer x:60, y:450, width: 500, height: 300, scale: 0, backgroundColor: "#null", color:"#ffffff"
notification.html = 'Device Triggered!'
notification.style =
  fontSize: '80px'
  textAlign: 'center'
  lineHeight: '100px'


# This imports all the layers for "Bee" into beeLayers1
Bee = Framer.Importer.load "imported/Bee"

#Button
Bee.Explode.z = -5
Bee.Base.z = -5
Bee.Button.z = -1

Bee.Button.states.add
	pressed: {y: 758}
	released: {y: 753, opacity: 0}
Bee.Button.states.animationOptions =
	curve: "spring(1000,20,10)"	
	
Bee.Explode.states.add
	Exploded: {scale: 8}
Bee.Explode.states.animationOptions =
	curve: "spring(200,20,10)"	

#Bee Loaded State
Bee.LeftEye.scale = 0
Bee.RightEye.scale = 0
Bee.LeftWing.scale = 0
Bee.RightWing.scale = 0
Bee.Body1.scale = 0
Bee.Body2.scale = 0
Bee.Body3.scale = 0
Bee.Body4.scale = 0
Bee.LeftEye.animate
	properties: { scale: 1 }
	curve: 'spring'
	curveOptions:
		friction: 40
Bee.RightEye.animate
	properties: { scale: 1 }
	curve: 'spring'
	curveOptions:
		friction: 40
Bee.LeftWing.animate
	properties: { scale: 1 }
	curve: 'spring'
	curveOptions:
		friction: 40
Bee.RightWing.animate
	properties: { scale: 1 }
	curve: 'spring'
	curveOptions:
		friction: 40
Bee.Body1.animate
	properties: { scale: 1 }
	curve: 'spring'
	curveOptions:
		friction: 40
Bee.Body2.animate
	properties: { scale: 1 }
	curve: 'spring'
	curveOptions:
		friction: 40
Bee.Body3.animate
	properties: { scale: 1 }
	curve: 'spring'
	curveOptions:
		friction: 40
Bee.Body4.animate
	properties: { scale: 1 }
	curve: 'spring'
	curveOptions:
		friction: 40
		
#Bee States
#LeftEye
Bee.LeftEye.states.add
	tapped: {opacity: .5}
	blurred: {opacity: .5, blur: 5}
	cocked: {y: 500}
	released: {y: -50, z: 2}
Bee.LeftEye.states.animationOptions =
	curve: "spring(600,80,10)"	
#RightEye
Bee.RightEye.states.add
	tapped: {opacity: .5}
	blurred: {opacity: .5, blur: 5}
	cocked: {y: 500}
	released: {y: -50, z: 2}
Bee.RightEye.states.animationOptions =
	curve: "spring(600,80,10)"	
#LeftWing
Bee.LeftWing.states.add
	tapped: {opacity: .5}
	blurred: {opacity: .5, blur: 5}
	animated: {originX: 1, originY: 0, y: 550, rotationZ: -20}
	released: {y: -140, z: 2}
Bee.LeftWing.states.animationOptions =
	curve: "spring(500,20,10)"	
#RightWing
Bee.RightWing.states.add
	tapped: {opacity: .5}
	blurred: {opacity: .5, blur: 5}
	animated: {originX: 0, originY: 0, y: 550, rotationZ: 20}
	released: {y: -140, z: 2}
Bee.RightWing.states.animationOptions =
	curve: "spring(500,20,10)"	
#Body1
Bee.Body1.states.add
	tapped: {opacity: .5}
	blurred: {opacity: .5, blur: 5}
	cocked: {y: 540}
	released: {y: -30, z: 2}
Bee.Body1.states.animationOptions =
	curve: "spring(300,30,10)"	
#Body2
Bee.Body2.states.add
	tapped: {opacity: .5}
	blurred: {opacity: .5, blur: 5}
	cocked: {y: 583}
	released: {y: -30, z: 2}
Bee.Body2.states.animationOptions =
	curve: "spring(350,30,10)"	
#Body3
Bee.Body3.states.add
	tapped: {opacity: .5}
	blurred: {opacity: .5, blur: 5}
	cocked: {y: 626}
	released: {y: -30, z: 2}
Bee.Body3.states.animationOptions =
	curve: "spring(400,30,10)"	
#Body4
Bee.Body4.states.add
	tapped: {opacity: .5}
	blurred: {opacity: .5, blur: 5}
	cocked: {y: 669}
	released: {y: -30, z: 2}
Bee.Body4.states.animationOptions =
	curve: "spring(500,30,10)"	

#Interactions
Background.on Events.TouchStart, ->
	Background.states.next("beeclicked")
	Bee.LeftEye.states.next("blurred")
	Bee.RightEye.states.next("blurred")
	Bee.LeftWing.states.next("blurred")
	Bee.RightWing.states.next("blurred")
	Bee.Body1.states.next("blurred")
	Bee.Body2.states.next("blurred")
	Bee.Body3.states.next("blurred")
	Bee.Body4.states.next("blurred")
	
Background.on Events.TouchEnd, ->
	Background.states.next("default")
	Bee.LeftEye.states.next("default")
	Bee.RightEye.states.next("default")
	Bee.LeftWing.states.next("default")
	Bee.RightWing.states.next("default")
	Bee.Body1.states.next("default")
	Bee.Body2.states.next("default")
	Bee.Body3.states.next("default")
	Bee.Body4.states.next("default")
	Background.backgroundColor = "#FFFFFF"
	Bee.Base.opacity = 1
	Bee.Button.states.next("default")
	notification.states.next("default")
	Bee.Explode.states.next("default")
	notification.animate
		properties: { scale: 1, z: -5}
		curve: 'spring'
 	curveOptions:
			friction: 10
	
	
Bee.Button.on Events.TouchStart, ->
	Bee.Button.states.next("pressed")
	Bee.LeftWing.states.next("animated")
	Bee.RightWing.states.next("animated")
	Bee.LeftEye.states.next("cocked")
	Bee.RightEye.states.next("cocked")
	Bee.Body1.states.next("cocked")
	Bee.Body2.states.next("cocked")
	Bee.Body3.states.next("cocked")
	Bee.Body4.states.next("cocked")
		
Bee.Button.on Events.TouchEnd, ->
	Bee.Button.states.next("released")
	Bee.LeftWing.states.next("released")
	Bee.RightWing.states.next("released")
	Bee.LeftEye.states.next("released")
	Bee.RightEye.states.next("released")
	Bee.Body1.states.next("released")
	Bee.Body2.states.next("released")
	Bee.Body3.states.next("released")
	Bee.Body4.states.next("released")
	Bee.Explode.states.next("Exploded")
	
	notification.animate
		properties: { scale: 1, z: 1}
		curve: 'spring'
 	curveOptions:
			friction: 10

	Bee.Base.opacity = 0
