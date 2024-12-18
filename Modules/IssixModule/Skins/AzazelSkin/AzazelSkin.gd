extends SkinBase

func _init():
	id = "AzazelSkin"

func getName():
	return "Azazel"

func getPatternTexture():
	return preload("res://Modules/IssixModule/Skins/AzazelSkin/AzazelSkin.png")

func getFittingSkinTypes():
	return {
		SkinType.Fur: 1.0,
		SkinType.Scales: 0.0,
	}
