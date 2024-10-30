extends SceneBase

func _init():
	sceneID = "GreenhouseCatnip"

func _run():
	if(state == ""):
		saynn("You approach the greenhouses, each one looks like a huge long tent with lots of artificial lights inside. You have to sneak around cause at any moment you can spotted by some guard.")
		
		saynn("This specific station seems to be growing quite a variety of herbs, most of which are unknown to you.")

		saynn("You spotted that the doors to the greenhouse have been left opened. Right behind them you see a familiar plant - catnip.")
		
		saynn("What do you wanna do?")

		addButton("Take catnip", "Sneak in, grab one and get out", "catnip")
		addButton("Don't steal", "Too dangerous", "endthescene")
			
	if(state == "catnip"):
		saynn("You find and cut one of many catnip at the bottom of the stem. Time to leave.")
		
		addButton("Continue", "Try to escape without being seen", "caughtcheck")

func _react(_action: String, _args):
	if(_action == "catnip"):
		GM.main.setModuleFlag("PierreModule", "Azazel_Catnip_taken_today", true)
		
		GM.pc.getInventory().addItem(GlobalRegistry.createItem("CatnipPlant"))
		addMessage("You stole catnip plant.")
	
	if(_action == "caughtcheck"):		
		processTime(10 * 5)
		
		if(RNG.chance(25)):
			if(GM.ES.triggerReact(Trigger.CaughtStealingInGreenhouse)):
				endScene()
				return
		
		addMessage("Seems like you got away safely")
		addButton("Leave", "Leve the crime scene", "endthescene")
		return

	if(_action == "endthescene"):
		endScene()
		return
	
	setState(_action)

# The amount of times I wrote "catnap" instead of "catnip" is insane. Thanks that one horror game franchise.
