extends EventBase

func _init():
	id = "AzazelCorruptionAttemptEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom)

func react(_triggerID, _args):
	if not GM.pc.getLocation().begins_with("main_hall") or not (GM.pc.getLocation() in ["main_bathroom1"]):
		return false
	if not (GM.main.getModuleFlag("IssixModule", "Azazel_Affection_given", 0) > 0 and GM.main.getModuleFlag("IssixModule", "Quest_Status", 0) < 1):
		return false
	#if(!RNG.chance(30 + 10.0*GM.pc.getExposure()) || !GM.world.getRoomByID(GM.pc.getLocation()).loctag_MentalWard):
	#	return false

	if RNG.chance(0.1):
		var scene_index = GM.pc.getModuleFlag("IssixModule", "Azazel_Corruption_Scene", 1)
		if scene_index == -1:
			return false
		runScene("AzazelCorruption"+str(scene_index))
		return true
	return false

func getPriority():
	return 5

