extends PerkBase

func _init():
	id = "Clicker"
	skillGroup = "Pet"

func getVisibleName():
	return "Pavlov's Dog"

func getVisibleDescription():
	return "You have unconditional urge to stop what you are doing when you hear a click"

func getSkillTier():
	return 2

func getPicture():
	return "res://Modules/IssixModule/Skills/Images/clicker.png"

func toggleable():
	return false

func unlockable():
	return false

func hiddenWhenLocked():
	return true
