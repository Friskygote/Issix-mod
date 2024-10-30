extends SceneBase

func _init():
	sceneID = "PetsTalkScene"

func _run():

	if(state == ""):
		saynn("In front of you - three slaves belonging to Pierre.")
		addButton("Azazel", "Approach Azazel", "azazelmain")
		addButton("Hiisi", "Approach Hiisi", "hiisimain")
		addButton("Lamia", "Approach Lamia", "lamiamain")
		addButton("Leave", "Be on your way", "endthescene")
		
	if(state == "azazelmain"):
		playAnimation(StageScene.Duo, "stand", {npc="azazel", npcAction="sit"})  # TODO There is better sitting pose, like in gym, but need to find where poses are stored
		if GM.main.getModuleFlag("PierreModule", "PC_Enslavement_Status") == 0:
			saynn("You approach Azazel, he recognizes sudden attention given to him, raises on his fours and streches his back before sitting towards you expectandly. You notice he took a quick peek at his master beforehand.")
		else:
			pass  # TODO
		addButton("Talk", "Talk to Azazel", "azazeltalk")
		addButton("Appearance", "Look at Azazel", "azazelappearance")
		if(GM.pc.getInventory().hasItemID("CatnipPlant")):
			saynn("Before you even have the time to approach Azazel, you see his head hovering over his body, his little nose working very hard to track down the source of the curious smell. He looks around with interest, until he sees you approaching.\nHe observes you with interest as you come close.")
			saynn("[say=azazel]Meow! You really smell of a cat nip, do you have catnip? Do you??")
			saynn("{azazel.name} becomes really excited, as exemplified by his tail stretching high as if it was a broom stick. His body constantly sways.")
			addButton("Give Catnip", "Give Azazel the catnip", "catnip")
		addButton("Back", "Take a step back", "")
			
	if(state == "catnip"):
		saynn("You take the catnip and slowly reach your paw with the plant to the feline. Halfway there feline snatches the catnip from you paw and throws it in the air. His paws go above and he plays airborne valley...catnip with it? Eventually he misses with his paw and catnip falls on his muzzle, he freezes for a moment as if paralyzed, the pupils in his eyes become large.")
		saynn("[say=pc]Umm, Azazel, are you okey?[/say]")
		sayn("He turns his face towards you again, enlarged pupils still in his eyes, surprised face expression staring at you.")
		saynn("After a moment his pupils go back to normal, and his face expression turns content.")
		saynn("[say=azazel]Meow! I mean... Yes, sorry, I got... A bit carried away.[/say]")
		saynn("He becomes a little embarassed. Looks down at the catnip plant on his blanket. Picks it up with his paw and consumes it.")
		saynn("[say=azazel]Twank yuu {pc.name}. It was really nice![/say]")
		processTime(10 * 5)
		addButton("Back", "End catnip therapy session", "azazelmain")
		#setState("azazelmain")
		
		
	if(state == "azazeltalk"):
		GM.main.setModuleFlag("PierreModule", "Azazel_Catnip_talked", true)
		if(GM.pc.getInventory().hasItemID("CatnipPlant")):
			pass
		else:
			pass
		addButton("Back", "Do something else", "azazelmain")
		
	if(state == "azazelappearance"):
		saynn("You take a closer look at {azazel.name}. He is a very thin and fairly short feline, judging from him sitting he is around " + Util.cmToString(150) + " tall, with no visible muscles, likely not very strong. Overall his body is still mostly masculine, though here and there there are feminine features like his face or shoulders.\nHis fur is in majority dark grey, though his belly and face are of ligher shade of gray. A small set of horns protrudes from his head. Connecting his backside is a medium sized feline tail.\n\nOne significant detail is that he does not possess a penis, in its place there is a {azazel.pussyStretch} vagina.")
		addButton("Back", "Do something else", "azazelmain")

func _react(_action: String, _args):
	if(_action == "catnip"):
		GM.pc.getInventory().removeXOfOrDestroy("CatnipPlant", 1)
		GM.main.getCharacter("azazel").addLust(10)
		GM.main.increaseModuleFlag("PierreModule", "Azazel_Catnips_given")
	
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
