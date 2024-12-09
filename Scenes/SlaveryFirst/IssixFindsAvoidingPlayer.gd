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
		if (GM.pc.getPersonality().getStat(PersonalityStat.Coward) < -0.5):
			addButton("Not a pet", "Tell your Master that you no longer wish to be his pet", "rejection")
		else:
			addDisabledButton("Not a pet", "You are too much of a coward to tell your Master this")
		addButton("Walk away", "Just keep walking", "leave")

	if state == "excuse":
		saynn("[say=pc]I'm sorry, I were working on something really hard lately and...[/say]")
		saynn("[say=issix]Enough. I'm not interested in hearing any of this.[/say]")
		saynn("He comes to you and attaches the leash to your collar.")
		saynn("[say=issix]Disappearing like that and giving me such a bad excuse? That's disappointing, extremely disappointing. You are coming with me.[/say]")
		addButton("Continue", "Follow Issix to the corner", "walkcorner")

	if state == "honest":
		saynn("[say=pc]I'm very sorry Master. I didn't feel like coming lately. I've been taking time to do some-[/say]")
		saynn("[say=issix]Enough.[/say]")
		saynn("He comes to you and attaches the leash to your collar.")
		saynn("[say=issix]This is not what I expect of my pets, I were worried about you, you know? You know exactly what are my expectations towards you - you come to the corner, day after day, you spend some time with us and then you have the rest of entire day to spare. This isn't a lot to ask. Really.[/say]")
		saynn("His look of disappointment is pretty hard to bear on you. He leads you towards the corner.")
		addButton("Continue", "Follow Issix to the corner", "walkcorner")

	if state == "rejection":
		saynn("[say=pc]I don't want to be your pet anymore.[/say]")
		saynn("Your Master stands stunned by your proclamation.")
		saynn("[say=issix]What did you just say?[/say]")
		saynn("[say=pc]I no longer want to be your pet.[/say]")
		saynn("[say=issix]I don't think you understand your position, pet. You are not in a position to decide on that anymore, you've made your decision a while ago, you don't just get to change it because your feel like it, such decision belongs to your Master. Now, be a good "+IssixModule.getPlayerPetName()+" and come with me.[/say]")
		addButton("Continue", "Follow Issix to the corner", "walkcorner")

	if state == "leave":
		saynn("You decide to ignore the dragon-demon completely and continue walking, to be stopped not even a step later by Your Master's hand grabbing you by the collar.")
		saynn("[say=issix]What the fuck do you think you are doing? I asked you a question.[/say]")



func _react(_action: String, _args):
	processTime(2*60)


	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
