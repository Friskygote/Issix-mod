extends SceneBase

func _init():
	sceneID = "AzazelCorruption2"

func _run():
	if(state == ""):

		saynn("Lost in the murmur of big hallways you walk towards your goal when you get hit on your chest by a tail, a long leathery red tail ending in a spade. You blink, and realize that the tail you saw is in actuality a regular gray feline tail, you stop in your tracks, confused, looking for tail's owner you follow the trail, finding Azazel lusty look on you.")
		saynn("[say=azazel]What's that in your look? Surprised to see me again outside of the corner?[/say]")
		saynn("[say=pc]Uhh, no, it's just... Ah, forget it.[/say]")
		saynn("He smiles.")
		saynn("[say=azazel]Tell me sweetie, have you ever kissed?[/say]")
		# Plan for the scene
		#
		#

func _react(_action: String, _args):


	if _action == "hot":
		processTime(5*60)
		GM.pc.addLust(30)
		setModuleFlag("IssixModule", "Azazel_Corruption_Scene", 3)


	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
