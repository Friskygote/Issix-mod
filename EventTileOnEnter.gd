extends EventBase

func _init():
	id = "PierreEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "hall_ne_corner")

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
