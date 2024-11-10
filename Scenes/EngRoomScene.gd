extends SceneBase

var cabinets = {2: {"name": "2"}, 9: {"name": "9"}, 14: {"name": "14"}, 20: {"name": "20"}, 28: {"name": "28"}, 42: {"name": "|/\\"}, 51: {"name": "51"}, 69: {"name": "69"}, 84: {"name": "84"}, 87: {"name": "87"}, 90: {"name": "90"}}
var empty_loots = [
	"This shelf is filled to the brim with various metallic nuts and bolts. However it has nothing of interest to you",
	"After putting your paw deep within the shelf you start feeling very unpleasant coldness coming from the tips of your fingers. Oof! You immediately pull out your paw.",
	"The entire filling cabinet starts vibrating after opening this shelf. It does not bode well, you immediately close this shelf. The vibration stops. That was odd.",
	"When opening the shelf you start hearing voice outside the closet, considering how well the doors are masking the sounds from the hallway they must be really close, perhaps they want to use the closet?\nIn panic you try to find some place to hide to no avail, there is not much space to begin with. You stand terrified until voice goes quiet. After sigh of relief you check the opened shelf, however there isn't anything in there other than various replacement parts to electronic devices.",
	"You pull out a shelf and find a single piece of paper inside. It has only one sentence on it, in large font that fills entire page saying „OH, DID U GET THE BROOM CLOSET ENDING? THEB ROOM CLOSET ENDING WAS MY FAVRITE!1 XD”. The absolute lack of context and randomness of this message fill you with concern. Engineers must have a very strange sense of humor."
]
var cabinet_random = RandomNumberGenerator.new()
var current_loot = null  # TODO will not survive save/load 
var current_cabinet = null

func _init():
	sceneID = "EngRoomScene"

func _run():
	if(state == ""):
		saynn("You hesitate, last time you walked this hallway you are sure that in this part the only thing you'll meet, if you continue walking, is a wall. This entire thing sounds dumb, and yet... It's a trust excercie, no? Realistically the worst thing that will happen is that you'll eventually hit a wall, doesn't sound like something you can't take.")
		if GM.main.isVeryLate():
			addButton("Wall time", "Trust Issix and walk towards the wall", "nightwallwalking")
		else:
			addButton("Wall time", "Trust Issix and walk towards the wall", "trust")
		addButton("Nope", "You are not trusting Issix, this is stupid", "endthescene")
		
	if(state == "nightwallwalking"):
		GM.main.setModuleFlag("IssixModule", "Quest_Bonked", true)
		processTime(1*60)
		saynn("You decide to trust Issix. You turn 90 degrees, take a deep breath and walk forward. Last time you went this corridor while not blind there was a wall here, an maybe this time...")
		saynn("Four confidence in Issix is rewarded with a loud bang on the wall. While your feet were the first to hit the wall, your head followed and... You hit the wall like a fool. Why would it work anyways, it's a solid wall.")
		var damage_taken = GM.pc.receiveDamage(DamageType.Physical, 40, 1.0)
		saynn("You took "+str(damage_taken)+" damage.")
		addButton("Leave", "Leave embarassed before you give someone a reason to laugh at you", "endthescene")
		
	if(state == "trust"):
		aimCameraAndSetLocName("eng_closet")
		GM.pc.setLocation("eng_closet")
		GM.main.setModuleFlag("IssixModule", "Quest_Status", 2)
		saynn("You decide to trust Issix. You turn 90 degrees, take a deep breath and walk forward. Last time you went this corridor while not blind there was a wall here, an maybe this time...")
		saynn("You hear a beep before you, a few screeching sounds. Holy shit, perhaps Issix was onto something here? You continue walking, the atmosphere changes, the echo of your steps disappeared, the air is more dry and you start to feel claustrophobic. You cautiously drag your foot forward until it hits something seemingly metal. Have you reached your destination?")
		processTime(2*60)
		var item: ItemBase = GM.pc.getInventory().getEquippedItem(InventorySlot.Eyes)
		if(item != null):
			var restraint = item.getRestraintData()
			if(restraint != null):
				if (restraint.canStruggleFinal() and GM.pc.getStamina() > 0) or GM.pc.getInventory().hasItem("restraintkey"):
					addButton("Struggle", "It would be useful to see what is going on around", "strugglemenu")
				else:
					addDisabledButton("Struggle", "Your "+item.getVisibleName() + " is stuck on your eyes")
			else:
				addButton("Look around", "Look around", "lookaround")
		else:
			addButton("Look around", "Look around", "lookaround")
		addButton("Leave", "Try to leave the room", "leave")
			
	if state=="leave":
		if(GM.pc.isBlindfolded()):
			if(GM.pc.hasBlockedHands()):
				saynn("You attempt to retrace your setps back where you came from, however it seems like whatever you went through has closed. It's hard to judge how can you even open the doors. After a while of trying, you blast the doors with a serios of forceful pushes, it does not budge.")
				processTime(7*60)
			else:
				saynn("You attempt to retrace your setps back where you came from, however it seems like whatever you went through has closed. Thankfully, it seems like from this end there is a very analog door handle that pulling seems to lead back to the hallway. Or at least you judge that from the sounds.")
				processTime(4*60)
		else:
			processTime(2*60)
			saynn("Thankfully, the doors have a regular old-school door handle. You pull it and they swing open.")
			saynn("On the other side - curiously, completely flat wall texture. You close the doors and observe how this fit of engineering doors leading to ancient technology closet fits the wall so perfectly that it leaves no evidence of ever existing, not even a tiny crevice can be seen. Above the doors is a camera, maybe it opens the doors?")
		aimCameraAndSetLocName("eng_corridor6")
		GM.pc.setLocation("eng_corridor6")
		addButton("Issix", "Guess it's time to go back to Issix", "endthescene")
		
	if state=="lookaround":
		saynn(GM.world.getRoomByID("eng_closet").getDescription())
		addButton("Cabinets", "Try to search cabinets", "cabinets")
		addButton("Leave", "Try to leave the room", "leave")
		
	if state=="cabinets":
		saynn("Within so many filling cabinets there are over 12 shelves. You could open some of them and see what's in them, however only one of them is really interesting to you.")  # TODO placeholder
		addButton("Back", "Look around again", "lookaround")
		var activated_cabinets = getModuleFlag("IssixModule", "Activated_Cabinets", {})
		for item in cabinets:
			if item in activated_cabinets:
				addDisabledButton("Cabinet "+cabinets[item]["name"], "You've already looted this cabinet")
			else:
				if item == 84 and GM.main.getModuleFlag("IssixModule", "Quest_Status") == 2:
					addButton("Cabinet " + cabinets[item]["name"], "Check the cabinet with number "+cabinets[item]["name"], "cabinet84", [item])
				else:
					addButton("Cabinet " + cabinets[item]["name"], "Check the cabinet with number "+cabinets[item]["name"], "cabinetloot", [item])
			
	if state=="cabinetloot":
		saynn("You chose to open cabinet number "+str(current_cabinet)+"...")
		processTime(1*60)
		if(typeof(current_loot) == TYPE_NIL):  # event
			markCabinetAsActivated(current_cabinet)
		elif(typeof(current_loot) == TYPE_STRING): #nothing
			saynn(current_loot)
			markCabinetAsActivated(current_cabinet)
		else: #item
			saynn("Inside you've found "+str(current_loot.getAmount())+" of "+ current_loot.getVisibleName() +".")
			addButton("Take items", "Take the items", "acceptloot")
		addButton("Cabinets", "Look at cabinets without picking up anything", "cabinets")
			
	if state=="cabinet84":
		processTime(1*60)
		saynn("It is the cabinet mentioned by Issix. You reach your paw inside and there is a single item inside - a pack of gumball. You grab and take it.")
		GM.main.setModuleFlag("IssixModule", "Quest_Status", 3)
		markCabinetAsActivated(84)
		addButton("Back", "Look at cabinets", "cabinets")
		
	if state=="cabinetevent1":
		processTime(10*60)
		saynn("You chose to open cabinet number "+str(current_cabinet)+"...")
		var fluidType = RNG.pick(["Cum", "GirlCum", "Milk"])
		saynn("The shelf is located a little higher than your head, since there isn't anything in the closet that you could stand on, your plan is to simply open the shelf and try to feel with your paw if there is anything there. You regret that decision the moment you open the shelf. Entire shelf is filled to brim with a kind of cold slimy fluid that spills on you the moment you open it.\n\nYou've been covered in "+fluidType.to_lower()+".")
		GM.pc.coverBodyWithFluid(fluidType, 800.0)
		
	if state=="cabinetevent2":
		processTime(3*60)
		saynn("You chose to open cabinet number "+str(current_cabinet)+"...")
		saynn("The shelf is located a little higher than your head, since there isn't anything in the closet that you could stand on, your plan is to simply open the shelf and try to feel with your paw if there is anything there.\n\nYou pull the shelf and it falls on you!")
		if (RNG.randf_range(0, 1) < GM.pc.getDodgeChance()+0.1):  # Got protected from the fall, base 10% + whatever player dodge chance has
			saynn("You were able to avoid the falling shelf with your quick reflexes. Phew. You push the shelf back where it came from.")
		else:
			var damage_taken: int = 0
			if GM.pc.hasHorns():  # I were curious, so I asked search engine about this, have some cool sciency read code reader masochist! https://bioengineering.hyperbook.mcgill.ca/mechanical-analysis-of-animal-horns/
				damage_taken = GM.pc.receiveDamage(DamageType.Physical, 40, 1.0)
			else:
				damage_taken = GM.pc.receiveDamage(DamageType.Physical, 60, 1.0)
			saynn("You were unable to react in time and heavy shelf fell on your head ouch.\n" + ("Seems like your horns helped you with taking a hit from the above to some degree.\n" if GM.pc.hasHorns() else "") + "\nYou took "+str(damage_taken)+" damage.")
			
		
	if state=="cabinetevent3":
		processTime(3*60)
		saynn("You chose to open cabinet number "+str(current_cabinet)+"...")
		var lust_taken = RNG.randi_range(20, 50)
		GM.pc.addLust(lust_taken)
		saynn("A red mist surrounds you as the dust from the shelf spills out with the force of your pull.\n\nYou gain "+ str(lust_taken)+" lust.")
		
		
func randomItemFromSeed(array):
	return array[cabinet_random.randi() % array.size()]
	
func randomNumberFromSeed(numStart, numEnd):
	cabinet_random.randi_range(numStart, numEnd)
		
func generateLoot(cabinet_number: int):
	cabinet_random.seed = GM.main.getDays() + cabinet_number * 1000
	var rand_num = cabinet_random.randf() * 100
	if (rand_num < 16): # item
		var item_type = randomItemFromSeed(["PlantEgg", "Cookie", "lube", "PlasticBottle", "restraintkey", "WorkCredit", "UsedCondom"])
		var newItem = GlobalRegistry.createItem(item_type)
		if item_type == "PlantEgg":
			newItem.whoGaveBirth = "thisnamedoesntexistbecauseplayercantpossiblyknowwhoseggsthoseare"
			newItem.setAmount(randomNumberFromSeed(2, 3))
		elif item_type == "cookie":
			newItem.setAmount(randomNumberFromSeed(2, 3))
		elif item_type == "Credit":
			newItem.setAmount(randomNumberFromSeed(3, 5))
		elif item_type == "UsedCondom":
			newItem.markLastUser("unknown person")
			newItem.generateFluids()
			var fluids = newItem.getFluids()
			var allowedFluids = ["CumLube", "BlackGoo"]
			if OPTIONS.isContentEnabled(ContentType.Watersports):
				allowedFluids.append("Piss")
			fluids.addFluid(randomItemFromSeed(allowedFluids), randomNumberFromSeed(2, 5)*100.0)
		return newItem
	elif (rand_num < 21):  # TODO event
		markCabinetAsActivated(cabinet_number)
		return RNG.randi_range(1,3)
	else:
		return randomItemFromSeed(empty_loots)
		
func markCabinetAsActivated(cabinetNumber:int):
	var activated_cabinets = getModuleFlag("IssixModule", "Activated_Cabinets", {})
	activated_cabinets[cabinetNumber] = true
	GM.main.setModuleFlag("IssixModule", "Activated_Cabinets", activated_cabinets)

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
		
	if(_action == "cabinetloot"):
		if getModuleFlag("IssixModule", "Activated_Cabinets", {}).size() > 10:
			# TODO Do a force encounter with an engineer
			pass
		current_loot = generateLoot(_args[0])
		current_cabinet = _args[0]
		if typeof(current_loot) == TYPE_INT:
			_action = "cabinetevent"+str(current_loot)
			
	if(_action == "acceptloot"):
		markCabinetAsActivated(current_cabinet)
		GM.pc.getInventory().addItem(current_loot)
		_action = "cabinets"
		
	if(_action == "strugglemenu"):
		runScene("StrugglingScene")
		return
	
	setState(_action)
