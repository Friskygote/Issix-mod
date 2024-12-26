extends StatusEffectBase

func _init():
	id = "CatnipOverdose"
	isBattleOnly = false

func initArgs(_args = []):
	if(_args.size() > 0):
		turns = _args[0]
	else:
		turns = 30*60

func processBattleTurn():
	pass

func processTime(_secondsPassed: int):
	turns -= _secondsPassed
	if(turns <= 0):
		stop()

func getEffectName():
	return "Catnip overdose"

func getEffectDesc():
	return "You feel like you can lift a moon"

func getEffectImage():
	return "res://Modules/IssixModule/StatusEffects/catnipoverdose.png"

func getIconColor():
	return IconColorGray

func combine(_args = []):
	if(_args.size() > 0):
		turns = _args[0]+turns

func getBuffs():
	return [
	]

func saveData():
	return {
		"turns": turns,
	}

func loadData(_data):
	turns = SAVE.loadVar(_data, "turns", 30*60)
