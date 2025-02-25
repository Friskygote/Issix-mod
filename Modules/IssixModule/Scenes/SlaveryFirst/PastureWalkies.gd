extends SceneBase

const Globals = preload("res://Modules/IssixModule/Globals.gd")

var char1 = ""
var char2 = ""
var privates_choice = "ass"
var borrowed_strapon = false
var tasks := []

func _init():
	sceneID = "IssixPastureWalk"

func _initScene(_args = []):
	finished_activities = []
	tasks = [["Threesome", "Say you'd like some not-so-private action with Issix and Hiisi", "threesome_issix"],
			 ["Fetch", "Say you'd be up for a game of fetch, like a good puppy you are", "ball_chasing"],
			 ["Waterfall", "Check out the waterfall", "waterfall_check"],
			 ["Outhouse", "Investigate the outhouse", "outhouse_thing"],
			 ["Hiisi", "Spend time with Hiisi", "hiisi_time"],
			 ["Lamia", "Spend time with Lamia", "lamia_time"]]
	tasks.shuffle()

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

	if state == "2ndactivity":
		saynn("You are deliberating what to do now.")

		for item in randomTasks():
			addButton(item[0], item[1], item[2])

		if hasAllPerksRequiredForMindfuck() and getModuleFlag("IssixModule", "Mindlessness_Walkies_Status", 0) < 1 and getModuleFlag("IssixModule", "Mindlessness_Day_Start") == null:
			saynn("As you think what to do next, you notice a guard walking out an inmate nearby, what catches your attention is the fact that the canine inmate is led on a leash just like your Master walks you all to the pasture, in addition they walk on their fours. It is still a rather rare sight.")
			saynn("At some point they stop, the pet sits. There is something strange about this couple...")
			addButton("Other pet", "Investigate the couple", "mindless_investigate")

	if state == "mindless_investigate":
		saynn("The pair interested you enough for you to stealthy come closer and try to see why do they feel so strange. The guard is in the regular guard clothing - they have fairly androgynous build and facial features. Their face has a neutral face expression and their posture gives you a very authoritarian vibe. Other than that, there is nothing special about their look, they look like a regular guard. The inmate, on the other hand, is a smaller build anthropomorphic canine, they seem to be naked under large amount of latex bondage gear on them. While the bondage gear seems in fine condition, though there are small signs of use. Judging by the look and smell they are masculine and possess a penis. Their head is turned in direction of the guard's face. Unnervingly the inmate doesn't seem to move a bit. They seem inanimate for all you can see, even their tail lies dead behind.")
		saynn("[sayOther]D-1, rub my back.[/sayOther]")
		saynn("As the androgynous guard said, they lower onto the ground sitting on it with their arms around their legs. The canine immediately gets to work, however their paws are bound in the mittens.")
		saynn("[sayMale]Master, I'm unable to fulfill the task in my current condition, to provide massage I require unrestricted paws.[/sayMale]")
		saynn("The guard sighs, turns around and takes off the bondage mittens off canine's paws, after which they turn around once again and canine begins massaging the guard in circular almost robotic movements. In fact, the moves are so repetitive and mechanical you might as well consider the inmate a robot.")
		saynn("[sayOther]Stop.[/sayOther]")
		saynn("Finally the guard seems satisfied, and as they command the inmate, the inmate immediately stops the massage and moves their arm to stick to the torso. Guard stands up, cleaning their butt and legs with a hand as they begin to move, leash in hand leading the crawling inmate behind.")
		addButton("Woah!", "Your shoulders are grabbed and a sound from behind speaks out", "mindless_investigate2")

	if state == "mindless_investigate2":
		saynn("[say=hiisi]Anything fun? I've seen you've been looking at them for a while.[/say]")
		saynn("[say=pc]Yeah, a strange... Pair. The inmate moved as if they were a robot, and the guard called them, what was it? D-1? Yeah, D-1 I think.[/say]")
		saynn("[say=hiisi]Yup. That was Yuan. They aren't exactly „themselves” anymore.[/say]")
		saynn("[say=pc]Was? Themselves? What do you mean? They changed their name?[/say]")
		saynn("[say=hiisi]Like you are the one to talk.[/say]")
		saynn("Hiisi's lighthearted joke referring to your change of name still sounded incredibly serious coming from him, he couldn't light up when joking even if he wanted.")
		saynn("[say=pc]Ha, ha. No, but seriously, what's up with them?[/say]")
		saynn("[say=hiisi]Apparently Yuan went through some kind of metamorphosis, don't know all of the details, but rumors say that he has became an „ultimate pet” for the guard. Ever since the day it happened they barely leave the guard alone, to their detriment, that particular guard seems pretty sadistic as far as guards go.[/say]")
		saynn("[say=pc]I see, but they aren't a robot, right?[/say]")
		saynn("[say=hiisi]Doubt it, but their mind isn't the same as it was, that's for sure. The creatures closest to Yuan say that he has became „odd” and when they saw the guard give them commands he obeyed them unconditionally, whatever the commands were.[/say]")
		saynn("[say=pc]Curious, ultimate pet huh.[/say]")
		saynn("[say=hiisi]I don't know, it seems creepy as hell. I'd stay away from them if I were you.[/say]")
		saynn("[say=pc]Well, thanks for the info Hiisi, I'll... Be careful. Let's go back.[/say]")
		saynn("You make a mental note of the couple, being interested in the description given by Hiisi. Maybe they could teach you something about being a pet?")
		addButton("Go back", "", "2ndactivity")


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
				saynn("You've steered Azazel's {azazel.penisOrStrapon} towards your ass as he plunges right in. His {azazel.penisOrStrapon} enters it with certain force that comes with suddenness of the action, but thanks to fair amount of lube in your ass as well on the strapon this does not prove an issue. Azazel's paws land on same height as your waist finding grip to control speed at which he wants to bury his rubbery bone inside of you.")
			else:
				saynn("You've steered Azazel's {azazel.penisOrStrapon} towards your {pc.pussy} as he plunges right in. His {azazel.penisOrStrapon} enters it with certain force that comes with suddenness of the action, but thanks to fair amount of lube as well on the strapon this does not prove an issue. Azazel's paws land on same height as your waist finding grip to control speed at which he wants to bury his rubbery bone inside of you.")
		else:
			var privates1 = "{pc.pussy}" if GM.pc.hasReachableVagina() else "{pc.ass}"
			saynn("As you are on your knees Master gives a command and your bottom feels squeezed between two horny beasts. Feelings assault you from both front and back, they aren't unpleasant by any means. Your Master's {issix.penis} accompanied by large amount of lube went right up your "+privates1+" penetrating it, while the move was sudden, Master didn't insert his entire length into your "+privates1+" but rather started entry with half of it, still growing a little as his tool gets stimulated even harder.")
			if privates_choice == "ass":
				saynn("On the other side your {pc.penisOrStrapon} got pushed inside of Azazel's backside by {azazel.him} pushing hard onto you with powerful hips.")
			else:
				saynn("On the other side your {pc.penisOrStrapon} got pushed inside of Azazel's {azazel.pussy} by {azazel.him} pushing hard onto you with powerful hips.")

		saynn("[say=azazel]Mewwwl!!! Ahhhhh. Soo gooood.[/say]")
		saynn("[say=issix]Fuck yeah, what a nice cocksleeve you make {"+char1+".Name}![/say]")
		saynn("With time everyone's moves become more or less rhythmic with occasional changes of pace as one or the other participant chooses to speed up or slow down. Master Issix gives out occasional grunts while Azazel meowls uncontrollably but sweetly in pleasure"+(" as his pussy is being bred by Master's hard {issix.cockSize} {issix.penis}." if char2 == "pc" else "."))
		addButton("Finish", "Finish the threesome", "threesome_3_SexTrain")

	if state == "threesome_3_SexTrain":
		playAnimation(StageScene.SexTrain, "inside", {pc=char1, npc=char2, pcCum=true, cum=true, npcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}, npc2="issix", npc2BodyState={naked=true,hard=true}})
		saynn("After considerable amount of time arousal as well as tiredness begins to run their course and meowls and grunts increasingly take form of gasps.")
		if char2 == "pc":
			if privates_choice == "ass":
				saynn("Azazel for a while now uses the entirety of his tool to ram your backdoor. With your front arms giving their way under repeated motions coming from Azazel, and with arousal buildup from terrific job Azazel has been doing in keeping you stimulated you collapse onto your elbows and climax. Azazel's release comes just moments later as his own {azazel.pussy} leaks profusely of his love juices.")
			else:
				saynn("Azazel for a while now uses the entirety of his tool to ram your wet {pc.pussy}. With your front arms giving their way under repeated motions coming from Azazel, and with arousal buildup from terrific job Azazel has been doing in keeping you stimulated you collapse onto your elbows and climax. Azazel's release comes just moments later as his own {azazel.pussy} leaks profusely of his love juices.")
		else:
			var privates1 = "{pc.pussy}" if GM.pc.hasReachableVagina() else "{pc.ass}"
			if privates_choice == "ass":
				saynn("Your knees start to weaken from exhaustion of being in the center of attention - constantly drained by kitty in front of you and demon in your back. Your arousal from constant attention, well stimulated ass and even better stimulated {pc.penisOrStrapon} raises until it cannot anymore and you give in to the sweet sweet climax."+(" Azazel's pussy drains you of your load, which goes straight into his feline fertile womb. This is exactly what he wanted, since he looks back at you giving you a smirk." if GM.pc.hasReachablePenis() else "Azazel's ass drains you of your load which paints his inside walls with your salty treat. You have the feeling the naughty cat would prefer breeding in the other hole, however he is hardly dissatisfied either considering the mix of pheromones and just how wet the feline is. ")+"On the opposite side, Master Issix reaches his own climax putting his virile load inside of your "+privates1+".")
			else:
				saynn("Your knees start to weaken from exhaustion of being in the center of attention - constantly drained by kitty in front of you and demon in your back. Your arousal from constant attention, well stimulated ass and even better stimulated {pc.penisOrStrapon} raises until it cannot anymore and you give in to the sweet sweet climax."+(" Azazel's pussy drains you of your load, which goes straight into his feline fertile womb. This is exactly what he wanted, since he looks back at you giving you a smirk. " if GM.pc.hasReachablePenis() else "Azazel's ass drains you of your load which paints his inside walls with your salty treat. You have the feeling the naughty cat would prefer breeding in the other hole, however he is hardly dissatisfied either considering the mix of pheromones and just how wet the feline is. ")+"On the opposite side, Master Issix reaches his own climax putting his virile load inside of your "+privates1+".")
			if GM.pc.hasReachableVagina():
				saynn("[say=issix]Fuck yes, take my seed bitch. Give me nice little dragons, will you? Hufff.[/say]")

		saynn("All three of you stay like this for a while, still inside of each other just trying to get a breath.")
		saynn("[say=issix]Round two?[/say]")
		saynn("[say=azazel]Maybe not this time Master, I feel spent.[/say]")
		saynn("[say=issix]Sure, up to you, I need to grab some water anyways.[/say]")
		addButton("Continue", "Continue", "threesome_4_SexTrain")

	if state == "threesome_4_SexTrain":
		saynn("After another minute it's Master who first moves away, stretches giving some pained sounds likely from being in position on knees for so long and goes to his bag to grab a bottle of water.")
		if getModuleFlag("IssixModule", "Azazel_Affection_given", 5) > 40:
			saynn("You and Azazel collapse onto the blanket, your looks wander to the ceiling of the prison facility, his paw finds its way to yours and gently grabs it.")
			saynn("[say=azazel]How did you like today's session?[/say]")
			saynn("[say=pc]Pretty awesome, if I can say so myself.[/say]")
			if char2 == "pc":
				saynn("[say=azazel]Hihi, I think so too! And you made such cute moans while I rammed your pretty "+privates_choice+" with a strapon! Maaan, that was good, we should absolutely do it often.[/say]")  # It's 01:21 AM, honestly I'm pretty sleepy, meanwhile my brain now wants to add romance option with Azazel even though it's not even on my roadmap aaaaaaaaaaaaaaaaa
			else:
				saynn("[say=azazel]Hihi, I think so too! And you made such cute moans while getting rammed into your adorable "+("{pc.pussy}" if GM.pc.hasReachableVagina() else "{pc.ass}")+" by the Master! Your moves were also quite something, I mean, not on level of what I've experienced fooling around with other sex workers, but you are still a pretty decent slut, you know?[/say]")
			saynn("His head tilts to the side as his eyes meet your face, you look at him as well, his head is a bit lower, he notices that and helps with his legs to push himself „higher” so he can be on the same level with your head. He gives you a genuine, warm smile, his eyes closing slightly.")
			saynn("[say=azazel]Your paw is so cute, and {pc.name}... I like you, a lot.[/say]")
			saynn("His face looks a little embarrassed, and his attempt to hid it only makes it more apparent.")
			addDisabledButton("Kiss", "Kiss the feline (not implemented yet)")  # TODO Add plz?
			addButton("Nice", "Be nice with the kitten, but don't give him hopes", "azazel_nice_answer")
			addDisabledButton("Cold", "Give the kitten a cold answer")  # , "azazel_cold_answer"
		else:
			saynn("You and Azazel collapse onto the blanket.")
			saynn("[say=azazel]Was fun, thanks. Huff.[/say]")
			saynn("[say=pc]Same here. Thanks.[/say]")

			saynn("You both walk back on your knees to your respective blankets to rest a bit more before continuing.")
			addButton("Continue", "Continue", "2ndactivity")

	if state == "azazel_nice_answer":
		saynn("[say=pc]Aww, thank you Azazel! I appreciate it, I do like you too just... Not this way.[/say]")
		saynn("His look of embarrassment is still there, though now mixed with sadness.")
		saynn("[say=azazel]I understand, it's okey, didn't really expect anything more anyways. I'm still incredibly happy that you become a pet, you know? Lets me spend time with you.[/say]")
		saynn("[say=pc]Yeah, that's nice. Spending time with you all is worth it.[/say]")
		saynn("[say=azazel]Yeah...[/say]")
		addButton("Continue", "Move away to your blanket in the pasture", "2ndactivity")

	if state == "ball_chasing":



func randomTasks():  # TODO If no will, player will have no choice here
	return [tasks.pop_front(), tasks.pop_front()]

func hasAllPerksRequiredForMindfuck():
	for perk in ["BowlTraining", "Commands", "PetName", "PetSpeech", "PetWalkies", "PetRelocated"]:
		if !GM.pc.hasPerk(perk):
			return false
	return true


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
		processTime(10*60)
		var character = GlobalRegistry.getCharacter(char1)
		if !character.HasReachablePenis() and character.canWearStrapon():
			var strapons = character.getStrapons()
			if strapons.empty():
				borrowed_strapon = true
				strapons = [GlobalRegistry.createItem("StraponFeline")]
			character.getInventory().equipItem(RNG.pick(strapons))
			addMessage(character.getName()+" equipped a strapon.")
		GM.pc.addLust(20)

	if _action == "threesome_3_SexTrain":
		if !char2 == "pc":  # Player is in the middle, bred by Issix
			if (GM.pc.hasReachablePenis() or GM.pc.isWearingLoadedStrapon()):
				if privates_choice == "ass":
					GlobalRegistry.getCharacter("azazel").cummedInAnusBy("pc", FluidSource.Penis if GM.pc.hasReachablePenis() else FluidSource.Strapon)
				else:
					GlobalRegistry.getCharacter("azazel").cummedInVaginaBy("pc", FluidSource.Penis if GM.pc.hasReachablePenis() else FluidSource.Strapon)
			if GM.pc.hasReachableVagina():
				GM.pc.cummedInVaginaBy("issix", FluidSource.Penis)
			else:
				GM.pc.cummedInAnusBy("issix", FluidSource.Penis)
		processTime(20*60)
		GM.pc.addLust(-600)

	if _action == "threesome_issix":
		finished_activities.append(_action)

	if _action == "threesome_2_SexTrain":
		privates_choice = _args[0]
		processTime(30*60)
		GM.pc.addLust(60)

	if _action == "threesome_4_SexTrain":
		# TODO Unequip a strapon
		processTime(10*60)

	if _action == "mindless_investigate2":
		setModuleFlag("IssixModule" ,"Mindlessness_Walkies_Status", 1)

	if _action == "threesome_prepare":
		GM.pc.addEffect(StatusEffect.LubedUp, 60*60)

	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
