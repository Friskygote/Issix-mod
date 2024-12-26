extends PerkBase

func _init():
	id = "PetRelocated"
	skillGroup = "Pet"

func getVisibleName():
	return "Relocated"

func getVisibleDescription():
	return "Your Master's tiny cell has became your new cell"

func getSkillTier():
	return 0

func getPicture():
	return "res://Modules/IssixModule/Skills/Images/relocated.png"

func toggleable():
	return false

func unlockable():
	return false

func hiddenWhenLocked():
	return true
