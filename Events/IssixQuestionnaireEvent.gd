extends EventBase

func _init():
	id = "Ch1IssixQuestQuestionnaire"

func registerTriggers(es):
	es.addTrigger(self, Trigger.TalkingToNPC, "issix")

func run(_triggerID, _args):
	if(GM.main.getModuleFlag("IssixModule", "Quest_Status") == 4):
		if GM.main.getModuleFlag("IssixModule", "Quest_Wait_Another_Day") == false:
			addButton("Next task", "Ask Issix about next task", "main")
		else:
			addDisabledButton("Next task", "You need to wait until tomorrow")
		return true
	elif(GM.main.getModuleFlag("IssixModule", "Quest_Status") == 5):
		addButton("Questionnaire", "Ask Issix about continuing the questionnaire", "main")
	return false
	
	
func onButton(_method, _args):
	if(_method == "main"):
		GM.main.endCurrentScene()
		runScene("IssixQuestionnaire")
	
func getPriority():
	return 20
