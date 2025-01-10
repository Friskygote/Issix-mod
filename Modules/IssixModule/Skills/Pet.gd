extends SkillBase

func _init():
	id = "Pet"

func getVisibleName():
	return "Pet"

func getVisibleDescription():
	return "Shows how used you are to being a pet"

func getPerkTiers():
	return [
		[0],
		[5],
		[10],
	]

func scripted():
	return false
