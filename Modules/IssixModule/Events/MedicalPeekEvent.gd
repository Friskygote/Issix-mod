extends EventBase

func _init():
	id = "MedicalLamiaPeekEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "med_near_wards")
	es.addEventCheck(self, "ElizaBusy")

func react(_triggerID, _args):
	if(getModuleFlag("IssixModule", "Quest_Status") == 5 and getModuleFlag("IssixModule", "Quest_Wait_Another_Day") == true):
		runScene("MedicalLamiaPeekScene")
		return true
		# I don't have any other way of preventing the player from entering the medical room so we do some forcy scene on them, they would never see that coming!
		#addButton("Investigate", "Eavesdrop on large commotion in the hospital room next to you", "main")
		
	return false
		
func getPriority():
	return 150

func onButton(_method, _args):
	if(_method == "main"):
		runScene("MedicalLamiaPeekScene")
		
func eventCheck(_checkID, _args = []):  # sorry player, you can't heal, Eliza is occupied by Issix's pet
	if(_checkID == "ElizaBusy" and getModuleFlag("IssixModule", "Quest_Status") == 5 and getModuleFlag("IssixModule", "Quest_Wait_Another_Day") == true):
		return {busy=true}
