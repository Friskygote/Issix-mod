extends EventBase

func _init():
	id = "IssixEvent"


var registered_special_scenes = [['IssixSlaveryIntroCont', 1]]

func sort_by_progressionpoints(a, b):
	if a[1] < b[1]:
		return true
	return false

func shouldBeShownForcedEvent():
	var current_progression_points = GM.main.getModuleFlag("IssixModule", "Progression_Points", 1)
	if GM.main.getDays() == GM.main.getModuleFlag("IssixModule", "Progression_Day_Next", 0):
		registered_special_scenes.sort_custom("sort_by_progressionpoints")
		for scene in registered_special_scenes:
			if scene[1] > current_progression_points:
				return null
			if GM.main.getSceneByUniqueID(scene[0]).requirements_met():
				return scene[0]
	return null

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "hall_ne_corner")

func react(_triggerID, _args):
	#if(doEventCheck("IssixBusy") != null):
	#	return false
	var scene_to_show = shouldBeShownForcedEvent()
	if scene_to_show != null:
		runScene(scene_to_show)
		return true
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
