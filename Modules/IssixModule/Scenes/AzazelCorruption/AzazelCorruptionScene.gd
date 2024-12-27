extends SceneBase

func _init():
	sceneID = "AzazelCorruption1"

func _run():
	if(state == ""):
		addCharacter("azazel")
		saynn("As you walk in the hallway you spot a certain familiar feline a few steps in front of you. It's Azazel, he stands against the wall with his entire body fully naked, right leg on the floor while left one bent and is in contact with the wall. Looking at you, he winks.")
		saynn("[say=azazel]Heeeey there {pc.name}, sweetie! How are you doing?[/say]")
		saynn("[say=pc]Pretty fine, what are you doing here? Shouldn't you be with your Master?[/say]")
		saynn("[say=azazel]Even pets have their needs, right?[/say]")
		saynn("[say=pc]Shouldn't Master like, walk you to the toilet or something?[/say]")
		saynn("[say=azazel]Ohhh, is this something you'd like?[/say]")
		addButton("Yes", "Admit that this would be pretty hot", "walkyes")
		addButton("No", "Say that this wouldn't be your kind of thing", "walkno")

	if state == "walkyes":
		saynn("[say=pc]Uhhh.. I admit that sounds pretty hot.[/say]")
		saynn("Azazel smirks, he puts his left feet on the ground while slowly and sensually takes two steps towards you, you can feel heat radiating off them.")
		saynn("[say=azazel]I can't disagree with you there, it sounds really good.[/say]")
		saynn("His paw reaches your chin as he puts two fingers to massage it while he licks his lips. He puts another paw on your {pc.thick} chest, doing round circles with his paw.")
		saynn("[say=azazel]You know... I'm sure there is a still some space in my Master's corner, and I'd really really want to see you there, with a leash connected to your collar. I think you'd love it too, I think deep down you too would want to be a nice [pulse color=#ac1eff height=0.0 freq=1.0]"+GlobalRegistry.getModule("IssixModule").getPlayerPetName()+"[/pulse] for your Master. Call it an expert opinion.[/say]")
		saynn("You gulp, the way the feline said it made you flinch, and not in a bad way, it's a scary concept to be owned by someone else so directly. You are already a slave in this prison, but to give yourself so willingly? To a man wanting to assert power over others? That's...")
		addButton("Hot", "Admit to yourself that this thought makes your knees weak (CW: musk, drug use in future scenes)", "hot")
		addButton("Absurd", "You do not find this idea hot at all (disables future Azazel's corruption scenes)", "nothot")

	if state == "walkno":
		saynn("Azazel puts his left feet on the ground while slowly approaching you, studying you, you can feel his body heat.")
		saynn("[say=azazel]Really? You wouldn't want to be a cute [pulse color=#ac1eff height=0.0 freq=1.0]"+GlobalRegistry.getModule("IssixModule").getPlayerPetName()+"[/pulse] for your Master? To receive endless love, treats and have all of your needs satisfied by your hot Master?[/say]")
		saynn("He looks at you with really surprised look, as if you've said something so illogically outrageous that he is unable to even comprehend such an answer.")
		saynn("[say=azazel]Wouldn't you want to have scratches behind your ear every morning? To have food in your bowl? To be cared for in this bleak world? To fulfill your Master's wishes and be rewarded?[/say]")
		saynn("He said, continuing a surprised tone.")
		addButton("Yes", "Say that this does sound good... (enables future Azazel corruption scenes which contain dubious consent actions CW: musk, drug use)", "hot")
		addButton("No", "Say that this is delusional to like it (disables future Azazel's corruption scenes)", "nothot")

	if state == "hot":
		saynn("[say=pc]I would love that, actually...[/say]")
		saynn("You look down embarrassed, imagining the prospects Azazel put in your mind.")
		saynn("[say=azazel]Thought so.[/say]")
		saynn("He says, lustfully")
		saynn("[say=azazel]I have to go, think about it all [pulse color=#ac1eff height=0.0 freq=1.0]"+GlobalRegistry.getModule("IssixModule").getPlayerPetName()+"[/pulse], think about it.[/say]")
		saynn("He leaves, as you try to steady your mind from countless thoughts assaulting it, of submission and obedience to a Master like Issix. After a moment you can move again.")
		addButton("Leave", "Take your leave", "endthescene")

	if state == "nothot":
		saynn("[say=pc]Meh, not my sort of thing.[/say]")
		saynn("The look of Azazel's face tells you everything, he feels hurt by your answer, this is not at all what he expected. His ears curl and he looks down at the floor.")
		saynn("[say=azazel]I see... Okey then, sorry for wasting your time.[/say]")
		saynn("He starts walking really slowly towards his Master's corner, his arms limpy, as if he was incredibly tired, even though a moment ago he felt full of energy. Oh well.")
		addButton("Leave", "Take your leave", "endthescene")


func getDevCommentary():
	return ""

func hasDevCommentary():
	return false


func _react(_action: String, _args):
	if _action == "walkno":
		processTime(5*60)

	if _action == "walkyes":
		processTime(6*60)
		GM.pc.addLust(30)

	if _action == "hot":
		processTime(5*60)
		GM.pc.addLust(30)
		setModuleFlag("IssixModule", "Azazel_Corruption_Scene", 2)

	if _action == "nothot":
		processTime(5*60)
		setModuleFlag("IssixModule", "Azazel_Corruption_Scene", -1)

	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
