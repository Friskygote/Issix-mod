extends PerkBase

func _init():
	id = "BowlTraining"
	skillGroup = "Pet"

func getVisibleName():
	return "Undignified eater"

func getVisibleDescription():
	return "You learned how to eat from the common pet bowl."

func getMoreDescription():
	return "You can now only eat like a pet, from the bowl without using your paws or tools."

func getSkillTier():
	return 1

func getPicture():
	return "res://Modules/IssixModule/Skills/Images/bowl.png"

func toggleable():
	return false

func unlockable():
	return false
