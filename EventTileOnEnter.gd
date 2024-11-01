extends EventBase

func _init():
	id = "PierreEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "hall_ne_corner")
	es.addEventCheck(self, "PierreBusy")

func run(_triggerID, _args):
	#if(doEventCheck("PierreBusy") != null):
	#	return false
	
	if(GM.main.isVeryLate()):  # Add something in the nightime it's very late?
		saynn("You see an empty chair in the corner with three blankets laying around.")
		return false
	
	if(!getModuleFlag("PierreModule", "Pierre_Introduced")): # Do that if not night
		saynn("You see a demon-dragon sitting on a chair in a corner, around him there are three leashed creatures.")
		GM.main.setModuleFlag("PierreModule", "Score_Explored", 0)  # is there a better place to do this?
		GM.main.setModuleFlag("PierreModule", "Quest_Status", 0)
		addButton("Demon", "Talk to the demon-dragon", "talk")
		return
		
	GM.main.applyWorldEdit("PierreWorldEdit")
	
	if(checkCharacterBusy("PierreBusy", "Pierre is not here", "Pierre")):
		saynn("This corner is not occupied by anyone at the momentm, just three empty blankets with a chair.")
		if getModuleFlag("PierreModule", "Quest_Status") == 5:
			addButton("Paper", "A piece of paper lies left in a hurry", "paper")
		return
		
	saynn("You see Pierre sitting on a chair in a corner, around him there are three leashed slaves.")
	addButton("Pierre", "Talk to Pierre", "talk")
	if(!getModuleFlag("PierreModule", "Pets_Introduced")):
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
		runScene("PierreTalkScene")
	if(_method == "pets"):
		runScene("PetsTalkScene")
	if(_method == "paper"):
		runScene("NoPetsTalkScene")

func eventCheck(_checkID, _args = []):
	if(getModuleFlag("PierreModule", "Quest_Status") == 5 and getModuleFlag("PierreModule", "Quest_Wait_Another_Day") == true):
		return {busy=true}
