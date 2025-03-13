extends SceneBase

func _init():
	sceneID = "HiisiWanderScene2"

func _run():
	if(state == ""):
		saynn("As you walk, you pass smutty kitten Azazel on your way as he goes in the opposite direction, noticing his slow and sensual walk. You give him a wave and he waves back at you as you pass by. A few meters later you begin feeling strangely, as if someone was watching you. You look around and surely enough you spot Hiisi standing in a corner discretely, his eyes tracking the kitten you've just passed.")
		saynn("[say=pc]Hiisi? Hey there.[/say]")
		saynn("[say=hiisi]Hey {pc.name}.[/say]")
		saynn("He says without even looking at you.")
		saynn("[say=pc]Anything wrong? You know, I can see what you are doing.[/say]")
		saynn("Hiisi grumbles in response before moving away from you, tracking Azazel.")
		addButton("Follow", "See what the canine is doing", "followhiisi")
		addButton("Leave", "It doesn't interest you in the slightest", "endthescene")

	if state == "followhiisi":
		saynn("You decide to follow Hiisi, which turns into some kind of scene from a comedy where there is a chain of people following each other. Not much happens really, he is following Azazel, this much you can see. When Azazel reaches the bathroom Hiisi simply stands nearby, listening and observing, not just the bathroom but other inmates too.")

		saynn("After a while Azazel leaves the bathroom and Hiisi again follows them until they end up back in the corner. Azazel seemingly is aware of Hiisi's presence, but chooses to ignore it.")
		addButton("Leave", "Nothing else to observe, come back to your stuff", "endthescene")


func getDevCommentary():
	return "Previous scene with Hiisi shows how he deals with unpleasant situations in the prison where force has to be used. This one is short, but it doesn't have to be a long scene to still explain how Hiisi keeps everything under control. He cares about the harem and other pets. And the pets? They are kind of used to this state of matter already. Worth nothing however, that if they want to they can tell Hiisi to just not follow them, but he will absolutely be stressed about such a situation."

func hasDevCommentary():
	return true


func _react(_action: String, _args):

	if(_action == "endthescene"):
		setModuleFlag("IssixModule", "Hiisi_Encounter_scene", 3)
		endScene()
		return

	setState(_action)
