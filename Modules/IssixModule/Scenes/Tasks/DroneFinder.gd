extends SceneBase

func _init():
	sceneID = "DroneFlightTask"

var missing_items = ["Syndicate flier", "a black and white striped keyring", "notebook", "floral pin", "a pair of slimy panties", "a space pirate flag", "a rubber rat squishy toy", "a book titled „Introduction to sex 101”", "a very squeezable plushie of an Intergalactic Squid", "fake boobs", "naga necklace", "a mechanical cube", "yoga mat", "a pizza cutter", "a magnifying glass", "a remote", "pair of headphones", "elaborate multi-tool"]
var location = ""
var item_target = ""
var item_target_type = 1
var item = ""
var distance = 0
var minigameScene = preload("res://Game/Minigames/ClickAtTheRightTime/ClickAtTheRightTime.tscn")
const Globals = preload("res://Modules/IssixModule/Globals.gd")
var strike = 0
var flying_back = false
var location_dir = {"hall_elevator": "med_elevator", "mining_elevator": "hall_elevator", "med_elevator": "mining_elevator","main_stairs2": "CBStairs2","main_stairs1": "CBStairs1", "CBStairs2": "main_stairs2", "CBStairs1": "main_stairs1"}

func _initScene(_args = []):
	item = RNG.pick(missing_items)
	location = GM.pc.getLocation()
	item_target = RNG.pick(["main_dressing2", "main_green_corridor10", "main_green_secret", "main_dressing1", "main_hallroom5", "med_mental_entrance", "medical_hospitalwards", "medical_storage", "med_corridor_split2", "med_nearshower", "med_researchlab", "med_milkingroom", "eng_corridor_blue3", "eng_airventskip", "eng_robotics", "eng_storage", "eng_corridor6", "eng_corridor3", "eng_assemblylab", "mining_shafts_entering", "eng_bay_nearbreakroom", "cellblock_red_playercell", "cellblock_lilac_nearcell", "cellblock_orange_playercell", "cellblock_corridor_nearstairs"])
	strike = 0
	flying_back = false
	# DEBUG
	item_target = "eng_assemblylab"

func _run():
	if(state == ""):
		addCharacter("hiisi")
		addCharacter("issix")
		if getModuleFlag("IssixModule", "Drone_Flight_Unlocked") == false:  # first time doing this
			saynn("[say=pc]Master, is there something I could help with?[/say]")
			saynn("[say=issix]Pet wants to help? Hmm. Actually there might be something. Hiisi?[/say]")
			saynn("[say=hiisi]Yes Master?[/say]")
			saynn("[say=issix]Can you get me a recent task from {pawn1.name}?[/say]")
			saynn("[say=hiisi]Here you go, Master.[/say]")
			saynn("Hiisi hands the Master some kind of a note.")
			saynn("[say=issix]Yeah, {pawn1.name} have lost "+item+" somewhere and they need it back. Based on their scent we can approximate location of "+item+" however you'll still need to do some finding.[/say]")
			saynn("[say=pc]So... Do I just walk there and look for it?[/say]")
			saynn("[say=issix]No. Of course not. That would take too long. You are going to use a mini drone.[/say]")
			saynn("[say=pc]What?[/say]")
			saynn("[say=issix]A mini drone. Have you ever played with one?[/say]")
			saynn("[say=pc]Never did.[/say]")
			saynn("[say=issix]Hiisi will give you an introduction then. It's pretty fun.[/say]")
			addButton("Introduction", "Hiisi gives you instructions on how to search for items", "introduction")
		else:
			saynn("You see a note stickled to Hiisi's blanket. It's another missing item.")

			saynn("[say=pc]You mind if I search for this one?[/say]")
			saynn("[say=hiisi]Go ahead. I'd rather do something else.[/say]")
			if GM.pc.getLust() > 60:
				saynn("[say=pc]Can I be something else?[/say]")
				saynn("You wink at Hiisi with a smirk, he rolls his eyes and waves you off.")

			saynn("You pull out a drone from the bag and activate it. Putting googles on your head beginning the operation.")
			addButton("Start", "Start searching for "+item, "search")

	if state == "introduction":

		saynn("[say=hiisi]Alright, so the general idea is as follows - we do various services for people in the prison. One of them is finding their lost items. Just because you are in the prison doesn't mean you don't own things that can get lost. Master acquired a drone that has multiple functionalities, including appropriate sensors for finding scents.[/say]")
		saynn("[say=pc]Is that even possible? And how is it allowed?[/say]")
		saynn("[say=hiisi]Well, anthros are a bit better with smell than humans, but nothing beats a specialized machine, so yes, all of the things you use have your smell in some capacity and this device tracks it down. Something something few molecules in big number of particles is good enough. It can somehow differentiate items too, I'm not exactly sure how that works. As to how is it allowed... It isn't. Guards have a hard-on for drones and if they notice one they can get pissy and try to take down the drone. That's why you'll have to [b]avoid guards and engineers[/b] when you fly, drone isn't so easy to catch so you might get lucky, but you are responsible for it if they take it. Inmates don't really care, I think they even like the distraction when they notice a drone.[/say]")
		saynn("[say=pc]How do I avoid the guards?[/say]")
		saynn("[say=hiisi]Just make sure you don't bump into walls, allow the drone to go too low or go too near the guards and you should be fine. Usually when you stay in one place the drone is also quieter so guards may not notice it, but it's still a gamble.[/say]")
		saynn("( You have to use the minimap for checking where the guards/engineers/nurses are, for a reminder - they are marked in blue or yellow )")
		saynn("[say=pc]What about nurses?[/say]")
		saynn("[say=hiisi]They don't care. If your item is in the medical wing consider yourself lucky.[/say]")

		saynn("[say=pc]And how will I know where the item is?[/say]")
		saynn("[say=hiisi]The closer you get the more vibrations the controller gives you. [/say]")
		saynn("He pulls out the equipment from the bag and passes them to you.")
		saynn("[say=hiisi]You wear the googles to see what the drone sees, and the controller is as you can imagine - to control the drone. We'd use some kind of neura-link to steer it better however it was way outside the budget and obviously it's not the kind of thing we can make on our own, so analog controller it is. Don't worry, you can do it.[/say]")
		saynn("[say=hiisi]Oh, also, the drone is pretty quick, so watch out when you fly not to bump into walls.[/say]")

		saynn("He shows you the controls and how to use them. It's pretty intuitive to use even if you don't see the controller when wearing googles. You put the googles on your head, the strap comfortably wraps around your "+GM.pc.getBodypart(BodypartSlot.Head).getName()+".")
		saynn("[say=hiisi]Looks good. When you are ready hit start button.[/say]")
		addButton("Start", "Start the search", "search")

	if state == "retrival_failure":
		saynn("You attempted to fly down and grab "+item+" but missed it with the grabby arms of the drone. You need to do better in next attempt!")
		state = "search"

	if state == "search":
		playAnimation(StageScene.Nothing, "nothing", {})
		aimCameraAndSetLocName(location)
		saynn("You are hovering in air in "+GM.world.getRoomByID(location).getName())
		if !flying_back:
			if distance < 2:
				saynn("The vibrations of the controller are [b][color=#960003]very intense[/color][/b], the item must be nearby.")
			elif distance < 4:
				saynn("The vibrations of the controller are [color=#ff8000]intense[/color] but you feel like this isn't everything you can squeeze out of it.")
			elif distance < 8:
				saynn("The vibrations of the controller are [color=green]constant but lightweight[/color], you are getting somewhere but it's still not there.")
			elif distance < 15:
				saynn("The vibrations of the controller are [color=blue]sporadic and gentle[/color], this is probably not the area you are looking for.")
			else:
				saynn("The controller doesn't vibrate at all, you must be quite far away from your goal.")
		else:
			saynn("You are flying back to the corner.")

		var roomID = location
		if(GM.world.canGoID(roomID, GameWorld.Direction.NORTH)):
			addButtonAt(6, "North", "Fly north", "go", [GameWorld.Direction.NORTH, Direction.North])
		else:
			addDisabledButtonAt(6, "North", "Can't go north")

		if(GM.world.canGoID(roomID, GameWorld.Direction.WEST) or location in ["main_green_corridor7", "med_lobbynw", "med_staffonly_door2", "eng_bay_corridor"]):
			addButtonAt(10, "West", "Fly west", "go", [GameWorld.Direction.WEST, Direction.West])
		else:
			addDisabledButtonAt(10, "West", "Can't go west")

		if(GM.world.canGoID(roomID, GameWorld.Direction.SOUTH)):
			addButtonAt(11, "South", "Fly south", "go", [GameWorld.Direction.SOUTH, Direction.South])
		else:
			addDisabledButtonAt(11, "South", "Can't go south")

		if(GM.world.canGoID(roomID, GameWorld.Direction.EAST) or location in ["yard_vaulthere", "med_staffonly_door1", "med_lobbyne", "eng_bay_nearbreakroom"]):
			addButtonAt(12, "East", "Fly east",  "go", [GameWorld.Direction.EAST, Direction.East])
		else:
			addDisabledButtonAt(12, "East", "Can't go east")
		addButton("Wait", "Stay in place (while being more quiet)", "wait")
		addButtonsForFloors()
		if !flying_back:
			addButton("Retrieve", "Search and retrieve the item", "search_retrieve")

	if state == "search_retrieve":
		var game = minigameScene.instance()
		GM.ui.addCustomControl("minigame", game)
		game.instantEscapePerk()

		game.setDifficulty(RNG.randi_range(1, 2))
		game.connect("minigameCompleted", self, "onMinigameCompleted")

	if state == "retrival_success":
		saynn("You were able to fish out "+item+" without an issue! Time to fly back to the harem.")
		addButton("Fly back", "Fly back", "fly_back")

	if state == "drone_lost":
		saynn("You lunged with the drone to grab the item again, however someone grabbed the drone while it was diving in for the item and that's about it. You didn't see who that was when the camera feed cut off.")
		addButton("Drone lost", "You've lost the drone", "issix_fail")

	if state == "landing":
		aimCameraAndSetLocName(location)
		saynn("You skillfully land the drone back on empty space of your own blanket. You've successfully brought back "+item+", job well done! You take off your visors and look at the drone with the payload.")
		saynn("[say=hiisi]Oh nice, you brought the drone back with the item, thanks I'll fetch that and Master will process it.[/say]")
		saynn("[say=issix]Good job, pet! Our dear customer will surely be happy about it.[/say]")
		saynn("[say=issix]Hmm, you deserve a little something for this task...[/say]")
		saynn("He throws a small sack with some physical credits at you")
		saynn("[say=issix]Here you go[/say]")
		addButton("Finish", "End the task", "endthescene")

	if state == "guard_catch":
		aimCameraAndSetLocName(location)
		saynn("As you continue flying out of the sudden a large object appears in your eyes scaring you. The visor flashes in colors before becoming completely dark.")
		saynn("[say=pc]What the fuck![/say]")
		saynn("You continue watching but nothing changes. The controls don't do anything and the visor is completely black.")
		saynn("[say=hiisi]Anything wrong?[/say]")
		saynn("[say=pc]I don't know, there was something big that appeared on the screen, then it looked as if camera fell down and...[/say]")
		saynn("[say=hiisi]Probably not the camera but rather entire drone. That's not great.[/say]")
		saynn("[say=pc]What?[/say]")
		saynn("[say=hiisi]Are you sure there were no guards or engineers where you flew?[/say]")
		saynn("[say=pc]I... Maybe? Do you think...[/say]")
		saynn("[say=hiisi]Unless you hit invisible wall, which is a thing on video games only - yeah, that's how it looks like when they throw something at the drone.[/say]")
		saynn("[say=pc]Fuck... What now?[/say]")
		saynn("[say=hiisi]Eh, it's not great, we don't have any more drones. We either need to order a new one or you somehow recover the one you've lost.[/say]")
		saynn("[say=pc]And how would I recover this one?[/say]")
		saynn("[say=hiisi]Beats me.[/say]")
		saynn("[say=pc]Fuuuck...[/say]")
		addButton("Issix", "Tell Master about failed task", "issix_fail")

	if state == "issix_fail":
		saynn("You are afraid of doing this but you did fuck the task up. Only way forward is to admit to your failure.")

		saynn("[say=pc]Master Issix... I'm sorry, I lost the drone.[/say]")
		if getModuleFlag("IssixModule", "Issix_Mood", 50) < 40:
			saynn("[say=issix]This is no good, pet. You were responsible for the drone and you fucking lost it.[/say]")
			saynn("Master seems agitated by your admission.")
			saynn("[say=issix]They cost a fortune for fuck's sake, is it this fucking difficult to keep it stealthy when you do an item search?[/say]")
			saynn("[say=pc]I apologize... It was an honest mistake.[/say]")
			saynn("[say=issix]A mistake you are going to pay for, I hope you have 550 work credits ready, with a bit of luck I could probably turn them into less shitty currency to buy another one. Ugh.[/say]")
		else:
			saynn("Master sighs, hiding his face behind a paw that massages their face.")
			saynn("[say=issix]It's okey, pet. This happens sometimes. Still not great - we need that drone, but not much you can do I guess. Drones usually cost plenty, for work credits that you are acquainted with it would be around 500, I still need to turn that into actual currency. While I could buy one already, you still have to cover the cost for that one.[/say]")
			saynn("[say=pc]I understand...[/say]")
		addButtonWithChecks("Pay", "Pay for the drone now", "paydrone", [], [[ButtonChecks.HasCredits, 550 if getModuleFlag("IssixModule", "Issix_Mood", 50) < 40 else 500]])
		addButton("Pay later", "Pay for the drone at later time (you can do that later in Issix's pet menu)", "endthescenefail")

	if state == "paydrone":
		saynn("You hand your Master the payment for the drone.")

		saynn("[say=issix]Thank you. I'll make requests and hopefully it should arrive in here in a few days, whenever is the next resupply anyways.[/say]")
		addButton("End", "End conversation", "endthescenefail")

func addButtonsForFloors():
	var loc = location_dir.get(location)
	if loc:
		if location.to_lower().find("stairs") != -1:
			addButton("Use", "Use stairs", "switch_place", [loc.substr(0)])
		else:
			addButton("Use", "Use elevator shaft", "switch_place", [loc.substr(0)])

func onMinigameCompleted(result:MinigameResult):
	GM.main.pickOption("minigameResult", [result])

func getDevCommentary():
	return ""

func hasDevCommentary():
	return false

func supportsShowingPawns() -> bool:
	return true

func saveData():
	var data = .saveData()

	data["location"] = location
	data["item_target"] = item_target
	data["item_target_type"] = item_target_type
	data["item"] = item
	data["strike"] = strike
	data["flying_back"] = flying_back

	return data

func loadData(data):
	.loadData(data)

	location = SAVE.loadVar(data, "location", "hall_ne_corner")
	item_target = SAVE.loadVar(data, "item_target", "eng_assemblylab")
	item_target_type = SAVE.loadVar(data, "item_target_type", 1)
	item = SAVE.loadVar(data, "item", RNG.pick(missing_items))
	strike = SAVE.loadVar(data, "strike", 0)
	flying_back = SAVE.loadVar(data, "flying_back", false)

func _react(_action: String, _args):
	if _action == "minigameResult":
		var minigameResult:MinigameResult
		minigameResult = _args[0]
		var minigameScore:float = minigameResult.score
		if minigameScore >= 0.8:
			_action = "retrival_success"
		else:
			_action = "retrival_failure"

	if _action == "retrival_failure":
		strike += 1
		if strike > 2:
			_action = "drone_lost"
			setModuleFlag("IssixModule", "Drone_Task_Timeout", -1)

	if _action == "go":
		location = GM.world.applyDirectionID(location, _args[0])
		var pawsAtNewLoc = GM.main.IS.getPawnsAt(location)
		var chances = 0
		for pawn in pawsAtNewLoc:
			if pawn.isGuard():
				chances += 20
		if RNG.chance(chances) and location != "hall_ne_corner":
			_action = "guard_catch"
		elif flying_back:
			if location != "hall_ne_corner":
				_action = "fly_back"
			else:
				_action = "landing"
		else:
			_action = "search"

	if _action == "search":
		processTime(20)
		var endLocation = null
		if item_target_type == 1:
			endLocation = item_target
		else:
			endLocation = GM.main.IS.getPawn(item_target).getLocation()
		var path = GM.world.calculatePath(location, endLocation)
		if(path.size() <= 0):
			endScene()
		distance = path.size()

	if _action == "landing":
		var reward = 20
		var item_index = missing_items.find(item)
		if item_index != -1:
			reward = (item_index*8)+RNG.randi_range(0,7)
		addMessage("You've received "+str(reward)+" from Issix for successful task")
		GM.pc.addCredits(reward)

	if _action == "switch_place":
		processTime(20)
		location = _args[0]
		_action = "search"

	if _action == "wait":  # in case of second type of search this may be broken
		processTime(60)
		var pawsAtNewLoc = GM.main.IS.getPawnsAt(location)
		var chances = 0
		for pawn in pawsAtNewLoc:
			if pawn.isGuard():
				chances += 5
		if RNG.chance(chances):
			_action = "guard_catch"
		else:
			_action = "search"

	if _action == "fly_back":
		processTime(20)
		flying_back = true
		_action = "search"

	if _action == "guard_catch":
		setModuleFlag("IssixModule", "Drone_Task_Timeout", -1)

	if(_action == "endthescene"):
		Globals.addIssixMood(5)
		setModuleFlag("IssixModule", "Did_Task_Today", true)
		addMessage("Issix's mood has improved")
		endScene()
		return

	if _action == "paydrone":
		GM.pc.addCredits(-550 if getModuleFlag("IssixModule", "Issix_Mood", 50) < 40 else -500)
		setModuleFlag("IssixModule", "Drone_Task_Timeout", GM.main.getDays() + RNG.randi_range(4, 6))

	if _action == "endthescenefail":
		setModuleFlag("IssixModule", "Did_Task_Today", true)
		Globals.addIssixMood(-3)
		endScene()
		return

	setState(_action)
