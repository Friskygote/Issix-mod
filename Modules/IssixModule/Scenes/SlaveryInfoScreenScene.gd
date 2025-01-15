extends SceneBase

const Globals = preload("res://Modules/IssixModule/Globals.gd")

var rng_per_day = null
var pet_time_start = null
var reply_litter = null
var azazel_teased_motherhood = false
var AVERAGE_WALK_DELAY = 9
var milk_result = []

func _init():
	sceneID = "SlaveryInfoScreen"

func _initScene(_args = []):
	rng_per_day = RandomNumberGenerator.new()
	rng_per_day.seed = GM.main.getDays()
	reply_litter = 0

func _run():
	if(state == ""):
		clearCharacter()
		var last_walk = getModuleFlag("IssixModule", "Last_Walk", 0)
		playAnimation(StageScene.Duo, "kneel", {npc="issix", npcAction="stand"})
		if pet_time_start == null:
			pet_time_start = GM.main.getTime()
		addMessage("WARNING: A lot of the content in here is a placeholder. It will change, it will break, it will cause calamities. Treat it as a sneek peek into the (potential) future.")
		saynn("Your slave role: "+("pet" if GM.main.getModuleFlag("IssixModule", "PC_Enslavement_Role", 1) == 1 else "prostitute"))
		saynn("Your training: "+trainingCheck())
		saynn("Master's mood: "+getMood())
		saynn("Issix's slave for "+str(getDays())+" days")
		match GM.main.getModuleFlag("IssixModule", "PC_Enslavement_Role", 1):
			1.0, 1:
				saynn("Amount of time spent in Master's harem today: "+str(getTimeSpentReadable()))
				var forced = GM.main.getModuleFlag("IssixModule", "Is_Player_Forced_Today", 0)
				if forced > 0:
					saynn("You are expected to spend "+Util.getTimeStringHumanReadable(forced)+" in the harem today.")
			2.0, 2:
				saynn("To pay Master for sluttying around yesterday: " + str(GM.main.getModuleFlag("IssixModule", "Prostituation_fee_yesterday", 0) + GM.main.getModuleFlag("IssixModule", "Prostituation_flat_fee", 0)))
			_:
				pass
		if playerToFuck() and getModuleFlag("IssixModule", "Had_Sex_With_Issix", false) != true:
			saynn("[color=#983030][b]Master expects you to be available for fucking today.[/b][/color]")
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
			addDisabledButton("Play", "Play with other pets (WIP)")
		else:
			addDisabledButton("Play", "You are too tired to play with other pets (minimum 100 stamina)")
		if GM.main.getDays()-last_walk == AVERAGE_WALK_DELAY:  # TODO Walks
			if GM.main.getTime() < 54000:
				addDisabledButton("Walk", "Walks are unimplemented at the moment, possibly in future releases!")
			else:
				addDisabledButton("Walk", "Too late for a walk")
		addButton("Pass", "Pass the time (placeholder button for now, supposed to be actions with pets/master later)", "passtime")
		if getModuleFlag("IssixModule", "Comic_Book_Unlocked", false) == true and getModuleFlag("IssixModule", "Comic_Books", 0) > 0:
			addButtonWithChecks("Comic", "Read one of "+ str(getModuleFlag("IssixModule", "Comic_Books", 0)) +" comic books", "readabook", [], [ButtonChecks.NotBlindfolded])
		if not (GM.main.getModuleFlag("IssixModule", "Is_Player_Forced_Today", 0) > (getTimeSpent())) or GM.main.isVeryLate():
			addButton("Leave", "Leave", "endthescene")
		GM.ES.triggerRun("OpeningSlaveryScreen")

	if state == "issixpetmenu":
		addCharacter("issix")
		saynn("[say=issix]"+getSituationalMessage() + " " + getMoodMessage()+"[/say]")
		saynn("Is there anything you want to do with Master?")
		if GM.pc.hasBreastsFullOfMilk():
			saynn("[say=issix]{pc.Name}, wouldn't you want to unburden your heavy chest a little?[/say]")
			addButton("Milking", "Ask Issix about milking", "issixmilkingq")
		if getModuleFlag("IssixModule", "Had_Sex_With_Issix", false) == false:
			addButton("Sex", "Ask for sex with Master", "issixsexrequest")
		else:
			addDisabledButton("Sex", "You've already had sex with Issix today")
		addButton("Walk", "Ask when he plans the next walk to the pasture", "issixwalkquestion")
		addDisabledButton("Tasks", "Ask for extra tasks (WIP)")  # , "issixtaskquestion"
		addDisabledButton("Options", "Ask your Master to change how he treats you (WIP)")  #, "issixoptions" Pet etiquette, make player communicate via animalistic sounds, unlocks optional training
		addButton("Back", "Go back", "")

	if state == "issixmilkingfirst":
		saynn("[say=pc]Master, you mentioned something about unburdening my chest?[/say]")
		saynn("[say=issix]Yes, pet. I can see your nipples leaking, you must be full. If you want, I could help you out. What do you say about it, do you want to be a little cow for me today? I can even give you something extra if you are a good little pet for me and give me your milk.[/say]")
		addButton("Moo", "Moo at your Master", "issixmilking")
		addButton("Not today", "You do not feel like getting milked right now", "issixpetmenu")

	if state == "issixmilkingrepeat":
		saynn("[say=pc]Master, I'd like you to milk me today.[/say]")
		saynn("Master smiles at you and gestures you to come closer")
		saynn("[say=issix]Of course my little cow, come here, let me take care of you.[/say]")
		addButton("Moo", "Get milked by your Master", "issixmilking")

	if state == "issixmilking":
		playAnimation(StageScene.Duo, "sit", {npc="issix", bodyState={exposedChest=true, leashedBy="issix"}, npcAction="sit"})
		saynn("[say=pc]Mooo.[/say]")
		saynn("Your Master stands and sits you down on his chair.")
		if !GM.pc.isFullyNaked():
			saynn("[say=issix]First we will need to make you lose your clothes, don't you think? Little cows don't need any of that silly fabrics.[/say]")
			saynn("Your Master eagerly removes the clothing covering your round orbs containing plenty of fluid your body meant for your children.")

		saynn("Issix looks at your {pc.breasts} and starts massaging them with his paws, some {pc.milk} trickles out on his arm, he licks it.")

		if GM.pc.hasBigBreasts():
			saynn("[say=issix]You have such big {pc.milk} producers, can't wait to see just how much I can get out of them.[/say]")
		else:
			saynn("[say=issix]Modest size, but always cute to milk. If I were here for profit only I probably would skip the milking, but my precious pet cow deserves more than that, don't you?[/say]")
			saynn("You respond with a little embarrassed moo.")
		var term_for_breasts = ("udders" if GM.pc.hasBigBreasts() else "perky breasts")
		saynn("Master grabs a bucket from under his chair, kneels with one of his legs and puts the bucket on your legs. He holds the bucket with his elbow while each of his paws lands on your {pc.breasts}.")
		saynn("[say=issix]Hmm, perhaps that's not the best position for me, and I also think to complete your look we need one more thing.[/say]")

		saynn("Your Master stands before producing another folded chair from a stash of stuff behind you. He also picks up a leash from his bag and attaches its clasp to your collar.")

		saynn("[say=issix]That's better look for you, animals should be leashed. Now, my sweet little cow, relax and let me take care of you, okey?[/say]")
		saynn("You nod to your Master, excited. He starts to tug on your "+term_for_breasts+" as you feel {pc.milk} escape your body into the bucket below, this feeling accompanied by a range of other pleasurable feelings.")

		saynn("You look at your Master's face as he continues to gather your sweet {pc.milk}, though your look is blank - empty, just as your mind at that moment. You feel pleasure escaping from your "+term_for_breasts+" into every part of your body. Rhythmic squeezes currently fueling your existence. You live in a moment, letting your Master drain you, milk you like a feral animal. Your dumb stare is accompanied by open mouth with string of saliva dropping from your lips onto your body, if someone were to ask you a question, it likely wouldn't even register in your mind. Perhaps your Master milks you not only of {pc.milk} but also your mind? You wouldn't mind that though, would you?")
		saynn("[say=issix]What a happy little cow you are! Don't worry, seems like we are nearing the end.[/say]")
		saynn("You smile dumbly at your Master, not understanding his words. Cows don't think complex thoughts, they are to support their calves, or - like in your case - let their Master relieve them of burden. At some point you no longer register the waves of pleasure from your chest, and you hear snaps near your right ear. The blur in your eyes starts to sharpen out and you see happy face of your Master staring back at you, a bucket no longer on your legs.")
		saynn("[say=issix]You there? Hello? Theeere you are. Enjoyed being a little cow?[/say]")
		saynn("He scratches you behind your ears.")
		saynn("[say=issix]Lets see...[/say]")
		addButton("Continue", "Production review", "issixmilkingresult")

	if state == "issixmilkingresult":
		saynn("[say=issix]Today you've produced " +str(round(milk_result[0])) +" ml for me today. It makes it "+str(round(milk_result[1]))+" ml in total.[/say]")

		if GM.pc.getSkillLevel(Skill.Milking) < 20 or milk_result[1] < 50000 or milk_result[0] < 600:
			saynn("[say=issix]Perhaps you'd want to stay like you were when milking huh? Maybe some day, if you choose to be my little cow instead of "+GlobalRegistry.getModule("IssixModule").getPlayerPetName()+" we could think about it okey? But you need to be a goood healthy cow producing lots and lots of milk for your Master alright? "+("You even look the part already! *gently pokes your horns*" if GM.pc.hasHorns() else "")+" Gooood cow.[/say]")
			saynn("He pets your head")

		else:  # TODO I'll wait with this path for TF changes to land in main, perhaps player could become a female cow for Master?
			addDisabledButton("Cow cow!", "Become a cow for your Master (transformation, WIP (likely very distant future if ever))")
			if milk_result[2] > 0:
				saynn("[say=issix]You know, since your milk already brings me some profit I don't mind giving you a small share, perhaps my pet would want to get something for himself huh? Do you? Aww. Of course you do. Have this.[/say]")

		addButton("Continue", "Come back to your senses", "issixpetmenu")

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
			if getModuleFlag("IssixModule", "Azazel_Fertility_Training_Today") == true:
				addDisabledButton("Learn fertility", "You've trained fertility with Azazel today already")
			elif GM.pc.getSkillLevel(Skill.Fertility) < 10 and GM.pc.hasAnyWomb():
				addButton("Learn fertility", "Learn about being harem's breeder", "azazellearnfertility")
			else:
				addDisabledButton("Learn", "You already know everything about bearing children or you don't have a womb")
			if GlobalRegistry.getCharacter("azazel").isHeavilyPregnant() and canPromptLitterDialogue():
				addButton("Guess litter", "Ask Azazel about his pregnancy", "azazelguesslitter")
		addDisabledButton("Sex", "Ask for sex with Azazel (WIP)")  # , "azazelsexrequest"
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
			saynn("[say=azazel]Aren't you curious yourself, what it means to bear litter? Wouldn't you want to leave a mark in this wretched galaxy? To have more of little {pc.name}'s running around? Becoming adventurers, slaves, masters... Hah. Don't get me wrong, personally I don't think I care about my own legacy, but our Master does, I think. I enjoy being his little breeding kitten, maybe you'd like being his breeding "+GlobalRegistry.getModule("IssixModule").getPlayerPetName()+" too? Think about it.[/say]")
			saynn("He gives you a smile.")
		saynn("After he says that you leave the trance you were in, that was odd...")
		saynn("[say=azazel]So what do you say? Are you in?[/say]")
		addButton("Yup", "Accept Azazel's proposal to play the game", "azazelguesslitteraccept")
		addButton("Reject", "You don't want to play if you don't know what's at stake", "azazelguesslitterreject")

	if state == "littercountresult":
		var azazel = GlobalRegistry.getCharacter("azazel")
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
		playAnimation(StageScene.Duo, "kneel", {pc="hiisi", npcAction="kneel", npc="pc", bodyState={naked=false, hard=false}})
		addCharacter("hiisi")
		if GM.pc.getSkillLevel(Skill.Combat) < 16:  # Just thought about it, it just may be the only way to skill this up in pacifist way to do skill checks on combat, that's awesome
			if getModuleFlag("IssixModule", "Trained_With_Hiisi_Combat", false) != true:
				addButtonWithChecks("Learn", "Learn something from Hiisi (requires Energy Drink)", "hiisilearncombat", [], [[ButtonChecks.HasItemID, "EnergyDrink"], [ButtonChecks.HasStamina]])
			else:
				addDisabledButton("Learn", "You've trained with Hiisi today already, both you and he need a break")
		else:
			addDisabledButton("Learn", "There isn't anything more you can learn from Hiisi about combat")

		addDisabledButton("Sex", "Ask for sex with Hiisi (WIP)")  # , "hiisisexrequest"
		if getModuleFlag("IssixModule", "Hiisi_Protects_PC", true):
			addButton("Don't protect", "Tell Hiisi to stop protecting you in case of assault by an inmate", "hiisidontprotect")
		else:
			addButton("Protect", "Tell Hiisi to again protect you from assults of inmates", "hiisiprotect")
		addButton("Back", "Go back", "")

	if state == "hiisidontprotect":
		saynn("[say=pc]Hey, Hiisi, could you please stop following me? I should be able to deal with inmates on my own.[/say]")
		if GM.pc.getSkillLevel(Skill.Combat) < 16:
			if getModuleFlag("IssixModule", "Trained_With_Hiisi_Combat") == null:  # Low skill and never trained with Hiisi
				saynn("[say=hiisi]Are you sure? No offense, but you don't look like someone capable of defending {pc.himself}.[/say]")
				saynn("[say=pc]Yeah, I'll be fine, trust me.[/say]")
				saynn("[say=hiisi]Alright, I can do that, but please take care of yourself okey?[/say]")
			else:
				saynn("[say=hiisi]Are you sure? We did some combat training, but I'd say that you still need some more.[/say]")
				saynn("[say=pc]Yup, I'm sure I'll be fine, trust me.[/say]")
				saynn("[say=hiisi]Okey, sure. But please, be cautious, not a great place to live in.[/say]")
		else:
			saynn("[say=hiisi]Alright, if you say you are fine without my help then so be it. You do look capable if I had to say just... Please watch over yourself, okey?[/say]")
		saynn("[say=pc]Don't worry, I will![/say]")
		addButton("Finish", "End this conversation", "hiisipetmenu")

	if state == "hiisiprotect":
		saynn("[say=pc]Hey Hiisi, I'd like you to... Umm... Help me with other inmates again...[/say]")
		saynn("[say=hiisi]Of course. Don't worry, I'll do my best, okey?[/say]")
		saynn("[say=pc]Thank you Hiisi![/say]")
		addButton("Finish", "End this conversation", "hiisipetmenu")

	if state == "azazelfertilityfirst":
		playAnimation(StageScene.Duo, "kneel", {pc="azazel"})
		saynn("[say=pc]Heyy Azazel... Umm.[/say]")
		saynn("Azazel smiles at you.")
		saynn("[say=pc]I know you are harem's broodmother and I figured you'd have a lot of experience with, you know, having children?[/say]")
		saynn("[say=azazel]Haha. Well, you know I only can ever have them for a little bit when they are in me, but then they take them away. But yes, I guess you could say I have some experience with that, why do you ask?[/say]")
		saynn("[say=pc]Could you perhaps teach me something about that?[/say]")
		saynn("He flashes you with mischievous smile.")
		saynn("[say=azazel]But of course I can, cutie! I can make a great mother out of you, you'll see. Buuuuut. I'll want something in exchange.[/say]")
		saynn("[say=pc]Oh? What would it be?[/say]")
		if GM.pc.getSkillLevel(Skill.Fertility) < 6:
			saynn("[say=azazel]Well, at first a bottle of Lube will do. But perhaps in the future I'll want a bit more, you know. I'm a fairly needy kitty.[/say]")
			saynn("He purrs.")
		if GM.pc.getSkillLevel(Skill.Fertility) > 5:
			saynn("[say=azazel]Hehe, I'd like the ability to impregnate you.[/say]")
			saynn("You are kind of stunned, ability to impregnate you? Azazel doesn't even have the-")
			if GM.pc.hasVagina():
				saynn("[say=azazel]You'll bring me a strapon with cum and I'll use it to ram it into your {pc.vagina}. If I can't, there will be no lesson for you. I want to see you have a big belly full of cubs hihi.[/say]")
			elif GM.pc.hasWombIn(BodypartSlot.Anus):
				saynn("[say=azazel]You'll bring me a strapon with cum and I'll use it to ram it between your sweet cheeks until it leaks with all of the content of it. If I can't - for whatever reason, there will be no lesson for you. I want to see you have a big belly full of cubs hihi.[/say]")
			else:
				saynn("-- THIS SHOULDN'T HAPPEN! UNLESS YOU HAVE WOMB SOMEWHERE IN STRANGE PLACE, IN WHICH CASE - GOOD FOR YOU BUT I HAVEN'T ADDED SUPPORT FOR THAT, LET ME KNOW --")
			if !GM.pc.hasPenis() or GM.pc.hasPerk(Perk.StartMaleInfertility):
				saynn("[say=pc]That's... Kinda hot but... Where will I get cum from?[/say]")
				saynn("[say=azazel]Cmon cutie, you can figure it out, it can be anyone, best if it's Master's cum![/say]")

			saynn("[say=pc]So, you want to impregnate me every lesson?[/say]")
			saynn("[say=azazel]Indeed! The best way to teach you is with you having your belly full of cubs, isn't it?[/say]")
			saynn("[say=pc]I guess...[/say]")
			saynn("[say=azazel]Also, one of us should be pregnant, I can't work my teacher magic without some inspiration.[/say]")
			saynn("[say=pc]That's... Certainly a requirement.[/say]")
			saynn("[say=azazel]Easier thank you may think![/say]")
		addButton("Agree", "Agree to kitten's proposal", "azazelfertilityagree")
		addButton("Maybe later", "Say you have to think about it some more", "azazelpetmenu")

	if state == "azazelfertilityagree":
		saynn("[say=pc]Sure, we can do it.[/say]")
		saynn("[say=azazel]Yaaaay! Thank you, I hope to teach you all I know! I have tons of experience.[/say]")
		saynn("[say=azazel]Should we have first lesson?[/say]")
		if GM.pc.getSkillLevel(Skill.Fertility) < 6:
			if GM.pc.getInventory().hasItemID("lube"):
				addButton("Sure", "Say yes", "azazelfertilityfirstlube")
			else:
				addDisabledButton("No Lube", "Can't do that without lube")
		else:
			if checkIfPCHasLoadedStrapons():
				addButton("Sure", "Say yes", "azazelfertilitysecondsex")
			else:
				addDisabledButton("No Strapons", "You don't have loaded strapons")
		addButton("Later", "You have to go!", "azazelpetmenu")

	if state == "azazelfertilityrepeatlube":
		saynn("[say=pc]Heey, can we do fertility training right now?[/say]")
		saynn("[say=azazel]Sure! I'm up for it. Have you brought the slick juice?[/say]")
		if GM.pc.getInventory().hasItemID("lube"):
			saynn("[say=pc]Yup, have it here, catch.[/say]")
			saynn("You throw the bottle of lube at Azazel, he catches it.")
			saynn("[say=azazel]Thaaaanks, that will come in handy later hehe. Now, where were we last time...[/say]")
			addMessage("You've gave Azazel one bottle of lube")
			addButton("Continue", "Continue", "azazelfertilityfirst")
		else:
			saynn("[say=pc]Uhhh, frick, I forgot.[/say]")
			saynn("[say=azazel]Well, I'll wait. As much as I want to breed you, I need lube for stuff![/say]")
			addButton("Leave", "", "azazelpetmenu")

	if state == "azazelfertilityrepeatsex":
		saynn("[say=pc]Heey, can we do fertility training right now?[/say]")
		saynn("[say=azazel]Well, that depends in your strapon is loaded and your womb ready to receive a happy load hihi.[/say]")
		saynn("He eyes you with lust.")
		saynn("[say=azazel]First, show me your toys! I wanna see them.[/say]")
		if checkIfPCHasLoadedStrapons():
			saynn("You show Azazel the strapons you have.")
			saynn("[say=azazel]Yay! They look fine![/say]")
			saynn("He places his paw on your stomach and looks you in the eyes.")
			if GM.pc.hasPerk(Perk.StartInfertile):
				saynn("[say=azazel]Waaait a minute! You can't have children! You are infertile![/say]")
				saynn("Azazel says in accusatory tone. You actually get embarassed a little.")
				saynn("[say=pc]Y-yeah...[/say]")
				saynn("[say=azazel]I'm only willing to teach creatures that actually can bear children, otherwise it makes no sense![/say]")
				saynn("He crosses his arms and puts on a pouty face.")
				saynn("[say=pc]Alright, sorry then...[/say]")
				addButton("Leave", "", "azazelpetmenu")
				return
			if GM.pc.hasReachableVagina() or (GM.pc.hasWombIn(BodypartSlot.Anus) and GM.pc.hasReachableAnus()):
				saynn("[say=azazel]Good {pc.boy}. Now, which one should we use?[/say]")
				for strapon in checkPCStrapon():
					addButton(strapon.getVisibleName(), "Let Azazel borrow "+strapon.getVisibleName(), "azazelfertilitybreeding", [strapon])
			else:
				saynn("[say=azazel]Maaaan, don't tell me you have your holes blocked? How am I supposed to breed you if I can't even put baby batter into your waiting womb? Cmooon.[/say]")
				saynn("[say=azazel]Free up your breeding hole and come back, I want to breed you![/say]")
				addButton("Leave", "", "azazelpetmenu")
		else:
			if GM.pc.hasStrapons():
				saynn("[say=pc]Here you go![/say]")
				saynn("You show the feline strapons you've got, he checks them out.")
				saynn("[say=azazel]None of them are loaded with enough of cum. I want to breed you.[/say]")
				saynn("He annoyed.")
				saynn("[say=azazel]Come back when you have loaded strapons! I won't teach you until them meh![/say]")
				addMessage("You must come with at least one strapon loaded with 200ml of cum.")
				addButton("Leave", "", "azazelpetmenu")
			else:
				saynn("[say=pc]Oh, sorry, I forgot strapons, give me a minute.[/say]")
				saynn("[say=azazel]Cmooonnn, come back soon! I wanna fuuuck![/say]")
				addButton("Leave", "", "azazelpetmenu")

	if state == "azazelfertilityfirst":


	if state == "azazelfertilitysecond":


	if state == "hiisilearncombatfirst":
		playAnimation(StageScene.Yoga, "warrior", {pc="hiisi", bodyState={naked=true}})
		saynn("Figuring Hiisi might need an encouragement to teach you something, you prepare an energy drink to further convince the canine to teach you combat.")
		saynn("[say=pc]Hey Hiisi, I were wondering, you seem to know how to fight, any chance you could perhaps teach me something?[/say]")
		saynn("Hiisi looks at you, surprised a little.")
		saynn("[say=hiisi]Teach? Combat... I'm not so sure, I don't think I'm a good teacher material.[/say]")
		saynn("[say=pc]I think you'd do great Hiisi.[/say]")
		saynn("[say=hiisi]I don't think it's a great idea.[/say]")
		saynn("[say=pc]Can I convince you with this then?[/say]")
		saynn("You show an energy drink to Hiisi.")
		saynn("[say=hiisi]Oh. Hmm... Alright, I can teach you, but I expect the same for every lesson, alright?[/say]")
		saynn("[say=pc]Deal.[/say]")
		saynn("[say=hiisi]Cool.[/say]")
		if GM.pc.hasEffect(StatusEffect.Yoga) or GM.pc.hasEffect(StatusEffect.WorkOutLight) or GM.pc.hasEffect(StatusEffect.WorkOut):
			saynn("Canine begins stretching, he also loses his clothes, makes sense. You do some light stretching but you recently stretched a fair bit so you are ahead in this regard")
		else:
			saynn("Canine begins stretching, he also loses his clothes, makes sense. He gesticulates you should start exercising as well, which you promptly start doing. You do some pull-ups, squats, planks... Eventually you feel pretty good about your form for today's training.")
		saynn("[say=hiisi]Oh, forgot to ask, how advanced are you in combat?[/say]")
		var combat_level = GM.pc.getSkillLevel(Skill.Combat)
		if combat_level < 3:
			saynn("[say=pc]Absolute novice, I didn't have much combat experience.[/say]")
			saynn("[say=hiisi]I see... I guess we will start with basics then and go from there.[/say]")
		elif combat_level < 7:
			saynn("[say=pc]I have some experience. Fought here and there.[/say]")
			saynn("[say=hiisi]Hmm... Your posture seems right so I assume you already know the basics, we will focus on other things then[/say]")
		elif combat_level < 12:
			saynn("[say=pc]I think I'm pretty good actually, thought I'm sure there is still plenty I can learn from you.[/say]")
			saynn("[say=hiisi]Judging from your posture alone, it does seem like you know your shit. Can you show how you punch?[/say]")
			saynn("You do attempt punch and freeze your arm.")
			saynn("[say=hiisi]Yeah, that's good. There are small details you'll have to perfect but that's about it.[/say]")
		else:
			saynn("[say=pc]I fight regularly, so I have plenty of experience, I'm really looking for someone I can spar with and you seem pretty capable yourself.[/say]")
			saynn("[say=hiisi]I didn't really agree to be a sparring partner, but I'm sure there is still something to perfect with your form so lets proceed.[/say]")
		addButton("Training", "Start training under watchful eye of Hiisi", "hiisilearncombattraining")

	if state == "hiisilearncombatrepeat":
		saynn("[say=pc]Student {pc.name} arrived for training![/say]")
		saynn("You smile at Hiisi while doing a salute. Hiisi attempts to hide his blush.")
		saynn("[say=hiisi]You don't have to do thaaaat. Anyways, do you have the goods?[/say]")
		saynn("You pass the energy drink to Hiisi, he catches it and puts near his blanket.")
		saynn("[say=pc]Don't overdose on those![/say]")
		saynn("[say=hiisi]Yeah, sure, sure. Let's start.[/say]")
		addButton("Training", "Start training under watchful eye of Hiisi", "hiisilearncombattraining")

	if state == "hiisilearncombattraining1":
		playAnimation(StageScene.Solo, "stand", {pc="hiisi", bodyState={naked=true}})
		saynn("[say=hiisi]Since you are still a baby as far as combat goes, first you need to understand the basics of posture.[/say]")

		saynn("He stands with his two legs having a sizable gap in-between, marginally bended knees, his back straight and paws curled into fists in front of him. You attempt to replicate his posture.")

		saynn("[say=hiisi]Extend your arm here a little, yes, like that. More space in between your legs, you don't want someone to just push you and lose your balance, that leg is there to keep you steady. Face the opponent, like this, yes. Good. Keep your back straight, can be a little curved if that's better for you, every species have a little different balance but basis for stance is the same for each and every of them.[/say]")
		saynn("He gives you tips on posture here and there, you start to understand more and more about combat. After 25 minutes of training you feel like you can't take much more of advice for today, it's been a productive session.")
		saynn("[say=pc]Thank you Hiisi, I think I learned a bunch from you.[/say]")
		saynn("[say=hiisi]No problem, and remember about energy drink![/say]")
		saynn("[say=pc]Yeah, yeah, sure.[/say]")
		addButton("End", "End training for today", "hiisipetmenu")

	if state == "hiisilearncombattraining2":
		playAnimation(StageScene.Solo, "punch", {pc="hiisi", bodyState={naked=true}})
		saynn("[say=hiisi]You know a little about training already, how about we add a few things to that knowledge?[/say]")

		saynn("He stands with his two legs having a sizable gap in-between, marginally bended knees, his back straight and paws curled into fists in front of him. He punches the air a few times with fists of his right paw, you observe the quick moves. He switches to punching with left fist a few times.")

		saynn("[say=hiisi]What matters is you and your opponent. Observation is very important part of fight, you react to what your opponent does. It must be like a reflex for you. Those who don't have reflexes can't predict how their opponent is going to behave, that's why it needs training, best in real sparring.[/say]")
		saynn("You replicate the punches he thrown, sort of, at the very least you try your best. Hiisi corrects you fairly often, pointing out your countless mistakes, making reflexes a thing can be hard when you still have to think about your posture. 25 minutes pass and you decide that's enough of punching air for today.")
		saynn("[say=pc]That was enlightening, thanks Hiisi![/say]")
		saynn("[say=hiisi]Sure, see you later![/say]")
		saynn("[say=pc]Yup.[/say]")
		addButton("End", "End training for today", "hiisipetmenu")

	if state == "hiisilearncombattraining3":
		playAnimation(StageScene.Solo, "kick", {pc="hiisi", bodyState={naked=true}})
		saynn("[say=hiisi]Combat is surely not something new to you anymore. But lets take it to the next level.[/say]")

		saynn("He stands with his two legs having a sizable gap in-between, marginally bended knees, his back straight and paws curled into fists in front of him. He throws punches but he also involves his legs in the mixture. It occurs to you that it's a bit funny seeing him fight with invisible opponent.")

		saynn("[say=hiisi]To fight, you must involve your entire body, not just arms, not just legs but entire body.[/say]")
		if GM.pc.hasHorns():
			saynn("[say=pc]Can I utilize horns?[/say]")
			saynn("He looks at you bewildered, before his face is replaced with heavy thinking.")
			saynn("[say=hiisi]That's... Yeah, that's something you can definitely do. It's good that you are thinking about your ENTIRE body. Horns are sturdy and can do plenty damage if used in appropriate moment.[/say]")

		saynn("He continues to give you guidance as he shows a few moves he knows. He teaches you how to react to different body cues coming from your opponent. Punching air gets tiring pretty quick and you decide to rest for today.")
		saynn("[say=pc]I feel like I'm getting better at this, thank you Hiisi![/say]")
		saynn("[say=hiisi]Of course, I feel like I might actually not be too bad as a teacher.[/say]")
		saynn("[say=pc]You are great! Seriously, I learn so much from you.[/say]")
		saynn("Canine blushes and waves you off")
		addButton("End", "End training for today", "hiisipetmenu")

	if state == "hiisilearncombattraining4":
		playAnimation(StageScene.Solo, "dodge", {pc="hiisi", bodyState={naked=true}})
		saynn("[say=hiisi]There is little more I can teach you, but I can try. Master is a lot more skilled in combat than I'm, maybe he could help?[/say]")

		saynn("He stands with his two legs having a sizable gap in-between, marginally bended knees, his back straight and paws curled into fists in front of him. He throws punches but he also involves his legs in the mixture. You can feel tense energy in the air, he gives it all and his technique is pretty refined, you can feel he doesn't do anything „simple” and doesn't try to make it easy to digest for you, this is high level.")

		saynn("[say=hiisi]All of the techniques you already learned must be perfected to work together, body posture, reflexes, proper technique on punches and kicks. You observe your opponent and choose the best course of action, rely on intuition, it's faster than reason.[/say]")

		saynn("You repeat the process over and over, you stand alongside Hiisi and try to synchronize your body with his, you imagine your opponent in front of you and try to beat them. Hiisi laughs.")
		saynn("[say=hiisi]That's pretty good, good. I'm pretty proud of you, combat is no stranger to you anymore.[/say]")
		saynn("[say=pc]Yeah! I feel plenty powerful, like... I could take down so many bullies![/say]")
		saynn("[say=hiisi]*chuckle* Don't get ahead of yourself. You need not to underestimate the opponent, the one who does - loses. Treat each and every opponent as someone who knows their shit so they don't knock you down when you fall to your pride. You are not Master.[/say]")
		saynn("[say=pc]What do you mean by that? I mean, Master sure looks well-built and I'm sure he can defend himself, but is he this good?[/say]")
		saynn("[say=hiisi]I truthfully believe that if he wanted he could take down all guards with his bare fists. He is Master not only in name but in combat as well.[/say]")
		saynn("It makes you wonder just how good your Master must be to hear such praise from someone like Hiisi about him,")
		addButton("End", "End training for today", "hiisipetmenu")

	if state == "lamiapetmenu":
		playAnimation(StageScene.Duo, "kneel", {pc="lamia", npcAction="kneel", npc="pc", bodyState={naked=false, hard=false}})
		addCharacter("lamia")
		#addButton("Read", "Read comic books (WIP)", "")
		if GM.main.getModuleFlag("IssixModule", "Have_Received_Headpats_Lamia", false) == false:
			addButton("Pets", "Ask for pets", "lamiapetrequest")
		else:
			addDisabledButton("Pets", "You've asked for headpats today already!")
		if GM.pc.getInventory().hasRemovableRestraintsNoLockedSmartlocks():
			addButton("Get help", "Get Lamia's help with bondage gear that is on you", "lamiahelpbondage")
		else:
			addDisabledButton("Get help", "You are currently not bound by anything that Lamia could help you with")
		addButton("Back", "Go back", "")

	if state == "lamiahelpbondage":
		saynn("[say=pc]Hey, Lamia, uhhh, could you help getting me out of those?[/say]")
		saynn("Lamia gives you a look and nods, they come up to you and start helping you out of your various bondage gear you have on yourself.\nFinally you are no longer burdened by all that bondage gear on your body. Lamia smiles at you and gives you a pat before returning to their usual activity.")
		addButton("Back", "Continue", "lamiapetmenu")

	if state == "lamiapetrequestfirst":
		saynn("A fox breed is consumed by snacking on food in their pet bowl.")
		if GM.pc.getPersonality().getStat(PersonalityStat.Coward) > 0.3:
			saynn("[say=pc]Hey Lamia, I wondered if...[/say]")
			saynn("You realize how awkward you feel asking Lamia this. It feels silly, you feel vulnerable and exposed doing so. Lamia stares at your face, which you are trying to unconsciously conceal from the fox breed. He stares at you some more, confused.")
			saynn("[say=pc]I were wondering if you could... Ummm...[/say]")
			saynn("You still feel incredibly embarrassed, making it difficult for you to finish the question. Finally, Lamia takes his paw and pushes it under yours, taking your into his own, doing the same with the second. This calms you down a little, you finally look at face of Lamia. It's a smile, such a honest and comforting smile. You didn't know that someone can have such an effect on you, to dispel any worries, to comfort you so much, and yet the fox does just that, without saying a single word.")
			saynn("[say=pc]Wow... Thank you. I wanted to ask if you could maybe pet me? It still feels si-[/say]")
			saynn("Not letting you finish your sentence, Lamia lets go of your paw and places it on top of your head giving you a few very gentle pats. You close your eyes and just let yourself be pet, realizing that it might look silly from outside perspective, but quickly losing those thoughts as they are replaced by fuzzy feelings. Fox may be mute, but somehow you start to understand that communication with words isn't always needed, that some emotions can be expressed with mere body language that often is more expressive than a thousand words. Feeling of fulfillment and comfort fills you, easing pain and filling you with happiness.")
			saynn("[say=pc]You are the best Lamia, thank you so much, that's just what I needed![/say]")
			saynn("He nods in understanding, they don't say anything but somehow it feels as if they communicated to you „any time, friend”. At least that's what you think you saw in their body language, or can you read their body language? That's a strange feeling.")
		else:
			saynn("[say=pc]Hey Lamia, I were wondering if you could pet my head a few times? I've been feeling do-[/say]")
			saynn("Fox needing no explanation or encouragement, simply puts his paw on your head and starts petting you. For a moment you even feel embarrassed a little by the treatment but then, you did ask right? You look at their face, very candid and expressively full of love for other creatures. It strikes you as such a rare experience in your life. To ask someone to do something so small and yet so meaningful, happy, joyful... As they ruffle your fur, and behind your ears you can feel a rush of endorphines in your body, as well as appreciation for such simple act of care you've been given.")
			saynn("[say=pc]Thank you, Lamia. That was wonderful, feel free to ask me anytime I can reciprocate your wonderful headpats.[/say]")
			saynn("They nod to you in understanding")
		addButton("Finish", "Finish this interaction", "lamiapetmenu")

	if state == "lamiapetrequestanother":
		saynn("[say=pc]Hey Lamia![/say]")
		saynn("You don't have to say anything and Lamia begins to reach their paw above your head, you let them do this. No future words are exchanged as the fox gives you pats and ruffles your hair a little. This small ritual gave you powers to push through the day reinvigorated.")

		addButton("Finish", "Finish this interaction", "lamiapetmenu")

	if state == "issixwalkquestion":
		var last_walk = getModuleFlag("IssixModule", "Last_Walk", 0)
		if last_walk + 5 > GM.main.getDays():
			saynn("[say=issix]We've just been on a walk pretty recently, so you'll have to be a little bit more patient my pet.[/say]")
		else:
			saynn("[say=issix]Hmm, soonish, probably in around "+ str(AVERAGE_WALK_DELAY-(GM.main.getDays()-last_walk)) + " days. Are you excited for the next walk?[/say]")
		addButton("Back", "Go back", "issixpetmenu")

	if state == "issixsexrequest":
		if GM.main.getModuleFlag("IssixModule", "Todays_Bred_Slave", "hiisi") == "pc":
			saynn("[say=pc]I'm ready, Master.[/say]")
			saynn("[say=issix]Good. let's do it.[/say]")
			addButton("Start", "Start sex", "startsexissix")
			return

		saynn("[say=pc]Umm, Master? Could we have sex today?[/say]")
		if float(GM.pc.getLust()) / GM.pc.lustThreshold() > 0.7:
			saynn("[say=issix]Aww, my "+GlobalRegistry.getModule("IssixModule").getPlayerPetName() +" is pent up? How cute.[/say]")
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

	if state == "after_sex_issix_unhappy":
		if getModuleFlag("IssixModule", "PC_Bad_Sex", 1) <= 1:
			saynn("[say=issix]That was bad. You should learn from Azazel how to do it correctly. Don't make me disappointed again.[/say]")
			addButton("Back", "Go back", "")
		else:
			saynn("[say=issix]I told you to stop disappointing me with this pathetic excuse of what you call sex. I'm going to have to make sure you do not disappoint me again.[/say]")
			addMessage("You've been assigned punishment by your Master.")  # TODO
			addButton("Back", "Go back", "")


	if state == "readabook":
		saynn("You read one of the comic books, 20 minutes pass.")  # TODO Expand on this
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

func supportsSexEngine():
	return true

func getSituationalMessage():
	var responses = []
	if GM.pc.isWearingHypnovisor():
		responses.append("Making sure you stay obedient for your Master with that thing? That's cute. I like it.")
	if GM.pc.isHeavilyPregnant():
		responses.append("Almost ready for kits? Wonder how many of them are mine.")
	if GM.pc.isCoveredInPiss():
		responses.append("Love to see you smelling of urine.")
	if GM.pc.isInHeat():
		responses.append("I can smell your love juices from here, is my pet in heat? Aww. You need a good fuck don't you?")
	if GM.pc.isWearingPortalPanties() and GM.pc.isFullyNaked():
		responses.append("Personally not a fan of those new technologies, what's fun about fucking someone when you can't feel them wriggle in your arms?")
	if GM.pc.isMuzzled():
		responses.append("All bark no bite haha. I love when my pets come to me with equipment befitting their role in life.")
	if GM.pc.hasBoundLegs() and GM.pc.hasBlockedHands() and GM.pc.hasBoundArms() and GM.pc.isBlindfolded() and GM.pc.isOralBlocked() and GM.pc.getInventory().hasItemIDEquipped("ropeharness"):
		responses.append("*whistles* You look like a rope bunny to me, in this place it screams „I consent to everything”, quite dangerous if you ask me, but fuck, if you like it maybe you don't mind being a rape bait for everyone in this facility.")
	if GM.pc.hasBoundLegs():
		responses.append("Do you enjoy struggling with walking so much? I hope you do.")
	if GM.pc.hasBlockedHands():
		responses.append("Fuck yes. It gotta be one of my favorite things when my pet's paws are reduced to absolutely useless mittens. I think this look befits you, in fact, I think you should wear them permanently.")
	if GM.pc.getInventory().hasItemIDEquipped("GasMask"):
		responses.append("Where the hell have you found that thing? A fucking gas mask? Damn. Did not expect that.")
	return ""

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

# Return all Strapons that have 200ml of Cum or more
func checkPCStrapon():
	var available_strapons := []
	for strapon in GM.pc.getStrapons():
		var fluids = strapon.getFluids()
		var fluids_type = fluids.getFluidAmountByType()
		if fluids_type.has("Cum"):
			if fluids_type["Cum"] >= 200:
				available_strapons.append(strapon)
	return available_strapons

func checkIfPCHasLoadedStrapons():
	return checkPCStrapon().size() > 0

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

static func playerToFuck():
	return (int(GM.main.getDays()) % 2 == 1) and GM.main.getModuleFlag("IssixModule", "Todays_Bred_Slave", "") == "pc"

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
	past_guesses["guesses_off"].append(reply_litter-GlobalRegistry.getCharacter("azazel").getPregnancyLitterSize())
	past_guesses["last_guess"] = GM.CS.getChildrenAmountOf("azazel")
	setModuleFlag("IssixModule", "Litter_Guessing_Game", past_guesses.duplicate(true))

func canPromptLitterDialogue():
	return getModuleFlag("IssixModule", "Litter_Guessing_Game", {"guesses_off": [], "last_guess": -1})["last_guess"] != GM.CS.getChildrenAmountOf("azazel")

func _react(_action: String, _args):
	if _action == "startsexissix":
		getCharacter("issix").prepareForSexAsDom()
		GlobalRegistry.getCharacter("issix").addPain(-50)
		runScene("GenericSexScene", ["issix", "pc"], "subbysexissix")

	if _action == "hiisidontprotect":
		setModuleFlag("IssixModule", "Hiisi_Protects_PC", false)

	if _action == "hiisiprotect":
		setModuleFlag("IssixModule", "Hiisi_Protects_PC", true)

	if _action == "azazellearnfertility":
		if getModuleFlag("IssixModule", "Azazel_Fertility_Training_Today") == null:
			_action = "azazelfertilityfirst"
		elif GM.pc.getSkillLevel(Skill.Fertility) < 6:
			_action = "azazelfertilityrepeatlube"
		else:
			_action = "azazelfertilityrepeatsex"

	if _action == "azazelfertilityfirst":
		GM.pc.getInventory().removeFirstOf("lube")

	if _action == "lamiapetrequest":
		GM.pc.addPain(-10)
		GM.pc.addStamina(5)
		processTime(4*60)
		GM.main.increaseModuleFlag("IssixModule", "Received_Headpats_From_Lamia")
		if GM.main.getModuleFlag("IssixModule", "Have_Received_Headpats_Lamia") == null:
			_action = "lamiapetrequestfirst"
		else:
			_action = "lamiapetrequestanother"
		GM.main.setModuleFlag("IssixModule", "Have_Received_Headpats_Lamia", true)

	if _action == "issixmilkingq":
		if GM.main.getModuleFlag("IssixModule", "Total_Fluids_Milked", 0) == 0:
			_action = "issixmilkingfirst"
		else:
			_action = "issixmilkingrepeat"

	if _action == "issixmilking":
		processTime(10*60)

	if _action == "issixmilkingresult":
		var this_milking = GM.pc.milk()
		var credits = 0
		var total_milk_obtained = getModuleFlag("IssixModule", "Total_Fluids_Milked", {"Milk": 0.0})  # Currently only fluid implemented in base game
		total_milk_obtained["Milk"] = total_milk_obtained["Milk"] + this_milking
		setModuleFlag("IssixModule", "Total_Fluids_Milked", total_milk_obtained)
		if this_milking > 500 and total_milk_obtained["Milk"] > 3000:
			credits = clamp(int(floor(sqrt(this_milking / 100.0) / 1.3)) - 15, 0.0, 300.0)
			if credits > 0:
				addMessage("Your Master passes to you "+str(credits)+" credits.")
		milk_result = [this_milking, total_milk_obtained["Milk"], credits]
		setModuleFlag("IssixModule", "Has_Been_Milked_Today", true)

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

	if _action == "hiisilearncombat":
		if GM.main.getModuleFlag("IssixModule", "Trained_With_Hiisi_Combat") == null:
			_action = "hiisilearncombatfirst"
		else:
			_action = "hiisilearncombatrepeat"
		GM.pc.getInventory().removeXOfOrDestroy("EnergyDrink", 1)
		addMessage("You've given away 1 energy drink.")

	if _action == "hiisilearncombattraining":
		processTime(25*60)
		var skill = GM.pc.getSkillsHolder().getSkill(Skill.Combat)
		var exp_calc = 25
		if skill != null:
			exp_calc = int(skill.getRequiredExperience(skill.getLevel()+1)/4)
		GM.pc.addSkillExperience(Skill.Combat, exp_calc)  # Needs <4 trainings per level, to not be too OP
		addMessage("You've gained "+str(exp_calc)+"XP in Combat thanks to training with Hiisi.")
		GM.main.setModuleFlag("IssixModule", "Trained_With_Hiisi_Combat", true)
		GM.pc.addStamina(-80)
		var combat_level = GM.pc.getSkillLevel(Skill.Combat)
		if combat_level < 3:
			_action = "hiisilearncombattraining1"
		elif combat_level < 7:
			_action = "hiisilearncombattraining2"
		elif combat_level < 12:
			_action = "hiisilearncombattraining3"
		else:
			_action = "hiisilearncombattraining4"

	if _action == "azazelguesslitterstare":
		GM.pc.addEffect(StatusEffect.Suggestible, [20])
		GM.pc.addLust(100)
		azazel_teased_motherhood = true

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

	if _action == "lamiahelpbondage":
		var bondage = GM.pc.getInventory().getEquppedRemovableRestraintsNoLockedSmartlocks()
		processTime(bondage.size()*60)
		for item in bondage:
			if RNG.chance(99):
				GM.pc.getInventory().unequipItem(item)
				addMessage(item.getVisibleName()+ " has been taken off you and added back to your inventory")
			else:
				GM.pc.getInventory().removeEquippedItem(item)
				addMessage(item.getVisibleName()+ " has been taken off but has been damaged beyond repair, Lamia discards the item into the trash bin")

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
		setModuleFlag("IssixModule", "Had_Sex_With_Issix", true)
		processTime(20*60)
		var issix_sex_result = _result[0].get("doms", {}).get("issix", {})
		var pc_sex_result = _result[0].get("subs", {}).get("pc", {})
		if pc_sex_result.get("isUnconscious"):
			Globals.addIssixMood(5)
		elif issix_sex_result.get("satisfaction") < 0.8:
			increaseModuleFlag("IssixModule", "PC_Bad_Sex")
			setState("after_sex_issix_unhappy")
		else:
			Globals.addIssixMood(5)
			setState("after_sex_issix")


func saveData():
	var data = .saveData()

	data["milk_result"] = milk_result
	data["replyLitter"] = reply_litter
	data["petTimeStart"] = pet_time_start
	data["azazelTease"] = azazel_teased_motherhood

	return data

func loadData(data):
	.loadData(data)

	milk_result = SAVE.loadVar(data, "milk_result", [])
	pet_time_start = SAVE.loadVar(data, "petTimeStart", null)
	azazel_teased_motherhood = SAVE.loadVar(data, "azazelTease", false)
	reply_litter = SAVE.loadVar(data, "reply_litter", 0)
