extends EventBase

func _init():
	id = "AzazelCatnipEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "main_green_corridor9")

func run(_triggerID, _args):
	if(GM.main.getModuleFlag("PierreModule", "Azazel_Catnip_talked") and RNG.chance(30)):
		GM.main.setModuleFlag("PierreModule", "Azazel_Catnip_found", true)
	
	if(GM.main.getModuleFlag("PierreModule", "Azazel_Catnip_found")):
		saynn("While staring at plethora of different plants, you recognize one in particular - white flowers and specific smell. Catnip!")
		if(!GM.main.getModuleFlag("PierreModule", "Azazel_Catnip_taken_today")):
			addButtonUnlessLate("Steal", "Try and steal something", "steal")
		else:
			addDisabledButton("Steal", "Too dangerous to do this again today")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "steal"):
		runScene("GreenhouseCatnip")
