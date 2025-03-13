extends SkillBase

func _init():
	id = "Pet"
	var _s = connect("levelChanged", self, "_on_levelChanged")

func getVisibleName():
	return "Pet"

func getVisibleDescription():
	return "Shows how used you are to being a pet"

func _on_levelChanged(idParam, newLevel):
	if(id != idParam):
		return
	unlockFeatures(newLevel)

func unlockFeatures(level):
	if level >= 4 and GM.main.getModuleFlag("IssixModule", "Did_Task_Today") == null:
		GM.main.setModuleFlag("IssixModule", "Did_Task_Today", false)
		GM.main.addMessage("Pet tasks have been unlocked!")
	if level >= 6 and GM.main.getModuleFlag("IssixModule", "Drone_Task_Timeout") == null:
		GM.main.setModuleFlag("IssixModule", "Drone_Task_Timeout", 0)
		GM.main.addMessage("Drone task has been unlocked!")


func getPerkTiers():
	return [
		[0],
		[3],
		[5],
		[7],
		[10],
	]

func scripted():
	return false
