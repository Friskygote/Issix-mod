extends EventBase

func _init():
	id = "IssixEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "hall_ne_corner")
	es.addEventCheck(self, "IssixBusy")

func run(_triggerID, _args):
	#if(doEventCheck("IssixBusy") != null):
	#	return false
	
	if(GM.main.isVeryLate()):  # Add something in the nightime it's very late?
		saynn("You see an empty chair in the corner with three blankets laying around.")
		return false
	
	if(!getModuleFlag("IssixModule", "Issix_Introduced")): # Do that if not night
		saynn("You see a demon-dragon sitting on a chair in a corner, around him there are three leashed creatures.")
		GM.main.setModuleFlag("IssixModule", "Score_Explored", 0)  # is there a better place to do this?
		GM.main.setModuleFlag("IssixModule", "Quest_Status", 0)
		addButton("Demon", "Talk to the demon-dragon", "talk")
		return
		
	GM.main.applyWorldEdit("IssixWorldEdit")
	
	if(checkCharacterBusy("IssixBusy", "Issix is not here", "Issix")):
		saynn("This corner is not occupied by anyone at the momentm, just three empty blankets with a chair.")
		if getModuleFlag("IssixModule", "Quest_Status") == 5:
			addButton("Paper", "A piece of paper lies left in a hurry", "paper")
		return
		
	saynn("You see Issix sitting on a chair in a corner, around him there are three leashed slaves.")
	addButton("Issix", "Talk to Issix", "talk")
	if(!getModuleFlag("IssixModule", "Pets_Introduced")):
		#addButton("Look at pets", "Look at pets", "pets")
		addDisabledButton("Talk with pets", "You should probably first talk with intimidating figure who got them leashed")
	else:
		addButton("Pets", "Look at pets", "pets")
	#if(checkCharacterBusy("RahiBusy", "Seems like the kitty is not here", "Rahi")):
	#	return
	#
	#if(getModuleFlag("RahiModule", "Rahi_NotThereToday", false)):
	#	saynn("Seems like the kitty is not here")
	#	
	#	addDisabledButton("Rahi", "She is not here today")
	#	return
	
	#if(!getModuleFlag("RahiModule", "Rahi_Introduced")):
	#	saynn("You see some unknown feline sitting on a bench")
	#else:
	#	saynn("You see the Kitty sitting on a bench")
	#addButtonUnlessLate("Rahi", "Talk to the feline", "talk")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "talk"):
		runScene("IssixTalkScene")
	if(_method == "pets"):
		runScene("PetsTalkScene")
	if(_method == "paper"):
		runScene("NoPetsTalkScene")

func eventCheck(_checkID, _args = []):
	if(getModuleFlag("IssixModule", "Quest_Status") == 5 and getModuleFlag("IssixModule", "Quest_Wait_Another_Day") == true):
		return {busy=true}
