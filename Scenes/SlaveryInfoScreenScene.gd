extends SceneBase

var rng_per_day = null
var pet_time_start = null
var reply_litter = null
var azazel_teased_motherhood = false
var azazel = null

func _init():
	sceneID = "SlaveryInfoScreen"

func _initScene(_args = []):
	rng_per_day = RandomNumberGenerator.new()
	rng_per_day.seed = GM.main.getDays()
	azazel = GlobalRegistry.getCharacter("azazel")
	reply_litter = 0

func _run():
	if(state == ""):
		clearCharacter()
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
		addCharacter("issix")
		saynn("[say=issix]"+getMoodMessage()+"[/say]")
		saynn("Is there anything you want to do with Master?")
		if getModuleFlag("IssixModule", "Had_Sex_With_Issix", false) == false:
			addButton("Sex", "Ask for sex with Master", "issixsexrequest")
		else:
			addDisabledButton("Sex", "You've already had sex with Issix today")
		addButton("Walk", "Ask when he plans the next walk to the pasture", "issixwalkquestion")
		addDisabledButton("Tasks", "Ask for extra tasks (WIP)")  # , "issixtaskquestion"
		addDisabledButton("Options", "Ask your Master to change how he treats you (WIP)")  #, "issixoptions" Pet etiquette, make player communicate via animalistic sounds, unlocks optional training
		addButton("Back", "Go back", "")

	if state == "haremeat":
		saynn("You approach your bowl on the edge of your blanket, full of the gelatinous mass your Master fills it with and start munching its contents like a real pet would, without using tools or paws.")
		if GM.pc.getMaxStamina()*0.8 > GM.pc.getStamina():
			saynn("It doesn't make you feel very satiated but it's batter than nothing.")
		else:
			saynn("It makes you feel pretty full. That was good.")
		addButton("Back", "Go back", "")

	if state == "azazelpetmenu":
		addCharacter("azazel")
		playAnimation(StageScene.Duo, "kneel", {pc="azazel", npcAction="kneel", npc="pc", bodyState={naked=false, hard=false}})
		if GM.pc.getSkillLevel(Skill.SexSlave) < 15:
			addDisabledButton("Learn sex", "Learn about sexual slavery from Azazel (WIP)")  # , "azazellearnslavery"
		else:
			addDisabledButton("Learn", "You are already a master of Azazel's craft of sexual servitude")
		if GlobalRegistry.getCharacter("azazel").isPregnant() or GM.pc.isVisiblyPregnant():
			if GM.pc.getSkillLevel(Skill.Fertility) < 10:
				addDisabledButton("Learn fertility", "Learn about being harem's breeder (WIP)")  # , "azazellearnfertility"
			else:
				addDisabledButton("Learn", "You already know everything about bearing children")
			if GlobalRegistry.getCharacter("azazel").isHeavilyPregnant() and canPromptLitterDialogue():
				addButton("Guess litter", "Ask Azazel about his pregnancy", "azazelguesslitter")
		addDisabledButton("Sex", "Ask for sex with Azazel")  # , "azazelsexrequest"
		addButton("Back", "Go back", "")

	if state == "azazelguesslitterfirst":
		saynn("[say=azazel]I see you looking.[/say]")
		saynn("Azazel gives you a mischievous grin.")
		saynn("[say=azazel]Let's play a game, I'll let you guess how much litter I have in my belly, the more off you are the worse for you, but if you are close enough I may have something for you, are you in?[/say]")
		saynn("[say=pc]You are being pretty vague with what you mean my prediction will mean for me, why not just say?[/say]")
		saynn("[say=azazel]It's part of the game, the less you know more fun it will be.[/say]")
		addButton("Sure", "Accept Azazel's proposal", "azazelguesslitteraccept")
		addButton("Reject", "You don't want to play if you don't know what's at stake", "azazelguesslitterreject")
		if azazel_teased_motherhood == false:
			addButton("Stare", "Continue staring at Azazel's pregnant belly, it looks so nice...", "azazelguesslitterstare")

	if state == "azazelguesslitteraccept":
		playAnimation(StageScene.Duo, "kneel", {pc="azazel", npcAction="kneel", npc="pc", bodyState={naked=true, hard=false}})
		saynn("[say=pc]Okey, I'll bite, lets do this.[/say]")
		saynn("[say=azazel]Wooho! Here we go, I'll make it a bit easier for you.[/say]")
		saynn("He chuckles as he takes off his clothes.")
		saynn("[say=azazel]So, what do you think? What's the magic number {pc.name}? What do you think?[/say]")
		say("Enter the prediction in number form (ex. 32)")

		var textBox:LineEdit = addTextbox("litter_count")
		var _ok = textBox.connect("text_entered", self, "onTextBoxEnterPressed")
		addButton("Confirm", "Guess this number", "littercountresult")

	if state == "azazelguesslitterstare":
		saynn("Instead of responding to Azazel you continue to look at his large belly filled with his litter. It feels so... Mesmerizing, as if calling to you. As if in trance, your head bears closer and closer to Azazel's belly until your forehead starts touching it. A slight purring noise comes from Azazel.")
		saynn("[say=azazel]Your interest in my litter is surprising but appreciated.[/say]")
		saynn("You change position of your head to have your right ear touch the fabric of Azazel's clothes that cover his pregnant bloated belly. You can hear.. Something inside, until you feel a small bump above your ear - litter is moving!")
		if GM.CS.getChildrenAmountOfOnlyMother("pc") > 0:
			saynn("[say=azazel]I know you are aware how good it is to bear children, you did have a litter of your own in the past did you? Mmm. Yes. You know the wonders of being a mother. "+("Oh don't give me that look, a male can be a great mother for their children as well! Just look at me. " if GM.pc.getGender() == Gender.Male else "")+"It's a great gift to be able to bear children for your Master. To bring him the joy of putting some of self into you, to leave a mark in this galaxy. Mmmm.[/say]")
			saynn("Azazel's purring becomes stronger.")
		elif GM.pc.isVisiblyPregnant():
			saynn("[say=pc]I bet your litter is just as enthusiastic as mine. Mrrrau.[/say]")
			saynn("His paw carreses your tummy full of your own litter.")
			saynn("[say=azazel]Isn't it a great joy to be a mother? "+("Oh don't give me that look, a male can be a great mother for their children as well! Just look at me. " if GM.pc.getGender() == Gender.Male else "")+"Mmmm. You are a great mother as well, cutie.[/say]")
		else:
			saynn("[say=azazel]Aren't you curious yourself, what it means to bear litter? Wouldn't you want to leave a mark in this wretched galaxy? To have more of little {pc.name}'s running around? Becoming adventurers, slaves, masters... Hah. Don't get me wrong, personally I don't think I care about my own legacy, but our Master does, I think. I enjoy being his little breeding kitten, maybe you'd like being his breeding "+IssixModule.getPlayerPetName()+" too? Think about it.[/say]")
			saynn("He gives you a smile.")
		saynn("After he says that you leave the trance you were in, that was odd...")
		saynn("[say=azazel]So what do you say? Are you in?[/say]")
		addButton("Yup", "Accept Azazel's proposal to play the game", "azazelguesslitteraccept")
		addButton("Reject", "You don't want to play if you don't know what's at stake", "azazelguesslitterreject")

	if state == "littercountresult":
		if reply_litter == 0:
			saynn("[say=pc]Zero.[/say]")
			saynn("Azazel stares at you with confusion")
			saynn("[say=azazel]Huh? But...[/say]")
			saynn("He stares at his giant belly caressing it in his paws, he fixes his gaze again on you")
			saynn("[say=azazel]You see this, right? You know what I can bear children, right? Cmon, take it seriously![/say]")
		elif reply_litter > 100:
			saynn("[say=pc]"+str(reply_litter)+"[/say]")
			saynn("He bursts out laughing")
			saynn("[say=azazel]I might be a fine breeder but I think with this amount my belly (and I) would have a very difficult time haha. No no, I can assure you I don't have THIS many! Cmon, give a more realistic guess.[/say]")
		else:
			saynn("[say=pc]"+str(reply_litter)+"[/say]")
			var diff = abs(reply_litter-azazel.getPregnancyLitterSize())
			if diff > 5:
				saynn("[say=azazel]"+str(reply_litter)+"? Interesting.[/say]")
			if diff > 50:
				saynn("[say=azazel]You are very far off, from what the doctor said I have "+str(azazel.getPregnancyLitterSize())+" cubs in my belly, impressive, isn't it?[/say]")
			elif diff > 20:
				saynn("[say=azazel]I mean, that's not too far but it's not very close either, at the moment I have "+str(azazel.getPregnancyLitterSize())+" cubs in my belly, but thank you for entertaining me with your guess![/say]")
			elif diff > 10:
				saynn("[say=azazel]Not terribly bad, in fact, I have "+str(azazel.getPregnancyLitterSize())+" cubs in my belly right now if to believe my doctor.[/say]")
			elif diff > 5:
				saynn("[say=azazel]Wow! Not too bad, you were pretty close, I have "+str(azazel.getPregnancyLitterSize())+" cubs in my belly, this batch is crazy![/say]")
			elif diff > 1:
				saynn("[say=azazel]You are great at that! In fact, I have "+str(azazel.getPregnancyLitterSize())+" cubs in me right now, that's super close to your number! Good job![/say]")
			elif diff == 1:
				saynn("[say=azazel]Hah! Classic off-by-one error! You were so close! Damn, {pc.name}, you are great at this game! I do have "+str(azazel.getPregnancyLitterSize())+" cubs in me right now, hah, maybe next time you'll get it 100% correct![/say]")
			elif diff == 0:
				saynn("Azazel looks at you shocked")
				saynn("[say=azazel]You... You got it! Exact number of cubs in me right now. Holy shit, great job! Wouldn't you make a great mother with those skills haha. Wow, still can't believe you got it exactly right. Bet you could even solve those „how many balls are there in this jar” without counting them beforehand, awesome.[/say]")

			saynn("[say=azazel]Thank you for playing, there is no reward this time for you, but if you entertain me with guesses in the future I might eventually have something for your smart ass.[/say]")
			saynn("He chuckles and gives you a warm smile.")
			addButton("Back", "You've played the game, that would be it for here", "azazelpetmenu")
			return

		var textBox:LineEdit = addTextbox("litter_count")
		var _ok = textBox.connect("text_entered", self, "onTextBoxEnterPressed")
		addButton("Guess", "Guess the number inserted", "littercountresult")


	if state == "azazelguesslitterreject":
		saynn("[say=pc]Sorry, but I don't think I want to play it at the moment, especially without knowing what is there to gain or lose.[/say]")
		saynn("[say=azazel]Aw, too bad, feel free to come back and guess my litter later then. I'm not going anywhere in this state haha.[/say]")
		addButton("Back", "Go back", "azazelpetmenu")

	if state == "azazelguesslitterrepeat":
		saynn("[say=azazel]Hah, coming back to play my little „how many Master cubs I have in my belly” game I hope?[/say]")
		saynn("[say=pc]Yeah...[/say]")
		saynn("[say=azazel]Excellent, you know the deal. Shoot a number, I tell you how much you are off by.[/say]")
		saynn("[say=pc]Will I finally get something out of it?[/say]")
		saynn("[say=azazel]Hmmm. Perhaps not yet, but perhaps soon...[/say]")
		saynn("You sigh.")
		addButton("Guess", "Guess the number", "azazelguesslitterguess")
		addButton("Later", "Maybe other time, leave", "azazelpetmenu")

	if state == "azazelguesslitterguess":
		playAnimation(StageScene.Duo, "kneel", {pc="azazel", npcAction="kneel", npc="pc", bodyState={naked=true, hard=false}})
		saynn("Azazel takes off his clothes.")
		saynn("[say=pc]Hmm.[/say]")
		saynn("[say=azazel]You can do it, I believe in you.[/say]")
		saynn("He caresses his belly with a paw letting you see just how bloated he is")
		say("Enter the prediction in number")

		var textBox:LineEdit = addTextbox("litter_count")
		var _ok = textBox.connect("text_entered", self, "onTextBoxEnterPressed")
		addButton("Confirm", "Guess this number", "littercountresult")


	if state == "hiisipetmenu":
		addCharacter("hiisi")
		if GM.pc.getSkillLevel(Skill.Combat) < 16:
			addDisabledButton("Learn", "Learn something from Hiisi (WIP)")  # , "hiisilearncombat"
		else:
			addDisabledButton("Learn", "There isn't anything more you can learn from Hiisi about combat")

		addDisabledButton("Sex", "Ask for sex with Hiisi (WIP)")  # , "hiisisexrequest"
		addButton("Back", "Go back", "")

	if state == "lamiapetmenu":
		addCharacter("lamia")
		#addButton("Read", "Read comic books (WIP)", "")
		addButton("Pets", "Ask for pets", "lamiapetrequest")
		addButton("Back", "Go back", "")

	if state == "issixwalkquestion":
		var last_walk = getModuleFlag("IssixModule", "Last_Walk", 0)
		if last_walk + 5 > GM.main.getDays():
			saynn("[say=issix]We've just been on a walk pretty recently, so you'll have to be a little bit more patient my pet.[/say]")
		else:
			saynn("[say=issix]Hmm, soonish, probably in around "+ str(IssixModule.getWalkDelay()-(GM.main.getDays()-last_walk)) + " days. Are you excited for the next walk?[/say]")
		addButton("Back", "Go back", "issixpetmenu")

	if state == "issixsexrequest":
		if GM.main.getModuleFlag("IssixModule", "Todays_Bred_Slave", "hiisi") == "pc":
			saynn("[say=pc]I'm ready, Master.[/say]")
			saynn("[say=issix]Good. let's do it.[/say]")
			addButton("Start", "Start sex", "startsexissix")
			return

		saynn("[say=pc]Umm, Master? Could we have sex today?[/say]")
		if float(GM.pc.getLust()) / GM.pc.lustThreshold() > 0.7:
			saynn("[say=issix]Aww, my "+IssixModule.getPlayerPetName() +" is pent up? How cute.[/say]")
		else:
			saynn("[say=issix]Sex? Hmmm...[/say]")

		if getModuleFlag("IssixModule", "Issix_Mood", 50) > 70 and rng_per_day.randi_range(1,2) == 2:
			saynn("[say=issix]Sure, we can fuck, come here.[/say]")
			addButton("Start", "Start sex", "startsexissix")
		else:
			saynn("[say=issix]Sorry, I'm not in the mood for breeding. Ask me some other time.[/say]")
		addButton("Back", "Go back", "issixpetmenu")

	if state == "after_sex_issix":
		saynn("[say=issix]You did good today, pet. Thank you.[/say]")
		addButton("Back", "Go back", "")

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

func registerOffspringGuess():
	var past_guesses: Dictionary = getModuleFlag("IssixModule", "Litter_Guessing_Game", {"guesses_off": [], "last_guess": GM.CS.getChildrenAmountOf("azazel")})
	past_guesses["guesses_off"].append(reply_litter-azazel.getPregnancyLitterSize())
	past_guesses["last_guess"] = GM.CS.getChildrenAmountOf("azazel")
	setModuleFlag("IssixModule", "Litter_Guessing_Game", past_guesses.duplicate(true))

func canPromptLitterDialogue():
	return getModuleFlag("IssixModule", "Litter_Guessing_Game", {"guesses_off": [], "last_guess": -1})["last_guess"] != GM.CS.getChildrenAmountOf("azazel")

func _react(_action: String, _args):
	if _action == "startsexissix":
		getCharacter("issix").prepareForSexAsDom()
		GlobalRegistry.getCharacter("issix").addPain(-50)
		runScene("GenericSexScene", ["issix", "pc"], "subbysexissix")

	if _action == "littercountresult":
		if(getTextboxData("litter_count") == ""):
			return

		if not getTextboxData("litter_count").is_valid_integer():
			addMessage("Insert a valid number!")
			return

		reply_litter = int(getTextboxData("litter_count"))
		if reply_litter < 0:
			addMessage("Insert a valid POSITIVE number!")
			return
		if not reply_litter > 100:
			registerOffspringGuess()

	if _action == "azazelguesslitterstare":
		GM.pc.addEffect(StatusEffect.Suggestible, [20])
		GM.pc.addLust(100)
		azazel_teased_motherhood = true

	if _action == "after_sex_issix":
		setModuleFlag("IssixModule", "Had_Sex_With_Issix", true)
		processTime(20*60)
		IssixModule.addIssixMood(5)

	if _action == "readabook":
		processTime(20*60)
		increaseModuleFlag("IssixModule", "Comic_Books", -1)

	if _action == "haremeat":
		processTime(10*60)
		GM.pc.addStamina(60)
		GM.pc.addPain(-10)
		setModuleFlag("IssixModule", "Eaten_Today", true)

	if _action == "azazelguesslitter":
		var guesses = getModuleFlag("IssixModule", "Litter_Guessing_Game", {"guesses_off": []})
		match guesses["guesses_off"].size():
			0:
				_action = "azazelguesslitterfirst"
			1,2,3:
				_action = "azazelguesslitterrepeat"
			4:
				_action = "azazelguesslitterlast"
			_:
				_action = "azazelguesslitterfun"

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

func onTextBoxEnterPressed(_new_text:String):
	GM.main.pickOption("littercountresult", [])



func _react_scene_end(_tag, _result):
	if _tag == "subbysexissix":
		setState("after_sex_issix")


func saveData():
	var data = .saveData()

	data["replyLitter"] = reply_litter
	data["petTimeStart"] = pet_time_start
	data["azazelTease"] = azazel_teased_motherhood

	return data

func loadData(data):
	.loadData(data)

	pet_time_start = SAVE.loadVar(data, "petTimeStart", null)
	azazel_teased_motherhood = SAVE.loadVar(data, "azazelTease", false)
	reply_litter = SAVE.loadVar(data, "reply_litter", 0)
