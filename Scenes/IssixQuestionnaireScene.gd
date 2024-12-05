extends SceneBase

var answer = null
var strikes = 0

func _init():
	sceneID = "IssixQuestionnaire"

func _run():
	if(state == ""):
		playAnimation(StageScene.Duo, "sit", {npc="issix", npcAction="sit"})
		if(GM.main.getModuleFlag("IssixModule", "Quest_Status") == 4):
			saynn("[say=issix]Alrighty, pet in training. It's the first time I do this, but I'm going to give you a bunch of questions and I expect you to answer them truthfully. Don't dwell too long on them, trust your instinct.\nBlah blah blah, there are no wrong answers something something. You get the drill right? You must have filled a similar one in the past. Tablet will only present you with questions, you answer to me.[/say]")
			saynn("[say=issix]Also, this will take a bit, here, have a seat.[/say]")
			saynn("He pulls a folding chair from behind his and unfolds it in front of himself, you sit and he passes a tablet to you. On it a giant button titled ”Start”.")
			addButton("Start", "Start the questionnaire", "q1")
			addButton("Later", "Maybe do this later, it looks like it is gonna take a while...", "endthescene")
		else:
			saynn("[say=pc]Could we continue the quiz?[/say]")
			saynn("Issix looks at you confused for a second.")
			saynn("[say=issix]Ohhhh, the quiz, right. Sorry, I've had... A rough night, sit down, the chair is still there.[/say]")
			addButton("Lamia", "Ask about Lamia", "lamiaquestion")
			addButton("Start", "Start the questionnaire", "q4")
			addButton("Later", "Maybe do this later, it looks like it is gonna take a while...", "endthescene")
		
	if(state == "q1"):
		processTime(2*60)
		saynn("You hit giant Start button. Screen flashes for split of a second in Silver color. You feel intense gaze of Issix studying your face as you read the first question.")
		saynn("„Do you believe creatures possess a soul?”")
		saynn("This question lingers in for you a second, but your ultimate answer is...")
		addButton("Yes", "Yes, you do believe souls exist", "q1yes", [true])
		addButton("No", "You don't believe in existence of souls", "q1no", [false])
		
	if(state == "q1yes"):
		saynn("[say=pc]I do believe creatures possess a soul, yeah.[/say]")
		saynn("You look at Issix to see his reaction.")
		saynn("[say=issix]Interesting, what do you think happens with it after a creature dies?[/say]")
		addButton("Disappears", "The soul disappears when the body dies", "q2")
		addButton("Moves", "The soul goes to heaven/hell/purgatory/other kind of place", "q2")
		addButton("Reincarnates", "The soul reincarnates as different creature", "q2")
		
	if(state == "q1no"):
		saynn("[say=pc]I don't believe that souls exist honestly, when we die - we die, there is no reason to be sentimental and add on some kind of feel good concept onto the death.[/say]")
		saynn("[say=issix]Bold. Death is scary to many, but is soul really just a concept giving us closure to idea of living? Hmm. Anyways, lets move on.[/say]")
		addButton("Next question", "Moving on", "q2")
		
	if(state == "q2"):
		if answer == true:
			saynn("[say=issix]Fascinating, thank you.[/say]")
		saynn("Looking back at tablet's screen, next question pops up.")
		saynn("„Do you consider yourself loyal?”")
		saynn("Not an unexpected question for this quiz.")
		addButton("Yes", "I do consider myself loyal", "q2yes", [true])
		addButton("No", "I don't consider myself loyal", "q2no", [false])
		
	if(state == "q2yes"):
		var protectedTavi = getModuleFlag("TaviModule", "Ch3ProtectedTavi")
		var onlyTaviPunished = getModuleFlag("TaviModule", "Ch5OnlyTaviPunished")
		if(protectedTavi == null and onlyTaviPunished == true):
			saynn("Issix chuckes as you said yes")
			saynn("[say=issix]I see. I see.[/say]")
		elif(protectedTavi == true and onlyTaviPunished == false):
			saynn("Issix gives you a warm smile as you said that. One that makes you feel particularly good about this answer.")
			saynn("[say=issix]I see. Loyal pets are a rarity.[/say]")
		elif(protectedTavi == null and onlyTaviPunished == false):
			saynn("Issix gives you a smile as you said that.")
			saynn("[say=issix]Good to know.[/say]")
		else:
			saynn("Issix gives you a smile as you said that.")
			saynn("[say=issix]I like loyal pets.[/say]")
		saynn("[say=issix]Anyways, lets proceed with the next one.[/say]")
		addButton("Next question", "Moving on", "q3")
		
	if(state == "q2no"):
		var protectedTavi = getModuleFlag("TaviModule", "Ch3ProtectedTavi")
		var onlyTaviPunished = getModuleFlag("TaviModule", "Ch5OnlyTaviPunished")
		if(protectedTavi == null and onlyTaviPunished == true):
			saynn("You look at Issix, he doesn't seem to be surprised by your answer, his face is still.")
			saynn("[say=issix]Alright.[/say]")
		elif(protectedTavi == true and onlyTaviPunished == false):
			saynn("Issix gives you a smile as you said that, he seems surprised.")
			saynn("[say=issix]Hmm, that's interesting. I wonder, are you being humble or... Anyways, let's move on.[/say]")
		elif(protectedTavi == null and onlyTaviPunished == false):
			saynn("Issix looks at you with curiosity.")
			saynn("[say=issix]Funny.[/say]")
		else:
			saynn("Issix considers you for a moment.")
		saynn("[say=issix]Okey then, I suppose we can move on.[/say]")
		addButton("Next!", "Another one", "q3")
		
	if(state == "q3"):
		processTime(2*60)
		saynn("You look back at your tablet. You stare it for good 10 seconds, but no new question comes up. You start wondering if something is wrong or...")
		saynn("[say=issix]Give me that for a second.[/say]")
		saynn("He takes the tablet from your paws and holds it. He then shakes it in all directions as if it was a snow globe toy, hitting it a few times on the floor for a good measure. After a solid minute of this treatment the tablet flashes with Lilac color for a second and displays the next question.")
		saynn("[say=issix]Here you go. Technology is sometimes stubborn, you'd think that violence is never an option, but for electronics? Those things fear you. Giving them a good whack sometimes helps them come to their senses.[/say]")
		saynn("He laughs, while passing the tablet back to you. Next questions says...")
		saynn("„What body part of yours do you consider most desirable?”")
		saynn("[say=issix]By that I mean, which one of them you find the most essential to your identity... I guess...[/say]")
		var body_parts = GM.pc.getBodyparts()
		for bp in body_parts:
			var body_part = body_parts[bp]
			if body_parts[bp] == null or bp in [BodypartSlot.Body, BodypartSlot.Hair]:
				continue
			addButton(body_part.getName().capitalize(), "Your "+body_part.getName()+" feels like the most appropriate answer here", "q3answer", [body_part.id])
			
	if(state == "q3answer"):
		processTime(5*60)
		GM.main.setModuleFlag("IssixModule", "Quest_Status", 5)
		GM.main.setModuleFlag("IssixModule", "Quest_Wait_Another_Day", true)
		saynn("[say=issix]Fascinating![/say]")
		saynn("He notes, presumably your answer, then he looks at the time.")
		saynn("[say=issix]Wow, we are so quick with those![/say]")
		saynn("[say=issix]Perhaps you'd like some wat-[/say]")
		saynn("[say=azazel]Master, master![/say]")
		saynn("You can hear sense of urgency in Azazel's voice.")
		saynn("[say=issix]Yes, pet? What happened?[/say]")
		saynn("[say=azazel]Lamia, they... I think they...[/say]")
		saynn("Everyone immediately starts looking at Lamia. The fox is curled up, their head hidden under all of their fluff, they are visibly shaking.\nIssix jumps out of the chair, chair falling on its back and making a lot of noise. He kneels next to Lamia and puts his paw gently under his head to see his face. Lamia is in tears, it's difficult to look at him at this state.")
		saynn("[say=issix]Lamia, please, show.[/say]")
		saynn("He grabs a pen and hands it to Lamia. Lamia with great struggle takes the pen and scribbles something on piece of paper, you can't see it, it's behind Issix's body. Issix looks at the piece of paper and as he realizes what Lamia drew he shouts")
		saynn("[say=issix]Pets, with me. To medical, now.[/say]")
		saynn("He grabs Lamia on his muscular hands and holds them in front. Fox is still curled up. It looks as if he is holding a large furry donut, but without a hole.")
		saynn("[say=issix]"+GM.pc.getName() + ", we will finish the questionnaire later. Azazel, Hiisi, with me.[/say]")
		saynn("You haven't heard his tone being so serious... Ever. Two pets followed their master, still leashed, him holding the other ends in his paw while almost running towards the elevator.\nIt's interesting how he always takes all of his pets with him wherever he goes. This situation looked really urgent, makes you wonder what had happened. but you guess there is no point in standing here.")
		addButton("Leave", "That would be it for today, you guess", "endthescene")

	if(state == "lamiaquestion"):
		saynn("[say=pc]Uhh, are you okey? Is Lamia okey? They didn't look great yesterday.[/say]")
		saynn("Issix sighs")
		saynn("[say=issix]Thank you for asking, pet. I'm fine, Lamia is... Well, let's just say it isn't the first time it happens, it's really due to my own negligence. But they are fine for now.[/say]")
		saynn("[say=pc]I see[/say]")
		saynn("Doesn't seem like Issix is willing to elaborate on this one.")
		addButton("Start", "Start the questionnaire", "q4")
		addButton("Later", "Maybe do this later, it looks like it is gonna take a while...", "endthescene")
		
	if(state == "q4"):
		saynn("Issix taps the sceen of the tablet a few times and passes to you. Screen already shows the 4th question. Issix looks at your face again, though not with same intensity as the last time, yesterday's event made him feel really out of it. His eyes are reddened and there are visible bags under them, lack of sleep? Maybe?")
		saynn("[say=issix]Let's start[/say]")
		saynn("The question says: „Can you bear children?”")
		if(GM.pc.isVisiblyPregnant()):
			saynn("[say=issix]Uhhh... You know what, let's skip this question, I think we know the answer already.[/say]")
			addButton("Skip", "There is no way to hide your pregnancy, Issix already knows the answer", "q4answer", [true])
		else:
			saynn("[say=issix]I need to know everything about my pets, and you know, this really helps.[/say]")
			if(GM.pc.hasAnyWomb() and GM.pc.hasPerk(Perk.StartInfertile) == false):
				addButton("Yes", "Yes, you can bear children", "q4answer", [true])
				addButton("No (lie)", "No, you can't bear children", "q4answer", [false])
			else:
				addButton("Yes (lie)", "Yes, you can bear children", "q4answer", [true])
				addButton("No", "No, you can't bear children", "q4answer", [false])
				
	if(state == "q5"):
		saynn("Screen flashes for a second, Aqua color fills the screen. Next question says: „What sexual activity are you interested in the most?”")
		saynn("[say=issix]Just to clerify - all of those assume you take the submissive role.[/say]")
		addButton("Anal", "Anal sex interests you the most", "q5answer", ['anal'])
		if(OPTIONS.isContentEnabled(ContentType.Watersports)):
			addButton("Watersports", "Say you are interested in piss", "q5answer", ['watersports'])
		addButton("Oral", "Oral sex interests you the most", "q5answer", ['oral'])
		addButton("Bondage", "Bondage interests you the most", "q5answer", ['bondage'])
		addButton("Masochism", "Masochism interests you the most", "q5answer", ['masochism'])
		addButton("Breeding", "Breeding excites you the most", "q5answer", ['breeding'])
		
	if(state == "q5answer"):
		saynn("Issix looks at you for a while, as if lost in thought, finally he livens up and notes your answer.")
		saynn("[say=issix]Anyways, lets move on. Next question.[/say]")
		addButton("Another one", "Move onto question number 6", "q6")
		
	if(state == "q6"):
		processTime(2*60)
		saynn("Another question shows up on your screen, along with it an ominous screaming face momentarily appears on the screen, you flinch, which doesn't go unnoticed.")
		saynn("[say=issix]Everything alright? You looked as if you saw a ghost.[/say]")
		saynn("He looks at the screen of the tablet, not seeing anything wrong.")
		saynn("[say=issix]Something wrong with the question?[/say]")
		saynn("[say=pc]Uhhh, no, I thought I saw something on the screen but it's not there anymore.[/say]")
		saynn("[say=issix]... Odd. But well, it's certainly not there anymore, just a boring question, go ahead, respond to it.[/say]")
		saynn("Question reads „Do you own any slaves of your own?”")
		addButton("Yes", "You do have slaves", "q6answer", [true])
		addButton("No", "I do not have slaves", "q6answer", [false])
		
	if(state == "q7"):
		if(GM.main.getPCSlaveAmount() > 0 or getModuleFlag("RahiModule", "rahiMile7Enslaved") or getModuleFlag("JackiModule", "Jacki_ch2GotEnslaved")) and answer == false:
			saynn("Issix looks at you with surprise.")
			saynn("[say=issix]Noted. Lets get to next question.[/say]")
		else:
			saynn("[say=issix]Noted. Ooonntooo the neext onnne![/say]")
			saynn("Issix says that with excitement as if he was singing.")
		saynn("Screen blinks in Violet color and another questions shows up.\n\n„Do you believe more in teaching by reward or by punishment?”")
		saynn("Issix looks oddly excited about this question, judging by movement of his tail.")
		saynn("[say=issix]There are two schools of thought here, I'm simply wondering what do you think about this dillema.[/say]")
		addButton("Reward", "You believe in superiority of rewards in education", "q7answer", [true])
		addButton("Punishment", "You believe in punishment as being better motivational drive than rewards", "q7answer", [false])
		
	if(state == "q8"):
		processTime(2*60)
		if answer == true:
			saynn("Issix claps his paws, so suddently that it spooked you a little bit. He seems happy.")
			saynn("[say=issix]Apologies, I just... Got carried away.[/say]")
		else:
			saynn("Issix smiles.")
			saynn("[say=issix]Respectable response. You aren't the only one thinking this way, considering you found yourself in place like this.[/say]")
		saynn("[say=issix]No time to waste, we are drawing near the end now.[/say]")
		saynn("Screen of the tablet flashes, in Evergreen color this time, and a new question appears.")
		saynn("„What species do you find most attractive?”")
		var species = GlobalRegistry.getAllPlayableSpecies()
		if species.size() > 15:  # ladies and gentleman, we are fucked
			pass  # TODO handle this
		for species_id in species:
			addButton(species[species_id].getVisibleName()+"s", "I find "+species[species_id].getVisibleName()+"s to be most attractive", "q8answer", [str(species_id)])

	if(state == "q9"):
		if(answer in ['demon', 'dragon']):
			saynn("Issix laugs")
			saynn("[say=issix]I hope my body had not contributed to this answer[/say]")
		saynn("Issix notes the answer, he puts his own tablet on the floor as he picks up a glass of water to drink")
		saynn("[say=issix]How do you feel about your answers so far? I hope you are honest with those, you know.[/say]")
		saynn("He puts the glass back on its earlier position, taps his tablet and you get the next question.")
		if(getModuleFlag("IssixModule", "QuestionnaireQ4") == true):
			saynn("„Your Master asks you to have his child. What do you do?”")
		else:
			saynn("„Your Master asks you to have his child (after first making you able to conceive one). What do you do?”")
		addButton("Refuse", "You aren't willing to bear your Master's child", "q9answer", [false])
		addButton("Accept", "You would agree to bear your Master's child", "q9answer", [true])
		
	if(state == "q10"):
		processTime(2*60)
		saynn("There is no reaction coming from Issix on your answer. He gestures you to go on. A new question appears.")
		saynn("„How do parasites make you feel?”")
		addButton("Disgusted", "Parasites are disgusting", "q10answer", [1])
		addButton("Scared", "They fill you with fear", "q10answer", [2])
		addButton("Neutral", "They are creatures, the only thing that makes them parasites is the way they obtain their food", "q10answer", [3])
		addButton("Horny", "You like parasites... In very specific way", "q10answer", [4])
		
	if(state == "q10answer"):
		if(answer < 3):
			saynn("It feels as if he is trying to compose his body language to hide something. That or your answer didn't have much of effect on him. He notes your answer.")
			saynn("[say=issix]That's indeed how pretty much everyone reacts, not surprising.[/say]")
		if(answer == 3):
			saynn("He gives you a curious look, perhaps a grin.")
			saynn("[say=issix]That's most curious, a very... Scientific response. Cold, non-emotional observation. Most creatures writhe on mention of a parasite, not you.[/say]")
		else:
			saynn("For some reason this answer lifted his spirit.")
			saynn("[say=issix]You are one kinky creature, you know that? I really like your boldness in this response, you are either very naive or sex worms have eaten your brain.[/say]")
			saynn("He laugs.")
		saynn("[say=issix]We are at the end, last question.[/say]")
		saynn("„What do you think about AlphaCorp?” the screen displays.")
		addButton("Good", "AlphaCorp is doing good work, better than anyone else in this part of the galaxy", "q11answer", [true])
		addButton("Neutral", "You either have no opinion or feel entirely neutral about AlphaCorp", "q11answer")
		addButton("Bad", "Your typical corrupt corporation, you dislike/hate it", "q11answer", [false])

	if(state == "q11answer"):
		saynn("He writes notes your last answer.")
		saynn("[say=issix]And we are done! Wasn't so bad, was it? Just 11 questions.\nI have to admit something to you, I lied. This test had wrong answers. Making a pet out of someone requires a lot, and I want my pets to be loyal as well as trustworthy. Of course there are more things than just those, but I needed you to feel safe while writing this test to make sure you give it your best shot as well as don't have reasons to lie to me.[/say]")
		saynn("[say=issix]I'll now discuss those questions and your answers with you. Are you ready? Good.[/say]")
		saynn("[say=issix]As your first question I've asked you if you believe creatures posses a soul. You answered "+("yes" if getModuleFlag("IssixModule", "QuestionnaireQ1") else "no")+".[/say]")
		saynn("[say=issix]The nature of souls is a very interesting one, how do you even define a soul? It may mean different things for each one of us. For me, a soul is your essence - a thing that makes you - you, so yes, I do think that souls do exist. Once you lose your soul you... Stop being yourself, or at least true to yourself, you become mallable by something or someone else. The choices your body makes aren't really made by someone in specific, they are impulses of the body or extensions of someone else's will and nothing more...[/say]") # ;)
		saynn("He thinks for a moment")
		saynn("[say=issix]That said, maybe at the end of the day, when soul leaves the body, it can still be itself... Somewhere else, better...[/say]")
		saynn("He coughs")
		saynn("[say=issix]Anyways, this question was entirely for your own consideration, there is truthfully no right or wrong answer in here. Let's discuss question number two.[/say]")
		addButton("Summary", "", "summary2")
		
	if(state == "summary2"):
		processTime(3*60)
		var protectedTavi = getModuleFlag("TaviModule", "Ch3ProtectedTavi")
		var onlyTaviPunished = getModuleFlag("TaviModule", "Ch5OnlyTaviPunished")
		saynn("[say=issix]Your next question was about loyality. It's a very important quality that I'm looking for in a pet. Perhaps not the reckless and completely maniacal type of loyality, but a loyality nonetheless.[/say]")
		if getModuleFlag("IssixModule", "QuestionnaireQ2"):
			saynn("[say=issix]You have answered that you consider yourself loyal.[/say]")
			if(protectedTavi == null and onlyTaviPunished == true):  # Total lack of loyality
				strikes += 1
				saynn("[say=issix]You see, sadly, I don't believe you are entirely honest with me, or yourself. Whenever something happens in this prison - rumors spread, people talk. Guards are surprisingly chatty with inmates.\nAnd what rumors - very trustworthy ones, mind you, say - is that you've abandoned your partner in crime twice. I'm sorry, but this is troubling answer. Not only you weren't loyal, but also you are not being truthful with yourself AND me. I don't tolerate this in my pets.[/say]")
				saynn("Issix likely has in mind Tavi, you want to correct Issix about this, and how you made the right decisions but the moment you breathe air to start talking his look clearly says he doesn't want you to defend yourself. You comply.")
			elif(protectedTavi == true and onlyTaviPunished == false):  # Total loyality
				saynn("[say=issix]This is further confirmed by what rumors I've heard about you. You stuck with your partner in crime to the very end - commendable behavior. My pets don't have to make many difficult decisions, but it's important they are honest both with me and also themselves when making them. And if they are disloyal, I can hardly call myself their master. I think you were honest and dependable with your answer. Good job, pet.[/say]")
				saynn("Your body feels incredibly good after those words by Issix, you feel rewarded for your honesty and loyality.")
			else:
				saynn("[say=issix]I can't say for sure whether you were being honest or not with me. But loyality is incredibly important quality of a pet, and the fact you consider yourself loyal makes me happy.[/say]")
		else:
			saynn("[say=issix]You have answered that you don't consider yourself loyal.[/say]")
			if(protectedTavi == null and onlyTaviPunished == true):  # Total lack of loyality
				saynn("[say=issix]Ehh, you are giving me a really hard time in here, you know? I've heard of your adventures with certain other inmate from the prison - people talk in here, a lot. And reports confim that you weren't exactly the most loyal when your partner in crime needed you the most. But you also said that you don't consider yourself loyal, making your answer a honest one - something I can respect. You seem to be true to yourself, maybe a little lost. I think we can overlook this and just work on your loyality as we go.[/say]")
				saynn("Issix likely has in mind Tavi, it's surprising he still gives you a chance even though he is aware how you basically let Tavi take all the blame for the failure - especially considering how much she went through after you got captured.")
			elif(protectedTavi == true and onlyTaviPunished == false):  # Total loyality
				saynn("[say=issix]Hmm, your answer baffles me, pet. Rumors I've heard described your actions as heroic and loyal to your partner in crime, when they needed you the most, not minding the consequences. And yet, you say you are not loyal? I can't tell, whether you are not honest with yourself, too humble or something else, but either way, I hope we can work on it as we go on.[/say]")
			else:
				saynn("[say=issix]I can't say for sure whether you were being honest or not with me. But loyality is incredibly important quality of a pet, it's a pity you don't consider yourself loyal. But regardless, this is something we can work on, don't worry.[/say]")
		saynn("[say=issix]Second question done, just 9 more to go.[/say]")
		addButton("Continue", "", "summary3")
		
	if(state == "summary3"):
		processTime(3*60)
		saynn("[say=issix]What do we have here... Body parts. Ah yes. It bears no any significance, but thought the answer would be fun.[/say]")
		answer = getModuleFlag("IssixModule", "QuestionnaireQ3")
		saynn("[say=issix]You said that the body part you are most interested in is... "+answer+"[/say]")
		saynn("[say=issix]If you are wondering what I'm going to do with this information, I will say - time will tell.[/say]")  # no, really, I have no fucking idea lol
		answer = getModuleFlag("IssixModule", "QuestionnaireQ4")
		var wants_to = getModuleFlag("IssixModule", "QuestionnaireQ9")
		var was_pregnant = GM.CS.getChildrenAmountOfOnlyMother("pc") > 0
		saynn("[say=issix]Next, you answered that you "+("can become pregnant with a child" if answer else "cannot become pregnant with a child")+".[/say]")
		if answer == false and was_pregnant == true:
			saynn("[say=issix]Hmm, interesting. I'm aware of you having a child in the past in this very prison, did something happen in the meantime?[/say]")
			if(GM.pc.hasAnyWomb() and GM.pc.hasPerk(Perk.StartInfertile) == false):
				addButton("Infertile", "Say you are no longer able to have offspring", "summary3lie")
				addButton("Fertile", "Say you are fertile and can have master's baby", "summary3truth")
			else:
				addButton("Infertile", "Say you are no longer able to have offspring", "summary3truth")
				addButton("Fertile", "Say you are fertile and can have master's baby", "summary3lie")
			return
		else:
			if answer == false and was_pregnant == false:
				if wants_to:
					saynn("[say=issix]But even though you cannot have a child you'd still be willing to let Master impregnate you. That's very good of you, perhaps this is something you've always wanted to do - be a good parent for child you brought to the world. But let me tell you outright - I'm not forcing my pets to bear my children. It's everyone's decision and it would be up to you to make. Azazel is proud „mother” of many of my children, he loves having my litter.[/say]")
				else:
					saynn("[say=issix]You've also mentioned you are not willing to have your Master's children - that's entirely fair, I'm not one to force anyone in this specific matter. I already have Azazel as my litter bearer and this is entirely enough for me.[/say]")
			elif answer == true and wants_to:
				saynn("[say=issix]I'm always happy to have another breeding bitch as my pet. You and Azazel will look very cute with your pregnant bellies, can't wait for that.[/say]")
			else:
				saynn("[say=issix]I have to say, I'm a little saddened to hear that while you can bear children, you are not willing to bear your Master's. I could use another breeding bitch, but it's your choice and I'm going to honor that.[/say]")
		addButton("Continue", "", "summary4")
		
	if state == "summary3lie":
		strikes += 1
		if GM.pc.hasAnyWomb() and GM.pc.hasPerk(Perk.StartInfertile) == false:
			if getModuleFlag("IssixModule", "QuestionnaireQ9"):
				# Lied twice about not being able to have offspring but says they want to have Master's child after making it possible, Issix knows it was a lie
				saynn("[say=issix]I see. And you are saying you'd be okey with having your Master's child in you? Curious, but possible.[/say]")
			else:
				# Lied twice about not being able to have offspring and says they don't want to have Master's child after making it possible, Issix knows its a lie and 
				saynn("[say=issix]I'll say, I'm disappointed. Not because you don't want Master's child, but because you are deceiving me. You were pregnant in the past, as well as I can feel you are able to have a child of your own. I'm really at loss here, as I don't understand why are you lying to me, I hope you don't think I'd force you to anything if you agreed to be my pet, that's not my intention.[/say]")
		else:
			# Said they cannot become pregnant with a child, when asked about past pregnancy however they lied that they are fertile
			if getModuleFlag("IssixModule", "QuestionnaireQ9"):
				# They want a child
				saynn("[say=issix]That's very nice that you'd like to have Master's child, though... I don't feel you are fertile, it's odd to me for you to say you are. Please do not lie to me, whether you want a child with your Master or not does not matter for becoming my pet. What matters is honesty.[/say]")
			else:
				# They don't want a child
				saynn("[say=issix]You are... Very conflicted. You said you cannot become pregnant, when I asked you about your past pregnancy you changed your tune and said you are fertile... But you don't want Master's children? I'm... Unsure how to feel about it.[/say]")
		addButton("Continue", "", "summary4")
		
	if state == "summary3truth":
		if GM.pc.hasAnyWomb() and GM.pc.hasPerk(Perk.StartInfertile) == false:
			setModuleFlag("IssixModule", "QuestionnaireQ4", true)
			saynn("[say=issix]Usure why you said earlier that you are not fertile, but I'll let that slide. Thank you for being honest this time. [/say]")
		else:
			saynn("[say=issix]Sorry to hear that you can't bear children anymore. Thank you for being honest and explaining that to me.[/say]")
		addButton("Continue", "", "summary4")
		
	if state == "summary4":
		processTime(4*60)
		answer = getModuleFlag("IssixModule", "QuestionnaireQ5")
		saynn("[say=issix]The next one is pretty fun, you've said that "+answer+" is your favorite sexual activity. With me as your master you might - or might not have a choice in matter of sex we will be doing, it will all depend on your future choices, you will see.[/say]")
		if (answer == "anal"):
			saynn("Issix moves his paw to your rear and squishes the ass cheek")
			saynn("[say=issix]A butt-slut, aren'tcha? That's entirely fine with me.[/say]")
		elif(answer == "watersports"):
			saynn("[say=issix]Anyways. You are in for a treat. All my pets have my mark at all times. Just one of the ways to show everyone else who they belong to, so there is no confusion about that. If you'll want it can be more than just a mark, though perhaps you should shower every now and then, piss sluts tend to have unbearable smell after a day. Who knows, maybe you are into that.[/say]")
			saynn("He chuckles.")
		elif(answer == "oral"):
			saynn("[say=issix]That's pretty mild. let me take a look.[/say]")
			saynn("He moves his chair closer to yours.")
			if(GM.pc.isMuzzled()):
				saynn("Issix pulls aside your muzzle.")
			if GM.pc.hasBuff(Buff.GagBuff):
				saynn("Issix pulls aside your gag.")
			if GM.pc.hasBuff(Buff.RingGagBuff):
				saynn("He mentions your ring gag chuckling.")
				saynn("[say=issix]I see you've came prepared, as oral slut should.[/say]")
				saynn("He puts two of his fingers into your mouth and moves them around.")
			else:
				saynn("He asks you to open your mouth, you obey. His fingers explore the inside of your mouth.")
			var fluidsMouth = GM.pc.getBodypart(BodypartSlot.Head).getFluids()
			if(!fluidsMouth.isEmpty()):
				saynn("[say=issix]That's a one used {pc.throatStretch} mouth you got there. Didn't care about not cleaning it before coming? Or maybe you like cum breath? Doesn't bother me, just wondering.[/say]")
			else:
				saynn("[say=issix]That's a one {pc.throatStretch} mouth you got there. Bet you trained it well.")
			saynn("He continues exploring your mouth with his fingers for uncomfortable amount of time, your saliva covers almost the entirety of his fist. Eventually he stops, seemingly content with his inspection.")
			saynn("[say=issix]Good pet.[/say]")
		elif(answer == "bondage"):
			saynn("[say=issix]Satisfying this one should be easy in this place. Do you know just how many inmates come to me with those? Anyways, we can yet make a total bondage puppy out of you.[/say]")
		elif(answer == "masochism"):
			saynn("[say=issix]Pain is pleasure for you? Or do you just like being treated rough? Didn't expect that one, but it's something I can do. If you want to be a painslut, so be it, but don't complain when you are left with a little memento of your escapades for a day or two.[/say]")
		elif(answer == "breeding"):
			if getModuleFlag("IssixModule", "QuestionnaireQ4"):
				saynn("[say=issix]Is that so? Can't wait to see you fight with Azazel for who should be my breeding bitch at any given day.[/say]")
				saynn("He laughs")
				saynn("Azazel hearing his name looks at his master and then gives you serious look, before going back to sleep.")
			else:
				saynn("[say=issix]Breeding? How so? You did say you can't bear children. How can you enjoy breeding then? Is it methaphorical or you like breeding others? I'll say it outright, my pets can't breed others, they are meant to be bred, that's only acceptable outcome for me.[/say]")
		
		saynn("Issix seems to be a little aroused by your answer, considering his penis peeking out.")
		answer = getModuleFlag("IssixModule", "QuestionnaireQ6")
		saynn("[say=issix]Annyyyways. Let's move on. I've asked you next if you have any slaves, it was yet another question to you to test your honesty. It's pretty trivial for me to learn of such facts, so I'm not sure why would one lie in that easily verifiable question, but nonetheless, you've said that "+("you own a slave" if answer else "you don't own a slave") +".[/say]")
		var slaves = GM.main.getPCSlaveAmount()
		var dialogue = ""
		if answer == false:
			strikes += 1
			if slaves > 0:
				dialogue = "And yet, I know that in your very own cell you have "+str(slaves)+" slaves."
			elif getModuleFlag("RahiModule", "rahiMile7Enslaved"):
				dialogue = "And yet I know of certain kitty of name Rahi who resides in general block seems to have a certain owner of name "+GM.pc.getName()+", does it sound like a coincidence? I think not."
			elif getModuleFlag("JackiModule", "Jacki_ch2GotEnslaved"):
				dialogue = "And yet I know of certain puppy of name Jacki who resides in general block seems to have a certain owner of name "+GM.pc.getName()+", apparently they've had quite a transformation into a slut there. Are they stray puppy now? Do you not want the responsibility? A bad master, that would be."
			else:
				strikes -= 1
				saynn("[say=issix]And it appears to be true. Not a dominant type, are you? Saves me time required to break you into a submissive slut.[/say]")
				saynn("He laugs, it appears he wasn't serious.")
			if dialogue:
				saynn("[say=issix]" + dialogue + "To lie about something like this is ridiculous, why would you even do this? Do you take me for a fool? Do you think that creatures don't talk in here? I hoped you'd be better than this.[/say]")
		else:
			if slaves or getModuleFlag("RahiModule", "rahiMile7Enslaved") or getModuleFlag("JackiModule", "Jacki_ch2GotEnslaved"):
				saynn("[say=issix]That seems to check out. I'm aware you have at least one slave. Just to let you know - it does not bother me. Even though, I have certain expectations of my pets, and no, any kind of dominative behavior will not be tolerated. You'll be my slave, keep that in mind. What you do with your slaves is of no concern to me.[/say]")
			else:
				saynn("[say=issix]You do have slaves huh? Where? In this prison? Are you trying to impress me? Don't be a fool. I'm not aware of you owning any slave, I'd know that, I do my research morsel. Do not try to deceive me.[/say]")
		saynn("Issix relaxes on his chair, stretches and breathes loudly.")
		if strikes>1:
			saynn("[say=issix]Maybe you have found your place, not with me, mind you, but in here, in this institution. Perhaps you are planning on staying here for a long time huh?[/say]")
			saynn("He smiles")
			saynn("[say=issix]Just being a bit of a tease[/say]")
		else:
			saynn("[say=issix]This is going pretty well so far I'd say, lets keep going, I want to wrap it up - hopefully before the night falls.[/say]")
		addButton("Continue", "", "summary5")
	
	if state == "summary5":
		processTime(3*60)
		answer = getModuleFlag("IssixModule", "QuestionnaireQ7")
		saynn("[say=issix]You might have noticed that the next question „Do you believe more in teaching by reward or by punishment?” excited me when I wanted to see you answer. One of the rare moments where hiding my emotions tends to be difficult, I really like philosophy and this classic carrot and a stick is pretty relevant to my line of interests.\nI've worked with many different people, I've experienced falls, victories. But more often than not, when it comes to reacting to certain unwanted behaviors - people tend to choose the stick option. It feels easier, it lets you convert your anger or frustration into a „lesson”. Simple, and effective, is it not?[/say]")
		saynn("[say=issix]Fuck that. Every single person I've met who enjoyed punishing their inferior always was a psychopath. I've seen it time and time again in AlphaCorp. Some creatures were on the ladder just as a punching bag for those assholes. But of course, they were only „setting an example”, „educating”, excuses for letting their anger use violence. You could lick their asses for a year, you could increase efficiency by 300%, it was never enough for those assholes to say even a simple „thank you, good job”. They only cared about punishment, that was their fucking reason to exist.[/say]")
		saynn("Issix notices he got a little worked up. He takes a breath and continues.")
		saynn("[say=issix]All I'm saying is that I've had bad experience with people who answer to this question by saying they prefer punishment.")
		if answer:
			saynn("[say=issix]Ultimately, even if you said that you prefer punishment that still wouldn't make you necessarily like them, but you chose reward, and that, in my eyes is good to hear. My relationsip with pets does have elements of punishment, but reward or lack of it is much better tool to control pets, it's not just much more effective but it's also better in every other angle. I'm using punishment only in specific cases. Hope it doesn't come to that.[/say]")
		else:
			saynn("[say=issix]And no, just because you've said you prefer punishment as education method doesn't put them on the same spot as those fuckers. There is more to being who they were than just that, That said, while my relationsip with pets does have elements of punishment, the reward or lack of it is much better tool to control pets, it's not just much more effective but it's also better in every other angle. I'm using punishment only in specific cases. Hope it doesn't come to that.[/say]")
		answer = getModuleFlag("IssixModule", "QuestionnaireQ8")
		saynn("[say=issix]Next I asked you about which species you find most attractive, this was entirely for fun and my own research. You've mentioned you do find "+answer+"s most attractive, that's great.")
		addButton("Continue", "", "summary6")
		
	if state == "summary6":
		processTime(3*60)
		saynn("[say=issix]Lastly, a question about AlphaCorp, this one doesn't really have anything to do with you, or me or you becoming my pet, but I simply were interested in your opinion. I've spent way too long inside AlphaCorp to get entirely sick of this corpo-circlejerk bullshit. Learning what others think of it, is always good, especially if their opinion matches my own or they have stories of their own to tell.[/say]")
		answer = getModuleFlag("IssixModule", "QuestionnaireQ11")
		if answer == true:
			saynn("[say=issix]Seems like you approve of AlphaCorp, either you are absolutely blind to what they've been doing and are doing, you are a fool or there is some other reason for you to take their side. Like I mentioned - has nothing to do with us. I'd love to know what made you believe this way but that's a conversation for some other day, maybe.[/say]")
		elif answer == false:
			saynn("[say=issix]You've told me that you dislike AlphaCorp as well. Don't know your motives, whether it's because you are where you are, they killed your family or something else - I'm with you on that. AlphaCorp is just another entirely corrupt bullshit machine that doesn't know any other way to resolve complex issues other than resort to violence. Their executives are bunch of dickheads who's brains got eaten by money worms a long time ago. But you probably know all of that. Hope one day comes where AlphaCorp is no more.[/say]")
		else:
			saynn("[say=issix]Seems like you don't have an opinion on that, that's fair. I'd ask why, when politics have such large impact on us all, but I've lived enough to just let it be. You know how I feel about this intergalatic corpo shitstain, that's probably all you need to know. Whatever, I'm sick of talking politics for now.[/say]")
		saynn("[say=issix]That would be all of the questions covered. Let's see... That makes it that... Plus this...[/say]")
		addButton("Results", "Wait for Issix to count the results", "finalresults")
		addButton("All questions?", "You remember there was one more question he asked of you, why didn't he sum it up?", "parasiteq")
		
	if state == "parasiteq":
		saynn("[say=pc]Are those really all of the questions? I could swear there was one more.[/say]")
		saynn("He tenses up a little, looks at you, at his tablet, at you and his tablet again.")
		answer = getModuleFlag("IssixModule", "QuestionnaireQ10")
		match answer:
			1, 2:
				saynn("[say=issix]Hmm, I guess you are right, yeah, I did ask you one more question. That was for my own purposes, you don't have to worry about it. Let's go to the results.[/say]")
			3:
				saynn("[say=issix]Hah, I were just really wondering. Your outlook on things such as parasites is honestly fascinating. It was a really great answer that I didn't expect. Anyways, results![/say]")
			4:
				saynn("[say=issix]Yeah, you are indeed right. I didn't mention the parasite question. Truth be told, your answer surprised me and... Made me a bit relieved. Forgive me, but I won't be able to tell you at the moment what that was about, but I assure you, there was a really good reason for this question. Now, let's count the results, shall we?[/say]")
		addButton("Results", "Wait for Issix to count the results", "finalresults")
		
	if state == "finalresults":
		saynn("He looks at responses, counts them, tries to figure something out, finally reaches a conclusion and in official tone announces...")
		GM.main.setModuleFlag("IssixModule", "Quest_Wait_Another_Day", true)
		if strikes == 0:
			saynn("[say=issix]I have no objections to you becoming my pet. As far as I'm aware you were honest with all of the answers. That was the only thing that truthfully mattered during the test.[/say]")
			saynn("You are happy to hear the result")
			saynn("[say=issix]There is only one more trial before I make my final decision. You'll face it tomorrow. And from tomorrow, I expect you to kneel before me, understood?[/say]")
			setModuleFlag("IssixModule", "Quest_Status", 6)
		elif strikes == 1:
			saynn("[say=issix]You pass. While I feel like you weren't entirely honest with me during the questionnaire, I'll chuck it as a mistake.[/say]")
			saynn("You are happy to hear the result")
			saynn("[say=issix]Mind you, there is one more thing that I expect you to do, the last trial. That's for tomorrow, you got it? And from tomorrow onwards, I expect you to kneel before me when you address me.[/say]")
			setModuleFlag("IssixModule", "Quest_Status", 6)
		else:
			saynn("Issix looks at you, his piercing black eyes judging you, or is he trying to intimidate you?")
			saynn("[say=issix]I'm afraid you can't become my pet. You weren't honest with me on multiple occasions. Trust is paramount in this relationship, and you have none of that, sorry, I don't know of reasons why you decided to deceive me, those are your own to know. You can still come, we can talk, you can talk with my pets, but you yourself will not become my pet, this is my final decision. A shame, really, you'd make a fine pet, except the lying part, of course.[/say]")
			setModuleFlag("IssixModule", "Quest_Status", 5)
			setModuleFlag("IssixModule", "Quest_Rejected_By_Issix", 2)
		addButton("Back", "", "endthescene")
			
			
func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
		
	if(_args):
		if(_action.begins_with("q10")):  # number parasite
			setModuleFlag("IssixModule", "QuestionnaireQ10", _args[0])
		elif(_action.begins_with("q11")):  # bool alphacorp
			setModuleFlag("IssixModule", "QuestionnaireQ11", _args[0])
		elif(_action.begins_with("q1")): # bool Creatures possess a soul
			setModuleFlag("IssixModule", "QuestionnaireQ1", _args[0])
		elif(_action.begins_with("q2")): # bool Consider yourself loyal
			setModuleFlag("IssixModule", "QuestionnaireQ2", _args[0])
		elif(_action.begins_with("q3")): # text Favorite bodypart
			setModuleFlag("IssixModule", "QuestionnaireQ3", _args[0])
		elif(_action.begins_with("q4")): # bool Can you be pregnant
			setModuleFlag("IssixModule", "QuestionnaireQ4", _args[0])
			_action = "q5"
		elif(_action.begins_with("q5")):  # text fav sexual activity
			setModuleFlag("IssixModule", "QuestionnaireQ5", _args[0])
		elif(_action.begins_with("q6")):  # bool have slaves
			setModuleFlag("IssixModule", "QuestionnaireQ6", _args[0])
			_action = "q7"
		elif(_action.begins_with("q7")):  # bool carrot and a stick
			setModuleFlag("IssixModule", "QuestionnaireQ7", _args[0])
			_action = "q8"
		elif(_action.begins_with("q8")):  # text attractive species
			setModuleFlag("IssixModule", "QuestionnaireQ8", _args[0])
			_action = "q9"
		elif(_action.begins_with("q9")):  # text bearing a baby
			setModuleFlag("IssixModule", "QuestionnaireQ9", _args[0])
			_action = "q10"
		
		answer = _args[0] # I'm lazy
		
	setState(_action)


func saveData():
	var data = .saveData()
	
	data["answer"] = answer
	data["strikes"] = strikes
	
	return data
	
func loadData(data):
	.loadData(data)
	
	answer = SAVE.loadVar(data, "answer", null)
	strikes = SAVE.loadVar(data, "strikes", 0)


func getDevCommentary():
	return "Writing questionnaire took me a while. I knew I wanted to write questionnaire and I wanted it to be meaningful in a way. At first the idea was that a player will choose some options and then Issix will use them to apply punishments and rewards according to those responses. However eventually I felt like this may not be the best usage of questionnaire. One thing that to me is missing in the game is the lack of impact of choices made in other character arcs on the rest of the prison, I really wanted to do something about it, so I decided to possibly involve choices made in Tavi's questline as well as Rahi's to judge player for slavery fitness. There is also the fact that I enjoy ethics, so I slapped some ethics questions as well, this allows me to show that Issix is not a two-dimensional character and works according to some rules he subscribes to as well. The end result is a weird mix of stuff. Don't know how I ultimately feel about all of this, but I think the idea of questionnaire is a solid one in here. Also, the abrupt break was added as I were writing the questionnaire, completely on impulse. I've felt like we needed some dramatic break or this would feel too boring, and it would allow me to add some relevant foreshadowing and story bits for later. Didn't want the quest to be this quick. It should be spread across multiple days, sorry for artificial filler ><"

func hasDevCommentary():
	return true
