extends EventBase

func _init():
	id = "AzazelCorruptionAttemptEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom)

func react(_triggerID, _args):
	if not (GM.pc.getLocation().begins_with("main_hall") or (GM.pc.getLocation() in ["main_bathroom1"])) or GM.main.isVeryLate():
		return false
	if not (GM.main.getModuleFlag("IssixModule", "Azazel_Affection_given", 0) > 0 and GM.main.getModuleFlag("IssixModule", "Quest_Status", 0) < 1):
		return false
	if GM.main.getModuleFlag("IssixModule", "Azazel_Had_Corruption_Scene_Today", false) == false and RNG.chance(1.0):
		var scene_index = GM.main.getModuleFlag("IssixModule", "Azazel_Corruption_Scene", 1)
		if scene_index == -1 or scene_index > 3:  # Player disabled corruption scenes or we ran out of them
			return false
		GM.main.setModuleFlag("IssixModule", "Azazel_Had_Corruption_Scene_Today", true)
		runScene("AzazelCorruption"+str(scene_index))
		return true
	return false

func getPriority():
	return 5

