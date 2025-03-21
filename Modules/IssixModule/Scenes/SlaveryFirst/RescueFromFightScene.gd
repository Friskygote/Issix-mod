extends SceneBase

const Globals = preload("res://Modules/IssixModule/Globals.gd")

var enemyID := ""
var fightScene: SceneBase = null

func _init():
	sceneID = "RescueFromFight"

func _initScene(_args = []):
	enemyID = _args[0]
	fightScene = _args[1]

func resolveCustomCharacterName(_charID):
	if(_charID == "npc"):
		return enemyID

func _run():
	if(state == ""):  # TODO If enemy is especially powerful summon Issix instead
		playAnimationForceReset(StageScene.Duo, "stand", {pc="hiisi", npc=enemyID, npcAction="stand"})  # TODO Make an animation with 3 people
		addCharacter("hiisi")
		addCharacter(enemyID)
		saynn("Before fight can continue, all of the sudden Hiisi appears on the scene, he looks a little out of breath but either way, he separates you from {npc.name}.")
		saynn("[say=npc]The fuck are you doing here?[/say]")
		saynn("[say=hiisi]None of your business, scram.[/say]")
		saynn("[say=npc]And why should I?[/say]")
		saynn("[say=hiisi]Because the alternative is that you eat shit.[/say]")
		if GlobalRegistry.getCharacter(enemyID).getPersonality().getStat(PersonalityStat.Coward) > 0.2:
			saynn("[say=npc]Fine, your "+boyfriend()+" is not worth a fight anyways.[/say]")
			saynn("{npc.Name} leaves the place. Hiisi leads him with his eyes before turning back to you.")
			saynn("[say=hiisi]Everything fine? Sorry for being late.[/say]")
			addButton("Fine", "Tell Hiisi you are fine", "sayfine")
			addButton("Been better", "Tell Hiisi you've been better", "saybetter")
			if GM.pc.getPain() > 50:
				addButton("Hurt", "Tell Hiisi you've been hurt", "sayhurt")
			else:
				addDisabledButton("Hurt", "You are not hurt badly enough to mention being hurt")
		else:
			saynn("[say=npc]Oh, you sure about that? Try me bitch.[/say]")
			saynn("{npc.He} raises his fist readying to fight. Hiisi gestures you to go away.")
			addButton("Observe", "Observe from a distance", "fightalone")
			addButton("Push Hiisi", "Tell Hiisi that you've got this and he doesn't have to be doing this", "fightpc")
			addButton("Leave", "Let the experienced canine handle this", "leave")

	if state == "sayfine":
		playAnimation(StageScene.Duo, "stand", {pc="hiisi", npc="pc", npcAction="stand"})
		saynn("[say=pc]I'm fine, thank you Hiisi.[/say]")
		saynn("[say=hiisi]Don't mention it, we need to stick together. I'll go, don't get into trouble again.[/say]")
		saynn("[say=pc]Can't promise.[/say]")
		addButton("Leave", "Leave as well", "endthescene")

	if state == "saybetter":
		playAnimation(StageScene.Duo, "stand", {pc="hiisi", npc="pc", npcAction="stand"})
		saynn("[say=pc]Eh, I've been better.[/say]")
		saynn("[say=hiisi]Hmm, are you hurt? Do you need help?[/say]")
		saynn("[say=pc]No, no, not really. Thanks Hiisi, you saved by hide there.[/say]")
		saynn("[say=hiisi]Don't mention it, we need to stick together. I'll go, don't get into trouble again.[/say]")
		saynn("[say=pc]Can't promise.[/say]")
		addButton("Leave", "Leave as well", "endthescene")

	if state in ["sayhurt", "after_fight_lost"]:
		playAnimation(StageScene.Duo, "kneel", {pc="hiisi", npc="pc", npcAction="kneel"})
		if state == "sayhurt":
			saynn("[say=pc]Actually, I think I might need some medical attention, I've been bruised pretty badly.[/say]")
			saynn("[say=hiisi]Shit, show.[/say]")
			saynn("You show the canine damage on your body, hissing when he touches a place on your "+Globals.getSkinWord()+".")
		else:
			saynn("[say=hiisi]Let me take a look at you...[/say]")
		if GM.pc.hasEffect(StatusEffect.Wounded):  # TODO Do that only when there is direct path to medical, check with shit

			saynn("[say=hiisi]You are looking really bad, we will have to get you out of here. Follow m- actually, nevermind, let me hold you.[/say]")
			if GM.pc.isVisiblyPregnant():
				saynn("Canine picks up your entire body, taking extra care not to hurt your offspring, as he moves you towards the infirmary.")
			else:
				saynn("Canine picks up your entire body and takes you to the infirmary.")
			addButton("Infirmary", "See what happens next", "infirmary")
		else:
			saynn("[say=hiisi]Pretty bad, but I have just a thing.[/say]")
			saynn("{hiisi.He} takes a sort of a small bottle with long nozzle as he moves it closer to places that are hurting you. A few drops of some strange liquid later and him massaging the place you feel much better, not feeling much actually. He also gives you a pill that you take to further deal with the pain.")
			saynn("[say=hiisi]How is that?[/say]")
			saynn("[say=pc]Better, thank you, I don't know what's this but it's pretty magic.[/say]")
			saynn("[say=hiisi]Just some next level medicine, can't heal deep wounds but bruises you've had are easy to deal with. You can stand right?[/say]")
			saynn("[say=pc]Yeah, no problem.[/say]")
			saynn("[say=hiisi]Good. Feel free to come back to the harem if you need further help, alright?[/say]")
			saynn("[say=pc]Yup, thanks again![/say]")
			saynn("Canine simply leaves you as he moves back towards the corner.")
			addButton("Leave", "Leave as well", "endthescene")

	if state in ["fightalone", "fightalonedefeat"]:
		playAnimation(StageScene.Duo, "throw", {pc="hiisi", npc=enemyID, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		if state == "fightalone":
			saynn("You decide to observe Hiisi's fight from the distance.")
		else:
			saynn("You watch how Hiisi approaches the victorious inmate.")
		saynn("[say=hiisi]You will learn that Issix's pets can fight back.[/say]")
		saynn("[say=npc]You are fucking full of it.[/say]")
		saynn("[say=hiisi]You'll change your tune.[/say]")
		saynn("They continue fighting, at the end, Hiisi emerges victorious sending many punches towards {npc.name} and having no problem taking them down. The difference in power was quite significant.")
		saynn("[say=npc]Fuck. Fine. Just leave me fucking be.[/say]")
		saynn("[say=hiisi]Learn the smell of my Master and avoid his pets next time, fucker.[/say]")
		saynn("[say=npc]Ugh...[/say]")

		if state == "fightalonedefeat" and (GM.pc.getPain() > 50 or GM.pc.hasEffect(StatusEffect.Wounded)):
			saynn("Hiisi turns to you.")
			addButton("Continue", "Continue", "after_fight_lost")
		else:
			saynn("Hiisi leaves like that the inmate on {npc.his} knees recovering {npc.himself}")
			saynn("[say=hiisi]Hey {pc.name}, everything alright?[/say]")
			saynn("[say=pc]Yeah, I'm alright.[/say]")
			saynn("[say=hiisi]You can walk right?[/say]")
			saynn("[say=pc]Yeah.[/say]")
			saynn("[say=hiisi]Great, I'll be on my way, Stay out of trouble.[/say]")
			saynn("[say=pc]Thank you Hiisi.[/say]")
			addButton("Leave", "Leave", "endthescene")  # TODO Expand

	if state == "fightpc":
		saynn("[say=pc]Hey Hiisi, don't worry, I can handle this.[/say]")
		if GM.pc.hasEffect(StatusEffect.Wounded):
			saynn("[say=hiisi]No way I'm letting you, you are badly wounded, you are not going anywhere except the infirmary.[/say]")
			saynn("[say=pc]No, really I ca-[/say]")
			saynn("[say=hiisi]Shut the fuck up and watch, do not move, lay on the ground.[/say]")
			saynn("Hiisi is having none of that, he makes you lay on the ground and wait for him to finish the fight.")
			addButton("Wait", "Can't do much other than let the canine fight", "fightalonedefeat")
		else:
			saynn("[say=hiisi]Are you absolutely positive you can handle this?[/say]")
			saynn("[say=pc]Yes, I'm.[/say]")
			saynn("[say=hiisi]*sigh* Fine, go at it.[/say]")
			saynn("He steps aside so you can continue fighting.")
			addButton("Continue", "Resume the fight", "resumefight")

	if state == "hiisi_congratulates":
		saynn("[say=hiisi]Good job. I'll go now.[/say]")
		saynn("[say=pc]You observed?[/say]")
		saynn("[say=hiisi]Just making sure you are not in trouble.[/say]")
		saynn("[say=pc]... Thanks.[/say]")
		saynn("He waves at you as he continues slowly walking towards the harem. You are now free to do with {npc.name} as you wish.")
		addButton(GlobalRegistry.getCharacter(enemyID).getName(), "See what you can do with them", "endthescene")

	if state == "hiisi_takesover":
		saynn("[say=hiisi]Let me take this over alright? Have some rest.[/say]")
		saynn("Says Hiisi as he prepares to finish the job with the inmate.")
		addButton("Watch", "Watch what happens next", "fightalonedefeat")

	if state == "leave":
		saynn("You decide to leave the fight to a more experienced fighter, you are pretty sure Hiisi can handle it.")
		addButton("Leave", "Leave the fight scene", "endthescene")

	if state == "infirmary":
		playAnimation(StageScene.Duo, "stand", {npc="eliza", npcAction="stand"})
		aimCameraAndSetLocName("med_lobbymain")
		addCharacter("eliza")

		saynn("You arrive in the medical lobby seeing Eliza.")
		saynn("[say=hiisi]Good day, I need help with {pc.Name}, they are badly hurt.[/say]")
		saynn("[say=eliza]And where does it hurt?[/say]")

		saynn("[say=pc]Inside.[/say]")

		saynn("[say=eliza]Alright, can you walk by yourself?[/say]")
		saynn("[say=pc]I think so.[/say]")
		saynn("[say=eliza]Alright, come with me then. Inmate number {hiisi.inmateNumber}, you can now leave, I'll take care of this. As for the payment, your Master I'm sure will cover.[/say]")
		saynn("[say=hiisi]Of course, Eliza. You are in good paws {pc.name}, come to our corner later, okey? Good luck.[/say]")
		saynn("[say=pc]Thanks Hiisi.[/say]")

		saynn("Eliza clips leash to your collar and leads you to the lab.")
		addButton("Continue", "", "cryopodtreatment")

	if state == "cryopodtreatment":
		playAnimation(StageScene.Cryopod, "idle", {bodyState={naked=true}})
		aimCameraAndSetLocName("med_researchlab")
		if getModuleFlag("MedicalModule", "Medical_FirstTimeHealedHappened"):
			saynn("You step after Eliza until you arrive at the lab, Eliza unclasps your leash and begins to tap on machines keyboard, preparing it for your session.")
		else: #TODO Expand?
			saynn("You eventually arrive in large sterile room with large amount of expensive equipment around. {eliza.She} unclasps your leash and begins to tap on machines keyboard, preparing it for your session. You watch with amazement the huge machinery and advanced medical technology for healing, a large glass tube just existing there in size that you could definitely fit in.")

		if !GM.pc.isFullyNaked():
			saynn("[say=eliza]Please strip down, you do not need clothes.[/say]")
			saynn("You strip down your clothes, the wound now all visible, it stings a bit and you bleed in non insignificant amounts.")

		saynn("[say=eliza]Okey, it's ready, please step into the cryopod, put on the mask. I'll take care of the rest.[/say]")

		saynn("You follow Eliza's instructions and soon you are surrounded by thick glass as the glass enclosure finally closes trapping you inside. The air you breathe through the mask feels clean, it lack that sterile smell that you've been sniffing just few seconds ago. You can hear muffled Elyze talking to you.")
		if getModuleFlag("MedicalModule", "Medical_FirstTimeHealedHappened"):
			saynn("[say=eliza]You know the drill by now. I'll be back when the cycle finishes.[/say]")
		else:
			saynn("[say=eliza]Okey, now just rest, don't worry about the liquid, keep the mask on and let the body recover, I'll be back when the cycle finishes.[/say]")

			saynn("The pod fills to the brim with strange liqud until you are fully submerged and floating. Soon enough, your consciousness fades and you stop tracking what's happening.")

		addButton("Continue", "", "cryopodend")

	if state == "cryopodend":
		playAnimation(StageScene.Duo, "stand", {npc="eliza", npcAction="stand"})
		aimCameraAndSetLocName("med_nearlab")
		GM.pc.setLocation("med_nearlab")
		saynn("Eventually you become aware of the world around you again as the liquid that you were just submerged in drained away. You stood on your legs again, feeling your heavy body again, taking off the mask as the liquid was below your waist now. You can barely hear Eliza through your ears - still full of the liquid.")
		saynn("[say=eliza]That would be 2 hours, the cycle is complete and the wound you had is looking fine. One last check and you are free to go.[/say]")
		saynn("After short draining and drying session the glass enclosure opens and you walk out. Eliza walks to you with some kind of scanner that is pointed at the place where you were wounded.")
		saynn("[say=eliza]Seems everything is okey, the healing process removed the nasty cut, this means you are free to go now. Don't get into trouble again.[/say]")
		saynn("[say=pc]Thank you, Doctor.[/say]")
		saynn("[say=eliza]You’re welcome~.[/say]")
		saynn("You are led to the corridor and let go.")
		addButton("Leave", "Leave", "endthescene")


func boyfriend():
	match GM.pc.getGender():
		Gender.Male:
			return "boyfriend"
		Gender.Female:
			return "girlfriend"
		_:
			return "lover"

func cleanupFight():

	var pawn:CharacterPawn = GM.main.IS.getPawn("pc")
	var interaction:PawnInteractionBase = pawn.getInteraction()
	if interaction != null and interaction.id == "GenericAttack":
		var pawn_ids = interaction.getInvolvedPawnIDs()
		pawn_ids.erase("pc")
		var pawn_to_handle = GM.main.IS.getPawn(pawn_ids[0])
		pawn_to_handle.satisfyAnger()
		pawn_to_handle.makeExhausted()
		interaction.stopMe()  # Force stop interaction with no gains
		if is_instance_valid(fightScene) and fightScene:
			fightScene.parentSceneUniqueID = -1  # Nullify previous scene so the react is sent nowhere
			GM.main.removeScene(fightScene)  # Remove fighting scene as if it never happened

func continueFight():  # Hijack parent of FightScene, reorder scene order (so our scene is parent of fight scene, change so Hiisi doesn't interrupt and rerun fighting scene)
	removeCharacter("hiisi")
	var ourCurrentScene = GM.main.sceneStack.pop_back()  # Remove our current scene from the SceneStack and save its reference to a variable
	fightScene.parentSceneUniqueID = ourCurrentScene.uniqueSceneID  # Change parent scene of fightScene so we get a callback when FightScene is over
	ourCurrentScene.parentSceneUniqueID = GM.main.sceneStack[-2].uniqueSceneID  # Set our parent scene to WorldScene, not needed but makes things neat I guess?
	GM.main.sceneStack.insert(GM.main.sceneStack.size()-1, ourCurrentScene)  # Reorder stack scene, move this scene to be between WorldScene and FightScene
	GM.main.sceneStack.back().sceneTag = "interaction_fight_pcdef_hijacked"  # So GameExtender doesn't hijak the scene once again
	GM.main.sceneStack.back().setState("fighting")
	GM.main.sceneStack.back().whatPlayerDid = ""
	GM.main.sceneStack.back().whatEnemyDid = ""
	GM.main.sceneStack.back().whatHappened = ""
	GM.main.reRun()

func supportsShowingPawns() -> bool:
	return true

func saveData():
	var data = .saveData()

	data["enemyID"] = enemyID
	#warning-ignore:incompatible_ternary
	data["fightScene"] = fightScene.uniqueSceneID if is_instance_valid(fightScene) else null

	return data

func loadData(data):
	.loadData(data)

	enemyID = SAVE.loadVar(data, "enemyID", null)
	var fight_scene_maybe = SAVE.loadVar(data, "fightScene", null)
	if fight_scene_maybe:
		fightScene = GM.main.getSceneByUniqueID(fight_scene_maybe)  # We might need to find the ID of this one
	else:
		for scene in GM.main.sceneStack:
			if scene.sceneID == "FightScene":
				fight_scene_maybe = scene.uniqueSceneID
		if fight_scene_maybe == null:  # Fail safe
			endScene()
			return
		fightScene = GM.main.getSceneByUniqueID(fight_scene_maybe)

func _react_scene_end(_tag, _result):
	if(_tag == "interaction_fight_pcdef_hijacked"):
		addCharacter("hiisi")
		var battlestate = _result[0]
		var parent_scene = GM.main.sceneStack[-2]
		var ignore_func_calls := false
		if parent_scene == null or parent_scene.sceneID != "WorldScene":
			ignore_func_calls = true
		if(battlestate == "win"):
			if !ignore_func_calls:
				parent_scene.sendStatusToInteraction({"won":false})
			setState("hiisi_congratulates")
		else:
			# Nullify the interaction
			var pawn:CharacterPawn = GM.main.IS.getPawn("pc")
			var interaction:PawnInteractionBase = pawn.getInteraction()
			interaction.stopMe()
			setState("hiisi_takesover")

func _react(_action: String, _args):
	if _action == "cryopodtreatment":
		processTime(8*60)

	if _action == "cryopodend":
		processTime(120*60)
		GM.pc.afterCryopodTreatment()

	if _action == "infirmary":
		GM.pc.setLocation("med_lobbymain")
		processTime(15*60)

	if _action in ["sayfine", "saybetter", "sayhurt", "fightalone", "leave", "hiisi_takesover"]:
		processTime(3*60)
		cleanupFight()

	if _action == "resumefight":
		continueFight()

	if _action in ["sayhurt", "after_fight_lost"]:
		if !GM.pc.hasEffect(StatusEffect.Wounded):
			GM.pc.addPain(-35)
			GM.pc.addIntoxication(0.15)
		processTime(5*60)

	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
