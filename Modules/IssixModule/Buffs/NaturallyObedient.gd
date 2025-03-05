extends BuffBase

var amount = 0

func _init():
	id = "CommandTrained"

func initBuff(_args):
	amount = _args[0]

func getVisibleDescription():
	return "Obedience 20%"

func apply(_buffHolder):
	_buffHolder.addCustom(BuffAttribute.ForcedObedience, 0.2)

func getBuffColor():
	if(amount < 0):
		return Color.red
	return DamageType.getColor(DamageType.Lust)
