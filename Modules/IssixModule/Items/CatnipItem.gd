extends ItemBase

func _init():
	id = "CatnipPlant"

func getVisibleName():
	return "Catnip"
	
func getDescription():
	return "An enticing plant for most of felines. Used as harmful drug, unless in large quantities. Can have effects on a feline if consumed."

func canUseInCombat():
	return true

func useInCombat(_attacker, _receiver):
	if "feline" in _attacker.getSpecies():
		if(!(_attacker.isPlayer() and GM.main.getFlag("HypnokinkModule.SoftOptIn") == false)):
			_attacker.addEffect(StatusEffect.Suggestible, [5])
		_attacker.addLust(10)
		removeXOrDestroy(1)
		return _attacker.getName() + " ate a catnip plant! That feels... Wahhaa."
	else:
		removeXOrDestroy(1)
		return _attacker.getName() + " ate a catnip plant! It didn't have any effect."

func getPossibleActions():
	return [
		{
			"name": "Eat one!",
			"scene": "UseItemLikeInCombatScene",
			"description": "Eat the catnip",
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
	return ItemCategory.Medical

func saveData():
	var data = .saveData()
	return data
	
func loadData(data):
	.loadData(data)

func getInventoryImage():
	return "res://Modules/IssixModule/Items/Icons/catnip.png"
