extends SceneBase

func _init():
	sceneID = "PierreQuestionnaire"

func _run():
	if(state == ""):
		playAnimation(StageScene.Duo, "sit", {npc="pierre", npcAction="sit"})
		saynn("[say=pierre]Alrighty, pet in training. It's the first time I do this, but I'm going to give you a bunch of questions and I expect you to answer them truthfully. Don't dwell too long on them, trust your instinct.\nBlah blah blah, there are no wrong answers something something. You get the drill right? You must have filled a similar one in the past. Tablet will only present you with questions, you answer to me.[/say]")
		saynn("[say=pierre]Also, this will take a bit, here, have a seat.[/say]")
		saynn("He pulls a folding chair from behind his and unfolds it in front of himself, you sit and he passes a tablet to you. On it a giant button titled ”Start”.")
		addButton("Start", "Start the questionnaire", "q1")
		addButton("Later", "Maybe do this later, it looks like it is gonna take a while...", "endthescene")
		
	if(state == "q1"):
		saynn("You hit giant Start button. Screen flashes for split of a second. You feel intense gaze of Pierre studying your face as you read the first question.")
		saynn("„Do you believe creatures possess a soul?”")
		saynn("This question lingers in for you a second, but your ultimate answer is...")
		addButton("Yes", "Yes, you do believe souls exist", "q1yes", [true])
		addButton("No", "You don't believe in existance of souls", "q1no", [false])
		
	if(state == "q1yes"):
		saynn("[say=pc]I do believe creatures possess a soul, yeah.[/say]")
		saynn("You look at Pierre to see his reaction.")
		saynn("[say=pierre]Interesting, what do you think happens with it after a creature dies?[/say]")
		addButton("Disappears", "The soul disappears when the body dies", "q2")
		addButton("Moves", "The soul goes to heaven/hell/purgatory/other kind of place", "q2")
		addButton("Reincarnates", "The soul reincarnates as different creature", "q2")
		
	if(state == "q1no"):
		saynn("[say=pc]I don't believe that souls exist honestly, when we die - we die, there is no reason to be sentimental and add on some kind of feel good concept onto the death.[/say]")
		saynn("[say=pierre]Bold. Death is scary to many, but is soul really just a concept giving us closure to idea of living? Hmm. Anyways, lets move on.[/say]")
		addButton("Next question", "Moving on", "q2")
		
	if(state == "q2"):
		saynn("Looking back at tablet's screen, next question pops up.")
		saynn("„Do you consider yourself loyal?”")
		saynn("Not an unexpected question for this quiz.")
		addButton("Yes", "I do consider myself loyal", "q2yes", [true])
		addButton("No", "I don't consider myself loyal", "q2no", [false])
		
	if(state == "q2yes"):
		var protectedTavi = getModuleFlag("TaviModule", "Ch3ProtectedTavi")
		var onlyTaviPunished = getModuleFlag("TaviModule", "Ch5OnlyTaviPunished")
		if(protectedTavi == null and onlyTaviPunished == true):
			saynn("Pierre chuckes as you said yes")
			saynn("[say=pierre]I see. I see.[/say]")
		elif(protectedTavi == true and onlyTaviPunished == false):
			saynn("Pierre gives you a warm smile as you said that. One that makes you feel particularly good about this answer.")
			saynn("[say=pierre]I see. Loyal pets are a rarity.[/say]")
		elif(protectedTavi == null and onlyTaviPunished == false):
			saynn("Pierre gives you a smile as you said that.")
			saynn("[say=pierre]Good to know.[/say]")
		else:
			saynn("Pierre gives you a smile as you said that.")
			saynn("[say=pierre]I like loyal pets.[/say]")
		saynn("[say=pierre]Anyways, lets proceed with the next one.[/say]")
		addButton("Next question", "Moving on", "q3")
		
	if(state == "q2no"):
		var protectedTavi = getModuleFlag("TaviModule", "Ch3ProtectedTavi")
		var onlyTaviPunished = getModuleFlag("TaviModule", "Ch5OnlyTaviPunished")
		if(protectedTavi == null and onlyTaviPunished == true):
			saynn("You look at Pierre, he doesn't seem to be surprised by your answer, his face is still.")
			saynn("[say=pierre]Alright.[/say]")
		elif(protectedTavi == true and onlyTaviPunished == false):
			saynn("Pierre gives you a smile as you said that, he seems surprised.")
			saynn("[say=pierre]Hmm, that's interesting. I wonder, are you being humble or... Anyways, let's move on.[/say]")
		elif(protectedTavi == null and onlyTaviPunished == false):
			saynn("Pierre looks at you with curiosity.")
			saynn("[say=pierre]Funny.[/say]")
		else:
			saynn("Pierre considers you for a moment.")
		saynn("[say=pierre]Okey then, I suppose we can move on.[/say]")
		addButton("Next!", "Another one", "q3")
		
	if(state == "q3"):
		saynn("You look back at your tablet. You stare it for good 10 seconds, but no new question comes up. You start wondering if something is wrong or...")
		saynn("[say=pierre]Give me that for a second.[/say]")
		saynn("He takes the tablet from your paws and holds it. He then shakes it in all directions as if it was a snow globe toy, hitting it a few times on the floor for a good measure. After a solid minute of this treatment the tablet flashes with colors for a second and displays the next question.")
		saynn("[say=pierre]Here you go. Technology is sometimes stubborn, you'd think that violence is never an option, but for electronics? Those things fear you. Givving them a good whack sometimes helps them come to their senses.[/say]")
		saynn("He laughs, while passing the tablet back to you. Next questions says...")
		saynn("„What body part of yours do you consider most desirable?”")
		saynn("[say=pierre]By that I mean, which one of them you find the most essential to your identity... I guess...[/say]")
		var body_parts = GM.pc.getBodyparts()
		for bp in body_parts:
			var body_part = body_parts[bp]
			if body_parts[bp] == null or bp in [BodypartSlot.Body, BodypartSlot.Hair]:
				continue
			addButton(body_part.getName().capitalize(), "Your "+body_part.getName()+" feels like the most appropriate answer here", "q3answer", [body_part.id])
			
	if(state == "q3answer"):
		GM.main.setModuleFlag("PierreModule", "Quest_Status", 5)
		GM.main.setModuleFlag("PierreModule", "Quest_Wait_Another_Day", true)
		saynn("[say=pierre]Fascinating![/say]")
		saynn("He notes, presumably your answer, then he looks at the time.")
		saynn("[say=pierre]Wow, we are so quick with those![/say]")
		saynn("[say=pierre]Perhaps you'd like some wat-[/say]")
		saynn("[say=azazel]Master, master![/say]")
		saynn("You can hear sense of urgency in Azazel's voice.")
		saynn("[say=pierre]Yes, pet? What happened?[/say]")
		saynn("[say=azazel]Lamia, they... I think they...[/say]")
		saynn("Everyone immediately starts looking at Lamia. The fox is curled up, their head hidden under all of their fluff, they are visibly shaking.\nPierre jumps out of the chair, it falling on its back and making a lot of noise. He kneels next to Lamia and puts his paw gently under their head to see their face. Lamia is in tears, it's difficult to look at him at this state.")
		saynn("[say=pierre]Lamia, please, show.[/say]")
		saynn("He grabs a pen and hands it to Lamia. Lamia with great struggle takes the pen and scribbles something on piece of paper, you can't see it, it's behind Pierre's body. Pierre looks at the piece of paper and as he realizes what Lamia drew he shouts")
		saynn("[say=pierre]Pets, with me. To medical, now.[/say]")
		saynn("He grabs Lamia on his muscular hands and holds them in front. Fox is still curled up. It looks as if he is holding a large furry donut, but without a hole.")
		saynn("[say=pierre]"+GM.pc.getName() + ", we will finish the questionnaire later. Azazel, Hiisi, with me.[/say]")
		saynn("You haven't heard his tone being so serious... Ever. Two pets followed their master, still leashed, him holding the other ends in his paw while almost running towards the elevator.\nIt's interesting how he always takes all of his pets with him wherever he goes. This situation looked really urgent, makes you wonder what had happened. but you guess there is no point in standing here.")
		addButton("Leave", "That would be it for today, you guess", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
		
	if(_args):
		if(_action.begins_with("q1") ):
			setModuleFlag("PierreModule", "QuestionnaireQ1", _args[0])
		elif(_action.begins_with("q2")):
			setModuleFlag("PierreModule", "QuestionnaireQ2", _args[0])
		elif(_action.begins_with("q3")):
			setModuleFlag("PierreModule", "QuestionnaireQ3", _args[0])

	setState(_action)


func getDevCommentary():
	return "Writing questionnaire took me a while. I knew I wanted to write wuestionnaire and I wanted it to be meaningful in a way. At first the idea was that a player will choose some options and then Pierre will use them to apply punishments and rewards according to those responses. However evantually I felt like this may not be the best usage of questionnaire. One thing that to me is missing in the game is the lack of impact of choices made in other character arcs on the rest of the prison, I really wanted to do something about it, so I decided to possibly involve choices made in Tavi's questline as well as Rahi's to judge player for slavery fitness. There is also the fact that I enjoy ethics, so I slapped some ethics questions as well, this allows me to show that Pierre is not a two-dimensional character and works according to some rules he subscribes to as well. The end result is a weird mix of stuff. Don't know how I ultimately feel about all of this, but I think the idea of questionnaire is a solid one in here."
