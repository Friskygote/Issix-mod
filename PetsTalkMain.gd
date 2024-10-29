extends SceneBase

func _init():
	sceneID = "PetsTalkScene"

func _run():

	if(state == ""):
		saynn("In front of you - three slaves belonging to Pierre.")
		addButton("Azazel", "Approach Azazel", "azazelmain")
		addButton("Hiisi", "Approach Hiisi", "hiisimain")
		addButton("Lamia", "Approach Lamia", "lamiamain")
		addButton("Leave", "Be on your way", "endthescene")
		
	if(state == "azazelmain"):
		addButton("Talk", "Talk to Azazel", "azazeltalk")
		addButton("Appearance", "Look at Azazel", "azazelappearance")
		if(GM.pc.getInventory().hasItemID("CatnipPlant")):
			saynn("Before you even have the time to approach Azazel, you see his head hovering over his body, his little nose working very hard to track down the source of the curious smell. He looks around with interest, until he sees you approaching. ")
			addButton("Give Catnip", "Give Azazel the catnip", "catnip")
			
	if(state == "catnip"):
		
		setState("azazelmain")
		
	if(state == "azazeltalk"):
		GM.main.setModuleFlag("PierreModule", "Azazel_Catnip_talked", true)
		pass
		
	if(state == "azazelappearance"):
		pass


func _react(_action: String, _args):
	if(_action == "catnip"):
		GM.pc.getInventory().removeXOfOrDestroy("CatnipPlant", 1)
		
	
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
