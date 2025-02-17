extends PerkBase

func _init():
	id = "Commands"
	skillGroup = "Pet"

func getVisibleName():
	return "Commands"

func getVisibleDescription():
	return "You learned basic commands that others can give you"

func getSkillTier():
	return 1

func getPicture():
	return "res://Modules/IssixModule/Skills/Images/commands.png"

func toggleable():
	return false

func unlockable():
	return false

func hiddenWhenLocked():
	return true
