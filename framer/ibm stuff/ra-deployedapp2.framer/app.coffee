# This imports all the layers for "EndAppMobileOnly" into endappmobileonlyLayers1
App = Framer.Importer.load "imported/EndAppMobileOnly"

#Login Modal and Exit Button
App.LoginScreen.opacity = 0
App.LoginScreen.z = -5
App.ExitGoogleLogin.opacity = 0

App.LoginScreen.states.add
	summoned: {opacity: 1, y: 20, z: 5}
App.ExitGoogleLogin.states.add
	unhovered:  {scale: 1}
	hovered: {scale: 1.1}
	summoned: {opacity: 1,y: 35,z: 5}	
App.LoginScreen.states.animationOptions =
	curve: "spring(1000,80,10)"	
App.ExitGoogleLogin.states.animationOptions =
	curve: "spring(1000,80,10)"	
	
#Stuff to Blur
App.Masthead.states.animationOptions =
	curve: "spring(1000,80,10)"	
App.Content.states.animationOptions =
	curve: "spring(1000,80,10)"	
App.Masthead.states.add
	blur: {blur: 10}
	back: {x: -680}
App.LoginButton.states.add
	blur: {blur: 10}
	back: {x: -680}
App.Content.states.add
	blur: {blur: 10}	
	back: {x: -680}

#Login Button
App.LoginButton.states.add
	tapped: {scale: 1.02, opacity: .8}
App.LoginButton.states.animationOptions =
	curve: "spring(1000,80,10)"		
App.LoginButton.on Events.Click, ->
	App.LoginButton.states.next("tapped")
	App.ExitGoogleLogin.states.next("summoned")
	App.LoginScreen.states.next("summoned")
	App.Masthead.states.next("blur")
	App.LoginButton.states.next("blur")
	App.Content.states.next("blur")	
App.LoginButton.on Events.TouchStart, ->
	App.LoginButton.states.next("tapped")
App.LoginButton.on Events.TouchEnd, ->
	App.LoginButton.states.next("default")
	
# Exit Login Button	
App.ExitGoogleLogin.on Events.MouseOver, ->
	App.ExitGoogleLogin.states.next("hovered")
App.ExitGoogleLogin.on Events.MouseOut, ->
	App.ExitGoogleLogin.states.next("unhovered")
App.ExitGoogleLogin.on Events.Click, ->
	App.LoginButton.states.next("default")
	App.ExitGoogleLogin.states.next("default")
	App.Masthead.states.next("default")
	App.LoginScreen.states.next("default")
	App.Content.states.next("default")
	
#LogginIn
App.Loader.opacity = 0
App.Loader.blur = 5
App.Loader.states.add
	summoned: {opacity: 1, x: 55, blur: 0}
App.Loader.states.animationOptions =
	curve: "spring(800,80,10)"		
	
# Let's Login
App.LoginScreen.on Events.Click, ->	
	App.ExitGoogleLogin.states.next("default")
	App.LoginScreen.states.next("default")
	App.Loader.states.next("summoned")
	App.Masthead.states.next("default")
	App.LoginButton.states.next("back")
	App.Content.states.next("back")
	
App.Loader.on 'end', ->
	App.Loader.states.next("default")
	App.ScreenOne.states.next("summoned")
	App.VisitorButton.states.next("summoned")	
	
#ScreenOne + Visitor Button
App.ScreenOne.states.add
	summoned: {x: -28}
	back: {x: -680, z:-10}
App.ScreenOne.states.animationOptions =
	curve: "spring(1000,80,10)"
	
App.VisitorButton.states.add
	summoned: {x: 16}
	tapped: {scale: 1.02, opacity: .8}
	back: {x: -680, z:-10}
App.VisitorButton.states.animationOptions =
	curve: "spring(1000,80,10)"		
#App.VisitorButton.on Events.Click, ->
	#App.VisitorButton.states.next("back")
	#App.ScreenOne.states.next("back")	
	#App.ScreenTwo.states.next("summoned")
App.VisitorButton.on Events.TouchStart, ->
	App.VisitorButton.states.next("tapped")
App.VisitorButton.on Events.TouchEnd, ->
	App.VisitorButton.states.next("back")
	App.ScreenOne.states.next("back")	
	App.ScreenTwo.states.next("summoned")	
	App.NameButton.states.next("summoned")
	App.CompanyButton.states.next("summoned")
	App.PurposeButton.states.next("summoned")
	App.DateButton.states.next("summoned")
	App.HostButton.states.next("summoned")
	App.SignInButton.states.next("summoned")
		
#ScreenTwo + Buttons
App.ScreenTwo.states.add
	summoned: {x: 0}
App.ScreenTwo.states.animationOptions =
	curve: "spring(1000,80,10)"

App.NameButton.states.add
	summoned: {x: 193}
	tapped: {scale: 1.02, opacity: .8}
App.NameButton.states.animationOptions =
	curve: "spring(1000,80,10)"
	
App.CompanyButton.states.add
	summoned: {x: 193}
	tapped: {scale: 1.02, opacity: .8}
App.CompanyButton.states.animationOptions =
	curve: "spring(1000,80,10)"

App.PurposeButton.states.add
	summoned: {x: 193}
	tapped: {scale: 1.02, opacity: .8}	
App.PurposeButton.states.animationOptions =
	curve: "spring(1000,80,10)"	
	
App.DateButton.states.add
	summoned: {x: 524}
	tapped: {scale: 1.02, opacity: .8}	
App.DateButton.states.animationOptions =
	curve: "spring(1000,80,10)"

App.HostButton.states.add
	summoned: {x: 524}
	tapped: {scale: 1.02, opacity: .8}
App.HostButton.states.animationOptions =
	curve: "spring(1000,80,10)"

App.SignInButton.states.add
	summoned: {x: 16}
	tapped: {scale: 1.02, opacity: .8}
App.SignInButton.states.animationOptions =
	curve: "spring(1000,80,10)"
	
App.NameButton.on Events.TouchStart, ->
	App.NameButton.states.next("tapped")
App.CompanyButton.on Events.TouchStart, ->
	App.CompanyButton.states.next("tapped")
App.PurposeButton.on Events.TouchStart, ->
	App.PurposeButton.states.next("tapped")
App.DateButton.on Events.TouchStart, ->
	App.DateButton.states.next("tapped")
App.HostButton.on Events.TouchStart, ->
	App.HostButton.states.next("tapped")
App.SignInButton.on Events.TouchStart, ->
	App.SignInButton.states.next("tapped")
	
	
