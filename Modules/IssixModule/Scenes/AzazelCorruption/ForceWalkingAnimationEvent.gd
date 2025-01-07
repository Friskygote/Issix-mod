extends EventBase

func _init():
	id = "ForceWalkingAnimationEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom)

func run(_triggerID, _args):
	if GM.pc.getLocation().begins_with("petsdream"):
		GM.ui.getStage3d().play(StageScene.PuppySolo, "walk", {}, true, true)


func getPriority():
	return 0

func onButton(_method, _args):
	pass
