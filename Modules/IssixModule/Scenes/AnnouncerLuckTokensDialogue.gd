extends SceneBase

func _init():
	sceneID = "AnnouncerLuckTokenDialogue"

func _run():
	if(state == ""):
		if getModuleFlag("IssixModule", "Got_Luck_Token_Before") == false:
			saynn("[say=pc]Umm, I've gotten this thing here, is this something you are interested in?[/say]")
			saynn("You show the announcer the luck token you've gotten from Issix.")
			saynn("[say=announcer]Hoo hoo, the luck tokens! Truth be told, they've lost on value with the time, but yes, I'm still collecting them. Though that makes me wonder, where have you got one babe? They aren't easy to come by in the prison, I haven't seen one in ages.[/say]")
			saynn("[say=pc]Let's just say that I found one?[/say]")
			saynn("[say=announcer]Oh, of course, you aren't willing to share, that's fine with me babe. Anything in specific you'd like in return for this gem?[/say]")
			if GM.pc.getPersonality().getStat(PersonalityStat.Naive) > 0:
				saynn("[say=pc]I'm not sure how expensive they are.[/say]")
				saynn("[say=announcer]Not very clever of you to be exchanging things that you don't know value of. Like I said, they aren't expensive at all, but they still hold their value. Tell you what, how does 40 credits sound like?[/say]")
				addButton("Fine", "Agree to the deal", "transaction")
			else:
				saynn("You take a close look at the metal token, this heavy blend of metals is rather rare in your chunk of galaxy. While you aren't sure about how rare exactly it is in here, you take a gander that melting the metal in this token could be a quite profitable endeavor.")
				addButton("90 credits", "That's your offer", "transaction")
		else:
			saynn("[say=pc]How much for this luck token?[/say]")
			# sorry
			var item = GM.pc.getInventory().getFirstOf("LuckToken")
			saynn("[say=announcer]This one? Hmm. I'm willing to pay you "+str(calculateCost(item))+" credits for this one, what do you think?[/say]")
			addButton("Sure", "Sell your luck token for "+str(calculateCost(item)), "agreesell")
			addButton("Nah", "Don't sell your luck token", "endthescene")


	if state == "transaction":
		if GM.pc.getPersonality().getStat(PersonalityStat.Naive) > 0:
			saynn("[say=pc]Fine by me.[/say]")
			saynn("[say=announcer]Splendid! Let me relive you of this weight now.[/say]")
		else:
			saynn("[say=pc]90 credits.[/say]")
			saynn("[say=announcer]Tsk. Fine. Your offer is at the very top of range that I'd be willing to pay for this token. But if you ever come back with more, don't expect the same sell price. Luck tokens were made with different degrees of quality, this one on the better end, but not every is.[/say]")
		saynn("You pass the token to the announcer.")
		saynn("[say=pc]Pleasure doing business.[/say]")
		saynn("[say=announcer]Likewise babe.[/say]")
		addButton("Leave", "Leave", "endthescene")

func calculateCost(item):
	return int(ceil((45 if getModuleFlag("IssixModule", "Announcer_PC_Naive") else 95)*item.getQuality()))

func _react(_action: String, _args):
	if _action == "transaction":
		if GM.pc.getPersonality().getStat(PersonalityStat.Naive) > 0:
			setModuleFlag("IssixModule", "Announcer_PC_Naive", true)
			addMessage("You've exchanged one luck token to the announcer for 40 credits.")
			GM.pc.addCredits(40)
		else:
			setModuleFlag("IssixModule", "Announcer_PC_Naive", false)
			addMessage("You've exchanged one luck token to the announcer for 90 credits.")
			GM.pc.addCredits(90)
		GM.pc.getInventory().removeXFromItemOrDelete(GM.pc.getInventory().getFirstOf("LuckToken"), 1)

	if _action == "agreesell":
		var item = GM.pc.getInventory().getFirstOf("LuckToken")
		GM.pc.addCredits(calculateCost(item))
		GM.pc.getInventory().removeItem(item)
		addMessage("You've exchanged one luck token to the announcer for "+str(calculateCost(item))+" credits.")
		endScene()
		return

	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
