extends QuestBase

func _init():
	id = "IssixsPetQuest"

func getVisibleName():
	return "Becoming something lesser"

func getProgress():
	var quest_status = GM.main.getModuleFlag("IssixModule", "Quest_Status")
	var quest_await = GM.main.getModuleFlag("IssixModule", "Quest_Wait_Another_Day", false)
	var quest_rejection = GM.main.getModuleFlag("IssixModule", "Quest_Rejected_By_Issix", 0)
	var result = []
	if quest_rejection == 1 or quest_rejection == 4:
		return ["You rejected Issix's offer to become his pet."]
	result.append("Issix gave you a map and a task - to get him whatever is in a place marked on the map, and look for number 84. Apparently this trust exercise requires you to wear a blindfold, wonder why...")
	if(quest_status > 1):
		result.append("You've found the hidden closet. Now just to find what Issix asked of you...")
	if(quest_status > 2):
		result.append("You've got a pack of gum. Return it to Issix.")
	if(quest_status > 4):
		result.append("You've delivered a pack of gum to Issix. His next request was of you to complete a ”test” of some sorts.")
	if(quest_status == 3 and quest_await):
		result.append("You've delivered a pack of gum to Issix. He has asked you to wait until tomorrow when he will have next task for you")
	if(quest_status == 3 and !quest_await):
		result.append("You've delivered a pack of gum to Issix. He should have a new task for you today.")
	if(quest_status > 5 and quest_rejection == 0):
		result.append("You've finished the questionnaire which you've passed. Issix asked you to come back the next day for last trial.")
	if(quest_status == 5 and quest_await):
		result.append("You started the questionnaire, however your answering session was abruptly interrupted by medical emergency of Lamia. Issix asked you to come other day.")
	if(quest_status == 5 and !quest_await):
		result.append("You started the questionnaire, however your answering session was abruptly interrupted by medical emergency of Lamia. Issix asked you to come other day, at least a day has passed so you should check up with them.")
	if quest_status > 6 and quest_rejection == 0:
		result.append("You've succeeded Issix's last trial and have gotten permission to become Issix's pet. Issix said that your introduction is the next day,")
	if(quest_rejection > 1):
		result.append("Issix rejected the idea of you being his pet after you failed his test.")
	return result

func isVisible():
	return GM.main.getModuleFlag("IssixModule", "Quest_Status") > 0

func isCompleted():
	return GM.main.getModuleFlag("IssixModule", "Quest_Status") > 10 or GM.main.getModuleFlag("IssixModule", "Quest_Rejected_By_Issix", 0) > 1

func isMainQuest():
	return false

# quest_status - state (number)
# 0 - no quest/haven't started
# -1 - refused Issixs quest
# 1 - accepted Issixs quest
# 2 - arrived at closet
# 3 - looted the gumball
# 4 - gave the gumball to Issix
# 5 - answered first part of questionnaire
# 6 - answered second part of questionnaire, waits for the walk
# 7 - got accepted as a pet
