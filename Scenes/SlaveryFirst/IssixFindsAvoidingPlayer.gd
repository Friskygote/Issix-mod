extends SceneBase

var reaction = false

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
		if (GM.pc.getPersonality().getStat(PersonalityStat.Coward) < -0.8):
			addButton("Walk away", "Just keep walking", "leave")
		else:
			addDisabledButton("Walk away", "Let's be honest, you don't have balls to do this")

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
		saynn("You decide to ignore the dragon-demon completely and continue walking, only to be stopped not even a step later by Your Master's hand grabbing you by the collar.")
		saynn("[say=issix]What the fuck do you think you are doing? I asked you a question.[/say]")
		saynn("[say=pc]I'm walking.[/say]")
		saynn("[say=issix]On twos, that's your first mistake, second is the direction you are going at.[/say]")
		saynn("As he says that he clasps a leash onto your collar and pulls you towards his corner in the main hall.")
		saynn("[say=issix]I'm not going to ask you. You are going with me.[/say]")
		addButton("Continue", "Unable to oppose such a strength, you follow Issix to the corner", "walkcorner")

	if state == "walkcorner":
		playAnimation(StageScene.Duo, "kneel", {npc="issix", npcAction="stand", bodyState={leashedBy="issix"}})
		saynn("As you approach the corner, you feel three pets of Issix clearly thrown off by the situation. They avoid looking at you, intensifying the feeling of disgrace that was put on you. Your Master reaches his chair and forcefully pulls the leash down to make you sit on your blanket.")
		saynn("[say=issix]SIT[/say]")
		saynn("Seeing no other option, you sit, looking down.")
		match getModuleFlag("IssixModule", "Strikes_For_Disobedience", 0):
			0, 0.0:
				if reaction:
					saynn("[say=issix]Listen, pet. Perhaps I weren't clear enough. I expect to see you every day in here. I don't want to hear excuses, unless you are physically unable to appear in here, due to some fucked circumstances - you come here every day without fault.[/say]")
				else:
					saynn("[say=issix]Here is the deal, pet - I don't take no for an answer, and I don't buy bullshit. I'm very sure I made myself clear that I expect my property to come to my corner once a day, anything short of that is unacceptable. Unless you are abducted by aliens or nurses, you better come here every single day, fucking hell.[/say]")
				addButton("Understood", "Acknowledge your Master's commands", "understand")
			1, 1.0:
				saynn("[say=issix]So you did it again? You ignored my warning and stopped coming on your own? What the fuck are you thinking, pet? Do you think this is a joke? That I'm endlessly good and all? Perhaps it's the time I started to put some discipline in you huh? Yeah, I think you do need some discipline.[/say]")
				saynn("He strips down his clothes and puts on the boxers.")
				saynn("[say=issix]I tried to reason, but apparently my pet does not understand reason. When reason doesn't work, a more persuasive approach can help.[/say]")
				addButton("Fight", "Issix is ready to fight you", "startfight")
				addButton("Surrender", "Don't even attempt to fight", "surrenderfight")
			2, 2.0:
				addMessage("This is still under construction, sowwy :( ~ Frisk")  # TODO Finish end of Issix's story on disobedience
				saynn("Master Issix sits in silence, just staring into you for a while.")
				saynn("[say=issix]I really don't know what to say. No, really. I have no idea what words can I use in here. The demons of this world ran out of juice. Like, what the fuck does this even mean? What am I doing here?[/say]")
				addButton("Back", "Maybe chaining mod's creator in the dungeon with a computer will make this go faster.", "endthescene")

	if state == "understand":
		saynn("[say=pc]I understand, Master.[/say]")
		saynn("[say=issix]You are still on the timeout, I expect you to stay in here for an hour longer today. This is the last time it happens.[/say]")
		addButton("Continue", "Continue", "backtothething")

	if state == "surrenderfight":
		# playAnimation(StageScene.PuppyPinned, "pinned", {pc="pc", npc="issix", bodyState={leashedBy="issix"}, npcBodyState={naked=false, hard=false}})
		playAnimation(StageScene.PuppyDuo, "kneel", {pc="issix", npc="pc", bodyState={naked=false, hard=false}, npcBodyState={naked=false, hard=false, leashedBy="issix"}})
		saynn("[say=issix]All that bravery leaving you the moment I lose my shirt? Or have you came to your senses? Can't complain, I do not like roughing up my pets like this. But since you are so nice on your knees already why not make use of it?[/say]")
		saynn("He pulls out bunch of black gear, takes your arms and instructs you to bend your arms which he secures in first part from the gear he pulled out. You quickly recognize the gear is a bitchsuit made to restrict your ability to move.")
		saynn("[say=issix]Arms are done, legs, will you?[/say]")

		saynn("You can feel your arms being severely restricted, the idea of straightening them is out of question, without external help you would be unable to do anything about your current state of body you are in. As you test your arms, the same thing happens to your legs, as your Master Issix secures them in very similar device.")
		saynn("[say=issix]Here we go. Just a few more things and we'll be golden.[/say]")
		addButton("Continue", "Oh shit, what now", "contsurrender")

	if state == "contsurrender":
		playAnimation(StageScene.PuppyPinned, "pinned", {pc="pc", npc="issix", bodyState={leashedBy="issix"}, npcBodyState={naked=false, hard=false}})
		saynn("With your lack of mobility and you can't do much at this point, other than accept everything that is happening to you. And so you do, trying to stand on your fours, struggling. Having to adapt to completely new balance and way of „standing”. Your Master continues to add further bondage gear onto you. A ball gag is first pushed into your mouth, then bondage mittens finishing your helpless look.")
		saynn("[say=issix]Think that's it, I think you look great now. In AlphaCorp that's how the leg footrest looks like in high-level corporate offices. Not a fan of footrest though, I prefer my feet on the ground, that said, the circumstances are pretty extraordinary here.[/say]")
		saynn("He puts his foot on your head and applies force making you collapse your front „legs” with your muzzle touching the ground.")
		saynn("[say=issix]This is a place for disobedient pets. Smelling the ground, under my foot. I want you to remember this feeling, to remember the helplessness you feel right now. My pets obey me, when I tell them to come here every day they do that. Do you understand now?[/say]")
		saynn("[say=pc]Yes, please, I understand.[/say]")
		saynn("[say=issix]Can barely hear your scowling. Good.[/say]")
		saynn("He lets go of his foot, kneels and unstraps your legs and arms.")
		saynn("[say=issix]Don't want to see you here today, I'm not unlocking the rest - this is your punishment, get the fuck away.[/say]")
		addButton("Leave", "Leave the place", "endthescene")


	if state == "if_won_issix_lust":
		saynn("[say=issix]Huff. Enough. I yield, fucking hell. Huff.[/say]")
		saynn("Clearly bothered by his inability to stay unaffected by your lusty advances Issix is on his knees in defeat, with a hardon in his paw.")
		saynn("[say=issix]I don't understand how you - a fucking slut could bring me to this state, but the fact is undeniable. To say I've been humiliated is an understatement. I can no longer call you my pet. You are a monster, a sex machine, huff..[/say]")
		saynn("His need evident, pent up sexual energy overwhelming the dragon")
		addButton("Finish him", "Give the dragon the relief he needs", "finishissix")
		addButton("Leave", "Let the dragon take care of his little problem by himself", "leaveissix")

	if state == "finishissix":
		pass # TODO

	if state == "leaveissix":
		pass # TODO


	if state == "if_won_issix_pain":
		saynn("[say=issix]Enough. I yield.[/say]")
		saynn("Issix is laying on his knees in submission.")
		saynn("[say=issix]It's pathetic, for the Master to lose against his pet in a fight. You've made good enough of display of power. I... Don't know what to say. Leave now, I need a day to think things over, we will talk tomorrow.[/say]")   # TODO Missing scene
		addButton("Leave", "You've done enough", "endthescene")

	if state == "if_lost_issix":
		saynn("[say=issix]Do you get it now? Who OWNS YOU? Who is your Master? Do you understand now? You better fucking do. Don't you dare do this again, pet.[/say]")
		saynn("Feeling in pain, you don't have anything else to answer other than.")
		saynn("[say=pc]I'm sorry, Master, I won't do this again.[/say]")
		saynn("[say=issix]Do you really mean it? Or is that another lie? Look at me, LOOK![/say]")
		saynn("He grabs you by your neck, tilts your face to meet his gaze, his face angry, furious even, staring deep into you, just like when he was judging you when you wished to become his "+ IssixModule.getPlayerPetName() + ".")
		saynn("[say=issix]Don't make me assert control over you again.[/say]")
		saynn("He releases your body from heavy grip.")
		saynn("[say=issix]I think you suffered enough of humiliation for today. Do whatever you want, but I expect you tomorrow in the corner, as usual.[/say]")
		addButton("Leave", "Leave", "endthescene")



func _react(_action: String, _args):
	processTime(2*60)
	if _action == "honest":
		reaction = true

	if _action == "contsurrender":
		var bg: ItemBase = GlobalRegistry.createItem("ballgag")
		bg.addSmartLock(SmartLock.KeyholderLock, "issix")
		var bm: ItemBase = GlobalRegistry.createItem("bondagemittens")
		bm.addSmartLock(SmartLock.KeyholderLock, "issix")
		GM.pc.getInventory().forceEquipByStoreOther(bg, "issix")
		GM.pc.getInventory().forceEquipByStoreOther(bm, "issix")
		increaseModuleFlag("IssixModule", "Pet_Time_Interaction_Today", 60*60)
		setModuleFlag("IssixModule", "Unwelcome_At_Corner", true)

	if _action == "startfight":
		runScene("FightScene", ["issix"], "issixfight")

	if _action == "understand":
		GM.main.setModuleFlag("IssixModule", "Is_Player_Forced_Today", 2*60*60)
		if not (getModuleFlag("IssixModule", "Issix_Mood", 50) >= 70 and reaction == true):
			increaseModuleFlag("IssixModule", "Strikes_For_Disobedience")

	if _action == "if_lost_issix":
		setModuleFlag("IssixModule", "Is_Player_Forced_Today", 3*60*60)

	if _action == "walkcorner":
		playAnimation(StageScene.Duo, "kneel", {npc="issix", npcAction="stand", bodyState={leashedBy="issix"}})
		runScene("ParadedOnALeashScene", ["issix", GM.pc.getLocation(), "hall_ne_corner", [
			"Can't fucking believe this shit",
			"Did you really think this would work?",
			"Master says, pets obey"
		], "hall_ne_corner", "crawl"])

	if _action == "backtothething":
		runScene("SlaveryInfoScreen", [], "finishslaveryinfo")

	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

func _react_scene_end(_tag, _result):
	if _tag == "finishslaveryinfo":
		endScene()

	if(_tag == "issixfight"):
		processTime(20 * 60)
		var battlestate = _result[0]
		var wonHow = _result[1]

		if(battlestate == "win"):
			if(wonHow == "lust"):
				setState("if_won_issix_lust")
			else:
				setState("if_won_issix_pain")
			addExperienceToPlayer(150)
			increaseModuleFlag("IssixModule", "Pet_Time_Interaction_Today", 60*60)
			setModuleFlag("IssixModule", "Unwelcome_At_Corner", true)
		else:
			setState("if_lost_issix")
			increaseModuleFlag("IssixModule", "Pet_Time_Interaction_Today", 60*60)
			addExperienceToPlayer(20)
