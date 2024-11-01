extends SceneBase

var answer = null

func _init():
	sceneID = "PierreQuestionnaire"

func _run():
	if(state == ""):
		playAnimation(StageScene.Duo, "sit", {npc="pierre", npcAction="sit"})
		if(GM.main.getModuleFlag("PierreModule", "Quest_Status") == 4):
			saynn("[say=pierre]Alrighty, pet in training. It's the first time I do this, but I'm going to give you a bunch of questions and I expect you to answer them truthfully. Don't dwell too long on them, trust your instinct.\nBlah blah blah, there are no wrong answers something something. You get the drill right? You must have filled a similar one in the past. Tablet will only present you with questions, you answer to me.[/say]")
			saynn("[say=pierre]Also, this will take a bit, here, have a seat.[/say]")
			saynn("He pulls a folding chair from behind his and unfolds it in front of himself, you sit and he passes a tablet to you. On it a giant button titled ”Start”.")
			addButton("Start", "Start the questionnaire", "q1")
			addButton("Later", "Maybe do this later, it looks like it is gonna take a while...", "endthescene")
		else:
			saynn("[say=pc]Could we continue the quiz?[/say]")
			saynn("Pierre looks at you confused for a second.")
			saynn("[say=pierre]Ohhhh, the quiz, right. Sorry, I've had... A rough night, sit down, the chair is still there.[/say]")
			addButton("Lamia", "Ask about Lamia", "lamiaquestion")
			addButton("Start", "Start the questionnaire", "q4")
			addButton("Later", "Maybe do this later, it looks like it is gonna take a while...", "endthescene")
		
	if(state == "q1"):
		saynn("You hit giant Start button. Screen flashes for split of a second in Silver color. You feel intense gaze of Pierre studying your face as you read the first question.")
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
		saynn("He takes the tablet from your paws and holds it. He then shakes it in all directions as if it was a snow globe toy, hitting it a few times on the floor for a good measure. After a solid minute of this treatment the tablet flashes with Lilac color for a second and displays the next question.")
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

	if(state == "lamiaquestion"):
		saynn("[say=pc]Uhh, are you okey? Is Lamia okey? They didn't look great yesterday.[/say]")
		saynn("Pierre sighs")
		saynn("[say=pierre]Thank you for asking, pet. I'm fine, Lamia is... Well, let's just say it isn't the first time it happens, it's really due to my own negligence. But they are fine for now.[/say]")
		saynn("[say=pc]I see[/say]")
		saynn("Doesn't seem like Pierre is willing to elaborate on this one.")
		addButton("Start", "Start the questionnaire", "q4")
		addButton("Later", "Maybe do this later, it looks like it is gonna take a while...", "endthescene")
		
	if(state == "q4"):
		saynn("Pierre taps the sceen of the tablet a few times and passes to you. Screen already shows the 4th question. Pierre looks at your face again, though not with same intensity as the last time, yesterday's event made him feel really out of it. His eyes are reddened and there are visible bags under them, lack of sleep? Maybe?")
		saynn("[say=pierre]Let's start[/say]")
		saynn("The question says: „Can you bear children?”")
		if(GM.pc.isVisiblyPregnant()):
			saynn("[say=pierre]Uhhh... You know what, let's skip this question, I think we know the answer already.[/say]")
			addButton("Skip", "There is no way to hide your pregnancy, Pierre already knows the answer", "q4answer", [true])
		else:
			saynn("[say=pierre]I need to know everything about my pets, and you know, this really helps.[/say]")
			if(GM.pc.hasAnyWomb() and GM.pc.hasPerk(Perk.StartInfertile) == false):
				addButton("Yes", "Yes, you can bear children", "q4answer", [true])
				addButton("No (lie)", "No, you can't bear children", "q4answer", [false])
			else:
				addButton("Yes (lie)", "Yes, you can bear children", "q4answer", [true])
				addButton("No", "No, you can't bear children", "q4answer", [false])
				
	if(state == "q5"):
		saynn("Screen flashes for a second, Aqua color fills the screen. Next question says: „What sexual activity are you interested in the most?”")
		saynn("[say=pierre]Just to clerify - all of those assume you take the submissive role.[/say]")
		addButton("Anal", "Anal sex interests you the most", "q5answer", ['anal'])
		if(OPTIONS.isContentEnabled(ContentType.Watersports)):
			addButton("Watersports", "Say you are interested in piss", "q5answer", ['watersports'])
		addButton("Oral", "Oral sex interests you the most", "q5answer", ['oral'])
		addButton("Bondage", "Bondage interests you the most", "q5answer", ['bondage'])
		addButton("Masochism", "Masochism interests you the most", "q5answer", ['masochism'])
		addButton("Breeding", "Breeding excites you the most", "q5answer", ['breeding'])
		
	if(state == "q5answer"):
		
		# this entire section should be at the summary part.
		if (answer == "anal"):
			saynn("Pierre moves his paw to your rear and squishes the ass cheek")
			saynn("[say=pierre]A butt-slut, aren'tcha? That's entirely fine with me.[/say]")
		elif(answer == "watersports"):
			saynn("[say=pierre]Hoo hoo, spicy! You are in for a treat. All my pets have my mark at all times. Just one of the ways to show everyone else who they belong to, so there is no confusion about that.[/say]")
		elif(answer == "oral"):
			saynn("[say=pierre]That's pretty mild. let me take a look.[/say]")
			saynn("He moves his chair closer to yours.")
			if(GM.pc.isMuzzled()):
				saynn("Pierre pulls aside your muzzle.")
			if GM.pc.hasBuff(Buff.GagBuff):
				saynn("Pierre pulls aside your gag.")
			if GM.pc.hasBuff(Buff.RingGagBuff):
				saynn("He mentions your ring gag chuckling.")
				saynn("[say=pierre]I see you've came prepared, as oral slut should.[/say]")
				saynn("He puts two of his fingers into your mouth and moves them around.")
			else:
				saynn("He asks you to open your mouth, you obey. His fingers explore the inside of your mouth.")
			var fluidsMouth = GM.pc.getBodypart(BodypartSlot.Head).getFluids()
			if(!fluidsMouth.isEmpty()):
				saynn("[say=pierre]That's a one used {pc.throatStretch} mouth you got there. Didn't care about not cleaning it before coming? Or maybe you like cum breath? Doesn't bother me, just wondering.[/say]")
			else:
				saynn("[say=pierre]That's a one {pc.throatStretch} mouth you got there. Bet you trained it well.")
			saynn("He continues exploring your mouth with his fingers for uncomfortable amount of time, your saliva covers almost the entirety of his fist. Eventually he stops, seemingly content with his inspection.")
			saynn("[say=pierre]Good pet.[/say]")
		elif(answer == "bondage"):
			saynn("[say=pierre]Satisfying this one should be easy in this place.[/say]")
		elif(answer == "masochism"):
			saynn("[say=pierre]Pain is pleasure for you? Or do you just like being treated rough? Didn't expect that one, but it's something I can do.[/say]")
		elif(answer == "breeding"):
			if getModuleFlag("PierreModule", "QuestionnaireQ4"):
				saynn("[say=pierre]Is that so? Can't wait to see you fight with Azazel for who should be my breeding bitch at any given day.[/say]")
				saynn("He laughs")
				saynn("Azazel hearing his name looks at his master and then gives you serious look, before going back to sleep.")
			else:
				saynn("[say=pierre]Breeding? How so? You did say you can't bear children. How can you enjoy breeding then?[/say]")
		saynn("[say=pierre]Anyways, lets move on. Next question.[/say]")
		addButton("Another one", "Move onto question number 6", "q6")
		
	if(state == "q6"):
		saynn("Another question shows up on your screen")
		saynn("„Do you own any slaves of your own?”")
		addButton("Yes", "You do have slaves", "q6answer", [true])
		addButton("No", "I do not have slaves", "q6answer", [false])
		
	if(state == "q7"):
		if(GM.main.getPCSlaveAmount() > 0 or getModuleFlag("RahiModule", "rahiMile7Enslaved")) and answer == false:
			saynn("Pierre looks at you with surprise.")
			saynn("[say=pierre]Noted. Lets get to next question.[/say]")
		else:
			saynn("[say=pierre]Noted. Ooonntooo the neext onnne![/say]")
			saynn("Pierre says with excitement.")
		saynn("Screen blinks in Violet color and another questions shows up.\n\n„Do you believe more in teaching by reward or by punishment?”")
		saynn("Pierre looks oddly excited about this question, judging by movement of his tail.")
		saynn("[say=pierre]There are two schools of thought here, I'm simply wondering what do you think about this dillema.[/say]")
		addButton("Reward", "You believe in superiority of rewards in education", "q7answer", [true])
		addButton("Punishment", "You believe in punishment as being better motivational drive than rewards", "q7answer", [false])
		
	if(state == "q8"):
		if answer == true:
			saynn("Pierre claps his paws, so suddently that it spooked you a little bit. He seems happy.")
			saynn("[say=pierre]Apologies, I just... Got carried away.[/say]")
		else:
			saynn("Pierre smiles.")
			saynn("[say=pierre]Respectable response. You aren't the only one thinking this way, considering you found yourself in place like this.[/say]")
		saynn("[say=pierre]No time to waste, we are drawing near the end now.[/say]")
		saynn("Screen of the tablet flashes, in Evergreen color this time, and a new question appears.")
		saynn("„What species do you find most attractive?”")
		var species = GlobalRegistry.getAllPlayableSpecies()
		for species_id in species:
			addButton(species[species_id].getVisibleName()+"s", "I find "+species[species_id].getVisibleName()+"s to be most attractive", "q8answer", [str(species_id)])

	if(state == "q9"):
		if(answer in ['demon', 'dragon']):
			saynn("Pierre laugs")
			saynn("[say=pierre]I hope my body had no effect on that answer[/say]")
		saynn("Pierre notes the answer, he puts his own tablet on the floor as he picks up a glass of water to drink")
		saynn("[say=pierre]How do you feel about your answers so far? I hope you are honest with those, you know.[/say]")
		saynn("He puts the glass back on its earlier position, taps his tablet and you get the next question.")
		if(getModuleFlag("PierreModule", "QuestionnaireQ4") == true):
			saynn("„Your Master asks you to have his child. What do you do?”")
		else:
			saynn("„Your Master asks you to have his child (after first making you able to conceive one). What do you do?”")
		addButton("Refuse", "You aren't willing to bear your Master's child", "q9answer", [false])
		addButton("Accept", "You would agree to bear your Master's child", "q9answer", [true])
		
	if(state == "q10"):
		saynn("There is no reaction coming from Pierre on your answer. He gestures you to go on. A new question appears.")
		saynn("„How do parasites make you feel?”")
		addButton("Disgusted", "Parasites are disgusting", "q10answer", [1])
		addButton("Scared", "They fill you with fear", "q10answer", [2])
		addButton("Neutral", "They are creatures, the only thing that makes them parasites is the way they obtain their food", "q10answer", [3])
		addButton("Horny", "You like parasites... In very specific way", "q10answer", [4])
		
	if(state == "q10answer"):
		if(answer < 3):
			saynn("It feels as if he is trying to compose his body language to hide something. That or your answer didn't have much of effect on him. He notes your answer.")
			saynn("[say=pierre]That's indeed how pretty much everyone reacts, not surprising.[/say]")
		if(answer == 3):
			saynn("He gives you a curious look, perhaps a grin.")
			saynn("[say=pierre]That's most curious, a very... Scientific response. Cold, non-emotional observation. Most creatures writhe on mention of a parasite, not you.[/say]")
		else:
			saynn("For some reason this answer lifted his spirit.")
			saynn("[say=pierre]You are one kinky creature, you know that? I really like your boldness in this response, you are either very naive or sex worms have eaten your brain.[/say]")
			saynn("He laugs.")
		saynn("[say=pierre]We are at the end, last question.[/say]")
		saynn("„What do you think about AlphaCorp?” the screen displays.")
		addButton("Good", "AlphaCorp is doing good work, better than anyone else in this part of the galaxy", "q11answer", true)
		addButton("Neutral", "You either have no opinion or feel entirely neutral about AlphaCorp", "q11answer")
		addButton("Bad", "Your typical corrupt corporation, you dislike/hate it", "q11answer", false)

	if(state == "q11answer"):
		saynn("He writes notes your last answer.")
		saynn("[say=pierre]And we are done! Wasn't so bad, was it? Just 11 questions.\nI have to admit something to you, I lied. This test had wrong answers. Making a pet out of someone requires a lot, and I want my pets to be loyal as well as trustworthy. Of course there are more things than just those, but I needed you to feel safe while writing this test to make sure you give it your best shot as well as don't have reasons to lie to me.[/say]")
		saynn("[say=pierre]I'll now discuss those questions and your answers with you. Are you ready? Good.[/say]")
		saynn("[say=pierre]As your first question I've asked you if you believe creatures posses a soul. You answered "+("yes" if getModuleFlag("PierreModule", "QuestionnaireQ1") else "no")+".[/say]")
		saynn("[say=pierre]The nature of souls is a very interesting one, how do you even define a soul? It may mean different things for each one of us. For me, a soul is your essence - a thing that makes you - you, so yes, I do think that souls do exist. Once you lose your soul you... Stop being yourself, or at least true to yourself, you become mallable by something or someone else. The choices your body makes aren't really made by someone in specific, they are impulses of the body and nothing more...[/say]") # ;)
		saynn("He thinks for a moment")
		saynn("[say=pierre]That said, maybe at the end of the day, when soul leaves the body, it can still be itself... Somewhere else...[/say]")
		saynn("He coughs")
		saynn("[say=pierre]Anyways, this question was entirely for your own consideration, there is truthfully no right or wrong answer in here. Let's discuss question number two.[/say]")
		addButton("Summary", "", "summary2")
		
	if(state == "summary2"):
		var protectedTavi = getModuleFlag("TaviModule", "Ch3ProtectedTavi")
		var onlyTaviPunished = getModuleFlag("TaviModule", "Ch5OnlyTaviPunished")
		saynn("[say=pierre]Your next question was about loyality. It's a very important quality that I'm looking for in a pet. Perhaps not the reckless and completely maniacal type of loyality, but a loyality nonetheless.[/say]")
		if getModuleFlag("PierreModule", "QuestionnaireQ2"):
			saynn("[say=pierre]You have answered that you consider yourself loyal.[/say]")
			if(protectedTavi == null and onlyTaviPunished == true):  # Total lack of loyality
				saynn("[say=pierre]You see, sadly, I don't believe you are entirely honest with me, or yourself. Whenever something happens in this prison - rumors spread, people talk. Guards are surprisingly chatty with inmates.\nAnd what rumors - very trustworthy ones, mind you, say - is that you've abandoned your partner in crime twice. I'm sorry, but this is troubling answer. Not only you weren't loyal, but also you are not being truthful with yourself AND me. I don't tolerate this in my pets.[/say]")
				saynn("Pierre likely has in mind Tavi, you want to correct Pierre about this, and how you made the right decisions but the moment you breathe air to start talking his look clearly says he doesn't want you to defend yourself. You comply.")
			elif(protectedTavi == true and onlyTaviPunished == false):  # Total loyality
				saynn("[say=pierre]This is further confirmed by what rumors I've heard about you. You stuck with your partner in crime to the very end - commendable behavior. My pets don't have to make many difficult decisions, but it's important they are honest both with me and also themselves when making them. And if they are disloyal, I can hardly call myself their master. I think you were honest and dependable with your answer. Good job, pet.[/say]")
				saynn("Your body feels incredibly good after those words by Pierre, you feel rewarded for your honesty and loyality.")
			else:
				saynn("[say=pierre]I can't say for sure whether you were being honest or not with me. But loyality is incredibly important quality of a pet, and the fact you consider yourself loyal makes me happy.[/say]")
		else:
			saynn("[say=pierre]You have answered that you don't consider yourself loyal.[/say]")
			if(protectedTavi == null and onlyTaviPunished == true):  # Total lack of loyality
				saynn("[say=pierre]Ehh, you are giving me a really hard time in here, you know? I've heard of your adventures with certain other inmate from the prison - people talk in here, a lot. And reports confim that you weren't exactly the most loyal when your partner in crime needed you the most. But you also said that you don't consider yourself loyal, making your answer a honest one - something I can respect. You seem to be true to yourself, maybe a little lost. I think we can overlook this and just work on your loyality as we go.[/say]")
				saynn("Pierre likely has in mind Tavi, it's surprising he still gives you a chance even though he is aware how you basically let Tavi take all the blame for the failure - especially considering how much she went through after you got captured.")
			elif(protectedTavi == true and onlyTaviPunished == false):  # Total loyality
				saynn("[say=pierre]Hmm, your answer baffles me, pet. Rumors I've heard described your actions as heroic and loyal to your partner in crime, when they needed you the most, not minding the consequences. And yet, you say you are not loyal? I can't tell, whether you are not honest with yourself, too humble or something else, but either way, I hope we can work on it as we go on.[/say]")
			else:
				saynn("[say=pierre]I can't say for sure whether you were being honest or not with me. But loyality is incredibly important quality of a pet, it's a pity you don't consider yourself loyal. But regardless, this is something we can work on, don't worry.[/say]")
		saynn("[say=pierre]Second question done, just 9 more to go.[/say]")
		addButton("Continue", "", "summary3")
		
	if(state == "summary3"):
		saynn("[say=pierre]What do we have here... Body parts. Ah yes. It bears no any significance, but thought the answer would be fun.[/say]")
		answer = getModuleFlag("PierreModule", "QuestionnaireQ3")
		saynn("[say=pierre]You said that the body part you are most interested in is... "+answer+"[/say]")
		#TODO
		
	
				
	
func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
		
	if(_args):
		if(_action.begins_with("q10")):  # number parasite
			setModuleFlag("PierreModule", "QuestionnaireQ10", _args[0])
		elif(_action.begins_with("q11")):  # bool alphacorp
			setModuleFlag("PierreModule", "QuestionnaireQ11", _args[0])
		elif(_action.begins_with("q1")): # bool Creatures possess a soul
			setModuleFlag("PierreModule", "QuestionnaireQ1", _args[0])
		elif(_action.begins_with("q2")): # bool Consider yourself loyal
			setModuleFlag("PierreModule", "QuestionnaireQ2", _args[0])
		elif(_action.begins_with("q3")): # text Favorite bodypart
			setModuleFlag("PierreModule", "QuestionnaireQ3", _args[0])
		elif(_action.begins_with("q4")): # bool Can you be pregnant
			setModuleFlag("PierreModule", "QuestionnaireQ4", _args[0])
			_action = "q5"
		elif(_action.begins_with("q5")):  # text fav sexual activity
			setModuleFlag("PierreModule", "QuestionnaireQ5", _args[0])
		elif(_action.begins_with("q6")):  # bool have slaves
			setModuleFlag("PierreModule", "QuestionnaireQ6", _args[0])
			_action = "q7"
		elif(_action.begins_with("q7")):  # bool carrot and a stick
			setModuleFlag("PierreModule", "QuestionnaireQ7", _args[0])
			_action = "q8"
		elif(_action.begins_with("q8")):  # text attractive species
			setModuleFlag("PierreModule", "QuestionnaireQ8", _args[0])
			_action = "q9"
		elif(_action.begins_with("q9")):  # text bearing a baby
			setModuleFlag("PierreModule", "QuestionnaireQ9", _args[0])
			_action = "q10"
		
		answer = _args[0] # I'm lazy
		
	setState(_action)


func getDevCommentary():
	return "Writing questionnaire took me a while. I knew I wanted to write wuestionnaire and I wanted it to be meaningful in a way. At first the idea was that a player will choose some options and then Pierre will use them to apply punishments and rewards according to those responses. However evantually I felt like this may not be the best usage of questionnaire. One thing that to me is missing in the game is the lack of impact of choices made in other character arcs on the rest of the prison, I really wanted to do something about it, so I decided to possibly involve choices made in Tavi's questline as well as Rahi's to judge player for slavery fitness. There is also the fact that I enjoy ethics, so I slapped some ethics questions as well, this allows me to show that Pierre is not a two-dimensional character and works according to some rules he subscribes to as well. The end result is a weird mix of stuff. Don't know how I ultimately feel about all of this, but I think the idea of questionnaire is a solid one in here. Also, the abrupt break was added as I were writing the quiestionnaire, completely on impulse. I've felt like we needed some dramatic break or this would feel too boring, and it would allow me to add some relevant foreshadowing and story bits for later. Didn't want the quest to be this quick. It should be spread across multiple days, sorry for artificial filler ><"

func hasDevCommentary():
	return true
