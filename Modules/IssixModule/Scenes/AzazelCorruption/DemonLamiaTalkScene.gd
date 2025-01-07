extends SceneBase

func _init():
	sceneID = "DemonLamiaTalk"

func _run():
	if(state == ""):
		addCharacter("lamiademon")
		saynn("You face Lamia. A fiery fox simply sits atop of a burning blanket, which doesn't seem to concern the fox at all. On the blanket, next to them lies a jar filled with water and many dark segmented worms swimming around and sticking to the glass with their circular opening of the body. On three walls surrounding them are countless drawings decorating the walls, you can see a few pentagrams, horned creatures, fiery hells.")
		addButton("Talk", "Talk with the fox", "talk")
		if true:
			addButton("Speech", "Learn how to speak like a good pet does", "learn")

	if state == "talk":
		saynn("[say=pc]Hello Lamia, umm, how are you?[/say]")
		saynn("Lamia gives you thumbs up.")

func getDevCommentary():
	return ""

func hasDevCommentary():
	return false


func _react(_action: String, _args):


	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
