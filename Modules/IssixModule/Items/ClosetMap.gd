extends ItemBase

func _init():
	id = "IssixsMap"

func getVisibleName():
	return "Issix's Map"
	
func getDescription():
	return "A map showing directinons"

func canUseInCombat():
	return false

func useInCombat(_attacker:Character, _receiver):
	return "Map shows the following:\n\n[font=res://Fonts/smallconsolefont.tres]"+Util.readFile("res://Modules/IssixModule/Misc/asciimapsmall.txt")+"[/font]"

func getPossibleActions():
	if(true):  # We really shouldn't assume the item is being used by a player character, but sadly game does not give us context for the item user :(
		return [
			{
				"name": "Look",
				"scene": "UseItemLikeInCombatScene",
				"description": "Look at the map",
			},
		]
	else:
		return [
			{
				"name": "Discard",
				"scene": "UseItemLikeInCombatScene",
				"description": "Discard this map, it won't be useful to you anymore.",
			},
		]

func getPrice():
	return 0

func canSell():
	return false

func canCombine():
	return false

func tryCombine(_otherItem):
	return .tryCombine(_otherItem)

func getTags():
	return []

func getItemCategory():
	return ItemCategory.Generic

func saveData():
	var data = .saveData()
	return data
	
func loadData(data):
	.loadData(data)

func getInventoryImage():
	return "res://Modules/IssixModule/Items/Icons/issixsmap.png"
