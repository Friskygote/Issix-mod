# Based on BDCC/Scenes/ParadedOnALeashScene.gd
# I made it a total mess

extends "res://Scenes/SceneBase.gd"

const Globals = preload("res://Modules/IssixModule/Globals.gd")

var corner = "hall_ne_corner"
var destination = ""
var destinations = {"yard_vaulthere": "End of Yard"}  # , "mining_shafts_entering": "Mining Shaft", "med_lobbymain": "Medical Lobby"
var custom_scenes = {"yard_vaulthere": {6: "nova_horny"}, "mining_shafts_entering": {}, "med_lobbymain": {}}
var path = []
var pawns_interactions = []
var teleportwhenskipped = true
var goodPoints = 0
var waited = 0
var sat_down = false
var pace = 0
var distraction_happened = false

func _initScene(_args = []):
	rollDestination()
	goodPoints = 0
	waited = 0
	sat_down = false
	distraction_happened = false

func _init():
	sceneID = "WalkiesTrainingWithIssix"

func _run():
	if(state == ""):
		addCharacter("issix")
		saynn("[say=issix]Hmm, I feel like going to "+destinations[destination]+" today, let's go.[/say]")
		saynn("He looks at Hiisi and tells him he will be out for a while.")

	if state == "nova_horny":
		addCharacter("nova")
		addCharacter(pawns_interactions[0])
		addCharacter(pawns_interactions[1])
		if pawns_interactions.size() < 2:
			setState("follow")
		else:
			playAnimation(StageScene.SexTrain, "sex", {pc="nova", npc=pawns_interactions[0], npc2=pawns_interactions[1], bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}, npc2BodyState={naked=true, hard=true}})
			if GM.pc.isBlindfolded() and !GM.pc.canHandleBlindness():
				saynn("You are crawling on your fours while walking towards "+destinations[destination]+" while as you continue, both you and your Master become aware and curious about source of some intense sounds. You close in to the sounds, walking forward there is a little bit of free space on the left, you recognize the sounds as... Intense love making. The leash that usually slightly tugs on you becomes much more loose, signifying your Master has stopped, you take a break as well.")
			else:
				saynn("You are crawling on your fours while walking towards "+destinations[destination]+" while as you continue, both you and your Master become aware and curious about source of some intense sounds. You close in to the sounds, walking forward there is a little bit of free space on the left, or rather was - if it wasn't occupied by three creatures very occupied by... Intense love making. Your Master stops in the tracks to take a longer look.")

			saynn("[say=nova]Ahhh, fuck yes![/say]")
			saynn("[say=pawn1]Good fuck.[/say]")
			saynn("[say=pawn2]Arrgghhh.[/say]")

			saynn("[say=issix]Always knew Nova was a horny slut, but rarely I see them going at it with other inmates, they are usually more... Seclusive. Anyways, we should continue. Let's go.[/say]")

			addButton("Continue", "Continue walking", "follow")

	if state == "irritatingguard":
		addCharacter(pawns_interactions[0])
		if GM.pc.hasTail():
			saynn("You continue walking happily behind your Master, however for the second time a guard behind you is steps on your tail. It's fairly painful each time they do this. You could try to do something about it...")
		else:
			saynn("You continue walking happily behind your Master, however for the second time a guard behind you is steps on your {pc.toes}. It's fairly painful each time they do this. You could try to do something about this...")
		addButtonWithChecks("Bite", "Bite the guard", "biteguard", [], [[ButtonChecks.NotOralBlocked]])
		addButton("Tug leash", "You could tug on leash to get Master's attention...", "tugmaster")
		addButton("Ignore", "Ignore the guard", "follow")

	if state == "biteguard":
		addCharacter(pawns_interactions[0])
		saynn("You decide to bite the guard, they are clearly doing it on purpose considering their wide grin and how they look at you.")
		saynn("[say=pc]*chomp*[/say]")
		saynn("[say=pawn1]YOU MOTHERFUCKER![/say]")
		saynn("Your Master looks behind to see the commotion, {pawn1.name} is looking pissed off, it turns out that even with guard uniform their legs are still quite open to bite attacks... {pawn1.He} jumps on {pawn1.his} one leg while the other one (the one you bit) is in their paws.")
		saynn("[say=pawn1]Your pet BIT ME![/say]")
		saynn("Master stares at you as if he demanded an explanation.")
		if GM.pc.hasTail():
			saynn("You curl your tail with its tip close to your mouth and whine.")
		else:
			saynn("You whine while trying to point your Master at your hinder {pc.toes}.")

		saynn("Your Master's look relaxes and he looks back at the guard.")

		saynn("[say=issix]Trust me, you are lucky it was {pc.him} who bit you.[/say]")
		saynn("As if nothing else your Master looks forwards and without any further explanation continues walking, you behind him. The guard is still recoiling in pain from your bite as they stare angrily at you both, justice served?")
		addButton("Follow", "Continue walking", "follow")

	if state == "tugmaster":
		addCharacter(pawns_interactions[0])
		saynn("You tug on your Master's leash in a pattern, he recognizes that you need his attention stops and looks at you, the guard from behind you continues walking, passing you on your left.")
		if GM.pc.hasTail():
			saynn("You show your Master your tail and try to point at the guard who was just behind you. Your Master looks confused for a moment though he quickly realizes what you are trying to signify.")
		else:
			saynn("You show your Master your {pc.toes} and try to point at the guard who was just behind you. Your Master looks confused for a moment though he quickly realizes what you are trying to signify.")
		saynn("[say=issix]Let's get them.[/say]")

		saynn("Master looks forward, both of you speed up the walk until you catch up to {pawn1.name}.")
		saynn("[say=issix]Excuse me, were you the one who assaulted my pet?[/say]")
		saynn("[say=pawn1]Assaulted? The fuck you are talking about inmate?[/say]")
		saynn("Issix closes in to them and moves his head to guard's ear, whispering something to {pawn1.him}. {pawn1.His} face expression changes immediately as {pawn1.he} apologizes both to your Master as well as you while fleeing the place in embarrassment.")
		saynn("[say=issix]Thank you for the mention. {pawn1.he} should treat you with respect you deserve from now on.[/say]")
		saynn("You wonder what Issix whispered to that guard to get that kind of effect. It must have been something really personal considering their reaction. Either way, the situation seems to be handled now.")
		addButton("Follow", "Continue walking", "follow")


	if(state == "" || state == "leashed"):
		clearCharacter()
		addCharacter("issix")
		if(state == "leashed"):
			showAppropriateScene()
		if(path.size() > 0):
			aimCameraAndSetLocName(path[0])
		
		var _roomInfo = GM.world.getRoomByID(path[0])
		
		if(_roomInfo == null):
			saynn("You're being walked on a leash by Issix")
		else:
			saynn("You're being walked on a leash by Issix")

			if pace < 0:
				saynn("[color=#ff5500]Your Master slows down and you can feel the leash getting looser, if you keep walking you will walk into your Master![/color]")
			elif pace > 0:
				saynn("[color=#ff5500]Your Master speeds up and you can feel the leash pulling you forward, if you don't keep up the pace you will slow down your Master![/color]")
			
			if(GM.pc.isBlindfolded() && !GM.pc.canHandleBlindness()):
				saynn(_roomInfo.getBlindDescription())
			else:
				saynn(_roomInfo.getDescription())
				

		addButton("Skip", "Skip the walk (skips all of the potential random small scenes as well!)", "skipwalk")
		addButtonAt(6, "Follow", "Follow the leash at regular speed", "follow")
		addButtonAt(7, "Faster", "Follow the leash a little bit faster", "followfast")
		addButtonAt(8, "Slower", "Follow the leash a little bit slower", "followslow")
		if RNG.chance(2) and distraction_happened == false:
			addButtonAt(9, "Check", "You've noticed something nearby, you could investigate but your Master wouldn't like it", "distraction")
		addDisabledButtonAt(10, "Leashed", "Can't escape from the leash")
		addDisabledButtonAt(11, "Leashed", "Can't escape from the leash")
		addDisabledButtonAt(12, "Leashed", "Can't escape from the leash")

	if state == "yard_vaulthere":
		if GM.pc.isBlindfolded():
			saynn("You can feel a bit more moisty and cold air as you step further. The surface of the path also changes - you recognize that you are likely near your destination. Your Master changes the direction of the walk.")
			saynn("[say=issix]It's a bench in here. Let me take a seat.[/say]")
			saynn("You assume he sits on nearby bench.")

		else:
			saynn("It is here, at the End of Yard, where your Master wanted to take you. Not far from here is pasture, but this place is closer to the greenhouses above. There are a couple of unused courtyards and benches. Your Master leads you to one of them before he sits on it.")

		saynn("[say=issix]Sit, {pc.name}, but not on the bench. Benches are not for pets.[/say]")
		if !sat_down:
			Globals.addButtonCheckNoncon("Sit", "Try to sit next to your Master (bratty)", "sit_yard")
		else:
			addDisabledButton("Sit", "You can't do that again")
		addButton("Wait", "Wait next to the bench", "wait_yard")

	if state == "sit_yard":
		if shouldBeInHeavyBondage() or GM.pc.hasBlockedHands():
			saynn("You attempt to sit next to your Master, on the bench - like a person would, quickly realizing that doing so is quite difficult in your predicament. Seeing your attempts you get scolded by your Master and smacked lightly on your side.")
			saynn("[say=issix]Bad "+Globals.getPlayerPetName()+"! Told you not to do that.[/say]")
		else:
			saynn("You stand up and sit next to your Master, on the bench - like a person would. Your Master is not amused.")
			saynn("[say=issix]Bad "+Globals.getPlayerPetName()+"! Told you not to do that.[/say]")
			saynn("You got smacked on your side hard enough to be back on your fours on the ground. You've been a bad pet.")
		addButton("Continue", "Continue", "yard_vaulthere")

	if state == "wait_yard":
		saynn("You patiently await near your Master. Leash swinging with slightest movements of your Master's paw and your neck. You use the time to observe the environment. Inmates, guards, environment. It's not difficult for you to see that the railing connecting the greenhouses in here isn't too high and you can jump off it if you'd want. Though getting onto them from here would be a harder task.")
		if waited > 4:
			saynn("Your Master moves, it's your signal you should be coming back.")
			addDisabledButton("Wait", "Master is moving, it's time to go")
			addButton("Crawl", "Crawl behind your Master back", "return")
		else:
			addButton("Wait", "Wait next to the bench", "wait_yard")

	if state == "distraction1":
		saynn("Two inmates nearby are fighting with each other. as they fight, from a pocket of one of them a physical work credit dropped, they didn't notice it. It's lose enough for you to be able to swipe it, you risk getting notice by your Master but... It feels worth it.")
		if GM.pc.hasBlockedHands():
			if RNG.chance(clamp(GM.pc.getStat(Stat.Agility), 0, 50)):
				saynn("Despite the fact that your paws were rendered truthfully useless by the bondage mittens, your skill had helped you to pocket the work credit for yourself. You are quite proud of yourself. Your Master? Not so much. You got noticed as you were doing that and your Master is unimpressed. Aw.")
				distractionSuccess()
				distractionFailure()
			else:
				saynn("With your paws rendered useless, you struggle to get the work credits for yourself. Unfortunately your efforts end at nothing ad the work credit just gets pushed by your rubber mitts. To add to that, your efforts were noticed by your Master and he is unimpressed. Aw.")
				distractionFailure()
		else:
			if RNG.chance(95):
				saynn("You snag and secure the work credit without any issue. Score for {pc.Name}!")
				distractionSuccess()
			else:
				saynn("You attempt to snag the work credit but you didn't notice another inmate coming from behind, his leg hits your arm in a fairly painful accident. You don't manage to snag the work token and you have to deal with very unimpressed Master.")
				distractionFailure()
		addButton("Continue", "Continue", "follow")

	if state == "distraction1":
		saynn("Risking bringing ire of Master on yourself, you choose to investigate the repeating sounds you don't recognize and only make you curious. You run off making your Master release the leash he held by being caught off guard.")
		if GM.pc.isBlindfolded():
			saynn("After running 15 meters relying on just your hearing you arrive somewhere and hit your head on metal grate. The noises definitely come from the inside.")
		else:
			saynn("After running 15 meters you arrive near a ventilator shaft behind the metal grate, the noises definitely come from behind it.")
		saynn("Master Issix stands behind you frustrated, picking up the leash from the ground.")
		if Globals.checkIfAchieved("Walkies_Distractions_State", "Issix_Seen_Distraction1"):
			saynn("[say=issix]Eh, you need to stop doing this sometime, pets gonna pet... Yes, I get it, I'll check it out.[/say]")
			addButton("Continue", "Master descends again...", "distraction1_success_repeat")
		else:
			# I do not like currently implementation of this, player doesn't know why given option is correct, this should be cleared up in the future TODO
			saynn("[say=issix]What on earth are you doing?[/say]")
			saynn("To make Master think this is worth investigating you'll likely have to do some convincing, but how?")
			addButton("Claw", "Bang your paws on the metal grate", "distraction1_fail_convince")
			addButton("Whine", "Start whining at your Master to show something is wrong", "distraction1_success_convince")
			addButton("Jump", "Jump around like crazy to show that something is not okey", "distraction1_fail_convince")
			addButtonWithChecks("Scream", "Start screaming at the metal grate", "distraction1_fail_convince", [], [[ButtonChecks.NotGagged]])
			addButtonWithChecks("Talk", "Talk to your Master in regular speech", "distraction1_fail_convince", [], [[ButtonChecks.NotGagged]])
			addButtonWithChecks("Eyes", "Make puppy eyes?", "distraction1_fail_convince", [], [[ButtonChecks.NotBlindfolded]])
			addButtonWithChecks("Chew", "Try to chew on the metal grate", "distraction1_fail_convince", [], [[ButtonChecks.NotOralBlocked]])
			addButtonWithChecks("Try open", "Try to open the metal grate and see what's behind", "distraction1_fail_convince", [], [[ButtonChecks.NotHandsBlocked]])
			addButton("Follow", "Ignore the thing and follow Master again", "follow")
		
	if state == "distraction1_fail_convince":
		saynn("[say=issix]No, bad "+Globals.getPlayerPetName()+"! That's not what a good pet does. With me, now![/say]")
		saynn("You get a forceful pull of a leash dragging you away.")
		addButton("Follow", "Ignore the thing and follow Master again", "follow")
		
	if state == "distraction1_success_convince":
		saynn("You whine at Master, he is still angry but seems like there is some attempt to understand you. He tries to analyze you looking at you quizzically, it just need to bring your point home now...")
		addButton("Claw", "Bang your paws on the metal grate", "distraction1_success_convince_claw")
		addDisabledButton("Whine", "You've already done this")
		addButton("Jump", "Jump around like crazy to show that something is not okey", "distraction1_fail_convince")
		addButtonWithChecks("Scream", "Start screaming at the metal grate", "distraction1_fail_convince", [], [[ButtonChecks.NotGagged]])
		addButtonWithChecks("Talk", "Talk to your Master in regular speech", "distraction1_fail_convince", [], [[ButtonChecks.NotGagged]])
		addButtonWithChecks("Eyes", "Make puppy eyes?", "distraction1_fail_convince", [], [[ButtonChecks.NotBlindfolded]])
		addButtonWithChecks("Chew", "Try to chew on the metal grate", "distraction1_success_convince_chew", [], [[ButtonChecks.NotOralBlocked]])
		addButtonWithChecks("Try open", "Try to open the metal grate and see what's behind", "distraction1_fail_convince", [], [[ButtonChecks.NotHandsBlocked]])
		addButton("Follow", "Ignore the thing and follow Master again", "follow")
		
	if state in ["distraction1_success_convince_claw", "distraction1_success_convince_chew"]:
		if state == "distraction1_success_convince_chew":
			saynn("You start chewing on the metal grate, it's a hard metal that can easily break the best of fangs, but you think that putting teeth on it should be good enough to bring attention to what you want, and it works.")
		else:
			saynn("You start clawing at the metal grate, it's a hard metal and you are just making more noise and commotion around, but you think it should be good enough to bring attention to what you want, and it works.")
		
		saynn("[say=issix]Hmm, you say something is wrong behind there? Let me take a look.[/say]")
		saynn("Issix approaches the metal grate, kneels and moves his ear to it. The repeating, strange sound continues.")
		saynn("[say=issix]That's... Not good. Stay here, pet. Do not dare to go after me, I'll be back in 5 minutes, if that's not the case go immediately to Hiisi and tell hime what happened.[/say]")
		saynn("He leashes you to the nearby handrail, unlocks metal grate in some magic way that you don't fully understand and fits within tight confines of metal rectangular corridor with ladder on its side coming down. You count the time as he is in there, first minute, the sound muffled a little bit, third minute the repeating coming from the metal shaft ceases. After 5 minutes since Master descended you still don't see him and you begin to think about leaving, which you realize would require yourself to untie your leash from the handrail, as you start formulating a plan you hear thuds coming from the shaft, hoping it's Master coming back you await him.")
		saynn("After another minute a figure of your Master reappears, he crawls out of the metal shaft, dusting his clothes and closing the metal grate. His appearance is mildly unsettled but putting on a tough demeanor worthy of your Master. He doesn't elaborate what happened or what he did there.")
		saynn("[say=issix]Okey, let's go.[/say]")
		saynn("And so he unties your leash and begins to walk you again. What the hell was that?")
		addButton("Continue", "Follow Master", "follow")
		
	if state == "distraction1_success_repeat":
		saynn("Your Master does exactly what you saw the last time - they unscrew the metal grate, put it aside and descent below, coming back 5 minutes after. Never saying anything more about what they are doing and how they make the sound stop. And even though they seem frustrated by entire ordeal, it does seem they appreciate you bringing their attention to it.")
		saynn("[say=issix]... Thank you pet, let's go.[/say]")
		addButton("Continue", "Follow Master", "follow")
		

func showAppropriateScene():
	if shouldBeInHeavyBondage():
		playAnimation(StageScene.PuppyDuo, "walk", {pc="issix", npc="pc", npcAction="crawl", flipNPC=true, npcBodyState={naked=true, leashedBy="issix"}})
		# TODO I'm aware this scene is wrong, PuppyDuo stage scene is limited and I'm yet to find a good solution
	else:
		playAnimation(StageScene.Duo, "crawl", {npc="issix", npcAction="walk", flipNPC=true, bodyState={leashedBy="issix"}})

func distractionSuccess():
	GM.pc.addCredits(2)
	addMessage("You obtained 2 work credits")

func distractionFailure():
	goodPoints -= 1

func checkSpeed(state):
	if state == "followfast":
		pace -= 1
	if state == "followslow":
		pace += 1
	if state != "follow":
		if pace == 0:
			goodPoints += 2
			addMessage("Your pace started matching your Master's.")
	if pace < 0:
		addMessage("You have bumped into your Master and earned an earful about watching your pace!")
		goodPoints -= 1
		pace = 0
	elif pace > 0:
		addMessage("Master's pace caught up with you until you were dragged on your leash, Master orders you to keep up.")
		goodPoints -= 1
		pace = 0


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if _action == "sit_yard":
		GM.pc.addPain(5)
		goodPoints -= 1
		sat_down = true

	if _action == "disctraction_fail_convince":
		goodPoints -= 2

	if _action == "distraction":  # TODO: Add more distractions
		_action = "distraction1"
		distraction_happened = true
	
	if _action == "distraction1_success_repeat":
		goodPoints += 6
		
	if _action in ["distraction1_success_convince_chew", "distraction1_success_convince_claw"]:
		processTime(7*60)
		Globals.modifyDictStates("Walkies_Distractions_State", "Issix_Seen_Distraction1", true)

	if _action == "tugmaster":
		goodPoints += 2

	if _action == "return":
		GM.pc.setLocation(corner)
		aimCamera(corner)
		endScene([goodPoints])
		return

	if _action == "wait_yard":
		processTime(5*60)
		waited += 1
	
	if(_action in ["follow", "followfast", "followslow"]):
		if(path.size() == 0):
			setState(destination)
			return
		
		var nextLoc = path.pop_front()
		
		if(!GM.world.hasRoomID(nextLoc)):
			endScene()
			return
		
		GM.pc.setLocation(nextLoc)
		if(path.size() == 0):
			setState(destination)
			return
		if path.size() in custom_scenes[destination] and RNG.chance(25):
			_action = custom_scenes[destination][path.size()]
			pace = 0
		elif RNG.chance(1):
			_action = "irritatingguard"
		else:
			checkSpeed(_action)
			if RNG.chance(20):
				pace += RNG.pick([-1, 1])
			setState("leashed")
			return

	if _action == "nova_horny":
		pawns_interactions = Globals.pick_unique_one(Globals.findPawns([[["isInmate"], []], [["isInmate"], ["hasPenis"]]]))
		if null in pawns_interactions:
			setState("leashed")
			return

	if _action == "irritatingguard":
		pawns_interactions = Globals.pick_unique_one(Globals.findPawns([[["isGuard"], []]]))
		if null in pawns_interactions:
			setState("leashed")
			return
		GM.pc.addPain(10)

	if _action == "skipwalk":
		aimCamera(destination)
		GM.pc.setLocation(destination)
		_action = destination
	
	setState(_action)



func shouldBeInHeavyBondage():
	return GM.pc.getSkillsHolder().getSkill("Pet").getLevel() > 3

func rollDestination():
	destination = RNG.pick(destinations.keys())

	path = GM.world.calculatePath(corner, destination)
	if(path.size() <= 0):
		endScene()

func resolveCustomCharacterName(_charID):
	if _charID.begins_with("pawn"):
		return pawns_interactions[int(_charID[-1])-1]

	return null

func saveData():
	var data = .saveData()
	
	data["endLocation"] = destination
	data["path"] = path
	data["teleportwhenskipped"] = teleportwhenskipped
	data["goodPoints"] = goodPoints
	data["pawnsInteractions"] = pawns_interactions
	data["waited"] = waited
	data["sat"] = sat_down
	data["pace"] = pace
	data["distraction_happened"] = distraction_happened

	return data
	
func loadData(data):
	.loadData(data)
	
	destination = SAVE.loadVar(data, "endLocation", "")
	path = SAVE.loadVar(data, "path", [])
	teleportwhenskipped = SAVE.loadVar(data, "teleportwhenskipped", true)
	goodPoints = SAVE.loadVar(data, "goodPoints", 0)
	pawns_interactions = SAVE.loadVar(data, "pawnsInteractions", [])
	waited = SAVE.loadVar(data, "waited", 0)
	sat_down = SAVE.loadVar(data, "sat_down", false)
	pace = SAVE.loadVar(data, "pace", 0)
	distraction_happened = SAVE.loadVar(data, "distraction_happened", false)
	
	return null
