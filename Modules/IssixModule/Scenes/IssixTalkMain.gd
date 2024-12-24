extends SceneBase

var random_issix_activities_talk = [
	"He notices you right away and follows you with his gaze.",
	"He is busy tinkering with some metal parts before noticing you.",
	"He sings a song to himself while gesticulating with his paws keeping the eyes closed, until he sees you approach.",

]  #TODO Write more

func _init():
	sceneID = "IssixTalkScene"
	
func _reactInit():
	if(GM.ES.triggerReact(Trigger.TalkingToNPC, ["issix"])):
		endScene()
		return

func _run():
	if(state == ""):
		setLocationName("Issix's Corner")
		if GM.main.getModuleFlag("IssixModule", "Quest_Status") < 6 and GM.main.getModuleFlag("IssixModule", "Quest_Rejected_By_Issix", 0) == 0:
			playAnimation(StageScene.Duo, "stand", {npc="issix", npcAction="sit"})
		else:
			playAnimation(StageScene.Duo, "kneel", {npc="issix", npcAction="sit"})
	
	if(state == ""):
		if(!GM.main.getModuleFlag("IssixModule", "Issix_Introduced")):
			saynn("While exploring the cellblock you stumble upon an uncommon sight - three leashed creatures resting on red blankets around a sitting man. One of the creatures appears to be sleeping, the other one is laying on their front turned towards the man sitting on the chair and the third one is licking their paws with their eyes closed, below them sheets of paper with drawings.\n\nThe sitting figure appears to be talking with the creature laying on their belly.")
			if(OPTIONS.isContentEnabled(ContentType.Watersports)):
				saynn("All of the three leashed creatures give off a pretty strong smell - they are all marked. While their fur seems dry, it's undeniable it had contact with piss, of a single male. Not difficult to figure out which.")
			addButton("Talk", "Talk to the intimidating demon", "talk")
			addButton("Appearance", "Take a closer look at the intimidating demon", "appearance")
		else:
			saynn("While exploring the station a in the corner of a platform sits a demon-dragon Issix with three leashed creatures.")
			addButton("Talk", "Talk to Issix", "talk")
			addButton("Appearance", "Take a closer look at Issix", "appearance")
		addButton("Leave", "Be on your way", "endthescene")
		
	if(state == "appearance"):
		saynn("Before you, on his ”throne” sits an intimidating figure - a demon-dragon hybrid. His piercing black eyes look distinct from any other inmate. His bright red fur uncommon for a dragon or even inmates, though his color pallette does fit a demon - his fur has three main colors, bright red, dark red and black.\n\nHe can certainly be called muscular, his arms and legs are on the beefier side, not extremely so, but one wouldn't want to pick a fight with him.\nEven though intimidating, his face... Shows kindness and calm.\n\nWhat makes him much different from everyone else is the... Harem? He holds a bundle of 3 leashes attached to his wrist, at the end of each is a creature laying or sitting on a blanket.")
		addButton("Back", "Go back", "")
		
	if(state == "talk"):
		clearCharacter()
		if GM.main.getModuleFlag("IssixModule", "Quest_Status") < 6 and GM.main.getModuleFlag("IssixModule", "Quest_Rejected_By_Issix", 0) == 0:
			playAnimation(StageScene.Duo, "stand", {npc="issix", npcAction="sit"})
		else:
			playAnimation(StageScene.Duo, "kneel", {npc="issix", npcAction="sit"})
		addCharacter("issix")
		if(!GM.main.getModuleFlag("IssixModule", "Issix_Introduced")):
			GM.main.setModuleFlag("IssixModule", "Issix_Introduced", true)
			saynn("You approach the intimidating demon, with a lot of distance still in-between you and him, standing right in front of his harem.")
			saynn("[say=issix]Oh hello little morsel. Don't believe I've seen you. Name is Issix. Do you have a name?[/say]")
			addButton("I'm "+GM.pc.getName(), "Introduce yourself with your name", "name")
		else:
			saynn("You approach the demon."+(" He grins, seeing you kneel." if GM.main.getModuleFlag("IssixModule", "Quest_Status") > 5 else ""))
			saynn(RNG.pick(random_issix_activities_talk))
			addButton("Prison", "How did he end up in prison?", "prison")
			addButton("Pets", "Have they really willingly gave to him?", "pets2")
			addButton("Guards", "Are prison guards giving him trouble?", "guards")
			if GM.main.getModuleFlag("IssixModule", "Quest_Status") == 1 and GM.main.getModuleFlag("IssixModule", "Quest_Bonked") == true:
				addButton("Exercise", "Ask Issix for explanation about your incident with the wall", "quest1bonk")
			if GM.main.getModuleFlag("IssixModule", "Quest_Status") == 3:
				addButton("Gumball", "Bring back the gumball to Issix", "quest1turn")
			match GM.main.getModuleFlag("IssixModule", "Quest_Rejected_By_Issix", 0):
				0:
					if GM.main.getModuleFlag("IssixModule", "Quest_Status", 0) == 0:
						addButton("Become his", "Ask if he'd like to make you his own pet", "join")
					elif GM.main.getModuleFlag("IssixModule", "Quest_Status", 0) > 10:
						pass
					else:
						addDisabledButton("Become his", "You are currently trying to become his")
				1, 3, 4:
					addDisabledButton("Become his", "You don't think there is much sense in asking anymore after you rejected Issix's proposition")
				2:
					addDisabledButton("Become his", "You don't think Issix trusts you enough to become his pet")
			GM.ES.triggerRun(Trigger.TalkingToNPC, ["issix"])
			addButton("Leave", "Be on your way", "endthescene")
			
	if state == "guards":
		saynn("[say=pc]What about guards? Are they not a problem for your operations?[/say]")
		saynn("[say=issix]Guards? No. They are just a gear in the system. As to my attitude towards them - I guess it's pretty symbiotic. I'm a very nice inmate, not making them any trouble and they leave me alone to my devious plans. My past earned me some privileges in here that no other can claim, by no means I'm untouchable but I'm close to being that. There are a few deals I have with the guards that allow me to live in here on my own terms, and its to their own benefit as well.[/say]")
		saynn("[say=pc]Really? So you are a big deal?[/say]")
		saynn("He takes a long breath")
		saynn("[say=issix]Nothing you have to worry about, morsel. All you need to know is to not cross me or any of my precious pets. That's all I want you to keep in mind.[/say]")
		saynn("[say=pc]Any way I could get on on some of deals you've mentioned?[/say]")
		saynn("[say=issix]Don't push it, morsel. If you are looking for charity this isn't the way to look.[/say]")
		addButton("Back","Issix seems annoyed, marking this conversation over", "talk")

	if state == "prison":
		saynn("You ask Issix about how he ended up in here. He looks at you with intensity, studying your face.")
		saynn("[say=issix]Honestly, don't think there is much for you to know morsel. But sure, I can entertain you a little.[/say]")
		saynn("Issix relaxes, his shoulders straight, he puts one leg on another, in crossed position.")
		saynn("[say=issix]I wanted to be here. My position offered me plenty of opportunities, everyone had their own expectations of everyone else's needs and wishes. I gave them all a big middle finger.\nThrough my connections I became an inmate. Nobody convicted me of any crime, like everyone else in here. I simply used my connections at AlphaCorp to be here. To gain my paradise.[/say]")
		if (GM.pc.getPersonality().getStat(PersonalityStat.Coward) < -0.2):
			saynn("[say=pc]You are craz-[/say]")
		else:
			saynn("[say=pc]That's... Cr-[/say]")
		saynn("[say=issix]Crazy. I know. I've heard it a million times, thanks.[/say]")
		saynn("He rolls his eyes and sips water from the glass nearby.")
		saynn("[say=pc]So how long have you been in here?[/say]")
		saynn("[say=issix]Enough to find my place, acquire three pets and make my own little business. So 5 years or so. I have it somewhere saved, but I don't really care enough to keep count.[/say]")
		addButton("Back", "Turn to other matters", "talk")
			
	if(state == "name"):
		saynn("[say=issix]I see. Nice to meet you {pc.name} and welcome to my humble corner in this piece of heaven.[/say]")
		saynn("He holds his paw up to you, not fazed by the fact that you are still separated by an awkwardly long distance from the demon-dragon.\nNot wanting to be rude, you lean forwards while making extra sure you will not trample upon laying inmate or fall forwards by yourself. Eventually your " + ("hand" if len(GM.pc.getSpecies()) == 1 and GM.pc.getSpecies()[0] == "human" else "paw") + " meets his and you are able to do shake them.")  # ok, I have no idea what's the difference between buff arms and anthro arms, they seem the same, and technically neither have paws, too bad I'm the one writing dialogue though
		saynn("[say=issix]What leads you to me? I don't suppose you are here to admire me like the three here.[/say]")
		saynn("He lets out a laugh")
		saynn("[say=issix]Anyways, I own this little corner including those three wonderful leashed pets beside me. You do NOT touch my pets without permission. Normally I wouldn't think this has to be mentioned, but for some reasons inmates think otherwise, those who do - don't keep this thought for long.[/say]")
		saynn("[say=issix]That's probably everything you need to know about me. \nAlso, considering we didn't start on the wrong foot, you have my permission to speak with my pets. \nNow, please find some other business to attend to, unless you need something else of me?[/say]")
		addButton("Heaven?", "Did you hear that correctly?", "heaven")
		addButton("You", "Learn more about Issix", "issixdetails")
		addButton("Pets", "Who are the pets?", "pets")
		
	if(state == "heaven"):
		saynn("[say=pc]Did you just call this prison a piece of heaven? Why?[/say]")
		saynn("[say=issix]Because it is. I don't understand why everyone says it's not.[/say]")
		saynn("[say=pc]Because it's... A prison?" + (" It's a middle-of-nothing rock that belongs to some mega rich empire. Because we have collars on our necks and they expect us to mine rock for their benefit, we are just slaves." if GM.main.getFlag("Mining_IntroducedToMinning", false) else "") + "[/say]")
		saynn("[say=issix]You are looking at it all wrong. While the rest of the galaxy is participating in a rat-race for who is the most awful of them all, when they are murdering each other daily in show of dominance, when food shortages, speciesism, chaos is happening out there, here? Sure we still have a lot of show of power, but nobody is murdering each other because of it, we have shitty, but food, and speciesism isn't as bad as out there because what's the point, everyone has been reduced to just an inmate. Slavery here isn't only restricted to AlphaCorp's and Syndicate's of the galaxy, which what allows me to have those wonderful pets in here.[/say]")
		saynn("[say=pc]So you like it here because you can have your own slaves?[/say]")
		saynn("[say=issix]I like it here because I can enjoy what the fuck I enjoy and whatever restrictions this place has don't bother me.[/say]")
		addButton("Continue", "Ask about something else", "name")
		
	if(state == "pets"):
		addCharacter("azazel")
		GM.main.setModuleFlag("IssixModule", "Pets_Introduced", true)
		saynn("[say=pc]So... Who are your pets exactly?[/say]")
		saynn("[say=issix]Curious about my treasured pearls, aren't you? Oh, I'm happy to introduce you, people usually talk only with me, but I feel like pets could use some social interactions with someone else than myself and themselves.[/say]")
		saynn("[say=issix]This kitty here is my very first pet, they've recognized me as their master shortly after I came here. They were very spooked and lost in here, still unsure what exactly they did to end up in this place. I gave them meaning, they repay me by being an excellent pet. Azazel, say hi.[/say]")
		saynn("Issix looks expectantly at Azazel - a fairly regular looking feline, he is wearing an lilac uniform. Until now he was curled and seemingly asleep, even though his ears were perking up whenever his master spoke. After hearing his master's voice speak his name however, his head immediately went up, and along with it the rest of his body. He stood on his fours and turned towards you.")
		saynn("[say=azazel]Hello... Stranger.[/say]")
		saynn("Azazel said with reservation. He looked away from you for a second to look at face of his master, whos face didn't lose his expectant look. Turning back to you he hesitently rubbed his cheek on your leg and collapsed onto his blanket again, making sure to take a last look at his master before closing his eyelids and presumably continuing his slumber.")
		saynn("[say=issix]Good kitty. He is the best breeding bitch in this entire institution, that's what nature made him to be. He doesn't mind petting his head, if that's something you'd like, otherwise we can move on.[/say]")
		saynn("In corner of your eye you see Azazel's faint smile in reaction to Issix's comment.")
		addButton("Pet Azazel", "Pet that kitty!", "hiisipet")
		addButton("Move on", "Learn about second pet", "hiisi")
		
	if(state in ["hiisipet", "hiisi"]):
		removeCharacter("azazel")
		addCharacter("hiisi")
		addCharacter("lamia")
		if(state == "hiisipet"):
			saynn("You crouch and gently pet Azazel's head. You can feel very delicate vibrations produced by the kitten. He doesn't open his eyes, but it's clear cat enjoys this treatment.")
			saynn("Master looks at this interaction with interest and sincere smile on his face.")
			saynn("After a short moment you stand back up and look at pet on your right.")
		saynn("[say=issix]This one here is Hiisi. He is my latest, which doesn't mean I love him any different. This puppy rather keeps to himself, you may have difficulties getting him to open to you, if you'd ever want to do that. He's.. A troubled one, to say the least, but look at him, isn't he the pristine puppy boy? He loves his belly rubs and stays out of the trouble! ... Well, mostly. Anyways, despite his troubled past, he agreed to join me and became my pup! Hiisi cmon, welcome our guest, give {pc.him} a sniff![/say]")
		saynn("[say=hiisi]{pc.name} isn't it? Umm... Hi.[/say]")
		saynn("{hiisi.name} licks your leg, leaving a bit of saliva on your fur.")  # TODO Fur/skin
		saynn("[say=issix]I apologize for my pets, they aren't used to longer conversations with strangers. They've been through a lot and... *sigh* Anyways, Lamia! Lamia is a fox breed, he doesn't speak. He communicates with drawings. He is getting pretty good at them. He also doesn't seem to mind being mute, quite to the opposite, he seems excited that his... Speech is in form of images.[/say]")
		saynn("You can see Lamia drawing something, Issix gives you a signal to just wait a second. After a minute, Lamia presents you with a drawing, smiling.")
		saynn("The drawing shows a pretty good representation of yourself, on fours, while leashed by a figure that you can only infer to be Issix. There is Lamia, Azazel and Hiisi hanging around there as well besides you. Issix laughs when he sees the drawing.")
		saynn("[say=issix]Lamia, please, don't scare our guest, not every friendly face you see must become my pet. You selfish little rascal.[/say]")
		saynn("While Issix's words seem playful, Lamia still is saddened by his master's words.")
		saynn("[say=issix]That would be it for introductions. If you have any problems with my pets you come to me, understood? Good.[/say]")
		addButton("Back", "Turn to other matters", "talk")
	
	if(state == "issixdetails"):
		saynn("[say=pc]Who are you?[/say]")
		saynn("[say=issix]Oh, I'm just a dragon-demon, nobody special. I dabble in... Equipment, and make bunch of things out of it. If you have some unused restraints, feel free to donate them to me, I'll be sure to make use of them, and maybe reward you a little, if I feel like it.[/say]")
		saynn("[say=pc]How long have you been in here?[/say]")
		saynn("[say=issix]A long while, compared to the others in here, several years at least. Enough to make some reputation for myself. [/say]")
		addButton("Back", "If he says so", "name")

	if(state == "pets2"):
		playAnimation(StageScene.Duo, "stand", {npc="issix", npcAction="sit"})
		saynn("[say=pc]Have your pets willingly gave to you? Can't imagine anyone giving up their freedom of their free will.[/say]")
		saynn("He looks at you with a mix of curiosity and amusement.")
		saynn("[say=issix]Oh? You think I'm a brute taking strays from the corridors of this prison against their will and making them my own?[/say]")
		saynn("He sips the drink from his glass. As he tries to read your very soul through your eyes.")
		if GM.main.getPCSlaveAmount() > 0:  # Judgement wooho
			saynn("[say=issix]Perhaps that's something you'd do. Perhaps you think that taking someone as your own is just a matter of violence and power. Perhaps you think that someone's will is yours to take, on your command, just like that, just because they walk this prison.[/say]")
			saynn("He recoils, you see a sliver of regret in his eyes.")
			saynn("[say=issix]No, fuck that. That's amateur hour. This is exactly what just another brute in this prison would think.[/say]")
			saynn("[say=issix]There is more to making someone a pet than brute force. There are other slavers in here who only care about shiny income and nothing else, they think a life is its worth in credits and that's all they see. They don't see the person behind eyes, they see money.[/say]")
			saynn("[say=pc]So what do you see in your pets?[/say]")
			saynn("[say=issix]Living, conscious beings, capable of love and hate, students yearning to learn about how life works, to find their destiny.[/say]")
			saynn("[say=pc]Sounds like load of bollocks.[/say]")
			saynn("[say=issix]To you, sure. Wouldn't expect you to understand anyways.[/say]")
			addButton("Back", "He gestures he is done talking on this topic", "talk")
		elif getModuleFlag("RahiModule", "rahiMile7Enslaved") == true:
			saynn("[say=issix]Perhaps not. Perhaps I misjudged you. Though, it is strange of you to ask me this question this way, considering you yourself look like someone who would enslave someone else with their own permission, giving themselves to you willingly. Am I mistaken?[/say]")
			saynn("His grin is very telling, he knows more than you tell him")
			saynn("[say=issix]Thought so. I don't like using violence and power to make someone my pet. Non-[/say]")
			saynn("He cuts himself in the middle")
			saynn("[say=issix]-my pets submitted to me willingly. I don't subscribe to other methods. That's all.[/say]")
			addButton("Back", "He gestures he is done talking on this topic", "talk")
		else:
			saynn("[say=issix]I'm not like this. My pets are here of their own will. They chose to give themselves to me. I don't enslave people if they don't want to, that's amateur and unfun.[/say]")
			saynn("[say=issix]I don't feel like you'd know a lot about slavery. Doesn't seem like you. Are you maybe an obedient puppy type of person?[/say]")
			saynn("He smiles")
			saynn("[say=issix]Well, if you are, I could show you exactly how my pets came to be my pets. If you allow, of course. All up to you.[/say]")
			saynn("This feels like a serious offer.")
			addButton("Back", "That's all on this topic", "talk")
		
	if(state == "join"):
		var score = calculateHaremScore()
		#var pets = [getModuleFlag("IssixModule", "Azazel_Affection_given", 0), getModuleFlag("IssixModule", "Lamia_Times_Helped", 0), getModuleFlag("IssixModule", "Hiisi_Affection", 0)]
		var score_explored = GM.main.getModuleFlag("IssixModule", "Score_Explored")
		saynn("[say=pc]"+RNG.pick(["What would you say about me becoming one of your pets?", "Do you think I would fit in with your harem?", "I'd like to become one of your pets, is this possible?"])+"[/say]")
		if(GM.pc.getPersonality().getStat(PersonalityStat.Subby) < 0):
			saynn("[say=issix]Look, you are lovely and all that, but I don't think you are the right fit. I require absolute obedience. Once you submit to me there is no going back, you become MY treasured pet forever. Those three? They know their place, they are ready to be mated whenever I feel like doing so. You? You strike me as leader - like myself. Why not just be business partners in here eh? I think you are entirely capable of gathering your own pets.[/say]")
		elif(score > 89):
			playAnimation(StageScene.Duo, "stand", {npc="issix", npcAction="stand"})
			saynn("You mention the intention to join his harem of pets, lust in your eyes. He looks at you and starts grinning.")
			saynn("[say=issix]Mmmmmm. You are almost done morsel. Not mine yet, but so close... I really like you. I really really like you. I think you have all of the qualities I'm looking for in a pet but...[/say]")
			saynn("He looks away, and looks... Concerned? No. In deep thought rather.")
			saynn("[say=hiisi]Is something the matter, master?[/say]")
			saynn("[say=issix]No Hiisi, you don't have to...[/say]")
			saynn("[say=azazel]Will {pc.name} join us, master?[/say]")
			saynn("Issix stands up, pulling on both Azazel's and Hiisi's leashes.")
			saynn("[say=issix]You two, do not concern yourself. {pc.name} here...[/say]")
			saynn("He looks at you, his black eyes again staring into yours. His face is neutral, still hazed by wandering thoughts.")
			saynn("[say=issix]... Is interested, but he still needs to prove he is worthy to be owned by your master.[/say]")
			saynn("He comes closer to you, leashes in his paw, eyes on you. There are only two steps separating you and him, but with each his tall posture makes you feel as if he is getting taller and taller, or perhaps you smaller and smaller. Eventually you can feel his body heat on yours, he is standing just in front of you, a peanut away. Your face meets his chest, you don't dare to look him in the face.\nHis paw reaches your chin to correct that. You see his black eyes again, looking down on you, as if you were a little feral kitten looking at big human. Insignificant. Tiny. His face has a serious expression.")
			saynn("[say=issix]Tell me {pc.name}, do you want to be my pet or do you want to stay a stray?[/say]")
			GM.main.setModuleFlag("IssixModule", "Score_Explored", score)
			addButton("Y-your pet", "Submit to Issix", "quest")
			if (GM.pc.getPersonality().getStat(PersonalityStat.Subby) < 0.3) and GM.pc.getLust() < 30 and !GM.pc.isWearingHypnovisor() and !GM.pc.hasEffect(StatusEffect.Suggestible) and !GM.pc.hasEffect(StatusEffect.UnderHypnosis):  # Good luck lol
				addButton("Stray", "You don't want to be his", "questreject")
			else:
				addDisabledButton("Stray kitten", "Your mind doesn't allow you to make this choice")
		elif(score > 75 and score_explored < 76):
			playAnimation(StageScene.Duo, "stand", {npc="issix", npcAction="stand"})
			saynn("[say=issix]Hmm.[/say]")
			saynn("He approaches you. Studying details of your face, he puts two of his paw fingers on your mouth opening it, he checks your teeth, if you have fangs. Without asking he grabs your arm rotating it, looking at every possible detail. You don't put up resistance at any point, you expected this treatment, after all. Being a pet is very intimate experience submitting yourself to someone else, after all.")
			saynn("Each one of your front paws are checked, whether you have nails, claws. He puts a paw on your chest, pushing it slightly as if to test your reaction, he tracks with his finger your spine on the back.")
			if GM.pc.hasNonFlatBreasts():
				#saynn("He looks at your "+ GM.pc.getBodypartLewdDescriptionAndName(BodypartSlot.Breasts) + "")
				saynn("He looks at your {pc.breasts}, giving them a squeeze, judging them by his own measures.")
				saynn("[say=issix]You'd be the first pet coming with extras in this area.[/say]")
				if GM.pc.hasBreastsFullOfMilk():
					saynn("As he squeezes your chest, some {pc.milk} spills out of your nipples onto the floor, with a few drops spilling on his paw. He notices and licks the drops off his paws.")
					saynn("[say=issix]Eager to be milked? A pet cow would be most welcome in my corner. How are your cow impressions?[/say]")
					saynn("You figure it's a rhetorical question and keep quiet as he moves to your other body parts.")
			saynn("He continues to explore your {pc.thick} {pc.masc} body, continuing wandering with his paws further down.")
			if GM.pc.getInventory().hasSlotEquipped(InventorySlot.UnderwearBottom) or GM.pc.getInventory().hasSlotEquipped(InventorySlot.Body):
				saynn("[say=issix]I'd rather see you without the clothes, but for today perhaps it's not a priority.[/say]")
				saynn("His hand gently and sensually explores your belly, ass and reproductive equipment.")
				if GM.pc.hasVagina() and GM.pc.getGender() == Gender.Male:
					saynn("[say=issix]A pussy huh? Well, don't worry, you wouldn't be the only male breeding bitch in here.[/say]")
					saynn("He laughs")
				elif GM.pc.hasVagina():
					saynn("[say=issix]A pussy huh? Tasty.")
				elif GM.pc.hasPenis():
					saynn("[say=issix]A penis huh? Wouldn't get much use out of it, but entirely acceptable.[/say]")
				else:
					saynn("[say=issix]Nothing there? That's okey by me, everyone comes with at least one hole.[/say]")
			else:
				if GM.pc.hasVagina() or GM.pc.hasPenis():
					saynn("[say=issix]You like having your babymaker on display, [pulse color=#00FFAA height=0.0 freq=1.0]slut[/pulse]?[/say]")
				else:
					saynn("[say=issix]Nothing there? That's okey by me, everyone comes with at least one hole.[/say]")
				if GM.pc.hasReachableVagina():
					var fluid = GM.pc.getBodypart(BodypartSlot.Vagina).getOrifice().getFluids().getDominantFluidID()
					saynn("He puts his finger into your {pc.pussyStretch} pussy, exploring it from the inside. You close your eyes as the dragon explores your body completely unrestricted as if you were just a [pulse color=#00FFAA height=0.0 freq=1.0]piece of meat[/pulse], a mix of pleasure and humiliation inside of your head. At last, he pulls out, his finger "+ ("covered in "+GlobalRegistry.getFluid(fluid).getVisibleName().to_lower() if fluid != null else "a bit moist")+".")
				if GM.pc.hasReachablePenis():
					saynn("He wraps around his paw around your {pc.penis}, stroking it a little. It already had some encouragement earlier, but now with some stroking from dominant dragon it became much harder.")
					if GM.pc.getPenisSize() > 14:
						saynn("[say=issix]What a shame. Such a big tool, you could be a breeder, if I would let you, but I won't.[/say]")
					else:
						saynn("[say=issix]What a nice little tool you have there. I'll be honest, I'd feel bad if you had a bigger penis, all this potential would be wasted, but this makes things simpler. Bitch.[/say]")
			saynn("He ends exploring your body and comes back to his chair.")
			saynn("[say=issix]I like what I see. You are almost ready, but not yet. When the time comes I expect you to show up again for my judgment. Then, I'll give you a chance. Don't waste it.[/say]")
			GM.main.setModuleFlag("IssixModule", "Score_Explored", score)
		elif(score > 45 and score_explored < 46):
			playAnimation(StageScene.Duo, "stand", {npc="issix", npcAction="stand"})
			saynn("[say=issix]Heh, interesting ask. It's still a no, though I have to admit, I do see some potential in here.[/say]")
			if (GM.pc.isBlindfolded()):
				saynn("Issix stands up, takes a step towards you, grabs your blindfold, pulls it higher, grabs you by your chin to look you straight in your eyes.")
			elif (GM.pc.isWearingHypnovisor()):
				saynn("[say=issix]Heh, I see you already come with the equipment. Let me take a look at you.[/say]")
				saynn("Issix stands up, takes a step towards you, pulls you forward, grabs your chin, pulls your head higher to face his head on top of his tall body. You barely see his eyes through your visor, which continues to massage your brain to obey every whim of every alpha in the prison.")
			else:
				saynn("Issix stands up, takes a step towards you, grabs you by your chin without asking and looks you straight into your eyes.")
			GM.pc.addLust(30)
			saynn("The moment takes forever, just as his gaze pierces through your eyes, you also observe his black, void pupils and irises. For a moment, it feels as if his pupil turned bright red. Could be just a play of light or something... But then... There is allure in those eyes. Something dangerous, yet enticing. You feel primal, bare. With every moment of this eye contact you feel less in control, weaker, inferior. Your knees start to bend ever so slightly before Issix stedies your head again and takes his paws from your chin.")
			if (GM.pc.isBlindfolded()):
				saynn("He fixes your blindfold to be back on your eyes.")
			saynn("[say=issix]Yess, you have the potential, whether you'll use it or not is up to you.[/say]")
			saynn("Issix goes back to his chair and sits, staring at you with a grin on his face.")
			GM.main.setModuleFlag("IssixModule", "Score_Explored", score)
		elif(score > 25 and score_explored < 26):
			saynn("[say=issix]I gotta say, I did hear of a certain {pc.name} around doing some whoring, but that's about it. You must understand, my pets must have prior experience and right spirit that I can exploit. You seem like a small fish. So no, my apologies but I'm simply not interested in you at the moment.[/say]")
			GM.main.setModuleFlag("IssixModule", "Score_Explored", score)
		elif(score_explored > 1):
			saynn("[say=issix]Hmm. you still look mostly the same, still unworthy.[/say]")
		else:
			saynn("[say=issix]Look, you are lovely and all that, but I don't think you have what it takes to join my other pets. I require absolute obedience and sexual experience. Once you submit to me there is no going back, you become MY treasured pet forever. Those three? They know their place, they are ready to be mated whenever I feel like doing so. They obey my every single command. I just don't see that in you, sorry.[/say]")
		addButton("Back", "Maybe another time then...", "talk")
		
	if state == "questreject":
		setModuleFlag("IssixModule", "Quest_Rejected_By_Issix", 1)
		saynn("[say=issix]I see... Disappointing, but it's your choice and I respect that.[/say]")
		saynn("He looks at you some more, he takes away his paw from your chin, turns around and sits on his chair. A serious and... Disappointed look on his face.")
		saynn("[say=issix]Go on then, unless you want to donate some items.[/say]")
		addButton("Leave", "Take your leave", "endthescene")

	if(state == "quest"):
		playAnimation(StageScene.Duo, "stand", {npc="issix", npcAction="sit"})
		saynn("He smiles briefly.")
		saynn("[say=issix]Very well.[/say]")
		saynn("He puts his paws on sides of your head and starts scratching you behind your ears. Immediately you feel... Comfortable. Loved. Protected. You closed your eyes in bliss. And then he... Stops, the feeling of his paws is filled with void. You feel empty, unfulfilled. You open your eyes and meet his eyes staring at you again from the above. He looks at you expectantly. You aren't sure what to do, you don't want to fail your Master, but... His black eyes speak to you, yes. They want you to open your mouth. You don't even realize when your mouth opens. You didn't do that by yourself, did you?")
		saynn("He takes your tongue in between his paw fingers gently, pulls it out a little. He opens his mouth and he spits. Spit lands right on your tongue, with incredible precision right in the middle. He does it again, using the fact your mouth is still open. It lands deeper inside your mouth. He pulls his paw fingers from your tongue and uses his two fingers to pressure your chin from below, giving you a signal to close your mouth.")
		saynn("You comply. There is nothing other than his eyes staring deep at you, his will is your will. His spit doesn't feel particularly different from yours, perhaps you can pick up some flavor or two, but it's more dignified flavor than one of cum that you are so used to. You keep the spit inside your mouth for a bit, tasting it, feeling it, connecting with its owner. And you swallow it, with a visible gulp.")
		saynn("Issix smiles. He ruffles your " + ("hair" if GM.pc.hasHair() else "ears") + " with his paws.")
		saynn("[say=issix]Good pet.\nNow, to be MY pet you'll have to prove yourself further. Besides the fact I want my pets to be all famous in this little heaven of ours, I want to make sure they follow my orders. For you my dear, I have a few little tasks, nothing you can't do, I'm sure, but it will be the proof I need you can become MY pet.[/say]")
		saynn("He turns around and moves towards his chair, where he sits.")
		saynn("[say=issix]Your first task will require... Trust. In me. Tell me, do you trust me?[/say]")
		addButton("Yes", "Say you trust Issix", "questresponseyes")
		addButton("No", "Say you don't trust Issix", "questresponseno")
			
	if(state in ["questresponseyes", "questresponseno"]):
		GM.main.setModuleFlag("IssixModule", "Quest_Status", 1)
		if(state=="questresponseyes"):
			saynn("Issix grins after hearing the answer.")
			saynn("[say=issix]Excellent. Now, what I want to do is verify your trust, and gain some of my own trust in you. You must be acutely aware how words, especially in this place"+ (" and especially coming from a red like yourself" if GM.pc.getInmateType() == InmateType.HighSec else "") + " can be deceptive.[/say]")
		if(state=="questresponseno"):
			saynn("Issix looks at you, studying you.")
			saynn("[say=issix]Curious. Not the answer I anticipated. It's fine, we can work on that.[/say]")
		saynn("[say=issix]For your first task, you'll need something I'm sure you are now well acquainted with - a blindfold. After all, what is the better tool to test someone's trust than tell them to do something stupid blind?[/say]")
		saynn("He chuckles")
		saynn("[say=issix]You will have to use your little head a bit too before you put one. I'll give you a map, I've drawn it myself, but it has to do. I won't spoil your fun and tell you what it shows, I'm sure you are clever enough to figure it out by yourself, after all, this prison isn't thaaat big, right?[/say]")
		saynn("He winks at you, and lets out a chuckle.")
		saynn("[say=issix]Go there, blind yourself, go through a wall and bring me the goods. The number you'll need is 84. And morsel, don't hang in there for too long, trust me on that. Don't worry, I'll know if you succeed or not, don't try to cheat. Remember, trust is the key.[/say]")
		addMessage("You've received a map.")
		addButton("Leave", "Take your leave", "endthescene")
	
	if(state == "quest1bonk"):
		saynn("Before you even start speaking Issix starts laughing maniacally, catching you off guard.")
		saynn("[say=issix]Oh Morsel[/say]")
		saynn("He almost chokes with laughter.")
		saynn("[say=issix]I've been told you- you've had a[/say]")
		saynn("He barely breathes thanks to constant laughter.")
		saynn("[say=issix]certain mee- meeting with a wall.[/say]")
		saynn("He starts recovering from the laughter.")
		saynn("[say=issix]I'm sorry, it was just... I've seen the clip, little birdie showed me it, told me I'd enjoy, and oh morsel, it made my week.[/say]")
		saynn("[say=pc]W-was it all a joke then? Have I passed your trust exercise?[/say]")
		saynn("[say=issix]Haha, don't get ahead of yourself there. I just didn't mention one very important fact, honestly didn't anticipate you trying to be sneaky.[/say]")
		saynn("[say=pc]What do you mean?[/say]")
		saynn("[say=issix]I mean that you weren't supposed to do that at night! I appreciate the attempt, but the mechanism closes shut at night.[/say]")
		saynn("That... Would make sense. Still unsure what mechanism Issix is referring to, but its true that the prison isn't exactly the same when the night comes, and some places are simply locked. "+("Your tail wraps around you in embarassment" if GM.pc.hasTail() else "You blush in embarassment")+".")
		saynn("[say=issix]It's fine pet, you didn't know. Go there today and do the same thing, just perhaps not during the night, okey?[/say]")
		addButton("Leave", "Nod and leave embarassed", "endthescene")
	
	if(state == "quest1turn"):
		saynn("[say=pc]Is... This what you wanted?[/say]")
		saynn("You said with uncertainty in your voice, presenting Issix with a packet of gumball.\nIssix looks at you elated, he claps his paws.")
		saynn("[say=issix]Yes, YES. This is exactly what I needed, morsel.[/say]")
		saynn("He stands up, and takes the packet of gum from your paw.")
		saynn("He opens one end of it and immediately pops one of the gums in his mouth. He goes back to sit on his chair.")
		saynn("[say=issix]You know, a lot of goods in here are generally unavailable to inmates. I knew what I were getting into arriving in here, and didn't really care about most of favorite dishes or products. But this gum? I can't live without it. I were able to make sure it arrives here, in this prison just for myself regularly. You wouldn't believe just how much I had to work to have it delivered, it's not exactly the most popular destination in the galaxy. I have a contact who drops it always in same place where you got it from.[/say]")
		saynn("He savours the taste of gum, closing his eyes and resting his head on chair's headrest.")
		saynn("[say=issix]Ahhhhhh. So good. I've been chewing this brand since I were little, out of all things, it never gets old.[/say]")
		saynn("He looks back at you.")
		if GM.main.getModuleFlag("IssixModule", "Quest_Bonked") == true:
			saynn("[say=issix]I assume no more, akhem, ”wall incidents”?[/say]")
			saynn("He grins")
		saynn("[say=issix]And with just that you've passed my first test. Congratulations! I knew you could do it.[/say]")
		saynn("[say=issix]That would be it for today. For your next time I'll have to prepare a little. I should have something for you tomorrow, so please come then.[/say]")
		addButton("Alright", "Leave", "endthescene")


func calculateHaremScore():
	var score = 0
	score += GM.pc.getPersonality().getStat("Subby")*10  # -10 - 10
	score += GM.pc.getReputation().getRepLevel(RepStat.Whore)*10  # 0 - 90
	return int(score) # -10 - 100

func _react(_action: String, _args):
	if _action in ["questresponseno", "questresponseyes"]:
		GM.pc.getInventory().addItem(GlobalRegistry.createItem("IssixsMap"))

	if _action == "quest1turn":
		GM.main.setModuleFlag("IssixModule", "Quest_Status", 4)
		GM.main.setModuleFlag("IssixModule", "Quest_Wait_Another_Day", true)
		#GM.pc.getInventory().removeFirstOf("IssixsMap")  - might be useful for later?

	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
