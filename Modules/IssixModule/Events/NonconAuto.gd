extends EventBase

func _init():
	id = "NonconAutoMovement"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom)

func react(_triggerID, _args):
	if GM.main.getModuleFlag("IssixModule", "Noncon_Mode_Enabled", false) and (GM.main.getModuleFlag("IssixModule", "PC_Pet_Didnt_Fullfill_Daily", false) or (GM.main.getTime() >= 17*60*60 and GM.main.getModuleFlag("IssixModule", "Last_Day_Visited_Master", 0) < GM.main.getDays())):
		runScene("NonconCornerOvertime")
		GM.main.setModuleFlag("IssixModule", "PC_Pet_Didnt_Fullfill_Daily", false)  # safety measure
		return true
	return false


func getPriority():
	return 20
