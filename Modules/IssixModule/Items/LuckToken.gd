extends ItemBase

var quality = 1.0

func _init():
	id = "LuckToken"
	quality = RNG.randf_range(0.5, 1.0)

func getVisibleName():
	return "Luck Token"

func getDescription():
	return "A flashy gold colored metal square with circular indention in the center, it weights quite a bit. According to Issix it may be possible to exchange it for something in the prison..."

func canUseInCombat():
	return false

func getPossibleActions():
	return []

func getPrice():
	return 0

func canSell():
	return false

func canCombine():
	return true

func getQuality():
	return quality

func tryCombine(_otherItem):
	return .tryCombine(_otherItem)

func getTags():
	return []

func getItemCategory():
	return ItemCategory.Generic

func saveData():
	var data = .saveData()

	data["quality"] = quality

	return data

func loadData(data):
	.loadData(data)

	quality = SAVE.loadVar(data, "quality", "")

func getInventoryImage():
	return "res://Modules/IssixModule/Items/Icons/lucktoken.png"
