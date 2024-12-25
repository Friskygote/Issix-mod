extends EventBase

func _init():
	id = "IssixNovaTalkEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.SceneAndStateHook, ["NovaTalkScene", "talk"])

func run(_triggerID, _args):
	if(GM.main.getModuleFlag("IssixModule", "Issix_Introduced", false) == true):
		addButton("Issix", "Ask Nova about Issix", "main")
		return true
	return false


func onButton(_method, _args):
	if(_method == "main"):
		# GM.main.endCurrentScene()
		runScene("NovaIssixTalkScene")

func getPriority():
	return 20
