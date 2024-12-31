extends EventBase

func _init():
	id = "AzazelCorruptionAttemptEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom)

func react(_triggerID, _args):
	if not (GM.pc.getLocation().begins_with("main_hall") or (GM.pc.getLocation() in ["main_bathroom1"])) or GM.main.isVeryLate():
		return false
	if GM.main.getModuleFlag("IssixModule", "Hiisi_Had_Encounter_Scene_Today", false) == false and RNG.chance(5.0):
		if activateHiisiScenes():
			return true
	if not (GM.main.getModuleFlag("IssixModule", "Quest_Status", 0) < 1):  # Do not show those if player started the quest as Azazel doesn't have a reason to corrupt the player
		return false
	if activateAzazelScenes():
		return true
	return false


func activateHiisiScenes() -> bool:
	var scene_index = GM.main.getModuleFlag("IssixModule", "Hiisi_Encounter_scene", 1)
	if scene_index == -1 or GM.main.getModuleFlag("IssixModule", "Hiisi_Affection", -1) < scene_index*2 or scene_index > 2:
		return false
	if scene_index == 1:  # Different conditions per Hiisi's scenes
		var pawns = findFreePawnsNearby()
		if pawns.size() > 1:
			GM.main.setModuleFlag("IssixModule", "Hiisi_Had_Encounter_Scene_Today", true)
			runScene("HiisiWanderScene1", [RNG.pick(pawns)])
			return true
	elif scene_index == 2:
		if GM.pc.getLocation() in ["main_bathroom1"]:
			return false
		var path = GM.world.calculatePath(GM.pc.getLocation(), "main_bathroom1")
		GM.main.setModuleFlag("IssixModule", "Hiisi_Had_Encounter_Scene_Today", true)
		GM.pc.setLocation(path[1])
		runScene("HiisiWanderScene2")
		return true
	return false

func activateAzazelScenes() -> bool:
	if GM.main.getModuleFlag("IssixModule", "Azazel_Had_Corruption_Scene_Today", false) == false and RNG.chance(2.0):
		var scene_index = GM.main.getModuleFlag("IssixModule", "Azazel_Corruption_Scene", 1)
		if scene_index == -1 or GM.main.getModuleFlag("IssixModule", "Azazel_Affection_given", -1) < scene_index*2 or scene_index > 3:  # Player disabled corruption scenes, their affection score is too low or we ran out of them
			return false
		GM.main.setModuleFlag("IssixModule", "Azazel_Had_Corruption_Scene_Today", true)
		runScene("AzazelCorruption"+str(scene_index))
		return true
	return false

# Taken from PawnInteractionBase.gd
func findFreePawnsNearby() -> Array:
	var result:Array = []

	var pawns = GM.main.IS.getPawnsNear(GM.pc.getLocation(), 2)
	for pawn in pawns:
		if(!pawn.canBeInterrupted() or !pawn.isInmate() or pawn.isPlayer()):
			continue
		result.append(pawn.charID)
	return result

func getPriority():
	return 5

