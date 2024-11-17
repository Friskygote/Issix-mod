extends SceneBase

func _init():
	sceneID = "IssixSlaveryIntroCont"

func requirements_met():
	return getModuleFlag("IssixModule", "Misc_Slavery_Info", {"scenes_seen": []})["scenes_seen"].find("IssixSlaveryIntroCont") == -1

func _run():
	if(state == ""):
		playAnimation(StageScene.Duo, "kneel", {npc="issix", npcAction="stand"})
		saynn("Your slave role: "+IssixModule.getPlayerRole())
		saynn("Your training: "+trainingCheck())
		saynn("Master's mood: "+getMood())
		saynn("Issix's slave for "+str(getDays())+" days")
		if GM.main.getModuleFlag("IssixModule", "PC_Enslavement_Role", 1) == 1:
			saynn("Amount of time spent in Master's harem today: "+str(getTimeSpent()) + " minutes")

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
		increaseModuleFlag("IssixModule", "PC_Training_Level")
		endScene()
		return

	setState(_action)
