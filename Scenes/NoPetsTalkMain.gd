extends SceneBase

func _init():
	sceneID = "NoPetsTalkScene"

func _run():
	if(state == ""):
		setLocationName("Issix's Corner")
		saynn("You take a look at sheet of paper laying on the floor. It must have been dropped by Issix when he stormed out of here with his pets.")
		saynn("It's insanely difficult to tell what exactly is drawn on the sheet of paper. The lines are very shaky and by themselves they hardly make anything recognizable.")
		saynn("It kind of reminds you of a snake, though it has no head and rather is like a tube with spiky tail. The other end of that tube seems to have been filled with color.")
		saynn("There isn't much more you can gather from this little piece of paper.")
		addButton("Leave", "Leave the paper as it is", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
