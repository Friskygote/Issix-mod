extends EventBase

func _init():
	id = "MedicalLamiaPeekEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "med_near_wards")

func run(_triggerID, _args):
	if(getModuleFlag("PierreModule", "Quest_Status") == 5 and getModuleFlag("PierreModule", "Quest_Wait_Another_Day") == true):
		addButton("Investigate", "Eavesdrop on large commotion in the hospital room next to you", "main")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "main"):
		runScene("MedicalLamiaPeekScene")
		
