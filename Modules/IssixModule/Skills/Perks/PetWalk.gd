extends PerkBase

func _init():
	id = "PetWalkies"
	skillGroup = "Pet"

func getVisibleName():
	return "Walkies"

func getVisibleDescription():
	return "Have been trained in walking alongside your master on fours."

func getSkillTier():
	return 0

func getPicture():
	return "res://Modules/IssixModule/Skills/Images/walkies.png"

func toggleable():
	return false

func unlockable():
	return false
