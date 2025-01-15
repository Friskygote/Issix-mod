# Based on BDCC/Scenes/ParadedOnALeashScene.gd

extends "res://Scenes/SceneBase.gd"

const Globals = preload("res://Modules/IssixModule/Globals.gd")

var corner = "hall_ne_corner"
var destination = ""
var destinations = {"yard_vaulthere": "End of Yard"}  # , "mining_shafts_entering": "Mining Shaft", "med_lobbymain": "Medical Lobby"
var custom_scenes = {"yard_vaulthere": {6: "nova_horny"}, "mining_shafts_entering": {}, "med_lobbymain": {}}
var path = []
var pawns_interactions = []
var teleportwhenskipped = true
var stageScene = StageScene.Duo
var goodPoints = 0
var waited = 0
var sat_down = false

func _initScene(_args = []):
	stageScene = StageScene.PuppyDuo if shouldBeInHeavyBondage() else StageScene.Duo
	rollDestination()
	goodPoints = 0
	waited = 0
	sat_down = false

func _init():
	sceneID = "WalkiesTrainingWithIssix"

func _run():
	if(state == ""):
		addCharacter("issix")
		saynn("[say=issix]Hmm, I feel like going to "+destinations[destination]+" today, let's go.[/say]")
		saynn("He looks at Hiisi and tells him he will be out for a while.")

	if state == "nova_horny":
		if pawns_interactions.size() < 2:
			setState("follow")
		else:
			playAnimation(StageScene.SexTrain, "inside", {pc=pawns_interactions[0], npc="nova", npc2=pawns_interactions[1], bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
			if GM.pc.isBlindfolded() and !GM.pc.canHandleBlindness():
				saynn("You are crawling on your fours while walking towards "+destinations[destination]+" while as you continue, both you and your Master become aware and curious about source of some intense sounds. You close in to the sounds, walking forward there is a little bit of free space on the left, you recognize the sounds as... Intense love making. The leash that usually slightly tugs on you becomes much more loose, signifying your Master has stopped, you take a break as well.")
			else:
				saynn("You are crawling on your fours while walking towards "+destinations[destination]+" while as you continue, both you and your Master become aware and curious about source of some intense sounds. You close in to the sounds, walking forward there is a little bit of free space on the left, or rather was - if it wasn't occupied by three creatures very occupied by... Intense love making. Your Master stops in the tracks to take a longer look.")

			saynn("[say=nova]Ahhh, fuck yes![/say]")
			saynn("[say=pawn1]Good fuck.[/say]")
			saynn("[say=pawn2]Arrgghhh.[/say]")

			saynn("") # TODO
			addButton("Continue", "Continue walking", "follow")


	if(state == "" || state == "leashed"):
		if(state == "leashed"):
			playAnimation(stageScene, "crawl", {npc="issix", npcAction="walk", flipNPC=true, bodyState={leashedBy="issix"}})
		if(path.size() > 0):
			aimCameraAndSetLocName(path[0])
		
		var _roomInfo = GM.world.getRoomByID(path[0])
		
		if(_roomInfo == null):
			saynn("You're being walked on a leash by Issix")
		else:
			saynn("You're being walked on a leash by Issix")
			
			if(GM.pc.isBlindfolded() && !GM.pc.canHandleBlindness()):
				saynn(_roomInfo.getBlindDescription())
			else:
				saynn(_roomInfo.getDescription())
				

		addButton("Skip", "Skip the walk (skips all of the potential random small scenes as well!)", "skipwalk")
		addButtonAt(6, "Follow", "Follow the leash", "follow")
		if RNG.chance(2):
			addButtonAt(7, "Check", "You've noticed something nearby, you could investigate but your Master wouldn't like it", "distraction")
		addDisabledButtonAt(10, "Leashed", "Can't escape from the leash")
		addDisabledButtonAt(11, "Leashed", "Can't escape from the leash")
		addDisabledButtonAt(12, "Leashed", "Can't escape from the leash")

	if (state == "skipwalk"):
		aimCamera(destination)
		GM.pc.setLocation(destination)
		
		endScene()

	if state == "yard_vaulthere":
		if GM.pc.isBlindfolded():
			saynn("You can feel a bit more moisty and cold air as you step further. The surface of the path also changes - you recognize that you are likely near your destination. Your Master changes the direction of the walk.")
			saynn("[say=issix]It's a bench in here. Let me take a seat.[/say]")
			saynn("You assume he sits on nearby bench.")

		else:
			saynn("It is here, at the End of Yard, where your Master wanted to take you. Not far from here is pasture, but this place is closer to the greenhouses above. There are a couple of unused courtyards and benches. Your Master leads you to one of them before he sits on it.")

		saynn("[say=issix]Sit, {pc.name}, but not on the bench. Benches are not for pets.[/say]")
		if !sat_down:
			addButton("Sit", "Try to sit next to your Master (bratty)", "sit_yard")
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
			else:
				saynn("With your paws rendered useless, you struggle to get the work credits for yourself. Unfortunately your efforts end at nothing ad the work credit just gets pushed by your rubber mitts. To add to that, your efforts were noticed by your Master and he is unimpressed. Aw.")
		else:
			if RNG.chance(95):
				saynn("You snag and secure the work credit without any issue. Score for {pc.Name}!")
			else:
				saynn("You attempt to snag the work credit but you didn't notice another inmate coming from behind, his leg hits your arm in a fairly painful accident. You don't manage to snag the work token and you have to deal with very unimpressed Master.")






func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if _action == "sit_yard":
		GM.pc.addPain(5)
		goodPoints -= 1
		sat_down = true

	if _action == "return":
		GM.pc.setLocation(corner)
		aimCamera(corner)
		endScene([goodPoints])
		return

	if _action == "wait_yard":
		processTime(5*60)
		waited += 1
	
	if(_action == "follow"):
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
		if path.size() in custom_scenes[destination] and RNG.chance(20):
			_action = custom_scenes[destination][path.size()]
		else:
			setState("leashed")
			return

	if _action == "nova_horny":
		pawns_interactions = pick_unique_one(findPawns([[["isInmate"], []], [["isInmate"], ["hasPenis"]]]))
		if null in pawns_interactions:
			setState("leashed")
			return
	
	setState(_action)

# Verify requirements for pawns TODO TEST
func verifyRequirements(pawn: CharacterPawn, requirements: Array) -> bool:
	for method in requirements[0]:
		pawn.has_method(method)
		if !pawn.call(method):
			return false
	var base_character = pawn.getCharacter()
	for method in requirements[1]:
		base_character.has_method(method)
		if !base_character.call(method):
			return false
	return true

# Find pawns that succeed requirements in list of lists
func findPawns(requirements) -> Array:
	var all_pawns = GM.main.IS.getPawns()
	var results = []
	for pawn_requirement in requirements:
		var meet_criteria = []
		for pawn in all_pawns:
			if !verifyRequirements(all_pawns[pawn], pawn_requirement):
				continue
			meet_criteria.append(pawn)
		results.append(meet_criteria)
	return results

func check_if_string(element):
	return element is String

# Pick a unique random item for each of arrays
func pick_unique_one(input_array: Array) -> Array:
	var sizes_of_arrays = []  # We will need to compare sized of arrays to first process smallest arrays
	var processed_array = input_array.duplicate(true)
	for array in input_array:
		sizes_of_arrays.append(array.size())

	for _item in range(input_array.size()):
		var smallest_array = sizes_of_arrays.min()
		var index = sizes_of_arrays.find(smallest_array)
		for _i in range(smallest_array):
			var pick = input_array.pick_random()
			if pick in processed_array:
				continue
			processed_array[index] = pick
			break
		if processed_array[index] is Array:
			processed_array[index] = null
		sizes_of_arrays[index] = 999999
	return processed_array

func shouldBeInHeavyBondage(): # TODO Skill rebalance
	return GM.pc.getSkillsHolder().getSkill("Pet").getLevel() > 2 or GM.pc.getSkillsHolder().getSkill("Pet").getExperience() > 80

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
	
	return null
