extends PerkBase

func _init():
	id = "PetSpeech"
	skillGroup = "Pet"

func getVisibleName():
	return "Meow bark"

func getVisibleDescription():
	return "You have learned the speech of animals without losing ability to communicate with humanoids"

func getSkillTier():
	return 2

func getPicture():
	return "res://Modules/IssixModule/Skills/Images/petspeech.png"

func toggleable():
	return true

func unlockable():
	return false

func hiddenWhenLocked() -> bool:
	return true

func hiddenWhenUnlocked() -> bool:
	return false
