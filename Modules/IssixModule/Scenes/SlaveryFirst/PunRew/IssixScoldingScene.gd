extends "res://Modules/IssixModule/Scenes/RequirementsBasedScene.gd"

var preference = 0

func _init():
	sceneID = "PunRewScold"

func _run():
	if(state == ""):
		saynn("You approach the harem but Issix calls you in.")
		saynn("[say=issix]Pet. I'm disappointed.[/say]")
		saynn("He continues - scolding you for your behavior. calling you a bad pet, and giving you advice on how to do better.")
		addButton("Accept", "Accept your place", "accept")
		Globals.addButtonCheckNoncon("Disagree", "Disagree with your Master", "decline")

	if state == "accept":
		saynn("You listen thoroughly to your Master, you agree with him that your behavior wasn't appropriate, apologize to him and make amends.")
		saynn("[say=pc]I'm sorry Master, I promise I'll not repeat the mistake again.[/say]")
		saynn("[say=issix]I appreciate this, pet, and I'll hold your word for that. So don't go break it again, understood?[/say]")
		saynn("[say=pc]Yes, Master.[/say]")
		saynn("[say=issix]Then we are done here.[/say]")
		addButton("End", "End the conversation", "endthescene")

	if state == "decline":
		saynn("You finally find a moment to interject.")
		saynn("[say=pc]I didn't do anything wrong! You are jus-[/say]")
		saynn("Issix shuts you up by muzzling your mouth.")
		saynn("[say=issix]Exactly what I were talking about. Bratty pet. Wasn't your turn to speak, especially in a such unworthy of a pet manner.[/say]")
		saynn("He applies more pressure on your muzzle, his strong grip causing you enough pain to whimper.")
		saynn("[say=issix]Learn. When. To. Speak. Get out of my sight now.[/say]")
		addButton("End", "End the conversation", "endthescene")


func defaultCategory() -> String:
	return "PUNISHMENT"

func oneTimeOnly(_checkID: String):
	return true

func _react(_action: String, _args):
	if _action == "decline":
		Globals.addIssixMood(-3)

	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
