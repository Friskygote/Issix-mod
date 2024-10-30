extends EventBase

func _init():
	id = "EngRoomClosetEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "eng_corridor6")

func run(_triggerID, _args):
	if(3 > getModuleFlag("PierreModule", "Quest_Status") and getModuleFlag("PierreModule", "Quest_Status") > 0): # In the future potentially make it possible to be a daily event thing
		if(GM.pc.isBlindfolded()):
			addButton("Pierre's Task", "Is it time?", "wall")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "wall"):
		runScene("EngRoomScene")
		
