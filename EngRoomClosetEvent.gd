extends EventBase

func _init():
	id = "EngRoomClosetEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "eng_corridor6")

func run(_triggerID, _args):
	var quest_status = getModuleFlag("IssixModule", "Quest_Status")
	if(3 > quest_status and quest_status > 0): # In the future potentially make it possible to be a daily event thing
		if(GM.pc.isBlindfolded()):
			if getModuleFlag("IssixModule", "Quest_Status") == 1:
				addButton("Issix's Task", "Is it time?", "wall")
			else:
				addButton("Closet", "Time to get that thing", "wall")
	elif quest_status > 2:
		addDisabledButton("Closet", "This place is of no significance to you anymore")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "wall"):
		runScene("EngRoomScene")
		
