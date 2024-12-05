extends SceneBase


func _init():
	sceneID = "IssixFoundPlayer"

func _run():
	if(state == ""):
		playAnimation(StageScene.Duo, "stand", {npc="issix", npcAction="stand"})

		saynn("[say=issix]Hey there pet! Now, care to explain why haven't you visited for past XX days?[/say]")
		saynn("Issix almost running stops you with haste before the guard checkpoint. His face is a mix of concern and anger.")
		addButton("Excuse", "Think of an excuse to escape this awkward situation", "excuse")
		addButton("Honest", "Tell your Master that you just haven't had the time", "honest")
		addButton("Not a pet", "Tell your Master that you no longer wish to be his pet", "rejection")
		addButton("Walk away", "Just keep walking", "leave")

	if state == "excuse":
		saynn("[say=pc]I'm sorry, I were working on something really hard lately and...[/say]")
		saynn("[say=issix]Enough. I'm not interested in hearing any of this. [/say]")



func _react(_action: String, _args):
	processTime(2*60)


	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
