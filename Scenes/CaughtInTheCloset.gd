# Based off https://github.com/Alexofp/BDCC/blob/3c1dc5f933c54971a60687abf539f8e0a3d15f7f/Modules/MedicalModule/NurseCaughtOfflimitsScene.gd

extends SceneBase

var npcID = ""
var sawBefore = false
var npcVariation = ""
var foundIllegalItems = false

func _init():
	sceneID = "ClosetCaughtOfflimitsScene"

func _initScene(_args = []):
	npcID = NpcFinder.grabNpcIDFromPoolOrGenerate(CharacterPool.Engineers, [], EngineerGenerator.new(), {NpcGen.Level: 30})
	var npc = GlobalRegistry.getCharacter(npcID)

	if(npc.getFlag(CharacterFlag.Introduced)):
		sawBefore = true
	else:
		npc.setFlag(CharacterFlag.Introduced, true)

	var personality:Personality = npc.getPersonality()
	if(personality.getStat(PersonalityStat.Mean) > 0.3 || personality.getStat(PersonalityStat.Subby) < -0.6):
		npcVariation = "mean"
	if(personality.getStat(PersonalityStat.Mean) < -0.3):
		npcVariation = "kind"
	if(personality.getStat(PersonalityStat.Subby) > 0.6 || personality.getStat(PersonalityStat.Coward) > 0.8):
		npcVariation = "subby"

func resolveCustomCharacterName(_charID):
	if(_charID == "npc"):
		return npcID

func _run():
	if(state == ""):
		addCharacter(npcID)
		playAnimation(StageScene.Duo, "stand", {npc=npcID})

	if(state == ""):
		# (new guard)
		saynn("You suddenly hear the doors just behind you opening, slight breeze of air hitting your back.")
		if(!sawBefore):
			saynn("[say=npc]Huh? How did you get in here? You are not supposed to be here, inmate![/say]")
		# (old guard)
		else:
			saynn("[say=npc]Huh? Hey, I do recognize you! Inmate number {pc.inmateNumber}! I don't know how you got here but you are not supposed to be here.[/say]")
			# (end)

		saynn("You turn towards {npc.him} and see {npc.him} hitting their other paw with the wrench, looking at you with anger.")

		addButton("Attack", "No way to run, might as well fight", "attack")
		addButton("Offer body", "Maybe you can try to seduce them", "offer_body")

	if(state == "attack"):

		saynn("You lash out at {npc.name}! {npc.He} lifts up {npc.his} wrench in anticipation.")
		if !GM.pc.isFullyNaked():
			saynn("[say=npc]Better start emptying your pockets.[/say]")
		else:
			saynn("[say=npc]Drop everything you got in here to the ground, not that you'll have any use of it anyways.[/say]")

		addButton("Fight", "Start the fight", "startfight")



	if(state == "if_lost"):
		saynn("You collapse, unable to continue fighting.")

		# (default)
		if(npcVariation != "mean"):
			saynn("[say=npc]Attacking me wasn’t such a smart idea, was it?[/say]")

		# (if mean)
		else:
			saynn("[say=npc]That’s what I thought, bitch.[/say]")

		#saynn("{npc.He} goes through your things and confiscates anything illegal.")
		saynn("{npc.He} kneels near you.")

		saynn("[say=npc]And now it’s time to have some fun with you.[/say]")

		saynn("Since you can’t really fight back anymore, your only choice is to submit.")

		# (sex)
		addButton("Get fucked", "Well, you lost", "startsexsubbyforced")


	if(state == "if_won"):
		saynn("You pin the defeated engineer to the floor. {npc.He} doesn’t seem to struggle much.")

		saynn("[say=npc]And now what?[/say]")

		# (Options are sex or leave them be, Inventory, Struggle)

		# (Need everything to be free to fuck)

		addWonButton()

	if(state == "offer_body"):
		saynn("Hoping that the engineer will overlook your little escapade to the closet you start showing off your {pc.masc} curves.")

		if GlobalRegistry.getCharacter(npcID).hasPenis():
			saynn("[say=pc]Perhaps you'd be interested in using your other wrench?[/say]")
		else:
			saynn("[say=pc]Are you maybe interested in having a piece of me, without too much violence?[/say]")


		if GM.main.RS.getLust("pc", npcID) > 0.2:
			saynn("{npc.He} checks you out")

			saynn("[say=npc]Alright, I like this idea, show me what you've got there.[/say]")

			addButton("Get fucked", "Let them have it", "startsexsubby")
		else:
			saynn("{npc.He} checks you out and shakes {npc.his} head.")

			saynn("[say=npc]No way, slut. You are getting your butt kicked today[/say]")

			addButton("Fight", "They are not letting you off the hook so easily", "startfight")


	if(state == "after_sex" || state == "after_sex_won"):
		saynn("After the fun time ends, the engineer opens one of the cabinets, picks up thing they need and leave.")

		saynn("[say=npc]You gave me a good fuck so as a present you can stay here, but don't fuck anything up or I'll rough you up next time.[/say]")

		# (scene ends)
		addButton("Continue", "Moving on", "endthescene")

	if state == "after_sex_forced":
		saynn("[say=npc]At least I got a good fuck out of it. Now begone.[/say]")

		saynn("The engineer not wanting to risk you rummaging through the closet kicked you out and forcefully dragged you out of the off-limits zone.")

		GM.pc.setLocation("eng_bay_corridor")
		aimCameraAndSetLocName("eng_bay_corridor")
		if getModuleFlag("IssixModule", "Quest_Status") == 2:
			addButton("Continue", "You've been kicked out of the closet, you should probably go there some other time", "endthesceneout")
		elif getModuleFlag("IssixModule", "Quest_Status") == 3:
			addButton("Continue", "You've been kicked out of the closet, but you've got what you needed from there anyways", "endthesceneout")
		else:
			addButton("Continue", "You've been kicked out of the closet", "endthesceneout")

	if(state == "after_sex"):
		GM.ES.triggerRun(Trigger.AfterSexWithDynamicNPCThatWon, [npcID])

	if(state == "after_sex_won"):
		GM.ES.triggerRun(Trigger.AfterSexWithDefeatedDynamicNPC, [npcID])


func addWonButton():
	addButton("Continue", "Kick them out of the closet and close the doors", "endthescene")
	addDisabledButton("Sex!", "You decide it's not the best idea here, just a matter of time until other engineers come look for you")
	addButton("Inventory", "Look at your inventory", "openinventory")
	if(GM.pc.getInventory().hasRemovableRestraints()):
		addButton("Struggle", "Struggle out of your restraints", "strugglemenu")
	GM.ES.triggerRun(Trigger.DefeatedDynamicNPC, [npcID])

func _react(_action: String, _args):

	if(_action == "endthesceneout"):
		endScene(['out'])
		return

	if _action == "endthescene":
		endScene(['closet'])
		return

	if(_action == "startfight"):
		runScene("FightScene", [npcID], "guardfight")  # I wish I could affect more how this specific fight goes. I feel like at this point the player is rather powerful in the attacks, the game doesn't seem to scale it very well IMO. '

	if(_action == "startsexsubby"):
		getCharacter(npcID).prepareForSexAsDom()
		GlobalRegistry.getCharacter(npcID).addPain(-50)
		runScene("GenericSexScene", [npcID, "pc"], "subbysex")

	if _action == "startsexsubbyforced":
		getCharacter(npcID).prepareForSexAsDom()
		GlobalRegistry.getCharacter(npcID).addPain(-50)
		runScene("GenericSexScene", [npcID, "pc"], "subbysexforced")

	if(_action == "openinventory"):
		runScene("InventoryScene")
		return

	if(_action == "strugglemenu"):
		runScene("StrugglingScene")
		return

	setState(_action)


func _react_scene_end(_tag, _result):
	if _tag == "subbysex":
		setState("after_sex")

	if _tag == "subbysexforced":
		setState("after_sex_forced")

	if(_tag == "guardfight"):
		processTime(20 * 60)
		var battlestate = _result[0]
		#var wonHow = _result[1]

		if(battlestate == "win"):
			setState("if_won")
			addExperienceToPlayer(30)
		else:
			setState("if_lost")
			addExperienceToPlayer(5)

			#GM.pc.getInventory().removeItemsList(GM.pc.getInventory().getItemsWithTag(ItemTag.Illegal))
			#GM.pc.getInventory().removeEquippedItemsList(GM.pc.getInventory().getEquippedItemsWithTag(ItemTag.Illegal))

func saveData():
	var data = .saveData()

	data["npcID"] = npcID
	data["sawBefore"] = sawBefore
	data["npcVariation"] = npcVariation
	data["foundIllegalItems"] = foundIllegalItems

	return data

func loadData(data):
	.loadData(data)

	npcID = SAVE.loadVar(data, "npcID", "")
	sawBefore = SAVE.loadVar(data, "sawBefore", false)
	npcVariation = SAVE.loadVar(data, "npcVariation", "")
	foundIllegalItems = SAVE.loadVar(data, "foundIllegalItems", false)
