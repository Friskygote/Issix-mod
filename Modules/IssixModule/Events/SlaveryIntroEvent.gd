extends EventBase

func _init():
	id = "Ch2IssixSlaveryIntro"

func registerTriggers(es):
	es.addTrigger(self, Trigger.TalkingToNPC, "issix")

func run(_triggerID, _args):
	if(GM.main.getModuleFlag("IssixModule", "Quest_Status") == 7):
		if GM.main.getModuleFlag("IssixModule", "Quest_Wait_Another_Day") == false:
			addButton("Do it", "Ask Issix about becoming his pet", "main")
		else:
			addDisabledButton("Slavery", "You need to wait until tomorrow before you can ask Issix about becomin his slave")
		return true
	return false


func onButton(_method, _args):
	if(_method == "main"):
		GM.main.endCurrentScene()
		runScene("IssixSlaveryIntro")

func getPriority():
	return 20
