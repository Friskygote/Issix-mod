extends EventBase

func _init():
	id = "IssixEvent"

func registerTriggers(es):
	es.addTrigger(self, "OpeningSlaveryScreen")

func react(_triggerID, _args):
	if false:
		runScene("SomeScene")
		return true
	return false

func getPriority():
	return 0
