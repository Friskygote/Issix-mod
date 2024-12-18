extends EventBase

func _init():
	id = "IssixSearchEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "hall_mainentrance")

func react(_triggerID, _args):
	if(doEventCheck("IssixBusy") != null) or GM.main.isVeryLate():
		return false

	var visited = GM.main.getModuleFlag("IssixModule", "Last_Day_Visited_Master")
	if visited != null and GM.main.getDays() > visited + 2:  # 3 days without visiting master
		runScene("IssixFoundPlayer")


func getPriority():
	return 10
