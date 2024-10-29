extends QuestBase

func _init():
	id = "PierresPetQuest"

func getVisibleName():
	return "Becoming something lesser"

func getProgress():
	var quest_status = GM.main.getModuleFlag("PierreModule", "Quest_Status")
	var result = []
	
	result.append("Pierre gave you a task")
	if(quest_status > 1):
		pass
	
	return result

func isVisible():
	return GM.main.getModuleFlag("PierreModule", "Quest_Status") > 0

func isCompleted():
	return GM.main.getModuleFlag("PierreModule", "Quest_Status") > 10

func isMainQuest():
	return false
