extends SceneBase

const Globals = preload("res://Modules/IssixModule/Globals.gd")

func _init():
	sceneID = "IssixSlaveryCommandContTraining"

func _run():
	if(state == ""):
		playAnimation(StageScene.Duo, "kneel", {npc="issix", npcAction="stand"})
		# CON
		saynn("[say=pc]Good day Master, I'd like to continue training commands...[/say]")
		saynn("[say=issix]Ah, of course. How are you feeling after last time?[/say]")
		saynn("[say=pc]I'm good! Thank you for your care Master.[/say]")
		saynn("[say=issix]Heh. Of course my pet.[/say]")
		saynn("You get headpats from your kind Master and start blushing as a reaction.")
		saynn("[say=issix]Alright, come.[/say]")
		addButton("Walk", "Walk to Master's cell", "follow_to_cell")
		# NONCON TODO

	if state == "follow_to_cell":
		aimCamera("cellblock_red_nearcell")
		saynn("You follow your Master to his own cell.")

		saynn("You are once again back at the crampy cell of your Master. It's still as cramped as it was the last time.")
		saynn("[say=issix][b]Sit[/b].[/say]")

		saynn("You obey the command without a hitch while Master fetches familiar box from the top of the stash.")
		saynn("[say=issix]You remember all of those, don't you? Wonderful.[/say]")
		saynn("He puts the ear pieces into your ears, followed by the cap on your head.")
		saynn("[say=issix][b]Present yourself[/b].[/say]")
		saynn("And so you do, standing on your fours, changing position so you look towards cell's entrance while the familiar feeling grows in your backside as Master effortlessly slides the „butt plug” in.")
		saynn("[say=issix]Splendid, now last piece.[/say]")
		saynn("You once again meet the gaze of your Master, a honest and kind look coming from his eyes as he puts on the visors on your head, covering your eyes. He takes a step back to look at you with all of the equipment on.")
		saynn("[say=issix]Now, [b]give me a bark[/b].[/say]")
		if "canine" in GM.pc.getSpecies():
			saynn("[say=pc]Arf![/say]")
		else:
			saynn("[say=pc]Waaf?[/say]")

		saynn("[say=issix]Good pup.[/say]")
		saynn("He begins to fiddle with the central device as you observe him. Finally he says again.")

		saynn("[say=issix][b]Give a paw[/b].[/say]")
		saynn("*click*")
		saynn("You put your paw on your Master's paw, this time you once again feel pleasure spreading through your body as you hear a click in your ears. Your Master grins and begins another lesson.")

		addButton("Training", "Continue training with Master", "train_commands_last")

	if state == "train_commands_last":

		saynn("You've completely lost any touch with time. The only thing that mattered for you is fulfilling every single command, and feeling the pleasure that comes with each successful fulfillment of the command. You don't miss a beat, your actions become almost robotic with their accuracy and speed. Failure is not an option, not that the commands your Master gives you are difficult.")
		saynn("[say=issix][b]Sit[/b][/say]")
		saynn("*click*")
		saynn("[say=issix][b]Roll[/b][/say]")
		saynn("*click*")
		saynn("[say=issix][b]Give paw[/b][/say]")
		saynn("*click*")
		saynn("[say=issix][b]Present[/b][/say]")
		saynn("*click*")

		saynn("As the time went, you were able to tell next command by simple observing Master's face as he spoke. This time, you didn't even notice that the pleasure from device inserted into your ass gave you smaller and smaller doses of pleasure as they felt like the regular doses of pleasure to you.")
		saynn("[say=issix][b]Sit[/b][/say]")
		saynn("*click*")
		saynn("[say=issix][b]Roll[/b][/say]")
		saynn("*click*")

		saynn("Your Master grins.")
		saynn("[say=issix]We are done here. You can [b]stand[/b].[/say]")
		saynn("*click*")
		saynn("You look with confusion at your Master after standing up.")
		saynn("[say=issix]Your conditioning is now done. Last 10 commands you didn't even seem to notice that all of the devices except the ear pieces were disabled.[/say]")
		saynn("He begins to unstrap your visor, device on your head as well as takes out the pieces from your ears.")
		saynn("[say=pc]Does it mean that... My training is now complete?[/say]")
		saynn("[say=issix]Yes it is, cute pet.[/say]")
		saynn("He kisses your forehead while he goes around you and pulls out the plug out of your ass.")
		saynn("[say=pc]I... I don't feel much different?[/say]")
		saynn("[say=issix]Sit.[/say]")
		saynn("*click*")
		saynn("You don't notice when, but by the time you realize you are already sitting.")
		saynn("[say=issix]Like I said, the training is complete.[/say]")
		saynn("The real consequences of such conditioning hit you only just now, and despite them you feel incredibly thankful to your Master for training you and making you a better pet.")
		saynn("[say=pc]Thank you, Master![/say]")
		saynn("[say=issix]But of course.[/say]")
		addButton("End training", "Your training has ended", "finish")

	if state == "finish":

		saynn("As you leave Master's cell you feel strange sense of belonging and want to do even more , become an even better pet for your Master. You can't wait in anticipation for when he'll use the commands on you again.")
		addButton("End", "Leave", "endthescene")


func _react(_action: String, _args):
	processTime(2*60)
	if _action == "finish":
		addMessage("You've gained 200 experience points at being a good pet for your Master")
		addMessage("You've gained a new perk „Commands”.")

	if _action == "follow_to_cell":
		GM.pc.setLocation("cellblock_red_nearcell")
		GM.pc.addLust(30)

	if _action == "train_commands_last":
		increaseModuleFlag("IssixModule", "PC_Training_Level")
		Globals.addIssixMood(10)
		GM.pc.addSkillExperience("Pet", 200)
		GM.pc.getSkillsHolder().addPerk("Commands")
		setModuleFlag("IssixModule", "Learned_Commands", true)

	if(_action == "endthescene"):
		endScene([true])
		return

	setState(_action)
