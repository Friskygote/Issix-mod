extends EventBase

func _init():
	id = "ArtworkModifyingPlayerCell"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringPlayerCell)

func run(_triggerID, _args):
	if getModuleFlag("IssixModule", "Placed_Portrait_In_Cell", false):
		saynn("On the wall you can see a vertical sheet of paper with your face holding a cookie in the mouth. Drawn by Lamia.")
		return
		
	if getModuleFlag("IssixModule", "Received_Portrait_From_Lamia", false) and getModuleFlag("IssixModule", "Placed_Portrait_In_Cell") == null:
		addButton("Portrait", "You can choose to put a portrait you've received from Lamia on the wall of your cell", "portrait")
		
func onButton(_method, _args):
	if(_method == "portrait"):
		runScene("PlayerCellLamiaPortraitScene")

func getPriority():
	return 11
