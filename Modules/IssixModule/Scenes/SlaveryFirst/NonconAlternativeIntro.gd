extends SceneBase

const Globals = preload("res://Modules/IssixModule/Globals.gd")
var bumping_guard := ""

func _init():
	sceneID = "NonconAltIntro"

func _run():
	if(state == ""):
		saynn("You move through the main halls of the prison until you find yourself near the same couple you saw on the Pasture - androgynous guard with a leashed pet - inmate. They are behind a pillar, you find a place to observe them sneakily.")
		saynn("The inmate is still in their heavy bondage, he is also on his fours while the guard is sitting on their back, using them as some kind of chair, the guard seems busy with something, fiddling with their paws.")
		saynn("This time around you are able to better see the facial features of the canine, or rather only one facial feature, considering the rest of their face is covered by a gimp mask. The only word you can find for describing their eyes however is... Blank. The look in their eyes looks empty, lifeless. There is nothing going on. They are staring forward. Once again their body still, only sometimes imbalanced by the guard on top of them moving their body one way another as they continue to move their paws doign something you don't see because of the angle. At some point the guard looks around, as if they knew they were being observed, after so much of near inactivity this took you by surprise and you hid behind the wall that separates you and the two creatures.")
		addButton("Bump", "You get bumped by someone on your shoulder", "intro2")

	if state == "intro2":
		# TODO Add idle scene
		saynn("At the same time as you hid yourself, you felt a bump on your shoulder, it's {pawn.name}.")
		saynn("[say=pawn]Why be such a creep {pc.inmateNumberFull}? Whoever you are watching probably doesn't bite and you can just say hello.[/say]")
		if GM.pc.getPersonality().getStat(PersonalityStat.Brat) > 0.2:
			saynn("[say=pc]None of your business.[/say]")
			saynn("[say=pawn]Feisty, huh? If you keep that up you are going to get yourself hurt at worst or forced to submission at best.[/say]")
			saynn("[say=pc]I said fuck off.[/say]")
		else:
			saynn("[say=pc]I've just been making sure everything is okey, jeez.[/say]")
			saynn("[say=pawn]What wouldn't be? From where I'm standing you were watching a nice pair of Master and a pet. Aren't you the one who would understand that well?[/say]")
			saynn("[say=pc]...[/say]")
			saynn("[say=pawn]Hehehe, thought so. you are Issix's "+Globals.getPlayerPetName()+".[/say]")

		saynn("[say=pawn]Whatever, don't cause trouble, I have enough on my own plate to be dealing with regular creeps.[/say]")
		saynn("{pawn.He} left, going somewhere towards the greenhouses. You breathe out, the sudden interruption frightened you a little. After taking two more breathes you sneakly look behind the wall in direction that the Guard and their pet were a minut ago, only to see them being gone.")
		addButton("Huh?", "You walk further to see the previously occupied place in entirety", "intro3")

	if state == "intro3":
		saynn("You walk a bit more, if the pair was still there they would see you whole now, but they aren't. They must have went somewhere when you were busy talking with {pawn.name}, you were ready to just continue going your way until you felt two arms on your shoulders, waking you up from a surprise into yet another one, you quickly turn around to see... Them.")

		saynn("[sayOther]Hello there. You know, it's quite rude to look, and I think you did that twice now, did you? Are you curious of something or are you just a creep?[/sayOther]")
		saynn("[say=pc]No, not anything like that... I were just uhhh... Curious...[/say]")
		saynn("Your look wanders between the guard and their blank, bondage wrapped pet. The look of interest and a tint of arousal in your eyes. This doesn't go unnoticed by the androgynous creature in front of you as they give you a smirky look.")
		saynn("[sayOther]Ohhhhhhh. Like that huh? You interested in my pet here, yes?[/sayOther]")
		saynn("[say=pc]Yes...[/say]")
		saynn("They lick their lips.")
		saynn("[sayOther]I'd happily make a drone out of you.[/sayOther]")
		saynn("You give them a quizzical look")
		saynn("[say=pc]A drone? I'm not sure I understand/[/say]")
		saynn("[sayOther]My little pet here is special after all, it's D-1. D-1, say hi to inmate.[/sayOther]")
		saynn("[sayMale]Hello, inmate.[/sayMale]")
		saynn("The way they said it, it's again very... Strange.")
		saynn("[sayOther]So, you interested?[/sayOther]")
		saynn("[say=pc]Umm, I already have a Master, I were just curious about uhh, your drone?[/say]")
		saynn("[sayOther]Awww, shucks, you are already taken? I knew I felt a pet in you the moment I set my eyes on you. Well, no wonder you seem so perfect and so well trained. Should have thought that was the case. Ekhem. Yes, this is my drone, designation D-1. It's my personal drone.[/sayOther]")
		saynn("[say=pc]They don't exactly look like a regular pet I'm used to.[/say]")
		saynn("[sayOther]It's a drone, you don't see many of those around. It has no free will of its own, it exists to serve, there is no other purpose to its existence.[/sayOther]")
		saynn("[say=pc]Isn't that like any other pet?[/say]")
		saynn("[sayOther]If your Master asks you to pleasure him in the way you personally hate, would you do it?[/sayOther]")
		saynn("[say=pc]Well-[/say]")
		saynn("[sayOther]You'd at least think before you do it right? You might be an absolute slut but it's going to take you a moment before you realize the position you are in as a pet. Drones don't think. They follow commands. They have no free will to have those thoughts. They cannot say no. That choice doesn't exist for them. They are puppets.[/sayOther]")

		saynn("[sayOther]You have your free will. I can see it in you. A shame, you'd make a good drone.[/sayOther]")
		saynn("You feel embarrassed as they say so.")
		saynn("[say=pc]Well, umm...[/say]")
		saynn("[sayOther]Tell your Master that I'd love to have you. Heh. Need to go now. Hope to see you again.[/sayOther]")
		saynn("And then they just walk away, as suddenly as they appeared behind you they are gone. This conversation made you feel like you need to talk with your Master about this.")
		addButton("Move", "Move your way", "endthescene")


func _react(_action: String, _args):
	processTime(5*60)

	if _action == "intro2":
		var guard = Globals.pick_unique_one(Globals.findPawns([[["isGuard"], []]]))
		if null in guard:
			bumping_guard = "risha"
		else:
			bumping_guard = guard[0]

	if(_action == "endthescene"):
		setModuleFlag("IssixModule", "Mindlessness_Walkies_Status", 2)
		endScene()
		return

	setState(_action)

func resolveCustomCharacterName(_charID):
	if _charID == "pawn":
		return bumping_guard

	return null
