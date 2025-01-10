extends SceneBase

const Globals = preload("res://Modules/IssixModule/Globals.gd")

func _init():
	sceneID = "DemonLamiaTalk"

func _run():
	if(state == ""):
		addCharacter("lamiademon")
		saynn("You face Lamia. A fiery fox simply sits atop of a burning blanket, which doesn't seem to concern the fox at all. On the blanket, next to them lies a jar filled with water and many dark segmented worms swimming around and sticking to the glass with their circular opening of the body. On three walls surrounding them are countless drawings decorating the walls, you can see a few pentagrams, horned creatures, fiery hells.")
		addButton("Talk", "Talk with the fox", "talk")
		if Globals.checkIfAchieved("Azazel_Corr_Dream_State", "Talked_With_Lamia"):
			addButton("Speech", "Learn how to speak like a good pet does", "finish")
		addButton("Appearance", "Look at the fox", "appearance")

	if state == "talk":
		playAnimation(StageScene.Duo, "stand", {pc="pc", npc="lamiademon"})
		saynn("[say=pc]Hello Lamia, umm, how are you?[/say]")
		saynn("Lamia gives you thumbs up.")
		saynn("[say=pc]Sooo, any hint on what is this place, how I got here or how I get out?[/say]")
		saynn("Lamia thinks, before shaking their head. They point to your side, when you look there is a notebook, it wasn't there before. You pick it up, it's full of drawings, the title page says „{pc.name}'s Manual”")
		saynn("As you flip the pages, you realize that the definition of [i]{pc.Name}'s[/i] in the title manual does not refer to it [i]belonging[/i] to you, but rather is a manual for how to use [i]you[/i].")
		saynn("First page shows various elements that the pet posesses, there is a general description of you: " + getPlayerDescription())
		saynn("Next page says that a „pet” comes with a collar on {pc.his} neck, it shows a basic step of attaching a leash to it.")
		saynn("You check your neck, still no collar in sight. Flipping the pages you see more of what one would expect - basic commands the pet should understand, „compatible” bondage gear, your exploitable weaknesses that can be used for further training...")
		saynn("The last page in the notebook shows that a pet cannot speak proper words, with the dialogue option coming from you saying „Yip!”. This page seems unfinished - only the general sketch is made, and compared to other pages, it's uncolored. You look at Lamia in bewilderment.")
		saynn("[say=pc]Wh- Who- Why?[/say]")
		saynn("Lamia gives you a mischievous smile as the flames of the blanket raise. You have a feeling that Lamia may want you to give them permission to finish the notebook.")
		addButton("Give in", "Let Lamia finish the manual", "finish")
		addButton("Talk", "Return to talk", "")

	if state == "appearance":


	if state == "finish":
		saynn("[say=pc]Well... I did notice the notebook is unfinished, you meant to finish it right?[/say]")
		saynn("Lamia nods.")
		saynn("[say=pc]Do you need anything from me to finish it?[/say]")
		saynn("They nod again.")
		saynn("[say=pc]Umm, what is it?[/say]")
		saynn("You ask with dread. Lamia writes 4 words with a paw finger in the air, they all leave a red floating smear.")
		saynn("YOUR ABILITY TO SPEAK")
		saynn("You gulp. To give something so essential to you, for the same of becoming someone's... Pet? Slave? You don't even know anymore. It feels like profound loss of something very important to all conscious beings... Until you remember just with whom you are speaking right now. Lamia never had their voice, and yet, you look at demonic fox, they were able to overcome.")
		saynn("A free choice to make a decision is presented to you, what will you do?")
		addButton("Agree", "Let Lamia take your speech (temporary speech impairment)", "speechbye")
		addButton("Refuse", "Do not let Lamia take away your speech", "speechyes")

	if state == "speechyes":
		saynn("[say=pc]I'd rather not, speech is quite important to me, I'd rather keep it.[/say]")
		saynn("You look at Lamia, he gets saddened, he takes a deep breath and nods to you, before laying on his belly facing the jar he has on his blanke, observing what's inside.")
		addButton("Leave", "Doesn't seem like Lamia has anything else to tell you", "endthescene")

	if state == "speechbye":
		playAnimation(StageScene.Hug, "hug", {pc="pc", npc="lamiademon"})
		saynn("[say=pc]Okey, I'm ready. Will it hurt?[/say]")
		saynn("Lamia smiles and shakes his head, he stands up and approaches you. You can feel immense heat radiating off him, before he touches you with his paw, the heat seems to dissipate. He takes both of your paws in their own and look at your face.")
		saynn("They can feel your uncertainty, fear, and yet they try to put you at ease. Their paws touching yours. Finally, they simply hug you. Their hug so gentle and caring.")
		saynn("[say=pc]Awww, thank you Lamia! That's sweet of you.[/say]")
		saynn("It calms you down. You stare once again at vulpine face.")
		addButton("Continue", "Continue", "speechbye2")

	if state == "speechbye2":
		playAnimation(StageScene.Hug, "kiss", {pc="pc", npc="lamiademon"})
		saynn("Lamia's paw moves towards your throat, it massages it. You feel that this is it, this is when it happens, you let the vulpine do his work.")
		saynn("You can feel the bulging, as if whatever you had in your throat changed place or something else happened to it, you try to say something but it doesn't come out, Lamia rests one of his paw fingers on your mouth to shush you up. You understand you shouldn't try doing anything yet. They continue massaging your throat with their paw fingers, the touch electrifying, changing. Once again you can feel the heat radiating from the place they touch.")
		saynn("Finally, you think they are done, as his paw lowers its position and he pushes you from the back so you lean forward straight into a kiss, as the vulpine is already waiting prepared.")
		saynn("And so you kiss, his mouth opened, gently pushing his tongue into your own mouth. At first it's how you'd expect, but quickly the situation changes, from a regular kiss it becomes something... Different, as Lamia's tongue extends and extends. It becomes longer and explores the entirety of your mouth, at some point it reaches as far as your throat, feeling gag reflexes which dissipate as if on magic command of Lamia.")
		saynn("You realize the kiss is yet another part of the process Lamia wanted you to go through, you accept it and continue kissing the fox, the saliva mingling, you ignore any feeling of fear, disgust or anything in between, right now what matters is sharing this intimate moment with a vulpine.")
		saynn("It's been a minute, or two, hard to tell, time doesn't matter in this place. You stopped feeling the heat radiating in your mouth as it was changing its internal shape, as Lamia said, there was no pain. Both you and Lamia just enjoyed each other in passion.")
		addButton("Continue", "Continue", "speechbye3")

	if state == "speechbye3":
		playAnimation(StageScene.Hug, "idle", {pc="pc", npc="lamiademon"})
		saynn("But it ended, like all things end. Kisses end too. You hug the vulpine and want to thank him for this awesome experience, forgetting what was the purpose of all of this.")
		saynn("[say=pc]Thank you Lamia![/say]")
		saynn("The sound you hear makes you confused and at first terrifies you. Those are not the words you've said, or, they sound so different?")
		saynn("[say=pc]Umm, the quick brown fox jumps over the lazy dog?[/say]")
		saynn("You gasp and block your mouth with your paws hearing yourself, you can't speak like you used to anymore, all that comes from your mouth are just... Animal sounds.")
		saynn("You look at Lamia, terrified, and he just... Pats your head.")
		saynn("[say=pc]Will people still understand me?[/say]")
		saynn("Lamia nods, it seems that even though you've lost your speech, somehow you'll still be understandable by others, you don't know how it works, but that's a relief.")
		addButton("Leave", "Go your way", "endthescene")



func getDevCommentary():
	return ""

func hasDevCommentary():
	return false


func getPlayerDescription() -> String:
	var body_parts = GM.pc.getBodyparts()
	var text = "\n\n{pc.Name} is a "+Util.getSpeciesName(GM.pc.getSpecies())+". They have "+body_parts[BodypartSlot.Head].getName()+" "+body_parts[BodypartSlot.Arms].getName()+" "+body_parts[BodypartSlot.Legs].getName()+"."
	if GM.pc.hasHorns() or GM.pc.hasTail():
		text = text + "\nAdditionally, they come equipped with "
	if GM.pc.hasHorns():
		text = text + body_parts[BodypartSlot.Horns].getName().rstrip("1234567890 ")
	if GM.pc.hasTail():
		text = text + body_parts[BodypartSlot.Tail].getName().rstrip("1234567890 ")
	if Globals.checkIfAchieved("Azazel_Corr_Dream_State", "Got_Molded_By_Azazel"):
		text = text + "SUPER FEATURE: The pet can bear your cubs! They have a breedable {pc.pussyStretch} {pc.vagina} that can be filled with seed, in addition, they've are host to a special Fertility Tattoo making them a perfect breeding bitch just for you!"
	text = text + ".\n\n"
	return text


func _react(_action: String, _args):
	if _action == "speechbye2":
		GM.pc.getSkillsHolder().addSkillExperience("Pet", 1000)
		GM.pc.getSkillsHolder().addPerk("PetSpeech")
		Globals.modifyDictStates("Azazel_Corr_Dream_State", "Lost_Speech", true)

	if _action == "finish":
		Globals.modifyDictStates("Azazel_Corr_Dream_State", "Got_Lamias_Permission", true)

	if _action == "talk":
		Globals.modifyDictStates("Azazel_Corr_Dream_State", "Talked_With_Lamia", true)

	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
