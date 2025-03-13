extends EventBase

func _init():
	id = "DemonPetsEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "petsdream_cellblock_orange_playercell")
	es.addTrigger(self, Trigger.EnteringRoom, "petsdream_cellblock_red_playercell")
	es.addTrigger(self, Trigger.EnteringRoom, "petsdream_cellblock_pink_playercell")
	es.addTrigger(self, Trigger.EnteringRoom, "petsdream_cellblock_nearcells")

func run(_triggerID, _args):
	match GM.pc.getLocation():
		"petsdream_cellblock_orange_playercell":
			addButton("Lamia", "Talk to Lamia", "lamia")
		"petsdream_cellblock_red_playercell":
			addButton("Hiisi", "Talk to Hiisi", "hiisi")
		"petsdream_cellblock_pink_playercell":
			addButton("Azazel", "Talk to Azazel", "azazel")
		"petsdream_cellblock_nearcells":
			if(OPTIONS.isContentEnabled(ContentType.Watersports)):
				saynn("In the center here you see a fountain like structure, except the yellow fluid that reaches its base and drains into the metallic crates falls from the ceiling instead of being ejected from the ground like in all other fountains you've seen. The yellow fluid is very strong in smell.")
			else:
				saynn("In the center here you see a fountain like structure, except the transparent fluid that reaches its base and drains into the metallic crates falls from the ceiling instead of being ejected from the ground like in all other fountains you've seen.")
			addButton("Approach", "Approach the fountain", "fountain")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "lamia"):
		runScene("DemonLamiaTalk")
	if(_method == "hiisi"):
		runScene("DemonHiisiTalk")
	if(_method == "azazel"):
		runScene("DemonAzazelTalk")
	if _method == "fountain":
		runScene("AzazelDreamFountainScene")
