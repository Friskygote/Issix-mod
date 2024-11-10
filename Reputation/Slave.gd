extends RepStatBase
# Currently just an idea
func _init():
	id = "PCSlave"

func getVisibleName():
	return "Slave's Reputation"

func getMaxLevel() -> int:
	return 4

func getMinLevel() -> int:
	return -1

func getTextForLevel(_level:int, _rep):
	if(_level <= -1):
		return "Regular"
	if(_level == 0):
		return "Unknown"
	if(_level == 1):
		return "Servant"
	if(_level == 2):
		return "Owned slut"
	if(_level == 3):
		return "Slave"
	if(_level == 4):
		return "Someone's property"
	return "FUCK TOY"

#func getSpecialRequirementToReachLevel(_level:int, _rep):
#	if(_level == 3):
#		return ["enslavesomeone", "Enslave anyone"]
#	if(_level == 5):
#		return ["makeobey", "Make any slave submit to you.. or break their mind"]
#
#	return null

func getEffectsInfoForLevel(_level:int, _rep) -> Array:
	if(_level <= 3):
		return ["More degradation from the inmates"]
	if(_level <= 5):
		return [
			"Less encounters with inmates, less cheating.",
		]
	if(_level <= 8):
		return [
			""
		]
	return [
		"Easier to make friends with staff.",
	]
