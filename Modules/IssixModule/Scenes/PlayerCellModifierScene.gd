extends SceneBase

func _init():
	sceneID = "PlayerCellLamiaPortraitScene"

#func _reactInit():
#	endScene()
#	return

func _run():
	if(state == ""):
		saynn("You can choose to put up Lamia's portrait of you in your cell if you so choose.")
		addButton("Put", "Put the portrait on your wall", "putportrait")
		addButton("Don't put", "Don't hang your portrait on the wall (won't ask in the future)", "dontput")
		addButton("Ignore", "Don't do anything with it for now", "endthescene")
		
	if(state == "putportrait"):
		setModuleFlag("IssixModule", "Placed_Portrait_In_Cell", true)
		saynn("You grab your portrait you got from Lamia, find some scraps of a tape in your stash and hang it on the wall. It looks wonderful. Reminds you of a great moment you shared with Lamia... And shows everyone who comes near who's cell it is.")
		addButton("Back", "Job well done", "endthescene")
		
	if state == "dontput":
		setModuleFlag("IssixModule", "Placed_Portrait_In_Cell", false)
		saynn("You grab your portrait you got from Lamia and stash it.")
		addButton("Back", "Job well done", "endthescene")
		
func _react(_action: String, _args):

	if(_action == "endthescene"):
		endScene()
		return
	
	setState(_action)
