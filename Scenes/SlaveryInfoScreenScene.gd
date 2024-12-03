extends SceneBase

var pet_time_start = null

func _init():
	sceneID = "SlaveryInfoScreen"

func _run():
	if(state == ""):
		playAnimation(StageScene.Duo, "kneel", {npc="issix", npcAction="stand"})
		if pet_time_start == null:
			pet_time_start = GM.main.getTime()
		saynn("Your slave role: "+IssixModule.getPlayerRole())
		saynn("Your training: "+trainingCheck())
		saynn("Master's mood: "+getMood())
		saynn("Issix's slave for "+str(getDays())+" days")
		match GM.main.getModuleFlag("IssixModule", "PC_Enslavement_Role", 1):
			1:
				saynn("Amount of time spent in Master's harem today: "+str(getTimeSpent()) + " minutes")
			2:
				saynn("To pay Master for sluttying around yesterday: " + str(GM.main.getModuleFlag("IssixModule", "Prostituation_fee_yesterday", 0) + GM.main.getModuleFlag("IssixModule", "Prostituation_flat_fee", 0)))
			_:
				pass
		setModuleFlag("IssixModule", "Last_Day_Visited_Master", GM.main.getDays())
		addButton("Master", "Talk with your master about something", "issixpetmenu")
		addButton("Azazel", "Actions in relation to Azazel", "azazelpetmenu")
		addButton("Hiisi", "Actions in relation to Hiisi", "hiisipetmenu")
		addButton("Lamia", "Actions in relation to Lamia", "lamiapetmenu")
		if not (GM.main.getModuleFlag("IssixModule", "Is_Player_Forced_Today", 0) > (getModuleFlag("IssixModule", "Pet_Time_Interaction_Today", 0)+(GM.main.getTime()-pet_time_start))) or GM.main.isVeryLate():
			addButton("Leave", "Leave", "endthescene")

	if state == "issixpetmenu":
		saynn("[say=issix]"+getMoodMessage()+"[/say]")
		saynn("Is there anything you want to do with Master?")
		addButton("Sex", "Ask for sex with Master", "issixsexrequest")

func getTimeSpent():
	return Util.getTimeStringHumanReadable(getModuleFlag("IssixModule", "Pet_Time_Interaction_Today", 0)+(GM.main.getTime()-pet_time_start))

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
	var days_enslaved = getModuleFlag("IssixModule", "PC_Training_Level", {})["day_enslaved"]
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
