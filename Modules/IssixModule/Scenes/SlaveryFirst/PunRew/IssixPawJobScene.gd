extends "res://Modules/IssixModule/Scenes/RequirementsBasedScene.gd"

var preference = 0

func _init():
	sceneID = "PunRewPawjob"

func _run():
	if(state == ""):
		saynn("[say=issix]I think my pet deserves a nice reward for {pc.his} good behavior. Though, I have trouble thinking of a good reward, Hiisi, do you have any ideas?[/say]")
		saynn("[say=hiisi]... I don't know, perhaps a headpat?[/say]")
		saynn("[say=issix]No, I think something better is in order. How about a pawjob {pc.name}? What do you think? Would you like to have some nice stimulation?[/say]")
		addButton("Yes!", "Be excited about it", "yespawjob")
		addButton("Meh", "Reject the proposed activity", "nopawjob")

	if state == "yespawjob":
		saynn("[say=pc]I like the idea Master.[/say]")
		saynn("[say=issix]Splendid.[/say]")
		var slotCoverage = Globals.getBodyCoveringItem(GM.pc, BodypartSlot.Vagina)  # Even if player doesn't have Vagina it should work with base game clothing
		if slotCoverage != null:
			saynn("[say=issix]But you'll first need to lose "+slotCoverage.getVisibleName()+" before we begin, I much prefer more direct contact.[/say]")
			saynn("[say=pc]Oh, of course Master![/say]")
			saynn("[say=issix]And please, lay on the ground.[/say]")
			addButton("Undress", "Undress your bottoms", "undress")
		else:
			saynn("[say=issix]I see we don't need to do any undressing, good good. Lay on the ground then.[/say]")
			addButton("Continue", "Lay on the ground", "onground")

	if state in ["onground", "undress"]:
		playAnimation(StageScene.SexFeetPlay, "head", {pc="issix", npc="pc"})

		if state == "undress":
			saynn("You get undressed by Issix, after which you lie on your back on top of your blanket with top of your body facing away from Master giving him all of the easy access to your crotch.")
			saynn("[say=issix]This is better.[/say]")
		else:
			saynn("You lie on your back on top of your blanket with top of your body facing away from Master giving him all of the easy access to your crotch.")

		saynn("However first thing your Master does after standing up from the chair is approach your top of the body first.")
		saynn("[say=issix]Look me in the eyes.[/say]")
		saynn("You already looked at your Master's face as he came closer but now you focus on your Master's eyes even more, he looks at you with intent, as he pulls his {issix.toe} over your face and orders you.")
		saynn("[say=issix][b]Lick[/b].[/say]")
		saynn("You obey your Master. The tongue meets rough texture of {issix.his} {issix.toe}, you can't deny that the texture, smell and taste that you can feel on your tongue are slightly off putting, but it's not as bad as you initially imagined it to be. As you get used to all of it your licking becomes more intense.")
		saynn("[say=issix]Get more spit on it, pet. You will thank yourself later.[/say]")
		saynn("You do as commanded and cover the hoof of Master's leg in more spit. There is only so much as the solid texture can take, which is apparent when your spit drips back onto your face covering it more and more. A minute later Master is satisfied.")
		saynn("[say=issix]Good hoof slut.[/say]")
		if GM.pc.hasReachablePenis() and GM.pc.hasReachableVagina():
			addButton("Penis", "He moves back and puts his hoof onto your penis", "soletreatment", [1])
			addButton("Vagina", "He moves back and puts his hoof onto your vagina", "soletreatment", [2])
		else:
			addButton("Continue", "He moves back and puts his hoof onto your privates", "soletreatment")

	if state == "soletreatment":
		match preference:
			1:
				saynn("{issix.His} hoof moves over your crotch until it touches your {pc.penis} applying gentle pressure as you become accustomed with the feeling.")
				saynn("[say=pc]Ahhh![/say]")
				saynn("[say=issix]Shush, do not speak.[/say]")
				saynn("All that lubricating spit you provided becomes very useful now as the hoof of {issix.his} hoof massages your increasingly erect penis. This goes on for good few minutes, every now and then you grunt slightly, showing your Master appreciation for {issix.his} care.")
				saynn("[say=issix]If you only saw yourself - a hoof slut squirming under my hoof so happy {pc.his} {pc.penisSize} {pc.penis} receives attention from {pc.his} Master. Ah, whatever, I think you are too far gone.[/say]")
				saynn("Master increases pressure and speed of his massage, regardless of rough texture of his hoof it's still pleasant enough for you to ")
			2:
				saynn("{issix.His} hoof moves over your crotch until it touches your {pc.vagina} applying gentle pressure as you become accustomed with the feeling.")
				saynn("[say=pc]Ahhh![/say]")
				saynn("[say=issix]Shush, do not speak.[/say]")
				saynn("All that lubricating spit you provided becomes very useful now as the hoof of {issix.his} hoof massages your increasingly wet {pc.vagina}. Its edge enters you slightly and with circular motions massages you as much as it can. This goes on for good few minutes, every now and then you grunt slightly, showing your Master appreciation for {issix.his} care.")
				saynn("[say=issix]If you only saw yourself - a hoof slut squirming under my hoof so happy {pc.his} {pc.vaginaStretch} {pc.vagina} receives attention from {pc.his} Master. Ah, whatever, I think you are too far gone.[/say]")
				saynn("Master increases pressure and speed of his massage, regardless of rough texture of his hoof it's still pleasant enough for you to ")
			3:
				saynn("{issix.His} hoof moves over your crotch until it touches it and applies gentle pressure and you become accustomed with the feeling.")
				saynn("[say=pc]Ahhh![/say]")
				saynn("[say=issix]Shush, do not speak.[/say]")
				saynn("All that lubricating spit you provided becomes very useful now as the hoof of {issix.his} hoof massages your crotch. This goes on for good few minutes, every now and then you grunt slightly, showing your Master appreciation for {issix.his} care.")
				saynn("[say=issix]If you only saw yourself - a hoof slut squirming under my hoof so happy {pc.his} null crotch receives attention from {pc.his} Master. Ah, whatever, I think you are too far gone.[/say]")
				saynn("Master increases pressure and speed of his massage, regardless of rough texture of his hoof it's still pleasant enough for you to ")

		saynn("[say=pc]Master, I...[/say]")
		saynn("[say=issix]It's okey, you can let it go pet.[/say]")
		if preference < 3:
			addButton("Cum", "Let it go", "climax")
		else:
			addButton("Climax", "Let it go", "Climax")

	if state == "climax":
		saynn("[say=pc]Yipppp![/say]")
		match preference:
			1:
				saynn("With a last yelp your you whine out the flood gates are released and you cover mostly yourself in your own baby batter.")
			2:
				saynn("With a last yelp your you whine out the flood gates are released and you cover mostly yourself in your own love juices.")
			3:
				saynn("With a last yelp your you whine out the flood gates are released and you climax.")

		saynn("Master withdraws {issix.his} {issix.foot} and looks at your bright face.")
		saynn("[say=issix]Happy, "+Globals.getPlayerPetName()+"? I certainly would hope so.[/say]")
		saynn("[say=pc]Y-yess Master[/say]")
		saynn("You thank your Master for rewarding you in such a special way and make yourself more or less presentable again.")
		addButton("Back", "", "endthescene")


func oneTimeOnly(_checkID: String):
	return true

func _react(_action: String, _args):
	if _action == "climax":
		if preference == 1:
			GM.pc.cummedOnBy("pc", FluidSource.Penis, 0.8)
			GlobalRegistry.getCharacter("issix").cummedOnBy("pc", FluidSource.Penis, 0.2)
		elif preference == 2:
			GM.pc.cummedOnBy("pc", FluidSource.Vagina, 0.8)
			GlobalRegistry.getCharacter("issix").cummedOnBy("pc", FluidSource.Vagina, 0.2)

	if _action == "soletreatment":  # 1 = penis, 2 = vagina, 3 = nullo
		if _args.size() > 0:
			preference = _args[0]
		else:
			if GM.pc.hasReachableVagina():
				preference = 2
			elif GM.pc.hasReachablePenis():
				preference = 1
			else:
				preference = 3

		GM.pc.addLust(40)

	if _action == "undress":
		var item = Globals.getBodyCoveringItem(GM.pc, BodypartSlot.Vagina)
		GM.pc.getInventory().unequipItem(item)

	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
