# Originally written by Rahi at https://github.com/Alexofp/BDCC/blob/main/Scenes/Cellblock/EatInCanteenScene.gd

extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "EatInCanteenScene"

func _run():
	if(state == ""):
		playAnimation(StageScene.Solo, "sit")
		
		saynn("You get into the queue and wait. The canteen is always busy with hungry inmates, some sit alone but you spot quite a few groups too.")
		
		saynn("Finally you approach the counter. Behind it is a kitchen with a few cooks doing their job. A thick window blocks inmates from getting in.")

		if getModuleFlag("IssixModule", "Taught_To_Use_Bowl") == true:
			saynn("You pull out your pet bowl with your name on it and try your luck. You push it through the small window through which all inmates get their plate, and hope for luck.")

			saynn("To your surprise, after being ready for total failure the staff behind gets the hint and a bowl with grey paste is pushed back, instead of regular plate. You take it up to the spotted empty table, take a seat and decide whether to bother with this food or not.")
		else:
			saynn("The menu is not that huge, there is no menu actually, the only thing inmates get are some kind of grey paste on a plate.")

			saynn("You take the offered plate and a basic spoon. Then you look around and spot an empty table. You take a sit and begin to ponder if you're hungry enough.")

		addButton("Eat it", "Yummy", "doeat")
		addButton("Don't eat", "Yuck", "donteat")

			
	if(state == "doeat"):
		saynn("You take your time consuming the paste, it's practically tasteless but it's better than nothing.")
		if getModuleFlag("IssixModule", "Taught_To_Use_Bowl") == true:
			saynn("You wish the paste became the gelatinous things that your Master feeds his pets, it's tastier than whatever this is.")

		addButton("Continue", "Stand up and continue on your way", "endthescene")
		GM.ES.triggerRun(Trigger.EatingInCanteen)
		
	if(state == "donteat"):
		if getModuleFlag("IssixModule", "Taught_To_Use_Bowl") == true:
			saynn("You clean your bowl out of the grey paste instead, deciding being hungry is better than eating this.")
		else:
			saynn("You leave the plate without taking a single bite.")
		
		addButton("Continue", "Leave", "endthescene")
		GM.ES.triggerRun(Trigger.EatingInCanteen)

func _react(_action: String, _args):
	if(_action == "doeat"):		
		GM.pc.afterEatingAtCanteen()
		processTime(60 * 5)
		
		setFlag("Canteen_PlayerAteToday", true)
		
		if(GM.ES.triggerReact(Trigger.EatingInCanteen)):
			endScene()
			return
		
		addMessage("You got an energy boost and don't feel as hungry anymore.")


	if(_action == "endthescene"):
		endScene()
		return
	
	setState(_action)

func getSceneCreator():
	return "Rahi, Frisk"
