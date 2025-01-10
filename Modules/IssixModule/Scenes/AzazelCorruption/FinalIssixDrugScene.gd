extends SceneBase

const Globals = preload("res://Modules/IssixModule/Globals.gd")
var corruption_level = 0

func _init():
	sceneID = "DemonLamiaTalk"

func _initScene(_args = []):
	corruption_level = (1 if Globals.checkIfAchieved("Azazel_Corr_Dream_State", "Trained_With_Hiisi") else 0) + (1 if Globals.checkIfAchieved("Azazel_Corr_Dream_State", "Lost_Speech") else 0) + (1 if Globals.checkIfAchieved("Azazel_Corr_Dream_State", "Got_Molded_By_Azazel") else 0)

func _run():
	if(state == ""):
		addCharacter("issix")
		saynn("As you continued walking, the musty air as well as humidity of it reached levels you didn't think you could possibly endure, and yet, you've pulled through without a hitch. The closer you got to the end of the metallic hallway, the less it looked like one. Metal got replaced by meaty tunnel, no longer looking so cubical, but getting irregular shapes, with meaty tendrils here and there.")
		saynn("The entire place feels alive, moving ever so slightly, making squelching sounds as you walk and as you don't. There are few smaller tendrils coming out of the ground, searching for something, needing to grab something or [i]someone[/i].")
		saynn("While walking on the meaty floor is exhausting, your {pc.feet} overcome the obstacle, your goal in sight now. It's a demon-dragon sitting on a chair, with his arm sitting on chair's support, while the other arm supports dragon's head as he looks forward - at you.")
		saynn("You can't tell what's the relationship between the environment and Issix, however it does seem like the demon dragon doesn't mind the surroundings he is in, in fact, the confidence exhibited by him would suggest he is in control. But then, what master would he be, without aura of confidence and control around him.")
		saynn("[say=issix]And so have the threads of fate, woven by a sly devil in disguise brought your wandering soul in the need of a strong Master to me - your light. Just like the others, you will too be a lamb -not for the slaughter mind you, but for eternal servitude to me. To follow commands, to let [b]me[/b] be your entire life's purpose.[/say]")
		saynn("[say=issix]A slave, a pet, term doesn't matter. You are here because you want it. You yearn for someone else to meld you, to change you, to make you theirs.[/say]")
		saynn("[say=issix]And I answer this call. I'll be your Master in exchange for your eternal obedience. I'll bind your flesh, your mind to me, and you will let me, you will beg me to do it. To make you someone as simple as my pet. A pet. A creature that yes - requires care, patience and maybe still has some level of independence. But a pet with his owner. Nobody else will see you as anything more that a thing, with its owner. You'll forever have a tag attached to you saying who to return you if you ever get lost, you'll no longer be seen as an individual but as [i]something lesser[/i] - a creature possessed by someone stronger who makes decisions for them.[/say]")
		saynn("[say=issix]Tell me {pc.boy}, am I wrong? Is it you who I'm describing?[/say]")
		addButton("Yes", "Say yes (enslavement)", "answeryes")
		addButton("No", "Say no", "answerno")

	if state == "answerno":
		saynn("[say=pc]It's not me.[/say]")
		saynn("Issix raises his eyebrows in surprise.")
		saynn("[say=issix]Are you not? [/say]")


	if state == "answeryes":
		saynn("[say=pc]Yes.[/say]")
		if GM.pc.getSkillsHolder().hasPerk("PetSpeech"):
			saynn("Master smiles and claps his paws in return.")
			saynn("[say=issix]Splendid! You speak like proper pet too. How wonderful![/say]")
		else:
			saynn("[say=issix]Perfect.[/say]")
		if Globals.checkIfAchieved("Azazel_Corr_Dream_State", "Got_Molded_By_Azazel"):
			saynn("Issix eyes your body, seeing your new {pc.vagina} and a tattoo.")
			saynn("[say=issix]I'm so glad for you so eagerly accepting your place as breeding bitch. I'll put it all to good use, don't worry, you'll enjoy being a mother.[/say]")

		saynn("[say=issix]Sit.[/say]")
		if Globals.checkIfAchieved("Azazel_Corr_Dream_State", "Trained_With_Hiisi"):
			saynn("Your knees fall to the meaty grounds, making you hear a resounding squelch as well as feel wetness on your legs, next - your ass hits the same floor... Feelings are odd, a bit uncomfortable, though the meaty floor feels smooth and inviting. Issix laughs.")
			saynn("[say=issix]So obedient.[/say]")
		else:
			saynn("You hesitate, it sounded like a command, your hesitation leaves as you look into Master's red eyes. You sit on the meaty floor, making squelching sounds as you do, feeling wetness on your nude body.")
			saynn("[say=issix]Good.[/say]")

		if corruption_level == 3:
			saynn("[say=issix]This is what you actively chose, wasn't it? Oh, you are much much more malleable than my other pets. I can feel it.[/say]")
			saynn("[say=issix]Such obedience, such eagerness for service must be rewarded.[/say]")

		saynn("Issix stands from his chair, he stretches his muscular body, flexing it as he takes 3 slow steps towards you. He stands taller than you, his figure looming like a parent over their child. They hold authority. Natural instinct tells you to keep your head down, you don't deserve to look at someone so much more refined, strong and independent than you.")

		saynn("He holds his paw just in front of you, at first empty palm suddenly holding an object that appeared from thin air. A heavy duty metal collar, shining with it's silver metallic color, reflecting purple-red light from the fleshy room around you. On it, there are engraved words „PROPERTY OF ISSIX — PET "+GM.pc.getName().to_upper()+" —”, Collar has a simple sturdy metal ring in front for connecting with a leash or a chain, the collar seems bent, with it not having any clear way to close it around someone's neck, it's a c shaped object, which confuses you, how does Master intend to secure it around your neck?")

		saynn("[say=issix]So tell me, are you ready to become mine?[/say]")
		addButton("Yes, Master", "Agree to be collared", "collaring")


	if state == "collaring":
		saynn("[say=pc]Y-yes Master.[/say]")
		saynn("[say=issix]Splendid. In that case...[/say]")
		saynn("He snaps his paw fingers. Suddenly the surrounding changes. The meaty walls are still meaty walls, however they are now decorated by a lot of white decor, many fancy shapes hang on the meaty walls, seemingly sticking to them by small tendrils holding them. Issix's chair is replaced by a small stage on which you now sit instead after being moved with no effort taken by anyone. Issix continues to stand before you, holding a collar in his paw. You look to your side, on which there still is an incredibly long dark tunnel, but also there are three chairs occupied by three very well known to you creatures - Azazel, Lamia and Hiisi, the first two hold an excited face expression, while the last one observes with interest the two of you on the stage.")
		saynn("In a way, the long dark tunnel adds creepiness to what this would otherwise be - a happy ceremony. Because judging by the surrounding decor and furniture - this does remind you of some kind of a old-school wedding.")
		saynn("If this  wasn't enough, some kind of organ music plays, you don't see the source of the sound, but the intention of the tune is quite apparent. The echo of long corridor making this experience even more bizzare.")
		saynn("[say=issix]We all gather here today to celebrate a new pet in my collection. {pc.name} decided to spend the rest of their life in servitude to me. {pc.He} is willingly in mind and body giving {pc.him}self to me, Master Issix as a submissive and recognizing me as his superior - master.[/say]")
		saynn("Issix continues in pompous tone, presenting the collar to the audience of three.")
		saynn("[say=issix]The collar I hold here is a sign of this subservience, it's an evidence of eternal pact. It's a heavy duty collar that keeps pets in check. The heaviness of its weight reminds them of their place at all times, the look and engraved words serve as banner for everyone else to know who owns this beautiful "+Globals.getPlayerPetName()+" here.[/say]")
		saynn("[say=issix]When the collar fits the neck of a pet, it never goes off. The metal welding by itself making impossible to take off ring.[/say]")
		saynn("You can feel Issix's look on you.")
		saynn("[say=issix]If there isn't any opposition, I'll seal {pc.name}'s fate.[/say]")
		addButton("Silence", "Music continues playing, some squelching from the meaty walls around can be heard", "collaring2")

	if state == "collaring2":
		saynn("[say=issix]Present your neck to me, "+Globals.getPlayerPetName()+".[/say]")
		saynn("Intense feelings of hit you like a brick hearing this sentence. „This is it”. It's where you become someone's property, a slave to whims of someone else. You look up at your Master's face, showing your neck to him, granting him full access.\nHe kneels before you supported by one leg giving you a good look at both his smiling face as well as collar that closes in on your neck.")
		saynn("Time is slowed down, the metal ends of a collar slip past your throat, you can feel the heat coming from your Master's paws positioning the collar just right, it doesn't touch you yet, as Master continues to hold it in the air. You gulp and close your eyes. Intense feeling of submission, lust and excitement rushes through you, you hear two ends of metal clinging together behind what you can see, the collar gets lowered until it rests on your neck and shoulders, it's heavy. Very heavy. You open your eyes and see face of Master licking his lips in excitement, the cheers coming from the side where his other pets sat down. Master "+("ruffles your hair" if GM.pc.hasHair() else "pets your hairless scalp")+" while attaching the end of a leash to the collar on your neck.")

		saynn("[say=issix]Good "+Globals.getPlayerPetName()+".[/say]")
		saynn("At one moment all you can see is your Master's face, at another he moves his head to your ear and you see the world around changing, melting? Disappearing. White noise appearing instead of meaty walls. Your Master whispers into your ear as he gives you a hug.")
		saynn("[say=issix]My pet. I'll see you soon again, I'll make you mine, for good this time.[/say]")
		addButton("Nooo", "Master, noooo!", "noo")
		addButton("Blink", "Blink", "blink")

	if state in ["noo", "blink"]:
		if state == "noo":
			saynn("Before you can answer the world starts deconstructing, the meaty walls you see become more and more twisted until they break into sea of white noise. Feeling the dread of losing the precious moment that you just entered moments before you whimper.")
			saynn("[say=pc]Noooooo![/say]")
			saynn("Your Master speaks in calm voice.")
			saynn("[say=issix]Don't despair. Join me soon.[/say]")
		saynn("The world you just knew gets replaced by nothingness, the musty heavy air is still the same, the feeling of a collar on your neck - perhaps not as heavy as before stays, the warm embrace of your Master is replaced with a different kind of warm embrace, from Azazel.")
		saynn("You open your eyes and see his face, happy, as if he was living through your emotions, through your experiences that you just had, he speaks.")
		saynn("[say=azazel]So, how was it? Did you have fun? What did you see?[/say]")
		saynn("A barrage of questions for burdened mind just extracted forcefully from a dream full of hope for new living, for new purpose.")
		saynn("[say=pc]I... I think I felt it.[/say]")
		saynn("Azazel tilts his head in confusion.")
		saynn("[say=azazel]Felt what?[/say]")
		saynn("[say=pc]Umm.. The..[/say]")
		saynn("You attempt to describe what you felt, a concoction of emotions related to becoming a pet, to having an owner, to being molded, shaped, changed. But nothing comes out of your mouth, it's too difficult for you to say that.")
		saynn("[say=pc]I think I'd like to have a Master.[/say]")
		saynn("[say=azazel]Hehehe. [b]I know[/b]. Don't worry, I'm sure Master would love to have you as his pet. I can't wait to see you in the harem![/say]")
		saynn("You feel embarrassed, but at the same time, you feel so wanting, there is an emotional hole inside you that you feel you have to fill in after encounter with Master Issix in whatever dreamy state you've had on drugs.")




func getDevCommentary():
	return ""

func hasDevCommentary():
	return false


func _react(_action: String, _args):
	if _action in ["noo", "blink"]:
		GM.main.clearOverridePC()
		GM.pc.getInventory().clearSlot(InventorySlot.Eyes)
		setModuleFlag("IssixModule", "Azazel_In_Dream", false)
		GlobalRegistry.getModule("IssixModule").hackProcessingCharacters()
		GM.pc.updateNonBattleEffects()

	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
