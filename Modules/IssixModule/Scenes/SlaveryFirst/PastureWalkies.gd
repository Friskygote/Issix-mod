extends SceneBase

const Globals = preload("res://Modules/IssixModule/Globals.gd")

var char1 = ""
var char2 = ""
var privates_choice = "ass"
var borrowed_strapon = false

func _init():
	sceneID = "IssixPastureWalk"

# Main loop:
# Player gets to choose from 2 options twice per pasture walk in regards to possible activities
# Options:
# Threesome with Issix, Azazel
# Foursome with Hiisi?
# Chasing ball with other pets
# Getting wet under waterfall
# Pulling tricks on inmates with Azazel
# Learning from Hiisi art of gathering intelligence (on pawns)
# Cooking with Lamia?
# Hide and seek

# Extra:
# Connect with PC finding petplay with elements of mind control to trigger conversation about this with Issix
# Secret under waterfall unlocked from the Computer

var tasks = [["Threesome", "Say you'd like some not-so-private action with Issix and Hiisi", "threesome_issix"],
			 ["Fetch", "Say you'd be up for a game of fetch, like a good puppy you are", "ball_chasing"]]
var chosen_scene = ""

func _run():
	if(state == ""):
		if GM.main.getTime() < 14 * 60 * 60:
			saynn("[say=issix]We are going today, but it's still a bit early for the walkies. Can you come back later dear?[/say]")
		else:
			saynn("[say=pc]Master, when do we go on next walk to the pasture?[/say]")
			saynn("[say=issix]We were actually waiting for you {pc.name}, we are all prepared, if you are ready we can all go.[/say]")
			saynn("You can see that all of Issix's pets are already leashed and packed, waiting to move forward.")
			addButton("Inventory", "Prepare for the walkies to the pasture", "inventory")
			addButton("Ready", "Let's go", "onwards")

		addButton("Later", "Come back later", "endthescene")

	if state == "onwards":
		saynn("[say=pc]I'm ready, Master.[/say]")
		saynn("[say=issix]Splendid.[/say]")
		saynn("Master comes closer to you and clips a leash to your collar. Without any further talk, you all set on the way towards the pasture.")
		addButton("Walk", "Walkies", "walk_pasture")

	# TODO Make sure everyone is naked in all of the scenes
	if state == "walk_pasture":
		playAnimation(StageScene.Duo, "kneel", {npc="issix", npcAction="stand", bodyState={leashedBy="issix"}})
		saynn("[say=issix]This is it, the pasture.[/say]")
		saynn("Master Issix puts his backpack on the grass near the small stream of water, he unclasps leashes from everyone's collar before unpacking blankets. Hiisi helps out with rolling them out on the grass, while Azazel and Lamia have left their bags near Master's and the feline started chasing the fox around, both of them in good moods. Everyone have left their clothes after arrival and so do you.")
		saynn("[say=hiisi]AZAZEL, LAMIA, TRY NOT TO RUN INTO ANYONE.[/say]")
		saynn("You look at screaming Hiisi with quizzical look.")
		saynn("[say=hiisi]What? They've ran into people in the past.[/say]")
		saynn("[say=pc]Oh.[/say]")
		saynn("[say=hiisi]Everyone was fine at the end, but nobody likes being ran into.[/say]")
		saynn("[say=pc]*chuckle* Can imagine.[/say]")
		saynn("[say=issix]What will you two do? Any plans? Should I take something out of the bag?[/say]")
		for item in randomTasks():
			addButton(item[0], item[1], item[2])

	if state == "threesome_issix":
		saynn("[say=pc]I were thinking of something in climate of fun with you Master and Hiisi?[/say]")
		saynn("[say=hiisi]Pass.[/say]")
		saynn("Master laughs.")
		saynn("[say=issix]Don't get discouraged {pc.name}, I'm up for it, perhaps Azazel would be too once he is done with his warmup.[/say]")
		saynn("[say=pc]Works for me![/say]")
		saynn("[say=issix]Great then, lube it is. Hmm, what could we do?[/say]")
		saynn("You look at Master confused.")
		saynn("[say=issix]Well, we could do a nice spit roast or we could play around with sex train.[/say]")
		addDisabledButton("Spitroast", "Choose spitroast (WIP, contributions are welcome)")  # , "spitroast_choice"
		addButton("Sex train", "Choose sex train", "sextrain_choice")

	if state == "sextrain_choice":
		saynn("[say=issix]And in what position would you want to be?[/say]")
		saynn("[say=issix]You can call dibs on getting railed and railing or just getting railed.[/say]")

		addButton("Former", "Say that you'd prefer to be in the middle", "threesome_middle")
		addButton("Latter", "Say that you'd prefer to be at the end, getting railed", "threesome_receiving")
		addButton("Back", "Change decision about the chosen configuration", "threesome_issix")

	if state == "spitroast_choice":
		saynn("[say=issix]And in what position would you want to be?[/say]")
		saynn("[say=issix]You can call dibs on getting fucked from both sides or being the one fucking.[/say]")

		addButton("Former", "Say that you'd prefer to be in the middle", "threesome_middle")
		addButton("Latter", "Say that you'd prefer to be at the end, fucking", "threesome_receiving")
		addButton("Back", "Change decision about the chosen configuration", "threesome_issix")

	if state == "threesome_prepare":
		saynn("[say=issix]Gotcha. Let's wait bit for Azazel and in the meantime we can get some lubricant on us, shall we?[/say]")
		saynn("Master seems to be in a great mood, singing to himself when he takes out a bottle of lube and starts to undress.")
		saynn("[say=issix]Here you have.[/say]")
		saynn("He passes you the lube bottle, you then use a fair amount of it on your bits making sure they shine.")

		saynn("[say=pc]Thank you, Master. Think I'm ready.[/say]")
		saynn("[say=issix]Yes, yes, it seems like Azazel is almost done, so just lay and relax a little. HEY, AZAZEL, CUT IT SHORT WILL YOU?[/say]")
		saynn("Master gives Azazel signal to wrap up his fooling around. Shortly after Azazel and Lamia come back, tired, just for Azazel to get back into doing yet another tiring activity.")
		saynn("[say=issix]{pc.Name} is horny and wanted to fuck, come here and let's play kitten.[/say]")
		saynn("[say=azazel]Meowl! Give me a minute, I need to get a breather.[/say]")

		saynn("Azazel takes a few breathes before lubing his own bits. After a few minutes you all get in positions.")
		addButton("Continue", "Get yourself ready", "threesome_1_"+chosen_scene)

	if state == "threesome_1_SexTrain":
		playAnimation(StageScene.SexTrain, "tease", {pc=char1, npc=char2, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}, npc2="issix", npc2BodyState={naked=true,hard=true}})
		var privates1 = "{pussy}" if GlobalRegistry.getCharacter(char2).hasReachableVagina() else "{ass}"
		#var privates2 = "{pussy}" if GlobalRegistry.getCharacter(char1).hasReachableVagina() else "{ass}"
		saynn("There is one large blanket set out on the grass - Master's blanket, it's picnic sized with enough space for plenty of shenanigans. Both you, Azazel and your Master situate on it while getting in positions.")
		if char2 == "pc":  # pc is at the end of the train
			saynn("You get on your knees, tail raised way above your back so Azazel has easy access to your "+privates1+". You grab your ass cheeks with both paws to allow for easy access to teasing kitty behind you, his moves making this sensual exercise for both of you. You can feel his {azazel.penisOrStrapon} rubbing between your cheeks while you can feel his slick penis stimulating your butt.")
			saynn("He pushes a finger into your "+privates1+" and rubs it in, getting it all slick with the lube you've prepared your hole with earlier.")
			addButton("Present ass", "Lead the kitty towards your ass instead", "threesome_2_SexTrain", ["ass"])
			addButtonWithChecks("Pussy", "Let the kitty ravage your... Kitty", "threesome_2_SexTrain", ["pussy"], [[ButtonChecks.HasReachableVagina]])
		else:
			saynn("You get on your knees, tail going to the side as you can feel Master's hot body on your back, soon hugging you in an embrace, his {issix.penis} rubbing between your cheeks while he whispers in your ear promises of fun. You can feel his slick penis stimulating your butt.")
			saynn("In front of you a horny kitten teasing your {pc.penisOrStrapon}, massaging it wit his slick {azazel.pussyStretch} {azazel.vagina}. Experienced past sex worker makes a quick job of teasing you into submission as you use your paws to position your stick lining it up with his {azazel.vagina}, despite that, Azazel's quick moves prolong your horny wants by moving away from it and continuing to tease it instead.")
			addButton("Anal", "Fuck Azazel's ass instead", "threesome_2_SexTrain", ["ass"])
			addButton("Vaginal", "Fuck kitten's kitten", "threesome_2_SexTrain", ["pussy"])
		saynn("[say=issix]How are you pets? Ready to get this started? Or would you want to tire yourself with foreplay until exhaustion?[/say]")
		saynn("[say=azazel]Noooo, let's starrrttt alreadyyy. I've had an itch for fucking. Plleeasssee.[/say]")
		saynn("Azazel begs for permission to start")
		saynn("[say=pc]I'm ready whenever you are, Master.[/say]")
		saynn("Master chuckles")
		#addButton("Go", "Master feels ready and gives a command to go at it", "threesome_2_SexTrain")

	if state == "threesome_2_SexTrain":
		playAnimation(StageScene.SexTrain, "fast", {pc=char1, npc=char2, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}, npc2="issix", npc2BodyState={naked=true,hard=true}})
		saynn("As Master Issix gives his signal the suddenness of Azazel's and Issix's first thrust caught you off the guard. They both were seemingly very pent up and needed to give in to the lust.")
		if char2 == "pc":
			if privates_choice == "ass":
				saynn("You've steered Azazel's {azazel.penisOrStrapon} towards your ass as he plunges right in. ")
			else:
				saynn("Azazel ")
		else:
			if privates_choice == "ass":
				saynn("You've ")
			else:
				saynn("Azazel ")




func randomTasks():  # TODO If no will, player will have no choice here
	tasks.shuffle()
	return [tasks[0], tasks[1]]


func saveData():
	var data = .saveData()

	data["char1"] = char1
	data["char2"] = char2
	data["borrowedStrapon"] = borrowed_strapon
	data["chosen_scene"] = chosen_scene
	data["privates_choice"] = privates_choice

	return data

func loadData(data):
	.loadData(data)

	char1 = SAVE.loadVar(data, "char1", "")
	char2 = SAVE.loadVar(data, "char2", "")
	borrowed_strapon = SAVE.loadVar(data, "borrowedStrapon", false)
	chosen_scene = SAVE.loadVar(data, "chosen_scene", StageScene.SexTrain)
	privates_choice = SAVE.loadVar(data, "privates_choice", "ass")

func _react(_action: String, _args):
	if _action == "inventory":
		runScene("InventoryScene")
		setState("")

	if _action == "walk_pasture":
		playAnimation(StageScene.Duo, "kneel", {npc="issix", npcAction="stand", bodyState={leashedBy="issix"}})
		runScene("ParadedOnALeashScene", ["issix", GM.pc.getLocation(), "yard_waterfall", [
			"Lamia, please try to keep up",
			"Azazel, watch out, inmate on your right is aboout to reach her climax",
			"Hiisi, stop sniffing every inmate, you are slowing us all down",
			"{pc.name} stay in between Lamia and Hiisi, you fit there perfectly"
		], "yard_waterfall", "crawl"])

	if _action == "sextrain_choice":
		chosen_scene = StageScene.SexTrain

	if _action == "spitroast_choice":
		chosen_scene = StageScene.SexSpitroast

	if _action == "threesome_middle":
		char1 = "pc"
		char2 = "azazel"
		_action = "threesome_prepare"

	if _action == "threesome_receiving":
		char1 = "azazel"
		char2 = "pc"
		_action = "threesome_prepare"

	if _action == "threesome_1_SexTrain":
		# Equip strapon, if no strapon in inventory create Feline strapon and mark borrowed status as True
		var character = GlobalRegistry.getCharacter(char1)
		if !character.HasReachablePenis() and character.canWearStrapon():
			var strapons = character.getStrapons()
			if strapons.empty():
				borrowed_strapon = true
				strapons = [GlobalRegistry.createItem("StraponFeline")]
			character.getInventory().equipItem(RNG.pick(strapons))
			addMessage(character.getName()+" equipped a strapon.")

	if _action == "threesome_2_SexTrain":
		privates_choice = args[0]

	if _action == "threesome_prepare":
		GM.pc.addEffect(StatusEffect.LubedUp, 60*60)

	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
