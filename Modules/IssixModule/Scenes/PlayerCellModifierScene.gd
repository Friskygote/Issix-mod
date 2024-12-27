extends SceneBase

func _init():
	sceneID = "PlayerCellLamiaPortraitScene"

#func _reactInit():
#	endScene()
#	return

func _run():
	if(state == ""):
		saynn("You can choose to put artwork on the wall of your cell if you'd like to.")
		if (getModuleFlag("IssixModule", "Lamia_Chosen_Drawing") == "simplepc" and getModuleFlag("IssixModule", "PC_Saw_Artwork_At_Lamias", null) == false):
			addButton("Put artwork", "Put your simplistic artwork enchanted by Lamia on your wall", "putsimple")
		if getModuleFlag("IssixModule", "Received_Portrait_From_Lamia", false):
			addButton("Put artwork", "Put the portrait on your wall", "putportrait")
			addButton("Don't put", "Don't hang your portrait on the wall (won't ask in the future)", "dontput")
			addButton("Ignore", "Don't do anything with it for now", "endthescene")
		
	if state == "putsimple":
		saynn("You grab the piece of paper with your artwork on it, find a tape in your stash and hang it on the wall. It will remind you of your old place.")
		addButton("Back", "Job well done", "endthescene")

	if(state == "putportrait"):
		saynn("You grab your portrait you got from Lamia, find some scraps of a tape in your stash and hang it on the wall. It looks wonderful. Reminds you of a great moment you shared with Lamia... And shows everyone who comes near who's cell it is.")
		addButton("Back", "Job well done", "endthescene")
		
	if state == "dontput":
		saynn("You grab your portrait you got from Lamia and stash it.")
		addButton("Back", "Job well done", "endthescene")
		
func _react(_action: String, _args):
	if _action == "dontput":
		setModuleFlag("IssixModule", "Placed_Portrait_In_Cell", false)

	if _action == "putportrait":
		setModuleFlag("IssixModule", "Placed_Portrait_In_Cell", true)

	if _action == "putsimple":
		setModuleFlag("IssixModule", "PC_Saw_Artwork_At_Lamias", true)

	if(_action == "endthescene"):
		endScene()
		return
	
	setState(_action)
