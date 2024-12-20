extends EventBase

func _init():
	id = "ArtworkModifyingPlayerCell"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringPlayerCell)

func run(_triggerID, _args):
	if getModuleFlag("IssixModule", "Lamia_Chosen_Drawing") == "simplepc" and getModuleFlag("IssixModule", "PC_Saw_Artwork_At_Lamias") == true:
		saynn("On the wall you can see a vertical sheet of paper with not so simplistic anymore drawing of place you used to live in. Drawn by yourself, enchanted by Lamia, adding details that are incredibly close to how it was. You still aren't sure how they knew.")

	if getModuleFlag("IssixModule", "Placed_Portrait_In_Cell", false):
		saynn("On the wall you can see a vertical sheet of paper with your face holding a cookie in the mouth. Drawn by Lamia.")
		return
		
	if (getModuleFlag("IssixModule", "Received_Portrait_From_Lamia", false) and getModuleFlag("IssixModule", "Placed_Portrait_In_Cell") == null) or (getModuleFlag("IssixModule", "Lamia_Chosen_Drawing") == "simplepc" and getModuleFlag("IssixModule", "PC_Saw_Artwork_At_Lamias") == false):
		addButton("Portrait", "You can choose to put an artwork you've received on the wall of your cell", "portrait")
		
func onButton(_method, _args):
	if(_method == "portrait"):
		runScene("PlayerCellLamiaPortraitScene")

func getPriority():
	return 11
