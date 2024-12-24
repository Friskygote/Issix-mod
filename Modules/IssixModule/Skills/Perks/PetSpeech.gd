extends PerkBase

func _init():
	id = "PetSpeech"
	skillGroup = "Pet"

func getVisibleName():
	return "Meow bark"

func getVisibleDescription():
	return "You have learned the speech of animals without losing ability to communicate with humanoids"

func getSkillTier():
	return 5

func getPicture():
	return "res://Modules/IssixModule/Skills/Images/petspeech.png"

func toggleable():
	var ch = npc if npc != null else GM.pc
	return !(ch.getSkillsHolder().hasPerk(self.id))

func unlockable():
	return false
