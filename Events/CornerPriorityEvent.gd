extends EventBase

func _init():
	id = "IssixSpecialEvent"


var registered_special_scenes = [['IssixSlaveryIntroCont', 1, {}], ['IssixBringsComicbooks', 2, {"Comic_Books": 1}], ['IssixSlaveryBowlTraing', 2, {}], ['IssixSlaveryBranding', 3, {}]]

class CustomSorter:
	static func sort_by_progressionpoints(a, b):
		if a[1] < b[1]:
			return true
		return false

func checkRequirements(requirements: Dictionary):
	for key in requirements.keys():
		if requirements[key] is int or requirements[key] is float:
			if getModuleFlag("IssixModule", key, 0) < requirements[key]:
				return false
		elif requirements[key] is String:
			if getModuleFlag("IssixModule", key, 0) != requirements[key]:
				return false
	return true

func shouldBeShownForcedEvent():
	var scenes_seen = getModuleFlag("IssixModule", "Misc_Slavery_Info", {"scenes_seen": []})
	var current_progression_points = GM.main.getModuleFlag("IssixModule", "Progression_Points", 1)
	if GM.main.getDays() >= GM.main.getModuleFlag("IssixModule", "Progression_Day_Next", 0) and !GM.main.getModuleFlag("IssixModule", "Unwelcome_At_Corner", false):
		registered_special_scenes.sort_custom(CustomSorter, "sort_by_progressionpoints")
		for scene in registered_special_scenes:
			if scene[1] > current_progression_points:
				return null
			if scenes_seen["scenes_seen"].find(scene[0]) == -1 and checkRequirements(scene[2]):
				return scene[0]
	return null

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "hall_ne_corner")

func react(_triggerID, _args):
	#if(doEventCheck("IssixBusy") != null):
	#	return false
	var scene_to_show = shouldBeShownForcedEvent()
	Console.printLine("test1")
	if scene_to_show != null:
		Console.printLine("test2")
		runScene(scene_to_show)
		return true
	Console.printLine("test3")
	return false


func getPriority():
	return 20

# func onButton(_method, _args):
# 	if(_method == "talk"):
# 		runScene("IssixTalkScene")
# 	if(_method == "pets"):
# 		runScene("PetsTalkScene")
# 	if(_method == "paper"):
# 		runScene("NoPetsTalkScene")
#
