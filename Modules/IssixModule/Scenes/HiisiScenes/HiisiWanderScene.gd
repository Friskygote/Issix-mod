extends SceneBase

var pawnID := ""
var pawn = null

func _init():
	sceneID = "HiisiWanderScene1"

func _initScene(_args = []):
	pawnID = _args[0]
	pawn = GlobalRegistry.getCharacter(pawnID)
	GM.main.IS.getPawn(pawnID).setLocation(GM.pc.getLocation())

func resolveCustomCharacterName(_charID):
	if(_charID == "npc"):
		return pawnID

func _run():
	if(state == ""):
		addCharacter("lamia")
		addCharacter(pawnID)
		playAnimation(StageScene.Duo, "stand", {pc="lamia", npc=pawnID})
		saynn("You are walking in the hallway when you notice Lamia striding towards the toilets, you continued walking while you heard whistling coming from where you've seen Lamia just a moment ago, you look at the source.")
		saynn("[say=npc]Look who we have in here, a stranded fox, you know what they say about foxes right? They are all holes.[/say]")
		saynn("Lamia seems unimpressed, looking at the inmate while rolling their eyes.")
		saynn("[say=npc]Come with me, I'll find better place for us two.[/say]")
		saynn("Inmate approaches Lamia and tries grabbing them by the wrist before Lamia swiftly takes their arm away.")
		saynn("[say=npc]Fucking slut, I said COME WITH ME.[/say]")
		saynn("Inmate is getting angry as their paws start fishing for Lamia's body.")
		addButton("Help", "Try to help Lamia", "helplamia")
		addButton("Observe", "Observe the situation from long distance", "observe")

	if state in ["helplamia", "observe"]:
		addCharacter("hiisi")
		playAnimation(StageScene.Duo, "stand", {pc="hiisi", npc=pawnID})
		if state == "helplamia":
			saynn("You start walking towards Lamia as you see the situation is getting heated, however before you come there Hiisi suddenly appears on the scene, you are unsure where did they even come from. He swiftly inserts himself between Lamia and {npc.name} with stern look directed at the inmate.")
		else:
			saynn("You decide to stay where you are and continue looking at unfolding situation from safe distance. You see the inmate throwing punches at Lamia... Until seemingly out of nowhere Hiisi suddenly appears, you are unsure where did they even come from. He swiftly inserts himself between Lamia and {npc.name} with stern look directed at the inmate.")
		saynn("[say=hiisi]Keep those crummy sticks to yourself.[/say]")
		saynn("[say=npc]The fuck? The fox is mine.[/say]")
		saynn("[say=hiisi]Like hell he is, find yourself other target.[/say]")
		saynn("[say=npc]Oh, believe me, I think I just found one.[/say]")
		saynn("{npc.He} spits at the floor while they prepare their arms for a fight, Hiisi stands there as if nothing happened. Lamia simply... Left, towards the bathroom, as if nothing happened.")
		addButton("Continue", "See what happens next", "hiisifight")

	if state == "hiisifight":
		removeCharacter("lamia")
		playAnimation(StageScene.Duo, "kick", {pc="hiisi", npc=pawnID, npcAction="defeat"})
		saynn("The inmate starts swinging {npc.his} fists at Hiisi, who skillfully blocks all of the attacks. Every 3rd attack or so he successfully counters the attack leaving the troublemaking inmate look more and more tired and wasted. The power imbalance between the two is pretty visible from perspective of a viewer, though {npc.name} doesn't seem to realize that yet.")
		if pawn.getSpecies().has("canine"):
			saynn("[say=npc]I despise things like you.[/say]")
		else:
			saynn("[say=npc]Stupid mutt. Should have stayed at your doghouse.[/say]")
		saynn("Hiisi doesn't seem bothered as he masterfully takes down {npc.name} with a kick on their side. {npc.Name} kneels defeated, Hiisi squats next to them.")
		saynn("[say=hiisi]Both me and the fox you tried to have fun with are Master Issix's property. Our Master doesn't like when other inmates play with his property. You must be new here if you didn't know that already, and trust me, you do not want to cross our Master. Now go make some friends and tell them how you've been knocked by mere pets in record time, that will be a fun story to tell.[/say]")
		saynn("{npc.Name} looks angry, though shaken enough not to retort with anything. Hiisi stands up and goes to the bathroom leaving the defeated inmate on the floor.")
		addButton("Leave", "Continue walking your way", "endthescene")

func saveData():
	var data = .saveData()

	data["pawnID"] = pawnID

	return data

func loadData(data):
	.loadData(data)

	pawnID = SAVE.loadVar(data, "pawnID", null)

func getDevCommentary():
	return ""

func hasDevCommentary():
	return false


func _react(_action: String, _args):

	if(_action == "endthescene"):
		setModuleFlag("IssixModule", "Hiisi_Encounter_scene", 2)
		endScene()
		return

	setState(_action)
