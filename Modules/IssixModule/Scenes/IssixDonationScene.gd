extends "res://Scenes/SceneBase.gd"

var inventoryScreenScene = preload("res://Modules/IssixModule/Internal/InventoryScreenDonation.tscn")

var lockedInto = false
var rewardItem: ItemBase = null
var rewardItemDescription := ""

func _initScene(_args = []):
	if(_args.size() > 0):
		lockedInto = true
		setState(_args[0])

func _init():
	sceneID = "IssixDonationScreen"

func filterNonAnnouncer(item) -> bool:
	return !item.hasTag(ItemTag.SoldByTheAnnouncer)

func filterArray(arr: Array, tester: String):
	var new_array = []
	for item in arr:
		if call(tester, item):
			new_array.append(item)
	return new_array

func _run():
	if(state == ""):
		saynn("You can donate BDSM gear to Issix, and he MAY reward you with some goodies after each 10 donations.")
		var current_donations = getModuleFlag("IssixModule", "Issix_Donation_Meter", 0)
		var used_donations = getModuleFlag("IssixModule", "Issix_Used_Donations", 0)

		saynn("You've made "+str(current_donations) + " donations to Issix so far.")

		addButton("Donate", "See what you can donate", "donatemenu")
		if (current_donations - used_donations) >= 10:
			addButton("Reward", "Ask Issix for reward for donations you've made so far", "issixdonationitemreward")
		else:
			addDisabledButton("Reward", "You haven't donated enough items to receive any rewards yet")

		if getModuleFlag("IssixModule", "Issix_Donation_Meter", 0) > 49:
			if (current_donations - used_donations) >= 10:
				addButton("Enchant", "Upgrade a restraint with a smart lock", "enchantmenu")
				saynn("Fair warning: Applying smart locks willy-nilly may break stuff. NPC's don't seem to support smart-locks yet and may struggle out of them as if smart-lock didn't exist. YOU are responsible for how you use the restraints made this way, this function is mainly made with idea that player may want to get those items on themselves, not NPCs.")
			else:
				addDisabledButton("Enchant", "Issix isn't willing to apply any SmartLocks to the gear just yet, donate more stuff to him")

		addButton("Step away", "Talk about something else", "endthescene")

	if(state == "donatemenu"):
		var inventory = inventoryScreenScene.instance()
		GM.ui.addFullScreenCustomControl("inventory", inventory)
		var inventoryItems = GM.pc.getInventory().getAllCombatUsableRestraints()
		inventory.setItems(filterArray(inventoryItems, "filterNonAnnouncer"), "donation")  # TODO Change into something more about restraints
		var _ok = inventory.connect("onItemSelected", self, "onInventoryItemSelected")
		var _ok2 = inventory.connect("onInteractWith", self, "onInventoryItemInteracted")
		#var _ok3 = inventory.connect("onInteractWithGroup", self, "onInventoryItemGroupInteracted")

		addButton("Back", "Don't donate anything", "")

	# So, let's talk. I realize this feature is kinda wild. I don't think it is intended to have SmartLocked restraints inside of PC's inventory, they are made to be only equipped on someone's body, which is why the smartlock disappears once player gets off the restraint. This feature allows free-for-all slut lock application. I specifically chose tasks that any NPC could possibly do by themselves regardless of body configuration, but I'm sure there will still be issues even with that. Overall, it's up to the player whether they want to break their NPCs in bad ways or not.
	if state == "enchantmenu":
		var inventory = inventoryScreenScene.instance()
		GM.ui.addFullScreenCustomControl("inventory", inventory)
		var allItems = []
		for item in GM.pc.getInventory().getAllCombatUsableRestraints():
			if !item.getRestraintData().hasSmartLock():
				allItems.append(item)
		inventory.setItems(allItems.duplicate(), "enchant")
		var _ok = inventory.connect("onItemSelected", self, "onInventoryItemSelected")
		var _ok2 = inventory.connect("onInteractWith", self, "onInventoryItemInteracted")
		#var _ok3 = inventory.connect("onInteractWithGroup", self, "onInventoryItemGroupInteracted")

		addButton("Back", "Don't donate anything", "")

	if state == "issixdonationitemreward":
		saynn("[say=pc]I've donated some gear, would you consider giving me something in return?[/say]")
		saynn("[say=issix]Hmm, I suppose that's true, your donations are appreciated. Let's see...[/say]")
		saynn("Issix grabs his bag and searches through it for trinkets, you assume.")
		saynn("[say=issix]Hmm, how about this?[/say]")
		if rewardItem != null:
			saynn("Issix pulls out "+rewardItem.getVisibleName()+" and hands it to you.")
			saynn("[say=issix]"+rewardItemDescription+"[/say]")
			if GM.main.getModuleFlag("IssixModule", "PC_Enslavement_Role", 0) == 0:
				saynn("[say=pc]Thank you Issix.[/say]")
			else:
				saynn("[say=pc]Thank you, Master.[/say]")
		else:
			saynn("[color=red]YOU SHOULDN'T SEE THIS, I'VE FUCKED UP SOMETHING.[/color]")
		addButton("Back", "Continue", "")

# Cookie
func reward1():
	rewardItemDescription = "You know, I've learned that sometimes it's the simplest things that bring us joy, so have this cookie, you can share it with someone if you'd like, I guess."
	return GlobalRegistry.createItem("Cookie")

func findDonor(pawns) -> BaseCharacter:
	var donor = null
	for inmate in pawns:
		if !inmate.isInmate() or inmate.isPlayer() or inmate.isSlaveToPlayer():
			continue
		if !inmate.getCharacter().hasPenis():
			continue
		donor = inmate.getCharacter()
		break
	return donor

# Boole of cum, get a random Male inmate pawn and milk them dry, if no male pawn explode, but seriously, those can be hella useful if you lack penis and have to do 213123123 slave tasks
func reward2():
	var item = GlobalRegistry.createItem("PlasticBottle")
	var fluids = item.getFluids()
	var pawns = GM.main.IS.getPawns().values()
	pawns.shuffle()
	var donor = findDonor(pawns)
	if donor == null:
		fluids.addFluid("Milk", RNG.randf_range(900.0, 1100.0))
		rewardItemDescription = "This one is filled with sweet milk. I generally prefer bottles with other white fluid, but would you believe how hard it is to come by inmates with a penis in this prison? Strange..."  # lol
	else:
		fluids.addFluid("Cum", RNG.randf_range(950.0, 1150.0), donor.getFluidDNA(FluidSource.Penis))
		rewardItemDescription = "Have you ever seen this much in one bottle? ... Of course it's cum. Let's just say I have uses for those, this one you can have."
	return item

func reward3():
	if getModuleFlag("IssixModule", "Got_Luck_Token_Before", false) == false:
		rewardItemDescription = "I've had this one in my bag for way too long. You can have it, I don't need it... Right, you probably are new to this. Been a while since I've done that, but I think there is still a single person in this prison who can exchange those tokens for credits for you. Try to look around, talk. Hopefully you'll find the one, I don't really care much for those credits."
		setModuleFlag("IssixModule", "Got_Luck_Token_Before", true)
	else:
		rewardItemDescription = "Another one of these? Where the hell do they come from? Here, have it."
	return GlobalRegistry.createItem("LuckToken")

func _react(_action: String, _args):
	if(_action == ""):
		if(lockedInto):
			endScene()
			return

	if(_action == "donate"):
		var item = _args[0]
		var howMuch = 1
		if(_args.size() > 1):
			howMuch = _args[1]
		howMuch = Util.mini(item.getAmount(), howMuch)
		var howMuchStr = str(howMuch)+"x"

		#GM.pc.addCredits(item.getSellPrice() * howMuch)
		GM.main.increaseModuleFlag("IssixModule", "Issix_Donation_Meter", howMuch)
		GM.pc.getInventory().removeXFromItemOrDelete(item, howMuch)

		addMessage(howMuchStr+item.getVisibleName()+" was donated to Issix")

		if GM.main.getModuleFlag("IssixModule", "Issix_Donation_Meter", 0) == 50:
			addMessage("You can now enchant items with smart locks thanks to Issix's good will")

		setState("")
		if(lockedInto):
			endScene()
			return
		return

	if _action == "enchant":
		var item = _args[0]
		var lock = _args[1]

		var newLock = SmartLock.create(lock)  # This is a very basic implementation of "enchanting", I kinda want to make it add more challenges to an item on each enchant but that depends on how this feature is perceived
		newLock.onLocked({forcer = "pc"})
		item.getRestraintData.setLevel(item.getRestraintData.getLevel()+1)  # Just an extra
		item.getRestraintData().setSmartLock(newLock)
		# Hey kids, don't do this at home, it's bound to be dangerous (seriously, I'm fucking surprised that works, though it feels like shoestring held kind of feature and fairly restricted)

		if lock == SmartLock.SlutLock:
			var availableTasks = ["Orgasms", "Choke", "Bodywritings"]  # Tasks should be available to anyone regardless any body configuration

			var theTask:NpcBreakTaskBase = GlobalRegistry.createSlaveBreakTask(RNG.pick(availableTasks))

			theTask.generateFor("pc", false, RNG.randf_rangeX2(1.0, 2.0))
			newLock.tasks.append(theTask)

			for task in newLock.tasks:
				var _ok = task.connect("onTaskCompleted", newLock, "onSlutTaskCompleted")

		addMessage(newLock.getName()+" has been applied to "+item.getVisibleName())
		setState("")
		if(lockedInto):
			endScene()
			return
		return

	if _action == "issixdonationitemreward":
		GM.main.increaseModuleFlag("IssixModule", "Issix_Used_Donations", 10)
		var item = call("reward"+str(RNG.randi_range(1,3)))
		GM.pc.getInventory().addItem(item)
		rewardItem = item

	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

func saveData():
	var data = .saveData()

	data["lockedInto"] = lockedInto
	data["rewardItem"] = rewardItem

	return data

func loadData(data):
	.loadData(data)

	lockedInto = SAVE.loadVar(data, "lockedInto", false)
	rewardItem = SAVE.loadVar(data, "rewardItem", null)

func onInventoryItemInteracted(item: ItemBase):
	if(state == "donatemenu"):
		GM.main.pickOption("donate", [item, item.getAmount()])

func onInventoryItemSelected(item: ItemBase):
	GM.ui.clearButtons()
	addButton("Back", "Don't do anything", "")

	if(state == "donatemenu"):
		var itemAmount = item.getAmount()
		var amounts = [1, 2, 3, 4, 5, int(itemAmount * 0.3), int(itemAmount * 0.5), int(itemAmount * 0.7), itemAmount]
		amounts.sort()
		var amountsUsed = {}

		for amount in amounts:
			if(amount < 1):
				continue
			if(itemAmount < amount):
				break
			if(amountsUsed.has(str(amount))):
				continue
			amountsUsed[str(amount)] = true

			addButton("Donate "+(str(amount)), "Amount: "+str(amount), "donate", [item, amount])

	if state == "enchantmenu":
		var smartLockTypes = SmartLock.getAll()
		for smartLock in smartLockTypes:
			if smartLock == SmartLock.KeyholderLock or smartLock == SmartLock.TightLock:  # Ignore keyholder locks or TightLocks because they are too involved, from base game only really SlutLocks are left from the list :(
				continue
			var dummyLock = SmartLock.create(smartLock)
			addButton(dummyLock.getName(), "Apply "+dummyLock.getName()+" onto the restraint", "enchant", [item, smartLock])
			#dummyLock.free()

# func onInventoryItemGroupInteracted(item: ItemBase):
	# if(state == "donatemenu"):
	# 	GM.main.pickOption("sellall", [item])



