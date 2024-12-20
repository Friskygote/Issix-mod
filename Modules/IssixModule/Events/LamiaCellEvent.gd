extends EventBase

func _init():
	id = "LamiaCellEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "cellblock_orange_nearcell")

func run(_triggerID, _args):
	if GM.main.getModuleFlag("IssixModule", "PC_Saw_Artwork_At_Lamias", false) == true:
		return

	if GM.main.getModuleFlag("IssixModule", "Lamia_Chosen_Drawing") == "lamia":
		saynn("While walking through the block you notice something in one of the cells, a sheet of paper taped to the wall of one of the cells. You recognize that artwork, it's the one you drew and it depicts Lamia! This means it must be Lamia's cell, out of all the artwork they make, they chose to hang the one made by you for them, it makes you feel warm inside.")
		addButton("Aww", "That's fun!", "seenart")

	if GM.main.getModuleFlag("IssixModule", "Lamia_Chosen_Drawing") == "simple":
		saynn("While walking through the block you notice something in one of the cells, a sheet of paper taped to the wall of one of the cells. You recognize that artwork, it's the one you drew which Lamia mysteriously helped you with adding surprising details to it! It must be Lamia's cell. You are surprised that of everything, they chose to hang your drawing.")
		addButton("Aww", "That's fun!", "seenart")


func onButton(_method, _args):
	if(_method == "seenart"):
		GM.main.setModuleFlag("IssixModule", "PC_Saw_Artwork_At_Lamias", true)


func getPriority():
	return 0
