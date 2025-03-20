extends SceneBase

var levels = {1: ["Walkies", "Learn how to walk like a proper pet", "walkies_training"],  # level, button name, button description, state, flag ID required
			  3: ["Bowl", "Learn how to eat like a proper pet", "bowl_training", "Taught_To_Use_Bowl"],
			  5: ["Commands", "Learn how to listen to your Master's commands", "command_training", "Learned_Commands"],
			  7: ["Speech", "Learn how to speak like a pet", "speech_training", "Learned_Speech"],
			  10: ["Name", "Learn your new name", "name_training", "Obtained_New_Name"]}

var hasBorrowedMuzzle = false
var hasBorrowedMittens = false
var goodPoints = 0
const Globals = preload("res://Modules/IssixModule/Globals.gd")

func _init():
	sceneID = "IssixGenericTrainSession"


func _run():
	if(state == ""):
		playAnimation(StageScene.Duo, "kneel", {npc="issix", npcAction="stand"})
		saynn("[say=issix]My dear pet would like to train a little? That's good. Good pets want to be the best pets for their owners.[/say]")
		saynn("[say=issix]Hmm, what was the last thing I trained you?[/say]")
		createButtons()
		addButtonAt(14, "Back", "Do not train today", "endthescene")

	if state == "walkies_training":
		playAnimation(StageScene.Duo, "stand", {pc="issix", npc="pc", npcBodyState={naked=true, leashedBy="issix"}, npcAction="kneel"})
		saynn("[say=issix]Right, walkies! Of course. Humanoids walk on two legs while pets - on four. That's the way of the nature.[/say]")
		saynn("He pulls a leash out of his bag and crouches in front of you to attach it to your collar, which ends up making clasp sound.")
		saynn("[say=issix]Here we go. Nice and secured now.[/say]")
		if GM.pc.isBlindfolded():
			saynn("[say=issix]Are you sure you want to do this blindfolded? More power to you, I guess.[/say]")
			addButton("Blindfold", "Take off your blindfold", "blindfold_takeoff")
		else:
			addButtonWithChecks("Blindfold", "Put on a blindfold", "blindfold_takeon", [], [[ButtonChecks.HasItemID, "blindfold"]])

		if !GM.pc.getInventory().hasSlotEquipped(InventorySlot.Mouth):
			saynn("[say=issix]Now, I don't mind if you say no, but you'd look cuter if you said yes. Do you want me to muzzle you?[/say]")
			saynn("Your Master shows you a Basket Muzzle that he'd like you to wear.")
			addButton("Muzzle", "Say you want your muzzle on", "muzzle_attach")
		elif GM.pc.isMuzzled() and !hasBorrowedMuzzle:
			saynn("[say=issix]You come with your own Basket Muzzle? Dedicated.[/say]")
			addButton("Muzzle", "Say you want your muzzle off", "muzzle_detach")
		elif GM.pc.isMuzzled():
			saynn("[say=issix]Now your pretty face looks good behind that metal grid.[/say]")
			addButton("Muzzle", "Say you want your muzzle off", "muzzle_detach")
		else:
			saynn("[say=issix]Hmm, I'd rather you have a Basket Muzzle on you but that's fine as well. [/say]")

		if GM.pc.hasBlockedHands() and !hasBorrowedMittens:
			saynn("[say=issix]As to your paw- oh. You already have your own mittens? That takes care of one thing. I do like it when my pets have proper wear for their walkies.[/say]")
			addButton("Mittens", "Remove mittens", "mittens_remove")
		elif GM.pc.hasBlockedHands():
			saynn("[say=issix]Yes, this is exactly what I meant, your {pc.feet} made useless.[/say]")
			addButton("Mittens", "Remove mittens", "mittens_remove")
		else:
			saynn("[say=issix]I think you'd look cuter and more helpless with bondage mittens, what do you think?[/say]")
			addButton("Mittens", "Get mittens", "mittens_add")

		addButton("Ready", "Say you are ready to go", "walkies_ready")

	if state == "walkies_ready":
		# Walkies will be to one of few generated locations, and can have a random person met on the way (or none), the restraints on the player can change the meeting scenes
		showAppropriateScene()
		if shouldBeInHeavyBondage():
			saynn("[say=issix]Actually, lets get you into even more proper look, I think you are ready.[/say]")
			saynn("Issix pulls out a larger heavy gear, it consists of four large black pads which have metal plates on one end and holes on another. They are kept tight with a belt.")
			saynn("Issix guides you through process of putting all of those on.")
			saynn("[say=issix]Perfect! Now you look just the part. Don't worry if you struggle at first. It's normal.[/say]")

		saynn("[say=issix]Now, just few ground rules "+Globals.getPlayerPetName()+", you walk behind me like a good pet does, keep focus on my walk, do not try to run somewhere, do not bite anyone"+(", not that you could." if GM.pc.isMuzzled() else ".")+" The way you behave reflects on your Master, so if you choose to be bratty I'll make sure this happens only once. Are we clear? Nod your head if you agreee.[/say]")
		saynn("You don't want to disobey your Master, you nod.")

		addButton("Ready", "You are ready (once again)", "walkies_ready_final")

	if state == "end_walkies":
		showAppropriateScene()

		if goodPoints < 0:
			saynn("[say=issix]Your behavior on today's training session was awful. You are not getting any reward. Next time work harder![/say]")
		elif goodPoints == 0:
			saynn("[say=issix]Your behavior on today's training session was unsatisfying. You really should put more work into what makes a pet a pet next time.[/say]")
		else:
			saynn("[say=issix]Your behavior on today's training session was satisfactory. I'm glad you are learning more.[/say]")
			saynn("As a reward, you get headpats.")
		addButton("Back", "End today's training session", "endthescene")

func showAppropriateScene():
	if shouldBeInHeavyBondage():
		playAnimation(StageScene.PuppyDuo, "stand", {pc="issix", npc="pc", npcAction="crawl", npcBodyState={naked=true, leashedBy="issix"}})  # TODO we will need new scene as this one is not really flexible at all
	else:
		playAnimation(StageScene.Duo, "kneel", {pc="pc", npc="issix", npcAction="kneel", bodyState={naked=true, leashedBy="issix"}})

func shouldBeInHeavyBondage():
	return GM.pc.getSkillsHolder().getSkill("Pet").getLevel() > 3

func createButtons():
	var trainingLevel = GM.pc.getSkillLevel("Pet")
	var available_special_training = []
	for x in levels.keys():
		if x <= trainingLevel:
			var buttonData = levels[x]
			if buttonData.size() == 4 and getModuleFlag("IssixModule", buttonData[3]) != true:
				available_special_training.append(buttonData[0])
				addDisabledButton(buttonData[0], buttonData[1]+" (you haven't unlocked this training)")
			else:
				if buttonData[2] == "bowl_training":
					pass  # skip bowl training? Not much we can do for repeatable scene here
				elif buttonData[2] == "command_training":
					addDisabledButton(buttonData[0], "WIP")
				else:
					addButton(buttonData[0], buttonData[1], buttonData[2])
		elif x > trainingLevel:
			var buttonData = levels[x]
			addDisabledButton(buttonData[0], buttonData[1]+" (you haven't unlocked this training yet)")
			break
	for y in range(available_special_training.size()):
		var training_name = available_special_training[y]
		if training_name in ["Speech", "Name"]:
			continue
		addButtonAt(5+y, training_name, "Receive a special training in "+training_name.to_lower(), "special_"+training_name.to_lower())

func destroyBorrowedEquipment():
	if hasBorrowedMittens and GM.pc.hasBlockedHands():
		GM.pc.getInventory().removeItemFromSlot(InventorySlot.Hands)
	if hasBorrowedMuzzle and GM.pc.isMuzzled():
		GM.pc.getInventory().removeItemFromSlot(InventorySlot.Mouth)

func _react(_action: String, _args):
	if _action == "blindfold_takeoff":
		if GM.pc.getInventory().getEquippedItem(InventorySlot.Eyes).isRestraint() and GM.pc.getInventory().getEquippedItem(InventorySlot.Eyes).getRestraintData().canBeEasilyRemovedByDom():
			GM.pc.getInventory().unequipSlot(InventorySlot.Eyes)
			addMessage("You've struggled out of the blindfold")
		else:
			addMessage("You've tried to struggle out of the blindfold but failed")

	if _action == "special_bowl":
		runScene("IssixSlaveryBowlTraing", [], "special_bowl_training_complete")

	if _action == "special_commands":
		if getModuleFlag("IssixModule", "Learned_Commands") == null:
			runScene("IssixSlaveryCommandTraining", [], "special_commands_training_complete")
		else:
			runScene("IssixSlaveryCommandContTraining", [], "special_commands_training_complete")

	if _action == "blindfold_takeon":
		GM.pc.getInventory().forceEquipByStoreOtherUnlessRestraint(GM.pc.getInventory().getFirstOf("blindfold"), "issix")

	if _action == "muzzle_attach":
		GM.pc.getInventory().forceEquipByStoreOther(GlobalRegistry.createItem("basketmuzzle"), "issix")
		hasBorrowedMuzzle = true

	if _action == "muzzle_detach":
		if GM.pc.getInventory().getEquippedItem(InventorySlot.Mouth).isRestraint() and GM.pc.getInventory().getEquippedItem(InventorySlot.Mouth).getRestraintData().canBeEasilyRemovedByDom():
			if hasBorrowedMuzzle:
				GM.pc.getInventory().removeItemFromSlot(InventorySlot.Mouth)
				hasBorrowedMuzzle = false
			else:
				GM.pc.getInventory().unequipSlot(InventorySlot.Mouth)
			addMessage("You've struggled out of the muzzle")
		else:
			addMessage("You've tried to struggle out of the muzzle but failed")

	if _action == "mittens_add":
		GM.pc.getInventory().forceEquipByStoreOther(GlobalRegistry.createItem("bondagemittens"), "issix")
		hasBorrowedMittens = true

	if _action == "mittens_remove":
		if GM.pc.getInventory().getEquippedItem(InventorySlot.Hands).isRestraint() and GM.pc.getInventory().getEquippedItem(InventorySlot.Hands).getRestraintData().canBeEasilyRemovedByDom():
			if hasBorrowedMittens:
				GM.pc.getInventory().removeItemFromSlot(InventorySlot.Hands)
				hasBorrowedMittens = false
			else:
				GM.pc.getInventory().unequipSlot(InventorySlot.Hands)
			addMessage("You've struggled out of the Bondage Mittens")
		else:
			addMessage("You've tried to struggle out of the Bondage Mittens but failed")

	if _action in ["blindfold_takeoff", "blindfold_takeon", "muzzle_attach", "muzzle_detach", "mittens_remove", "mittens_add"]:
		_action = "walkies_training"

	if _action == "walkies_ready_final":
		runScene("WalkiesTrainingWithIssix", [], "walkies_end")

	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "walkies_end"):
		goodPoints += 5 if shouldBeInHeavyBondage() else 0
		goodPoints += 2 if GM.pc.isMuzzled() else 0
		goodPoints += 2 if GM.pc.hasBlockedHands() else 0
		destroyBorrowedEquipment()
		setModuleFlag("IssixModule", "Trained_Pet_Today", true)
		if _result:
			goodPoints += _result[0]*2
			if goodPoints > 2:
				Globals.addIssixMood(2)
			GM.pc.addSkillExperience("Pet", 5+int(max(goodPoints, 0)))
			addMessage("You've gained "+str(5+int(max(goodPoints, 0)))+ " pet experience points.")
			setState("end_walkies")
		else:
			GM.pc.addSkillExperience("Pet", 5)
			addMessage("You've gained 5 experience points. Also, something went wrong with programming :(")
			setState("end_walkies")

	if _tag == "special_commands_training_complete":
		if _result and _result[0] == true:
			setModuleFlag("IssixModule", "Trained_Pet_Today", true)
		endScene(["force_close"])
		return

	if _tag == "special_bowl_training_complete":
		setModuleFlag("IssixModule", "Trained_Pet_Today", true)
		endScene()
		return

func saveData():
	var data = .saveData()

	data["hasBorrowedMuzzle"] = hasBorrowedMuzzle
	data["hasBorrowedMittens"] = hasBorrowedMittens
	data["goodPoints"] = goodPoints

	return data

func loadData(data):
	.loadData(data)

	hasBorrowedMuzzle = SAVE.loadVar(data, "hasBorrowedMuzzle", false)
	hasBorrowedMittens = SAVE.loadVar(data, "hasBorrowedMittens", false)
	goodPoints = SAVE.loadVar(data, "goodPoints", 0)
