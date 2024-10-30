extends ItemBase

func _init():
	id = "Cookie"

func getVisibleName():
	return "Cookie"
	
func getDescription():
	return "A regular cookie, has brown chocolate chips on it."

func canUseInCombat():
	return true

func useInCombat(_attacker:Character, _receiver):
	_attacker.addStamina(15)
	removeXOrDestroy(1)
	return _attacker.getName() + " ate a cookie. They feel a little bit more full."

func getPossibleActions():  # We really shouldn't assume the item is being used by a player character, but sadly game does not give us context for the item user :(
	return [
		{
			"name": "Eat one!",
			"scene": "UseItemLikeInCombatScene",
			"description": "Eat the cookie",
		},
	]

func getPrice():
	return 0

func canSell():
	return true

func canCombine():
	return true

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
	return "res://Modules/PierreModule/Items/cookie.png"
