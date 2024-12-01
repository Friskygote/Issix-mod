extends SceneBase

func _init():
	sceneID = "SlaveryInfoScreen"

func _run():
	if(state == ""):
		playAnimation(StageScene.Duo, "kneel", {npc="issix", npcAction="stand"})
		saynn("Your slave role: "+IssixModule.getPlayerRole())
		saynn("Your training: "+trainingCheck())
		saynn("Master's mood: "+getMood())
		saynn("Issix's slave for "+str(getDays())+" days")
		match GM.main.getModuleFlag("IssixModule", "PC_Enslavement_Role", 1):
			1:
				saynn("Amount of time spent in Master's harem today: "+str(getTimeSpent()) + " minutes")
			2:
				saynn("To pay Master for sluttying around yesterday: " + str(GM.main.getModuleFlag("IssixModule", "Prostituation_fee_yesterday", 0) + GM.main.getModuleFlag("IssixModule", "Prostituation_flat_fee", 0)))
			_:
				pass
		addButton("Master", "Talk with your master about something", "issixpetmenu")
		addButton("Azazel", "Actions in relation to Azazel", "azazelpetmenu")
		addButton("Hiisi", "Actions in relation to Hiisi", "hiisipetmenu")
		addButton("Lamia", "Actions in relation to Lamia", "lamiapetmenu")

	if state == "issixpetmenu":



func getTimeSpent():
	return ""

func getMood():
	var issix_mood = getModuleFlag("IssixModule", "Issix_Mood", 50)
	if issix_mood < 10:
		return "really bad"
	elif issix_mood < 25:
		return "bad"
	elif issix_mood < 40:
		return "meh"
	elif issix_mood < 60:
		return "mediocre"
	elif issix_mood < 75:
		return "good"
	elif issix_mood < 90:
		return "really good"
	else:
		return "excellent"

func getDays():
	var days_enslaved = getModuleFlag("IssixModule", "PC_Training_Level", {})["day_enslaved"]
	return GM.main.getDays() - days_enslaved

func trainingCheck():
	var training_level = getModuleFlag("IssixModule", "PC_Training_Level", 0)
	if training_level < 3:
		return "poor"
	elif training_level < 6:
		return "adequate"
	elif training_level < 10:
		return "fine"
	elif training_level < 14:
		return "good"
	else:
		return "very good"

func _react(_action: String, _args):

	if(_action == "endthescene"):
		# increaseModuleFlag("IssixModule", "PC_Training_Level")
		endScene()
		return

	setState(_action)
