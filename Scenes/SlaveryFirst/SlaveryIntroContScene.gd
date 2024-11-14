extends SceneBase

func _init():
	sceneID = "IssixSlaveryIntroCont"

func requirements_met():
	return getModuleFlag("IssixModule", "Misc_Slavery_Info", {"scenes_seen": []})["scenes_seen"].find("IssixSlaveryIntroCont") == -1

func _run():
	if(state == ""):
		playAnimation(StageScene.Duo, "kneel", {npc="issix", npcAction="stand"})

		saynn("As you approach the corner your Master stands, grinning. You assume your position on your blanket.")
		saynn("[say=issix]Good day, pet. [/say]")
		if(OPTIONS.isContentEnabled(ContentType.Watersports)):
			if GM.pc.getFluids().hasFluidTypeWithCharID("Piss", "issix"):
				saynn("[say=issix]My my. My piss slut came back and {pc.he} is marked by myself. [/say]")
			else:



func _react(_action: String, _args):

	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
