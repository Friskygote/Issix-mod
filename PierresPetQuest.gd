extends QuestBase

func _init():
	id = "PierresPetQuest"

func getVisibleName():
	return "Becoming something lesser"

func getProgress():
	var quest_status = GM.main.getModuleFlag("PierreModule", "Quest_Status")
	var result = []
	
	result.append("Pierre gave you a map and a task - to get him whatever is in a place marked on the map, and look for number 84. Apparently this trust exercise requires you to wear a blindfold, wonder why...")
	if(quest_status > 1):
		result.append("You've found the hidden closet. Now just to find what Pierre asked of you...")
	if(quest_status > 2):
		result.append("You've got a pack of gumball. Return it to Pierre.")
	
	return result

func isVisible():
	return GM.main.getModuleFlag("PierreModule", "Quest_Status") > 0

func isCompleted():
	return GM.main.getModuleFlag("PierreModule", "Quest_Status") > 10

func isMainQuest():
	return false

# quest_status - state (number)
# 0 - no quest/haven't started
# -1 - refused Pierres quest
# 1 - accepted Pierres quest
# 2 - arrived at closet
# 3 - looted the gumball
# 4 - gave the gumball to Pierre
