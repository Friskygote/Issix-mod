extends BuffBase

var amount = 0

func _init():
	id = "CommandTrained"

func getVisibleDescription():
	return "Obedience 20%"

func apply(_buffHolder):
	_buffHolder.addCustom(BuffAttribute.ForcedObedience, 0.2)

func getBuffColor():
	return DamageType.getColor(DamageType.Lust)
