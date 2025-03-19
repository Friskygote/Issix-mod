extends SceneBase

const Globals = preload("res://Modules/IssixModule/Globals.gd")

func _init():
	sceneID = "LamiaStoryScene1"

func _initScene(_args = []):  # When coming into harem tile
	pass

# func resolveCustomCharacterName(_charID):
# 	if(_charID == "npc"):
# 		return pawnID

func _run():
	if(state == ""):
		addCharacter("lamia")
		saynn("As you move near Issix's corner, you see Lamia hailing you over.")
		addButton("Come", "Come to Lamia", "start_scene")
		addButton("Later", "Choose to come later", "endthescene_early")
		
	if state == "start_scene":
		saynn("You approach Lamia and sit next to them on their blanket as instructed.")
		
		saynn("[say=pc]Hey Lamia, is something wrong?[/say]")
		saynn("Shaking his head he takes 4-5 drawings along with something else. It's a dried plant of some sorts. The artwork depicts various similar plants.")
		saynn("[say=pc]Huh, what are those?[/say]")
		saynn("A voice from behind you speaks.")
		saynn("[say=hiisi]Medicinal plants, and a few others.[/say]")
		saynn("[say=pc]Hmm, what about them?[/say]")
		saynn("[say=hiisi]Lamia wants some. He had experience with making medicine from them before he ended in prison.[/say]")
		saynn("[say=pc]I see. The drawings are pretty detailed.[/say]")
		saynn("[say=hiisi]Lamia found the now withered plant on the floor near the elevator, he is now convinced that those grow in the prison because apparently the plant wouldn't be in such a great state if it was imported.[/say]")
		saynn("[say=pc]Mhm.[/say]")
		saynn("[say=hiisi]But there is only once place where this prison grows any plants.[/say]")
		saynn("Lamia lowers his head dejected.")
		saynn("[say=pc]Greenhouses?[/say]")
		saynn("[say=hiisi]Greenhouses.[/say]")
		saynn("[say=pc]Maybe staff at medical would be willing to help? Or why not just get to greenhouses.[/say]")
		saynn("[say=hiisi]Staff is no help. And greenhouses are off-limits to us. Lamia wanted me to go looking for those but Master is clear that we want no trouble from the guards.[/say]")
		saynn("[say=pc]I see. Well, I don't think I'd mind to look for them... Isn't that what you wanted to ask me Lamia?[/say]")
		saynn("Lamia's attention is immediately caught and he nods, aggressively.")
		saynn("[say=pc]Then sure, I can try.[/say]")
		if Globals.checkIfPCEnslaved():
			saynn("Hiisi looks all over your body.")
			
			if GM.pc.getStat(Stat.Strength) < 15:
				saynn("[say=hiisi]Look, I don't think it's a good idea, if guard spots you - they may attack you. That's in addition to making trouble for Master. And how will you even fight? There is not a muscle in your body.[/say]")
				if GM.pc.getState(Stat.Sexiness) > 20:
					saynn("[say=pc]Don't you worry Hiisi, there are more forces in the world to fight with other than just simple strength/[/say]")
					saynn("Hiisi rolls his eyes.")
					saynn("[say=hiisi]Fine, I guess.[/say]")
				else:
					saynn("[say=pc]I'm sure I can figure something out.[/say]")
					saynn("[say=hiisi]This is NOT reassuring {pc.name}. You are not going there.[/say]")
					saynn("[say=pc]Hiisi! It will be fine, I promise. I've been there countless times.[/say]")
					saynn("[say=hiisi]... Eh. What makes you think it will be fine today too?[/say]")
					saynn("[say=pc]Comes from experience.[/say]")
					saynn("[say=hiisi]Well, if you so much want to get hurt for some plants then go for it. Remember, I warned you.[/say]")
					saynn("[say=pc]Thank you, Hiisi.[/say]")
					saynn("[say=hiisi]Mph.[/say]")
					saynn("He turns around.")
			else:
				saynn("[say=hiisi]Well, you do have some muscles...[/say]")
				saynn("He thinks for a while.")
				saynn("[say=hiisi]This could work, assuming you don't get into trouble.[/say]")
				saynn("[say=pc]I won't![/say]")
		else:
			pass
				
					
		
		
# 
# func saveData():
# 	var data = .saveData()
# 
# 	data["pawnID"] = pawnID
# 
# 	return data
# 
# func loadData(data):
# 	.loadData(data)
# 
# 	pawnID = SAVE.loadVar(data, "pawnID", null)

func getDevCommentary():
	return ""

func hasDevCommentary():
	return false


func _react(_action: String, _args):
	if _action == "endthescene_early":
		endScene()
		return

	if(_action == "endthescene"):
		setModuleFlag("IssixModule", "Lamia_Encounter_scene", 2)
		endScene()
		return

	setState(_action)
