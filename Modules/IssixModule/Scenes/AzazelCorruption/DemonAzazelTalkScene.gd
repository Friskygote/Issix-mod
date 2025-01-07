extends SceneBase

const Globals = preload("res://Modules/IssixModule/Globals.gd")

var hadVagina = false

func _init():
	sceneID = "DemonAzazelTalk"

func _run():
	if(state == ""):
		addCharacter("azazeldemon")
		saynn("Azazel sits atop of his small throne chair, not in dignified way, his ass is on its edge and his back bent between chair's support and base, he looks as if he has been bored to death by someone's long monologue. This position means his pussy and ass are on the display.")
		addButton("Talk", "Talk to Azazel", "talk")
		addButton("Appearance", "Check kitty's appearance", "appearance")
		if Globals.checkIfAchieved("Azazel_Corr_Dream_State", "Talked_With_Azazel"):
			if Globals.checkIfAchieved("Azazel_Corr_Dream_State", "Got_Azazels_Permission"):
				addDisabledButton("Better", "There is nothing more to be gained in here, move on")
			else:
				addButton("Better", "Become an ideal Master pet", "better")

	if state == "talk":
		saynn("[say=pc]A-azazel? You look like him though... The colors and the tail...[/say]")
		saynn("[say=azazeldemon]Hehe. Welcome, little „morsel”.[/say]")
		saynn("[say=pc]Are you Azazel? Where, what is this place?[/say]")
		saynn("[say=azazeldemon]Curiosity killed the "+Util.getSpeciesName(GM.pc.getSpecies())+".[/say]")
		saynn("He laughs")
		saynn("[say=azazeldemon]Am I Azazel? Who's to say. What makes Azazel Azazel? Do I check all the boxes?... Probably not. I'm part of Azazel, but I'm not whole.[/say]")
		saynn("[say=pc]What?[/say]")
		saynn("[say=azazeldemon]Doesn't matter. You asked what is this place, don't you recognize it? It's your home.[/say]")
		saynn("[say=pc]My home?[/say]")
		saynn("[say=azazeldemon]Yes, your home. One where you'll spend your entire life. One which you love, don't you?[/say]")
		saynn("[say=pc]But it's a prison cellblock.[/say]")
		saynn("[say=azazeldemon]Wrong. It's a paradise.[/say]")
		saynn("Azazel stands up from his throne. He is still as short as you remember him to be, he approaches you, his finger tracing your body.")
		saynn("[say=azazeldemon]You look like you could be better, more fitted for our Master. Give me a word and I'll make wonders with your body.[/say]")
		saynn("He comes back onto his throne, assuming same position as before.")
		addButton("Continue", "Seems like this conversation is over", "")

	if state == "better":
		saynn("[say=azazeldemon]Lay on your back for me.[/say]")
		saynn("[say=pc]Here? On the floor? It's cold.[/say]")
		saynn("A blanket appears under your {pc.feet}.")
		saynn("[say=azazeldemon]Lay. On. Your. Back.[/say]")
		addButton("Comply", "Lie on your back", "talklay")
		addButton("Refuse", "Do not comply with Azazel's command", "talkrefuse")

	if state == "talkrefuse":
		saynn("[say=azazeldemon]This wasn't a request, it was an order. I'm not the one to instill loyalty into you, but... I think we could do with you being a bit more obedient.[/say]")
		saynn("He approaches you. At first you try ta take a step back but... You can't. His eyes look so beautiful. Purple eyes with such a pretty glow. Azazel puts two of his paw fingers on your forehead.")
		saynn("[say=azazeldemon][corrupt]Azeryūze[/corrupt][/say]")

		saynn("Instantly as he finishes saying the word that you didn't understand, you felt different. You can't say what changed, but it felt significant.")
		saynn("[say=azazeldemon]Lay on the ground for me.[/say]")
		saynn("As he said that, you did. He is AZAZEL.")
		addButton("Comply", "Comply with Azazel's order", "talklay")

	if state == "talklay":
		saynn("You comply with Azazel's order, his purple eyes glowing with intense color making you oblige.")

		saynn("[say=azazeldemon]Good "+Globals.getPlayerPetName()+".[/say]")
		if GM.pc.hasPenis():
			saynn("[say=azazeldemon]Master doesn't need more pets with this thing.[/say]")
			saynn("He moves his hoof over your {pc.penis}, moving it around, pressing it. You feel hotness coming from his hoof.")
			if GM.pc.hasVagina():
				saynn("[say=azazeldemon]He needs more breeders, not those shitty flesh extensions. You already have what he wants, anything extra is unnecessary.[/say]")
			else:
				saynn("[say=azazeldemon]He needs more breeders, not those shitty flesh extensions. Only way to extend his blood line.[/say]")
		if !GM.pc.hasPenis() and !GM.pc.hasVagina():
			saynn("[say=azazeldemon]You have nothing there. This cannot be. Master needs breeders, you are useless like that.[/say]")
		if GM.pc.hasVagina() and !GM.pc.hasPenis():
			saynn("He smiles while he looks at you. Next, he says purring.")
			saynn("[say=azazeldemon]You'll be perfect for the Master. A breedable fuck pet, just as you should be.[/say]")

			saynn("[say=azazeldemon]But you are missing a few things...[/say]")
			addButton("Continue", "See what Azazel has in store for you", "azazeltattoo")
		else:
			saynn("[say=azazeldemon]I'll remold you into Master's fuck pet. I'll make you actually useful.[/say]")
			saynn("He kneels next to your laying body and moves his paws around your "+("penis" if GM.hasPenis() else "crotch area")+ ". You can feel small tingling near that area.")
			addButton("Allow", "Allow Azazel to do whatever he intends to do to you (non-permanent body modification)", "allowbodymod")
			addButton("Resist", "Call the rest of your mental fortitude to resist Azazel's spell", "denybodymod")

	if state == "allowbodymod":
		if GM.pc.hasPenis():
			saynn("You allow Azazel to do whatever he wants. Shortly after you feel even more heat concentrated on your {pc.penis} as well as arousal to level you've never felt. Your {pc.penis} gets instantly hard.")
			saynn("[say=pc]Aahhhh![/say]")
			saynn("You moan out.")
			saynn("[say=azazeldemon]Perfect. You just need to cum now my little lamb, cum. It will free you from the little masculinity you have left there. You won't need it where you are going. All you need is to be a nice little breedable "+Globals.getPlayerPetName()+" for our strong and virile Master, okey? So just let it go.[/say]")
			saynn("Words of the demon feline continue to affect you, feeling like honey, smooth and full of reason. That's the only thing that matters right now, is to do what he says and be a better vessel for Master's children. To be his broodmother, to leave being a stud behind and embrace a new you. Azazel massages your hard {pc.penis} as you approach your breaking point.")
			addButton("Cum", "Give in, cum", "cumafterpenis")
		else:
			saynn("You allow Azazel to do whatever he wants. Shortly after you feel even more heat concentrated on your crotch, feelings you've never felt there before, arousal climbing to level you've never felt.")
			saynn("[say=pc]Aahhhh![/say]")
			saynn("You moan out.")
			saynn("[say=azazeldemon]Perfect. You are coming out wonderfully, embrace the feeling. It will give in to something completely new, something that our Master will love. All you need is to be a nice little breedable "+Globals.getPlayerPetName()+" for our strong and virile Master, okey? So just let this do its work and become his breeding stock.[/say]")
			saynn("Words of the demon feline continue to affect you, feeling like honey, smooth and full of reason. That's the only thing that matters right now, is to do what he says and be a better vessel for Master's children. To be his broodmother, to embrace a new you. Azazel massages your crotch as you approach your breaking point.")

			saynn("Eventually you reach your breaking point and feeling of Azazel's paw fingers on your crotch shifts into completely new feeling of him sinking his paw fingers [i]into[/i] you. The completely new feeling of being filled it's... Euphoric.")
			saynn("[say=azazeldemon]Good. Good. You are almost perfect now, we just need a finishing touch and you'll be ready.[/say]")
			saynn("Your hands reach to your new sex and start fingering it, you can't resist testing the new feeling, exploring something so completely different and so good.")
			addButton("Continue", "Continue to finger yourself", "azazeltattoo")

	if state == "cumafterpenis":
		if hadVagina:
			saynn("You reach your peak and start cumming. It's probably your most „productive” milking in your life, and from the looks of it, it's also the last one. You look as your throbbing nugget of a penis reclines into your body leaving only your other sex for use, sealing your fate as Master's breeding bitch.")

			saynn("[say=azazeldemon]Wonderful job, life is better without that pesky sack of flesh. You can enjoy your life with just pussy, that's all you'll ever need. Now, there is still a few more things to do here before I can let you go.[/say]")
		else:
			saynn("You reach your peak and start cumming. It's probably your most „productive” milking in your life, and from the looks of it, it's also the last one. You look as your throbbing nugget of a penis reclines into your body and a new body part appears. It's small, but you have no issues recognizing what is your new sex.")
			saynn("[say=azazeldemon]Feels good, doesn't it? Life is better without that pesky sack of flesh. You can enjoy your life with just pussy, that's all you'll ever need. Now, there is still a few more things to do here before I can let you go.[/say]")
			saynn("Your hands reach to your new sex and start fingering it, the completely new feeling of being filled is so overwhelmingly good, you feel like you've been missing out your entire life! You can't resist testing the new feeling, exploring something so completely different and so good.")
		addButton("Continue", "Continue to finger yourself", "azazeltattoo")

	if state == "denybodymod":
		saynn("[say=pc]I don't know what you are plotting, but I don't want you to do anything to me![/say]")
		saynn("[say=azazeldemon]Your role is to obey, you will let me do what I want, now...[/say]")
		saynn("He continues touching you and while you do get more aroused by him stimulating your crotch, not much happens besides that. He is concentrating... Something, but that's about it.")
		saynn("[say=azazeldemon]Ughhh. Fine, you are too stubborn. Have it your way. I can't remold you like this. Mph![/say]")

		saynn("[say=pc]Am I free to go now?[/say]")
		saynn("[say=azazeldemon]Sure, whatever. See you later, can't wait to see how the collar fits you.[/say]")
		saynn("Collar! You realize that you don't have any! Are you... Free? How did it happen? Why does Azazel look like this, and what did he mean by being „part of Azazel”? You think as the sulking demon cat came back to sit on his chair, avoiding eye contact with you, clearly annoyed by your response.")
		saynn("[say=pc]T-thanks. I'll go.[/say]")
		addButton("Leave", "Leave", "endthescene")

	if state == "azazeltattoo":
		saynn("[say=azazeldemon]A good breeder must be ready for everything. A good breeder should be appropriately marked and be available at Master's command. I want to make you a perfect breeder, a perfect toy for the Master to break.[/say]")
		saynn("His paw finger once again hovers over you, this time it's above your {pc.vagina}. Once again, immense heat radiates from where Azazel's paw is, you look at this scene with bewilderment as a new something appears there - a womb tatoo, with each second the lines continue to appear permanenting the sigil inside your skin, the red heart inside takes shape, the dark red shape streaches with tubes connecting the central heart with ovaries - signifying your fertility and advertising yourself as breeding partner. Azazel's mischievous smile appears on his face, he runs his finger over your new tattoo, it feels so good.")
		saynn("[say=azazeldemon]This will keep you in service, it will keep you docile, receptive, it will show everyone who you are. When you are pregnant, it will glow. You will be a good mother {pc.girl}.[/say]")

		saynn("[say=azazeldemon]Now go, I'll see you soon.[/say]")
		addButton("Leave", "Stand up, leave, probably masturbate a little too", "endthescene")


func getDevCommentary():
	return ""

func hasDevCommentary():
	return false

func saveData():
	var data = .saveData()

	data["hadvag"] = hadVagina

	return data

func loadData(data):
	.loadData(data)

	hadVagina = SAVE.loadVar(data, "hadvag", false)


func _react(_action: String, _args):
	if _action == "talklay":
		Globals.modifyDictStates("Azazel_Corr_Dream_State", "Got_Molded_By_Azazel", true)

	if _action == "azazeltattoo":
		GM.pc.addEffect(StatusEffect.TaviWombMark)
		GM.pc.forceIntoHeat()

	if _action == "cumafterpenis":
		GlobalRegistry.getCharacter("azazeldemon").cummedOnBy("pc", FluidSource.Penis, 1.2)
		GM.pc.cummedOnBy("pc", FluidSource.Penis, 0.3)
		# Bye bye
		GM.pc.removeBodypart(BodypartSlot.Penis)
		if !GM.pc.hasVagina():
			var vagina = GlobalRegistry.createBodypart("vagina")
			GM.pc.giveBodypartUnlessSame(vagina)
		else:
			hadVagina = true

	if _action == "allowbodymod":
		if GM.pc.hasPenis():
			var penis = GM.pc.getBodypart(BodypartSlot.Penis)
			penis.applyAttribute("cocksize", penis.getLength()*0.25)
			penis.applyAttribute("ballsscale", 0.3)
		else:
			var vagina = GlobalRegistry.createBodypart("vagina")
			GM.pc.giveBodypartUnlessSame(vagina)

	if _action == "better":
		Globals.modifyDictStates("Azazel_Corr_Dream_State", "Got_Azazels_Permission", true)

	if _action == "talk":
		Globals.modifyDictStates("Azazel_Corr_Dream_State", "Talked_With_Azazel", true)

	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
