extends PerkBase

func _init():
	id = "PetName"
	skillGroup = "Pet"

func getVisibleName():
	return "New name"

func getVisibleDescription():
	return "You have received a completely new name from your Master - Seir"

func getSkillTier():
	return 1

func getPicture():
	return "res://Modules/IssixModule/Skills/Images/name.png"

func toggleable():
	return false

func unlockable():
	return false

func hiddenWhenLocked():
	return true
