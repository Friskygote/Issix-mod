extends EventBase

const Globals = preload("res://Modules/IssixModule/Globals.gd")

func _init():
	id = "StopPlayerFromLeavingDreamEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "petsdream_cellblock_corridor_part4")
	es.addTrigger(self, Trigger.EnteringRoom, "petsdream_cellblock_corridor_part6")
	es.addTrigger(self, Trigger.EnteringRoom, "petsdream_cellblock_corridor_part8")
	es.addTrigger(self, Trigger.EnteringRoom, "petsdream_cellblock_lilac_nearcell")

func run(_triggerID, _args):
	match GM.pc.getLocation():
		"petsdream_cellblock_corridor_part4":
			if !Globals.checkIfAchieved("Azazel_Corr_Dream_State", "Got_Azazels_Permission"):
				GM.ui.addDisabledButtonAt(6, "North", "A strange wall of goo blocks your path, you can't get over it. At the center of the wall is a sculpture of a pregnant person")

		"petsdream_cellblock_corridor_part6":
			if !Globals.checkIfAchieved("Azazel_Corr_Dream_State", "Got_Hiisis_Permission"):
				saynn("A wall blocks your path, on it is sculptured a warrior holding a sword.")
				GM.ui.addDisabledButtonAt(6, "North", "A stone wall blocks your path, a warrior sculptured onto it")

		"petsdream_cellblock_corridor_part8":
			if !Globals.checkIfAchieved("Azazel_Corr_Dream_State", "Got_Lamias_Permission"):
				saynn("You can barely see anything here, though it appears that some kind of small object is preventing you from progressing ahead.")
				GM.ui.addDisabledButtonAt(6, "North", "A magic ballgag protects further path, any attempt to pass it result in barrage of painful hits on your body")

		"petsdream_cellblock_lilac_nearcell":
			if !Globals.checkIfAchieved("Azazel_Corr_Dream_State", "Talked_With_Azazel"):
				GM.ui.addDisabledButtonAt(6, "North", "Large metal bars restrict you from going in that direction")



func getPriority():
	return 0

func onButton(_method, _args):
	pass
