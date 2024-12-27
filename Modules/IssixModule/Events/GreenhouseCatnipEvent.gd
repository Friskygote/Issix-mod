extends EventBase

func _init():
	id = "AzazelCatnipEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "main_green_corridor9")

func run(_triggerID, _args):
	if(GM.main.getModuleFlag("IssixModule", "Azazel_Catnip_noticed", false) == false):
		if "feline" in GM.pc.getSpecies():
			saynn("You approach greenhouses, each one looks like a huge long tent with lots of artificial lights inside. Your sensitive nose catches a whiff of a peculiar smell coming from one of the greenhouses, something very primal to your very instincts...")
			addButton("Investigate", "Find the source of smell", "greenhouse")
		else:
			saynn("While minding your business you notice a sign which depicts a crossed out feline. This strikes you as very odd, why would felines be banned from what appears to be a single greenhouse?")
			addButton("Investigate", "Try to find out what's up?", "greenhouse")
	else:
		saynn("While going through the greenhouses you remember a familiar greenhouse that had catnip in it. You could try and get some for yourself, or someone else.")
		if(!GM.main.getModuleFlag("IssixModule", "Azazel_Catnip_taken_today")):
			addButtonUnlessLate("Steal", "Try and steal something", "greenhouse")
		else:
			addDisabledButton("Steal", "Too dangerous to do this again today")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "greenhouse"):
		runScene("GreenhouseCatnip")
