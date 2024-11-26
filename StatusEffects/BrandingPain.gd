extends StatusEffectBase

func _init():
	id = "AfterBrandPain"
	isBattleOnly = false

func initArgs(_args = []):
	if(_args.size() > 0):
		turns = _args[0]
	else:
		turns = 72*60*60

func processBattleTurn():
	pass

func processTime(_secondsPassed: int):
	turns -= _secondsPassed
	if(turns <= 0):
		stop()

func getEffectName():
	return "Branding pain"

func getEffectDesc():
	return "Your skin burns like fire and you can't wear any clothes for "+Util.getTimeStringHumanReadable(turns)

func getEffectImage():
	return "res://Modules/IssixModule/StatusEffects/brandpain.png"

func getIconColor():
	return IconColorRed

func combine(_args = []):
	if(_args.size() > 0):
		turns = max(_args[0], turns)

func getBuffs():
	return [
		buff(Buff.AmbientPainBuff, [40.0]),
	]

func saveData():
	return {
		"turns": turns,
	}

func loadData(_data):
	turns = SAVE.loadVar(_data, "turns", 60*60)
