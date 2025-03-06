extends PerkBase

func _init():
	id = "Commands"
	skillGroup = "Pet"

func getVisibleName():
	return "Commands"

func getVisibleDescription():
	return "You learned basic commands that others can give you"

func getMoreDescription():
	return "Master Issix taught you various commands such as Sit, Roll, Give a paw, Stand. Guards and Master Issix can command you with Roll and Sit commands to skip turns."

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

func getBuffs():
	return [
		buff("CommandTrained"),
	]
