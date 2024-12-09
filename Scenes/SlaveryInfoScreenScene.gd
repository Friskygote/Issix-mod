extends SceneBase

var pet_time_start = null

func _init():
	sceneID = "SlaveryInfoScreen"

func _run():
	if(state == ""):
		var last_walk = getModuleFlag("IssixModule", "Last_Walk", 0)
		playAnimation(StageScene.Duo, "kneel", {npc="issix", npcAction="stand"})
		if pet_time_start == null:
			pet_time_start = GM.main.getTime()
		addMessage("WARNING: A lot of the content in here is a placeholder. It will change, it will break, it will cause calamities. Treat it as a sneek peek into the (potential) future.")
		saynn("Your slave role: "+IssixModule.getPlayerRole())
		saynn("Your training: "+trainingCheck())
		saynn("Master's mood: "+getMood())
		saynn("Issix's slave for "+str(getDays())+" days")
		match GM.main.getModuleFlag("IssixModule", "PC_Enslavement_Role", 1):
			1.0:
				saynn("Amount of time spent in Master's harem today: "+str(getTimeSpentReadable()))
			2.0:
				saynn("To pay Master for sluttying around yesterday: " + str(GM.main.getModuleFlag("IssixModule", "Prostituation_fee_yesterday", 0) + GM.main.getModuleFlag("IssixModule", "Prostituation_flat_fee", 0)))
			_:
				pass
		setModuleFlag("IssixModule", "Last_Day_Visited_Master", GM.main.getDays())
		addButton("Master", "Talk with your master about something", "issixpetmenu")
		addButton("Azazel", "Actions in relation to Azazel", "azazelpetmenu")
		addButton("Hiisi", "Actions in relation to Hiisi", "hiisipetmenu")
		addButton("Lamia", "Actions in relation to Lamia", "lamiapetmenu")
		if getModuleFlag("IssixModule", "Taught_To_Use_Bowl", false) == true:
			if getModuleFlag("IssixModule", "Eaten_Today", false) == false:
				addButton("Eat", "Eat from your bowl of food", "haremeat")
			else:
				addDisabledButton("Eat", "You've already eaten today")
		if GM.pc.getStamina() > 100:  # TODO Add some other event as precondition for this being available?
			addButton("Play", "Play with other pets.", "haremplay")
		else:
			addDisabledButton("Play", "You are too tired to play with other pets.")
		if GM.main.getDays()-last_walk == IssixModule.getWalkDelay():  # TODO Walks
			if GM.main.getTime() < 54000:
				addDisabledButton("Walk", "Walks are unimplemented at the moment, possibly in future releases!")
			else:
				addDisabledButton("Walk", "Too late for a walk")
		addButton("Pass", "Pass the time (placeholder button for now, supposed to be actions with pets/master later)", "passtime")
		if getModuleFlag("IssixModule", "Comic_Book_Unlocked", false) == true and getModuleFlag("IssixModule", "Comic_Books", 0) > 0:
			addButton("Comic", "Read one of "+ str(getModuleFlag("IssixModule", "Comic_Books", 0)) +" comic books", "readabook")
		if not (GM.main.getModuleFlag("IssixModule", "Is_Player_Forced_Today", 0) > (getTimeSpent())) or GM.main.isVeryLate():
			addButton("Leave", "Leave", "endthescene")

	if state == "issixpetmenu":
		saynn("[say=issix]"+getMoodMessage()+"[/say]")
		saynn("Is there anything you want to do with Master?")
		addButton("Sex", "Ask for sex with Master", "issixsexrequest")
		addButton("Walk", "Ask when he plans the next walk to the pasture", "issixwalkquestion")
		addButton("Tasks", "Ask for extra tasks", "issixtaskquestion")
		addButton("Options", "Ask your Master to change how he treats you", "issixoptions")  # Pet etiquette, make player communicate via animalistic sounds, unlocks optional training
		addButton("Back", "Go back", "")

	if state == "haremeat":
		saynn("You approach your bowl on the edge of your blanket, full of the gelatinous mass your Master fills it with and start munching its contents like a real pet would, without using tools or paws.")
		if GM.pc.getMaxStamina()*0.8 > GM.pc.getStamina():
			saynn("It doesn't make you feel very satiated but it's batter than nothing.")
		else:
			saynn("It makes you feel pretty full. That was good.")
		addButton("Back", "Go back", "")

	if state == "azazelpetmenu":
		if GM.pc.getSkillLevel(Skill.SexSlave) < 15:
			addButton("Learn sex", "Learn about sexual slavery from Azazel", "azazellearnslavery")
		else:
			addDisabledButton("Learn", "You are already a master of Azazel's craft of sexual servitude")
		if GlobalRegistry.getCharacter("azazel").isPregnant() or GM.pc.isVisiblyPregnant():
			if GM.pc.getSkillLevel(Skill.Fertility) < 10:
				addButton("Learn fert.", "Learn about being harem's breeder", "azazellearnfertility")
			else:
				addDisabledButton("Learn", "You already know everything about bearing children")
			if GlobalRegistry.getCharacter("azazel").isHeavilyPregnant():
				addButton("Guess litter", "Ask Azazel about his pregnancy", "azazelguesslitter")
		addButton("Sex", "Ask for sex with Azazel", "azazelsexrequest")
		addButton("Back", "Go back", "")

	if state == "hiisipetmenu":
		if GM.pc.getSkillLevel(Skill.Combat) < 16:
			addButton("Learn", "Learn something from Hiisi", "hiisilearncombat")
		else:
			addDisabledButton("Learn", "There isn't anything more you can learn from Hiisi about combat")

		addButton("Sex", "Ask for sex with Hiisi", "hiisisexrequest")
		addButton("Back", "Go back", "")

	if state == "lamiapetmenu":
		addButton("Read", "Read comic books", "")
		addButton("Pets", "Ask for pets", "lamiapetrequest")
		addButton("Back", "Go back", "")

	if state == "issixwalkquestion":
		var last_walk = getModuleFlag("IssixModule", "Last_Walk", 0)
		if last_walk + 5 > GM.main.getDays():
			saynn("[say=issix]We've just been on a walk pretty recently, so you'll have to be a little bit more patient my pet.[/say]")
		else:
			saynn("[say=issix]Hmm, soonish, probably in around "+ str(IssixModule.getWalkDelay()-(GM.main.getDays()-last_walk)) + " days. Are you excited for the next walk?[/say]")
		addButton("Back", "Go back", "issixpetmenu")

	if state == "readabook":
		addButton("Back", "Go back", "")



func getTimeSpent():
	return getModuleFlag("IssixModule", "Pet_Time_Interaction_Today", 0)+(GM.main.getTime()-pet_time_start)

func isTimeOkey():
	var forced = GM.main.getModuleFlag("IssixModule", "Is_Player_Forced_Today", 0)
	if forced > 0:
		if getTimeSpent() < forced:
			return false
	elif getTimeSpent() < 60*60:
		return false
	return true

func getTimeSpentReadable():
	if getTimeSpent() == 0:
		return "[color=red]0 minutes[/color]"
	return "[color="+("green" if isTimeOkey() else "red")+"]"+ Util.getTimeStringHumanReadable(getTimeSpent()) + "[/color]"

func getMoodMessage():
	var issix_mood = getModuleFlag("IssixModule", "Issix_Mood", 50)
	if issix_mood < 10:
		return RNG.pick(["What are you looking at, slut?", "You won't find help in here, worm.", "Just fucking get off me!"])
	elif issix_mood < 25:
		return RNG.pick(["Go away, not in the mood,", "Look for happiness somewhere else, you won't find it talking to me.", "I don't have time for you."])
	elif issix_mood < 40:
		return RNG.pick(["Eh, shitty day today, eh?", "Everyone seems so uptight and angry lately, jeez.", "Glass is half empty today."])
	elif issix_mood < 60:
		return RNG.pick(["Believe me, being bored in this prison sometimes is a blessing.", "How long did it take for you to get used to all this commotion in here?", "Being a guard in this prison ought to be the most boring thing to do ever."])
	elif issix_mood < 75:
		return RNG.pick(["*whistles* What's up?", "Should have seen the look of the new guard when I swiped their baton haha.", "Dum dee dum...", "Nice day today, huh?"])
	elif issix_mood < 90:
		return RNG.pick(["Eat, fuck, sleep repeat haha.", "Don't you just love life? So full of wonders.", "Glass is half full today."])
	else:
		return RNG.pick(["How are you today, pet? Maybe I should walk y'all hungry beasts huh?", "Maaan, do you ever just stop and take it aaallllll in for a second? It's soo good."])

func getMood():
	var issix_mood = getModuleFlag("IssixModule", "Issix_Mood", 50)
	if issix_mood < 10:
		return "[color=red]really bad[/color]"
	elif issix_mood < 25:
		return "bad"
	elif issix_mood < 40:
		return "meh"
	elif issix_mood < 60:
		return "mediocre"
	elif issix_mood < 75:
		return "good"
	elif issix_mood < 90:
		return "really good"
	else:
		return "[color=green]excellent[/color]"

func getDays():
	var days_enslaved = getModuleFlag("IssixModule", "Misc_Slavery_Info", {})["day_enslaved"]
	return GM.main.getDays() - days_enslaved

func trainingCheck():
	var training_level = getModuleFlag("IssixModule", "PC_Training_Level", 0)
	if training_level < 3:
		return "poor"
	elif training_level < 6:
		return "adequate"
	elif training_level < 10:
		return "fine"
	elif training_level < 14:
		return "good"
	else:
		return "very good"

func _react(_action: String, _args):
	if _action == "readabook":
		processTime(20*60)
		increaseModuleFlag("IssixModule", "Comic_Books", -1)

	if _action == "haremeat":
		processTime(10*60)
		GM.pc.addStamina(60)
		GM.pc.addPain(-10)
		setModuleFlag("IssixModule", "Eaten_Today", true)

	if _action == "passtime":
		processTime(15*60)
		_action = ""

	if(_action == "endthescene"):
		# increaseModuleFlag("IssixModule", "PC_Training_Level")
		increaseModuleFlag("IssixModule", "Pet_Time_Interaction_Today", GM.main.getTime()-pet_time_start)
		pet_time_start = null
		endScene()
		return

	setState(_action)


func saveData():
	var data = .saveData()

	data["petTimeStart"] = pet_time_start

	return data

func loadData(data):
	.loadData(data)

	pet_time_start = SAVE.loadVar(data, "petTimeStart", null)
