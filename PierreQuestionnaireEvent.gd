extends EventBase

func _init():
	id = "Ch1PierreQuestQuestionnaire"

func registerTriggers(es):
	es.addTrigger(self, Trigger.TalkingToNPC, "pierre")

func run(_triggerID, _args):
	if(GM.main.getModuleFlag("PierreModule", "Quest_Status") == 4):
		if GM.main.getModuleFlag("PierreModule", "Quest_Wait_Another_Day") == false:
			addButton("Next task", "Ask Pierre about next task", "main")
		else:
			addDisabledButton("Next task", "You need to wait until tomorrow")
		return true
	return false
	
	
func onButton(_method, _args):
	if(_method == "main"):
		GM.main.endCurrentScene()
		runScene("PierreQuestionnaire")
	
func getPriority():
	return 20
