extends SceneBase

func _init():
	sceneID = "NovaIssixTalkScene"

func _run():
	if(state == ""):
		saynn("[say=pc]Could you tell me more about Issix?[/say]")
		saynn("[say=nova]Issix? What would you want to know?[/say]")
		saynn("[say=pc]How are they? Are they problematic? Do they have issues with violence?[/say]")
		saynn("[say=nova]Hmm, him not really, honestly he is more of gentleman type if we were to compare him to the rest of the prison. I haven't had too much experience with them, they rather keep to their little corner on the main platform. But in terms of his reputation in the prison he is very chill and doesn't get into fights, usually when I hear he is involved in something it's because he defended his pets or himself.[/say]")
		saynn("[say=pc]And how is his fighting?[/say]")
		saynn("[say=nova]Haven't seen it in person, though what I did hear was that you don't wanna fight this guy, he is a monster.[/say]")
		saynn("[say=pc]Wow.[/say]")
		match getModuleFlag("IssixModule", "PC_Enslavement_Role", 0):
			0:
				addButton("Being a pet", "Talk how you'd like to become his pet", "becomeapet")
			1:
				addButton("Became a pet", "Talk how you became Issix's pet", "becameapet")
		addButton("Back", "End this topic", "endthescene")

	if state == "becomeapet":
		saynn("[say=pc]How the prison staff feels about his slaves?[/say]")
		saynn("[say=nova]We do have order not to touch him, and honestly not that we would, he helps... Yes - he has slaves all on display but captain believes that's good for morale or something.[/say]")
		saynn("[say=pc]How does he treat his pets?[/say]")
		saynn("[say=nova]Interested?[/say]")
		saynn("Nova gives you a sly wink, you blush.")
		saynn("[say=nova]Oh, you are, that's hot. Honestly, as far as slavery goes he is a kinky one but I think he genuinely cares about his slaves, at least as far as I've seen and heard, which isn't a lot.[/say]")
		saynn("[say=pc]He doesn't mistreat them?[/say]")
		saynn("[say=nova]Not that I've heard about.[/say]")
		saynn("[say=pc]I see, thanks Nova.[/say]")
		saynn("[say=nova]Sure thing, cutie.[/say]")
		addButton("Back", "End this topic", "endthescene")

	if state == "becameapet":
		saynn("[say=nova]Hehe, I've seen you have given your cute ass away to a new Master.[/say]")

		saynn("You blush in embarrassment")
		saynn("[say=pc]Y-yeah I did. I'm now Master Issix's pet.[/say]")
		saynn("[say=nova]Adorable. Hope the best for you in your new life cutie, you do look good with a leash.[/say]")
		saynn("[say=pc]Thank you...[/say]")
		addButton("Back", "Look away embarrassed", "endthescene")


func _react(_action: String, _args):


	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
