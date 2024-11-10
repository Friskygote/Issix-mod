extends EventBase

func _init():
	id = "Ch1IssixQuestWalk"

func registerTriggers(es):
	es.addTrigger(self, Trigger.TalkingToNPC, "issix")

func run(_triggerID, _args):
	if(GM.main.getModuleFlag("IssixModule", "Quest_Status") == 6):
		if GM.main.getModuleFlag("IssixModule", "Quest_Wait_Another_Day") == false:
			addButton("Next task", "Ask Issix about next task", "main")
		else:
			addDisabledButton("Next task", "You need to wait until tomorrow")
		return true
	return false
	
	
func onButton(_method, _args):
	if(_method == "main"):
		GM.main.endCurrentScene()
		runScene("IssixPetWalk")
	
func getPriority():
	return 20
