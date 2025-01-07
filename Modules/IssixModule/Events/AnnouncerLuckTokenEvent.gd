extends EventBase

func _init():
	id = "AnnouncerIssixExtender"

func registerTriggers(es):
	es.addTrigger(self, Trigger.SceneAndStateHook, ["AnnouncerTalkScene", ""])

func run(_triggerID, _args):
	if GM.pc.getInventory().hasItemID("LuckToken"):
		addButton("Luck token", "Talk with Announcer about exchanging your luck token", "main")
		return true
	return false


func onButton(_method, _args):
	if(_method == "main"):
		runScene("AnnouncerLuckTokenDialogue")

func getPriority():
	return 20
