extends ItemBase

func _init():
	id = "CatnipPlant"

func getVisibleName():
	return "Catnip"
	
func getDescription():
	return "An enticing plant for most of felines. Used as harmfull drug, unless in large quantities. Can have effects on a feline if consumed."

func isFeline(character:BaseCharacter):
	return "feline" in character.getSpecies()

func canUseInCombat():
	return isFeline(GM.pc)

func useInCombat(_attacker:Character, _receiver):
	if(isFeline(_attacker)):
		if(!(_attacker.isPlayer() and GM.main.getFlag("HypnokinkModule.SoftOptIn") == false)):
			_attacker.addEffect(StatusEffect.UnderHypnosis)
		_attacker.addLust(10)
		removeXOrDestroy(1)
		return _attacker.getName() + " ate a catnip plant! That feels... Wahhaa."
	else:
		removeXOrDestroy(1)
		return _attacker.getName() + " ate a catnip plant! It didn't have any effect."

func getPossibleActions():
	if(isFeline(GM.pc)):  # We really shouldn't assume the item is being used by a player character, but sadly game does not give us context for the item user :(
		return [
			{
				"name": "Eat one!",
				"scene": "UseItemLikeInCombatScene",
				"description": "Eat the catnip",
			},
		]
	else:
		return []

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
	return "res://Modules/PierreModule/Items/catnip.png"
