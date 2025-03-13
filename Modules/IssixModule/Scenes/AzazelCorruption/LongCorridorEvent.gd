extends EventBase

const Globals = preload("res://Modules/IssixModule/Globals.gd")

func _init():
	id = "LongCorridorEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "petsdream_cellblock_corridor_part17")

func react(_triggerID, _args):
	runScene("FinalIssixDrugScene")
	return true

func getPriority():
	return 0

func onButton(_method, _args):
	pass


