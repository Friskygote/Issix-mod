extends SceneBase

func _init():
	sceneID = "DemonHiisiTalk"

func _run():
	if(state == ""):
		addCharacter("hiisidemon")
		saynn("Muscular canine body sits a top of a throne placed at the end of the hallway. The dog is residing higher than you, their posture confident, indifferent.")
		addButton("Talk", "Talk to Hiisi", "talk")
		if Globals.checkIfAchieved("Azazel_Corr_Dream_State", "Talked_With_Hiisi"):
			addButton("Learn", "Learn from Hiisi about how the pet should behave", "learn")

	if state == "talk":
		saynn("[say=pc]Hello Hiisi/[/say]")
		saynn("[say=hiisidemon]A fly caught in spider's web, how... Tragic.[/say]")
		saynn("[say=pc]Huh?[/say]")
		saynn("[say=hiisidemon]Sometimes I wonder who really is the devil - the one who treats free will as sacred, or the one who corrupts the very meaning of freedom, who wants others to follow in his footsteps leading to downfall.[/say]")
		if GM.pc.getPersonality().getStat(PersonalityStat.Naive) > 0:
			saynn("[say=pc]I have no idea what you are talking about, but I think the former is the nicer guy.[/say]")
			saynn("[say=hiisidemon]And yet-. Ah, who cares, the fate is determined already. Yes, yes, I can see you. Welcome {pc.name}.[/say]")
		else:
			saynn("[say=pc]Perhaps those who follow the latter seek the downfall he brings. Perhaps they choose themselves to be eternally damned.[/say]")
			saynn("Hiisi raises his eyebrows at your statement. He falls into deep thought.")
			saynn("[say=hiisidemon]That's... Illogical, and yet in the very essence is exactly what happens. The corruptor doesn't have power of his own, he draws it from those who allow themselves to be corrupted, he believes their downfall is their freedom and happiness. And for many - it is, in the wicked way.[/say]")
			saynn("[say=hiisidemon]Welcome {pc.name}, thank you for your food for thought.[/say]")

		saynn("[say=hiisidemon]Let me tell you outright, I do not care whether you become Master's pet or not, it is of no concern to me. But considering you are here, I must teach you how a proper pet should behave. When you are ready to be taught, let me know.[/say]")
		addButton("Sure", "You will", "")

	if state == "learn":
		playAnimation(StageScene.Duo, "allfours", {pc="pc", npc="hiisi"})
		saynn("[say=pc]I'm here to learn from you, Hiisi.[/say]")
		saynn("[say=hiisidemon]So be it. On fours then. A pet should know how to walk and how to keep balance on their fours. Crawl on the floor for me like this.[/say]")
		saynn("You stand on your fours, it isn't particularly difficult, though it gets tiring really quickly.")
		saynn("[say=hiisidemon]You'll have to learn how to crawl like this without consuming too much energy, not easy but requires practice. You'll work on it in your own time.[/say]")
		saynn("[say=hiisidemon]You already know how to listen to commands, but commands are important part of being a pet. To listen to commands you must obey your Master and trust them. Do you trust your Master?[/say]")
		saynn("You nod.")
		saynn("[say=hiisidemon]Will you obey your Master?[/say]")
		saynn("You nod again.")
		saynn("[say=hiisidemon]Good.[/say]")
		saynn("A bone shaped treat materializes out of nowhere in his paw, he shows it to you.")
		saynn("[say=hiisidemon]Now, beg for it.[/say]")
		addButton("Beg", "Beg for the treat (clicker training)", "beg")
		addButton("Refuse", "Refuse to beg", "refusebeg")

	if state == "refusebeg":
		saynn("[say=pc]I refuse.[/say]")
		saynn("[say=hiisidemon]You refuse? You refuse to be trained and beg when Master so desires? Why?[/say]")
		saynn("[say=pc]That would be stooping too low for me.[/say]")
		saynn("[say=hiisidemon]Judging from you being in this domain, you are already in the deep. But so be it, like I said, it's not my concern what happens next. I were to try and teach you, but if student is unwilling, this entire exercise is pointless. Go now, Leave me be.[/say]")
		addButton("Leave", "", "endthescene")

	if state == "beg":
		playAnimation(StageScene.Beg, "beg", {pc="pc", npc="hiisi"})
		saynn("Without giving it any thought you kneel on your twos and curl your paws obediently begging Hiisi for his treat, you hear a click from all around, it makes you happy.")
		saynn("[say=hiisidemon]See? It comes to you instinctively now. That's how it should be.[/say]")
		addButton("Catch", "Catch the treat", "catch")

	if state == "catch":
		playAnimation(StageScene.Beg, "pat", {pc="pc", npc="hiisi"})
		saynn("Hiisi throws a treat at you and you catch it with your mouth.")
		saynn("[say=hiisidemon]Good {pc.boy}.[/say]")
		saynn("You repeat begging a few more times, and nail it perfectly each.")
		addButton("Continue", "Continue the exercises", "sitlay")

	if state == "sitlay":
		playAnimation(StageScene.Duo, "kneel", {pc="pc", npc="hiisi"})
		saynn("[say=hiisidemon]Sit.[/say]")
		saynn("You follow his command immediately, hearing a click and feeling rushing endorphins in your blood. It's really your nature now. You don't know when it happened, when did a switch get flipped to make you so receptive to commands, how did that even happen? Right now, no matter what kind of command gets out of Hiisi's mouth you follow it without thinking.")
		saynn("[say=hiisidemon]Lay.[/say]")
		saynn("You ley on your belly in front of Hiisi. It's this click again. It's a sign you did good job. It's a sign you are a good {pc.boy}.")
		saynn("[say=hiisidemon]Sit.[/say]")
		saynn("And so you are sitting, once again. Hearing the same clicking sound. You no longer want to know where it comes from, you simply know its there and when its there everything is good. You feel good. You want to hear more of it. You want to obey your Master, you know it will lead to more clicks, you know you will be rewarded, maybe not always by something physical, even praise will do for you. You want to be a good {pc.boy}. This is something you crave, that you need for your continued existence.")
		saynn("Hiisi continues his training, which goes on for a little bit, many clicks later, your brain feeling so fuzzy but so good, he announces the training session is over, and you are trained.")
		saynn("[say=hiisidemon]Wonderful job. Master will be proud to have you as his pet. Now go, we will see each other soon.[/say]")
		addButton("Leave", "Training session is over", "endthescene")


func getDevCommentary():
	return ""

func hasDevCommentary():
	return false


func _react(_action: String, _args):
	if _action == "learn":
		Globals.modifyDictStates("Azazel_Corr_Dream_State", "Got_Hiisis_Permission", true)

	if _action == "sitlay":
		Globals.modifyDictStates("Azazel_Corr_Dream_State", "Trained_With_Hiisi", true)

	if _action == "talk":
		Globals.modifyDictStates("Azazel_Corr_Dream_State", "Talked_With_Hiisi", true)

	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
