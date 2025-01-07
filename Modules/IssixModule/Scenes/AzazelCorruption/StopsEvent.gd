extends EventBase

const Globals = preload("res://Modules/IssixModule/Globals.gd")

func _init():
	id = "StopPlayerFromLeavingDreamEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "petsdream_cellblock_corridor_part2")
	es.addTrigger(self, Trigger.EnteringRoom, "petsdream_cellblock_lilac_nearcell")

func run(_triggerID, _args):
	match GM.pc.getLocation():
		"petsdream_cellblock_corridor_part2":
			GM.ui.addDisabledButtonAt(6, "North", "You are being blocked")
		"petsdream_cellblock_lilac_nearcell":
			if !Globals.checkIfAchieved("Azazel_Corr_Dream_State", "Talked_With_Azazel"):
				GM.ui.addDisabledButtonAt(6, "North", "Large metal bars restrict you from going in that direction")



func getPriority():
	return 0

func onButton(_method, _args):
	pass
