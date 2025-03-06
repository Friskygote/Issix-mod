extends SceneBase

func _init():
	sceneID = "GreenhouseCatnip"

func _run():
	if(state == ""):
		if GM.main.getModuleFlag("IssixModule", "Azazel_Catnip_noticed", false) == false:
			saynn("Curious, you begin investigating. You have to sneak around cause at any moment you can spotted by some guard.")

			saynn("This specific station seems to be growing quite a variety of herbs, most of which are unknown to you.")

			saynn("You spotted that the doors to the greenhouse have been left opened. Right behind them you see a familiar plant - catnip.")

			saynn("What do you wanna do?")

			addButton("Take catnip", "Sneak in, grab one and get out", "catnip", [GlobalRegistry.createItem("CatnipPlant")])
			addButton("Don't steal", "Too dangerous", "endthescene")
			
		else:
			saynn("While staring at plethora of different plants, you recognize one in particular - white flowers and specific smell. Catnip!")
			saynn("You find and cut one of many catnip at the bottom of the stem. Time to leave.")

			addButton("Continue", "Try to escape without being seen", "caughtcheck", [GlobalRegistry.createItem("CatnipPlant")])

	if state == "catnip":
		saynn("While staring at plethora of different plants, you recognize one in particular - white flowers and specific smell. Catnip!")
		saynn("You find and cut one of many catnip at the bottom of the stem. Time to leave.")

		addButton("Continue", "Try to escape without being seen", "caughtcheck")

	if state == "caughtcheck":
		addMessage("Seems like you got away safely")
		addButton("Leave", "Leave the crime scene", "endthescene")


func _react(_action: String, _args):
	if _args:
		GM.pc.getInventory().addItem(_args[0])
		addMessage("You stole catnip plant.")

	if(_action == "catnip"):
		GM.main.setModuleFlag("IssixModule", "Azazel_Catnip_noticed", true)
	
	if(_action == "caughtcheck"):
		GM.main.setModuleFlag("IssixModule", "Azazel_Catnip_taken_today", true)
		processTime(10 * 5)
		
		if(RNG.chance(20)):
			if(GM.ES.triggerReact(Trigger.CaughtStealingInGreenhouse)):
				endScene()
				return

	if(_action == "endthescene"):
		endScene()
		return
	
	setState(_action)

# The amount of times I wrote "catnap" instead of "catnip" is insane. Thanks that one horror game franchise.
