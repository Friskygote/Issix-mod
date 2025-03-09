extends StatusEffectBase

var wasPregnant := false

func _init():
	id = "JacuzziEffectsRelax"
	isBattleOnly = false

func initArgs(_args = []):
	if(_args.size() > 0):
		turns = _args[0]
	else:
		turns = 9*60*60
	wasPregnant = _args[1] if _args.size() > 0 else false

func processBattleTurn():
	pass

func processTime(_secondsPassed: int):
	turns -= _secondsPassed
	if(turns <= 0):
		stop()

func getEffectName():
	return "Hot tub relaxation"

func getEffectDesc():
	return "You feel invigorated and incredibly relaxed after Jacuzzi session for "+Util.getTimeStringHumanReadable(turns)

func getEffectImage():
	return "res://Modules/IssixModule/StatusEffects/jacuzzi.png"

func getIconColor():
	return IconColorGreen

func combine(_args = []):
	if(_args.size() > 0):
		turns = max(_args[0], turns)

func getBuffs():
	if wasPregnant:
		return [
		buff(Buff.StaminaRecoverAfterSexBuff, [40.0]),
		buff(Buff.PregnancySpeedBuff, [-20.0]),
		buff(Buff.RestEffectivenessBuff, [20.0]),
		buff(Buff.StatBuff, [Stat.Vitality, 3])
	]
	else:
		return [
			buff(Buff.StaminaRecoverAfterSexBuff, [40.0]),
			buff(Buff.RestEffectivenessBuff, [20.0]),
			buff(Buff.StatBuff, [Stat.Vitality, 3])
		]

func saveData():
	return {
		"turns": turns,
		"wasPregnant": wasPregnant
	}

func loadData(_data):
	turns = SAVE.loadVar(_data, "turns", 60*60)
	wasPregnant = SAVE.loadVar(_data, "wasPregnant", false)
