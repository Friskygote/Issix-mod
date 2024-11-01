extends SceneBase

func _init():
	sceneID = "MedicalLamiaPeekScene"

func _run():
	if(state == ""):
		saynn("You can definietely hear something happening there...")
		addButton("Leave", "Leave", "endthescene")
		# How to lock player out of entering the hospital room?

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	
	setState(_action)
