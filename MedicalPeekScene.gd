extends SceneBase

func _init():
	sceneID = "MedicalLamiaPeekScene"

#func _reactInit():
#	endScene()
#	return

func _run():
	if(state == ""):
		
		if (getModuleFlag("IssixModule", "Medical_Peeked") == null):
			saynn("You can definietely hear something happening in the hospital room north...")
			addButtonAt(3, "Investigate", "Try to see if you can hear something", "eavesdrop")
		else:
			saynn("The room to north seems to be quiet now, occassionally some ruffling can be heard.")
		addDisabledButtonAt(6, "North", "The double doors leading to the room are closed shut, you can't go in")
		addButtonAt(10, "West", "Go west", "west")
		addButtonAt(12, "East", "Go east", "east")
		#addButtonAt("Leave", "Leave", "endthescene")
		# How to lock player out of entering the hospital room?
		# just force a scene of them Mr White yo
		
	if(state == "eavesdrop"):
		setModuleFlag("IssixModule", "Medical_Peeked", true)
		saynn("There are a couple of voices you can hear throuh the doors, none of them are loud enough to make out full sentences, but from the tone you can at least make out who is speaking.")
		saynn("[say=issix]- long ---? --- pain?[/say]")
		saynn("[say=eliza]-- tell, --- midnight. We've -- anesthetic -- shouldn't feel any -. ------ nutrients --, --- needs - rest.[/say]")
		saynn("[say=issix]-- believe --- again, -- sake![/say]")
		saynn("There is a sounds of someone banging on something.")
		saynn("[say=eliza]-- calm, Issix, --- fine. That -, -- remove - parasite, -- integrated --- at --. -- to live --, - just - Sacrifices.[/say]")
		saynn("[say=issix]-- told me -- last --, --- nothing --- done?[/say]")
		saynn("[say=eliza]-- AlphaCorp --- the inmate ---... - sorry.[/say]")
		saynn("[say=azazel]---, I - Lamia ---.[/say]")
		saynn("[say=hiisi]--, Master, ---- be okey.[/say]")
		saynn("[say=issix]... Thank -, pets. --[/say]")
		saynn("Slight weeping can be heard from behind the doors.")
		saynn("[say=issix]--- care ----, I can't lose ---, --? ---- together.[/say]")
		saynn("[say=azazel]-- Master! ------![/say]")
		saynn("[say=hiisi]No ----![/say]")
		saynn("[say=issix]--. wait - Lamia --.[/say]")
		saynn("[say=eliza]-- stay ----, -- observe --.[/say]")
		saynn("[say=issix]Thank -, -.[/say]")
		saynn("The voices are now quiet, you think the conversation ended.")
		addButton("Leave", "This seems to be over now", "")
		
func _react(_action: String, _args):

	if(_action == "west"):
		aimCameraAndSetLocName("med_corridor13")
		GM.pc.setLocation("med_corridor13")
		endScene()
		return
	
	if(_action == "east"):
		aimCameraAndSetLocName("med_corridor14")
		GM.pc.setLocation("med_corridor14")
		endScene()
		return
	
	if(_action == "endthescene"):
		endScene()
		return
	
	setState(_action)

func getDevCommentary():
	return "This is a bonus scene for those who are clever enough to think of checking the hospital room after the medical incident with Lamia happens. I specifically didn't leave any hints that player can come here and just listen in, I consider this scene to be fairly natural outcome and I rely on player's intuition to get in here. I honestly struggled with making it so the player cannot get in the room to the north by themselves, there doesn't seem to be a way to modify cell's properties like going to certain location. Ultimately what I went with is forcing a new scene upon the player. I don't claim this is foolproof way to secure this, I'm sure there will be bugs with some other events that force player to come to the medical room. But I guess I'll solve those when they come up, I'm not too keen on doing a lot of testing at this moment. The fully non-censored dialogue was written in here as it played out in my head. I later replaced the words, tried to do - per one word. Blanks leave a lot to imagination of the player. They can try to decipher it by imagining word that would fit in given context, and that's entirely valid approach. But in general, it's really fun to let the player fill the blanks by themselves. The characters in this one may feel evil, or good depending on player's interpretation. But in general? This scene is supposed to be foreshadowing certain future events, but I'm not planning to include them in 1.0 release. Oh, also, the full dialogue as I've written it is available for just $2.99! Buy it when it still exists on my PC! (that's a joke, of course)"

func hasDevCommentary():
	return true
