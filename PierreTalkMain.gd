extends SceneBase

var random_pierre_activities_talk = [
	"He notices you right away and follows you with his gaze."
]  #TODO Write more

func _init():
	sceneID = "PierreTalkScene"
	
func _reactInit():
	if(GM.ES.triggerReact(Trigger.TalkingToNPC, ["pierre"])):
		endScene()
		return

func _run():
	if(state == ""):
		playAnimation(StageScene.Duo, "stand", {npc="pierre", npcAction="sit"})
		
	
	if(state == ""):
		if(!GM.main.getModuleFlag("PierreModule", "Pierre_Introduced")):
			sayn("While exploring the cellblock you stumble upon an uncommon sight - three leashed creatures resting on blankets around a sitting man. One of the creatures appears to be sleeping, the other one is laying on their front turned towards the man sitting on the chair and the third one is licking their paws with their eyes closed.\nThe sitting figure appears to be talking with the creature laying on their belly.")
			if(OPTIONS.isContentEnabled(ContentType.Watersports)):
				sayn("All of the three leashed creatures give off a pretty strong smell - they are all marked. While their fur seems dry, it's undeniable it had contact with piss, of a single male. Not difficult to figure out which.")
			addButton("Talk", "Talk to the intimidating demon", "talk")
			addButton("Appearance", "Take a closer look at the intimidating demon", "appearance")
		else:
			saynn("While exploring the station a in the corner of a platform sits a demon-dragon Pierre with three leashed creatures.")
			addButton("Talk", "Talk to Pierre", "talk")
			addButton("Appearance", "Take a closer look at Pierre", "appearance")
		addButton("Leave", "Be on your way", "endthescene")
		
	if(state == "appearance"):
		saynn("Before you, on his ”throne” stands an intimidating figure - a demon-dragon hybrid. His piercing black eyes look distinct from any other inmate.\n\nHe can certainly be called muscular, his arms and legs are on the beefier side, not extremaly so, but one wouldn't want to pick a fight with him.\nEven though intimidating, his face... Shows kindness and calm.\n\nWhat makes him much different from everyone else is the... Harem? He holds a bundle of 3 leashes attached to his wrist, at the end of each is a creature laying or sitting on a blanket.")
		addButton("Back", "Go back", "")
		
	if(state == "talk"):
		if(!GM.main.getModuleFlag("PierreModule", "Pierre_Introduced")):
			GM.main.setModuleFlag("PierreModule", "Pierre_Introduced", true)
			saynn("You approach the intimidating demon, with a lot of distance still in-between you and him, standing right in front of his harem.")
			saynn("[say=pierre]Oh hello little morsel. Don't believe I've seen you. Name is Pierre. Do you have a name?[/say]")
			addButton("I'm "+GM.pc.getName(), "Introduce yourself with your name", "name")
		else:
			saynn("You approach the demon.")
			saynn(RNG.pick(random_pierre_activities_talk))
			addButton("Prison", "How did he end up in prison?", "prison")
			addButton("Pets", "Have they really willingly gave to him?", "pets2")
			addButton("Guards", "Are prison guards giving him trouble?", "guards")
			if GM.main.getModuleFlag("PierreModule", "Quest_Status") == 1 and GM.main.getModuleFlag("PierreModule", "Quest_Bonked") == true:
				addButton("Exercise", "Ask Pierre for explanation about your incident with the wall", "quest1bonk")
			if GM.main.getModuleFlag("PierreModule", "Quest_Status") == 3:
				addButton("Gumball", "Bring back the gumball to Pierre", "quest1turn")
			GM.ES.triggerRun(Trigger.TalkingToNPC, ["pierre"])
			addButton("Leave", "Be on your way", "endthescene")
			
	if(state == "name"):
		addCharacter("pierre")
		saynn("[say=pierre]I see. Nice to meet you "+GM.pc.getName()+" and welcome to my humble corner in this piece of heaven.[/say]")
		saynn("He holds his paw up to you, not fazed by the fact that you are still separated by an awkwardly long distance from the demon-dragon.\nNot wanting to be rude, you lean forwards while making extra sure you will not trample upon laying inmate or fall forwards by yourself. Eventually your " + ("hand" if len(GM.pc.getSpecies()) == 1 and GM.pc.getSpecies()[0] == "human" else "paw") + " meets his and you are able to do shake them.")  # ok, I have no idea what's the difference between buff arms and anthro arms, they seem the same, and technically neither have paws, too bad I'm the one writing dialogue though
		saynn("[say=pierre]I own this little corner including those three wonderful leashed pets beside me. You do NOT touch my pets without permission. Normally I wouldn't think this has to be mentioned, but for some reasons inmates think otherwise, those who do - don't keep this thought for long.[/say]")
		sayn("[say=pierre]That's probably everything you need to know about me. \nAlso, considering we didn't start on the wrong foot, you have my permission to speak with my pets. \nNow, please find some other business to attend to, unless you need something else of me?[/say]")
		addButton("Heaven?", "Did you hear that correctly?", "heaven")
		addButton("Pierre", "Learn more about Pierre", "pierredetails")
		addButton("Pets", "Who are the pets?", "pets")
		
	if(state == "heaven"):
		saynn("[say=pc]Did you just call this prison a piece of heaven? Why?[/say]")
		saynn("[say=pierre]Because it is. I don't understand why everyone says it's not.[/say]")
		saynn("[say=pc]Because it's... A prison? It's a middle-of-nothing rock that belongs to some mega rich empire. Because we have collars on our necks.[/say]")
		saynn("[say=pierre]You are looking at it all wrong [/say]") # TODO
		addButton("Continue", "Ask about something else", "name")
		
	if(state == "pets"):
		GM.main.setModuleFlag("PierreModule", "Pets_Introduced", true)
		saynn("[say=pc]So... Who are your pets exactly?[/say]")
		saynn("[say=pierre]Curious about my treasured pearls, aren't you? Oh, I'm happy to introduce you, people usually talk only with me, but I feel like they could use some social interactions with someone else than myself and themselves.[/say]")
		sayn("[say=pierre]This kitty here is my very first pet, they've recognized me as their master shortly after I came here. They were very spooked and lost in here, still unsure what exactly they did to end up in this place. I gave them meaning, they repay me by being an excellent pet. Azazel, say hi.[/say]")
		saynn("Pierre looks expectantly at Azazel - a fairly regular looking feline, he is wearing an lilac uniform. Until now he was curled and seemingly asleep, even though his ears were perking up whenever his master spoke. After hearing his master's voice speak his name however his head immediately went up, and along with it the rest of his body. He stood on his fours and turned towards you.")
		saynn("[say=azazel]Hello... Stranger.[/say]")
		saynn("Azazel said with reservation. He looked away from you for a second to look at face of his master, whos face didn't lose his expectant look. Turning back to you he hesitently rubbed his cheek on your leg and collapsed onto his blanket again, making sure to take a last look at his master before closing his eyelids and presumably continuing his slumber.")
		saynn("[say=pierre]Good kitty. He is the best breeding bitch in this entire institution, that's what nature made him to be. He doesn't mind petting his head, if that's something you'd like, otherwise we can move on.[/say]")
		saynn("In corner of your eye you see Azazel's faint smile in reaction to Pierre's comment.")
		addButton("Pet Azazel", "Pet that kitty!", "hiisipet")
		addButton("Move on", "Learn about second pet", "hiisi")
		
	if(state in ["hiisipet", "hiisi"]):
		if(state == "hiisipet"):
			saynn("You crouch and gently pet Azazel's head. You can feel very delicate vibrations produced by the kitten. He doesn't open his eyes, but it's clear cat enjoys this treatment.")
			sayn("Master looks at this interaction with interest and sincere smile on his face.")
			saynn("After a short moment you stand back up and look at pet on your right.")
		saynn("[say=pierre]This one here is Hiisi. He is my lastest, which doesn't mean I love him any different. This puppy was actually one of the more recognized troublemakers around this prison.\nHe's been getting into pants of everyone against their own will to the point that even guards started getting concerned and wanted to take action. At one point he even attempted to breed my precious kitty Azazel, do you remember that Hiisi?[/say]")  # TODO
		saynn("Hissi looks at his master and shakes his head.")
		saynn("[say=pierre]Right, of course you don't, hah. But look at him now, pristine puppy boy! He love his belly rubs and stays out of the trouble! ... Well, mostly. Anyways, despite his troubled past, he agreed to join me and became my pup! Hiisi cmon, welcome our guest, give {pc.him} a sniff!")
		saynn("[say=hiisi]" + GM.pc.getName() + " isn't it? Umm... Hi.[/say]")
		saynn("{hiisi.name} licks your leg, leaving a bit of saliva on your fur.")  # TODO Fur/skin
		saynn("[say=pierre]I apologize for my pets, they aren't used to longer conversations with strangers. They've been through a lot and... *sigh* Anyways, Lamia! Lamia is a fox breed, he doesn't speak. He communicates with drawings. He isn't great at them, by any means, but to me it makes him very special. He doesn't mind being mute.[/say]")
		addButton("Leave", "Be on your way", "endthescene")
		addButton("Pets", "Ask more about pets", "hiisipet")
		
	if(state == "lamia"):
		saynn("You take a step towards Lamia to give him a pawshake. He sits on a blanket, next to him a stack of empty paper sheets, and a smaller pile of ")
	
	if(state == "pierredetails"):
		saynn("You ask Pierre about himself. He looks at you with intensity, studying your face.")
		saynn("[say=pierre]Honestly, don't think there is much for you to know morsel. But sure, I can entertain you a little.[/say]")
		saynn("Pierre relaxes, his shoulders straight, he puts one leg on another, in crossed position.")
		saynn("[say=pierre]I wanted to be here. My position offered me plenty of opportunities, everyone had their own expectations of everyone else's needs and wishes. I gave them all a big middle finger.\nThrough my connections I became an inmate. Nobody convicted me of any crime, like everyone else in here. I simply used my connections at AlphaCorp to be here. To gain my paradise.[/say]")
		if (GM.pc.getPersonality().getStat(PersonalityStat.Coward) < -0.2):
			saynn("[say=pc]You are craz-[/say]")
		else:
			saynn("[say=pc]That's... Cr-[/say]")
		saynn("[say=pierre]Crazy. I know. I've heard it a million times, thanks.[/say]")
		saynn("He rolls his eyes and sips water from the glass nearby.")
		saynn("[say=pierre]Anyways, this short story will have to do, morsel. I've talked enough about myself.[/say]")
		addButton("Back", "If he says so", "name")

	if(state == "pets2"):
		playAnimation(StageScene.Duo, "stand", {npc="pierre", npcAction="sit"})
		pass
		
	if(state == "join"):
		var score = calculateHaremScore()
		var score_explored = GM.main.getModuleFlag("PierreModule", "Score_Explored")
		if(GM.pc.getPersonality().getStat(PersonalityStat.Subby) < 0):
			saynn("[say=pierre]Look, you are lovely and all that, but I don't think you are the right fit. I require absolute obedience. Once you submit to me there is no going back, you become MY treasured pet forever. Those three? They know their place, they are ready to be mated whenever I feel like doing so. You? You strike me as leader - like myself. Why not just be business partners in here eh? I think you are entirely capable of gathering your own pets.[/say]")
		elif(score > 89 and GM.main.getModuleFlag("PierreModule", "Quest_Status") > 1):
			pass
		elif(score > 75 and score_explored < 9999):
			playAnimation(StageScene.Duo, "stand", {npc="pierre", npcAction="stand"})
			saynn("You mention the intention to join his harem of pets, lust in your eyes. He looks at you and starts grinning.")
			saynn("[say=pierre]Mmmmmm. You are almost done morsel. Not mine yet, but so close... I really like you. I really really like you. I think you have all of the qualities I'm looking for in a pet but...[/say]")
			saynn("He looks away, and looks... Concerned? No. In deep thought rather.")
			saynn("[say=hiisi]Is something the matter, master?[/say]")
			saynn("[say=pierre]No Hiisi, you don't have to...[/say]")
			saynn("[say=azazel]Will "+GM.pc.getName()+" join us, master?[/say]")
			saynn("Pierre stands up, pulling on both Azazel's and Hiisi's leashes.")
			saynn("[say=pierre]You two, do not concern yourself. "+GM.pc.getName()+" here...[/say]")
			saynn("He looks at you, his black eyes again staring into yours. His face is neutral, still hazed by wandering thoughts.")
			saynn("[say=pierre]... Is interested, but he still needs to prove he is worthy to be owned by your master.[/say]")
			saynn("He comes closer to you, leashes in his paw, eyes on you. There are only two steps separating you and him, but with each his tall posture makes you feel as if he is getting taller and taller, or perhaps you smaller and smaller. Eventually you can feel his body heat on yours, he is standing just in front of you, a peanut away. Your face meets his chest, you don't dare to look him in the face.\nHis paw reaches your chin to correct that. You see his black eyes again, looking down on you, as if you were a little feral kitten looking at big human. Insignificant. Tiny. His face has a serious expression.")
			saynn("[say=pierre]Tell me "+GM.pc.getName()+", do you want to be my pet or do you want to stay a stray kitten?[/say]")  # TODO depending on species
			GM.main.setModuleFlag("PierreModule", "Score_Explored", score)
			addButton("Y-your pet", "Submit to Pierre", "quest")
			if (GM.pc.getPersonality().getStat(PersonalityStat.Subby) < 0.3) and GM.pc.getLust() < 30 and !GM.pc.isWearingHypnovisor() and !GM.pc.hasEffect(StatusEffect.Suggestible) and !GM.pc.hasEffect(StatusEffect.UnderHypnosis):  # Good luck lol
				GM.main.setModuleFlag("PierreModule", "Quest_Status", -1)
				addButton("Stray kitten", "You don't want to be his kitten", "quest")
			else:
				addDisabledButton("Stray kitten", "Your mind doesn't allow you to make this choice")
		elif(score > 45 and score_explored < 76):
			playAnimation(StageScene.Duo, "stand", {npc="pierre", npcAction="stand"})
			saynn("[say=pierre]Heh, interesting ask. It's still a no, though I have to admit, I do see some potential in here.[/say]")
			if (GM.pc.isBlindfolded()):
				saynn("Pierre stands up, takes a step towards you, grabs your blindfold, pulls it higher, grabs you by your chin to look you straight in your eyes.")
			elif (GM.pc.isWearingHypnovisor()):
				saynn("[say=pierre]Heh, I see you already come with the equipment. Let me take a look at you.[/say]")
				saynn("Pierre stands up, takes a step towards you, pulls you forward, grabs your chin, pulls your head higher to face his head on top of his tall body. You barely see his eyes through your visor, which continues to massage your brain to obey every whim of every alpha in the prison.")
			else:
				saynn("Pierre stands up, takes a step towards you, grabs you by your chin without asking and looks you straight into your eyes.")
			GM.pc.addLust(30)
			sayn("The moment takes forever, just as his gaze pierces through your eyes, you also observe his black, void pupils and irises. For a moment, it feels as if his pupil turned bright red. Could be just a play of light or something... But then... There is allure in those eyes. Something dangerous, yet enticing. You feel primal, bare. With every moment of this eye contact you feel less in control, weaker, inferior. Your knees start to bend ever so slightly before Pierre stedies your head again and takes his paws from your chin.")
			if (GM.pc.isBlindfolded()):
				sayn("He fixes your blindfold to be back on your eyes.")
			saynn("[say=pierre]Yess, you have the potential, whether you'll use it or not is up to you.[/say]")
			saynn("Pierre goes back to his chair and sits, staring at you with a grin on his face.")
			GM.main.setModuleFlag("PierreModule", "Score_Explored", score)
		elif(score > 25 and score_explored < 46):
			saynn("[say=pierre]I gotta say, I did hear of a certain "+GM.pc.getName()+" around doing some whoring, but that's about it. You must understand, my pets must have prior experience and right spirit that I can exploit. You seem like a small fish. So nah, my apologies but I'm simply not interested in you at the moment.[/say]")
			GM.main.setModuleFlag("PierreModule", "Score_Explored", score)
		elif(score_explored > 1):
			saynn("[say=pierre]Hmm. you still look mostly the same, still unworthy.[/say]")
		else:
			saynn("[say=pierre]Look, you are lovely and all that, but I don't think you have what it takes to join my other pets. I require absolute obedience and sexual experience. Once you submit to me there is no going back, you become MY treasured pet forever. Those three? They know their place, they are ready to be mated whenever I feel like doing so. They obey my every single command. I just don't see that in you, sorry.[/say]")
		addButton("Back", "Maybe another time then...", "pets2")
		
	if(state == "quest"):
		playAnimation(StageScene.Duo, "stand", {npc="pierre", npcAction="sit"})
		if (GM.main.getModuleFlag("PierreModule", "Quest_Status") == -1):
			saynn("[say=pierre]I see... Disappointing, but it's your choice and I respect that.[/say]")
			saynn("He looks at you some more, he takes away his paw from your chin, turns around and sits on his chair. A serious and... Disappointed look on his face.")
			saynn("[say=pierre]I'll give you one more chance if you change your mind. But this one will be final. My pets trust me, and they don't say no to me.[/say]")
			addButton("Leave", "Take your leave", "endthescene")
		else:
			saynn("He smiles briefly.")
			saynn("[say=pierre]Very well.[/say]")
			saynn("He puts his paws on sides of your head and starts scratching you behind your ears. Immediately you feel... Comfortable. Loved. Protected. You closed your eyes in bliss. And then he... Stops, the feeling of his paws is filled with void. You feel empty, unfulfilled. You open your eyes and meet his eyes staring at you again from the above. He looks at you expectendly. You aren't sure what to do, you don't want to fail your Master, but... His black eyes speak to you, yes. They want you to open your mouth. You don't even realize when your mouth opens. You didn't do that by yourself, did you?")
			sayn("He takes your tongue in between his paw fingers gently, pulls it out a little. He opens his mouth and he spits. Spit lands right on your tongue, with incredible precision right in the middle. He does it again, using the fact your mouth is still open. It lands deeper inside your mount. He pulls his paw fingers from your tongue and uses his two fingers to pressure your chin from below, giving you a signal to close your mouth.")
			sayn("You comply. There is nothing other than his eyes staring deep at you, his will is your will. His spit doesn't feel particularly different from yours, perhaps you can pick up some flavor or two, but it's more dignified flavor than one of cum that you are so used to. You keep the spit inside your mouth for a bit, tasting it, feeling it, connecting with its owner. And you swallow it, with a visible gulp.")
			saynn("Pierre smiles. He ruffles your " + ("hair" if GM.pc.hasHair() else "ears") + " with his paws.")
			saynn("[say=pierre]Good pet.\nNow, to be MY pet you'll have to prove yourself further. Besides the fact I want my pets to be all famous in this little heaven of ours, I want to make sure they follow my orders. For you my dear, I have a few little tasks, nothing you can't do, I'm sure, but it will be the proof I need you can become MY pet.[/say]")
			saynn("He turns around and moves towards his chair, where he sits.")
			saynn("[say=pierre]Your first task will require... Trust. In me. Tell me, do you trust me?[/say]")
			addButton("Yes", "Say you trust Pierre", "questresponseyes")
			addButton("No", "Say you don't trust Pierre", "questresponseno")
			
	if(state in ["questresponseyes", "questresponseno"]):
		GM.main.setModuleFlag("PierreModule", "Quest_Status", 1)
		if(state=="questresponseyes"):
			saynn("Pierre grins after hearing the answer.")
			sayn("[say=pierre]Excellent. Now, what I want to do is verify your trust, and gain some of my own trust in you. You must be acutely aware how words, especially in this place"+ (" and especially coming from a red like yourself" if GM.pc.getInmateType() == InmateType.HighSec else "") + " can be deceptive.[/say]")
		if(state=="questresponseno"):
			saynn("Pierre looks at you, studying you.")
			saynn("[say=pierre]Curious. Not the answer I anticipated. It's fine, we can work on that.[/say]")
		saynn("[say=pierre]For your first task, you'll need something I'm sure you are now well acquainted with - a blindfold. After all, what is the better tool to test someone's trust than tell them to do something stupid blind?[/say]")
		saynn("He chuckles")
		saynn("[say=pierre]You will have to use your little head a bit too before you put one. I'll give you a map, I've drawn it myself, but it has to do. I won't spoil your fun and tell you what it shows, I'm sure you are clever enough to figure it out by yourself, after all, this prison isn't thaaat big, right?[/say]")
		saynn("He winks at you, and lets out a chuckle.")
		saynn("[say=pierre]Go there, blind yourself, go through a wall and bring me the goods. The number you'll need is 84. And morsel, don't hang in there for too long, trust me on that. Don't worry, I'll know if you succeed or not, don't try to cheat. Remember, trust is the key.[/say]")
		addButton("Leave", "Take your leave", "endthescene")
	
	if(state == "quest1bonk"):
		saynn("Before you even start speaking Pierre starts laughing maniacally, catching you off guard.")
		saynn("[say=pierre]Oh Morsel[/say]")
		saynn("He almost chokes with laughter.")
		saynn("[say=pierre]I've been told you- you've had a[/say]")
		saynn("He barely breathes thanks to constant laughter.")
		saynn("[say=pierre]certain mee- meeting with a wall.[/say]")
		saynn("He starts recovering from the laughter.")
		saynn("[say=pierre]I'm sorry, it was just... I've seen the clip, little birdie showed me it, told me I'd enjoy, and oh morsel, it made my week.[/say]")
		saynn("[say=pc]W-was it all a joke then? Have I passed your trust exercise?[/say]")
		saynn("[say=pierre]Haha, don't get ahead of yourself there. I just didn't mention one very important fact, honestly didn't anticipate you trying to be sneaky.[/say]")
		saynn("[say=pc]What do you mean?[/say]")
		saynn("[say=pierre]I mean that you weren't supposed to do that at night! I appreciate the attempt, but the mechanism closes shut at night.[/say]")
		saynn("That... Would make sense. Still unsure what mechanism Pierre is referring to, but its true that the prison isn't exactly the same when the night comes, and some places are simply locked. "+("Your tail wraps around you in embarassment" if GM.pc.hasTail() else "You blush in embarassment")+".")
		saynn("[say=pierre]It's fine pet, you didn't know. Go there today and do the same thing, just perhaps not during the night, okey?[/say]")
		addButton("Leave", "Nod and leave embarassed", "endthescene")
	
	if(state == "quest1turn"):
		GM.main.setModuleFlag("PierreModule", "Quest_Status", 4)
		GM.main.setModuleFlag("PierreModule", "Quest_Wait_Another_Day", true)
		saynn("[say=pc]Is... This what you wanted?[/say]")
		saynn("You said with uncertainty in your voice, presenting Pierre with a packet of gumball.\nPierre looks at you elated, he claps his paws.")
		saynn("[say=pierre]Yes, YES. This is exactly what I needed, pet.[/say]")
		saynn("He stands up, and takes the packet of gum from your paw.")
		saynn("He opens one end of it and immediately pops one of the gums in his mouth. He goes back to sit on his chair.")
		saynn("[say=pierre]You know, a lot of goods in here are generally unavailable to inmates. I knew what I were getting into arriving in here, and didn't really care about most of favorite dishes or products. But this gum? I can't live without it. I were able to make sure it arrives here, in this prison just for myself regularly. You wouldn't believe just how much I had to work to have it delivered, it's not exactly the most popular destination in the galaxy. I have a contact who drops it always in same place where you got it from.[/say]")
		saynn("He savours the taste of gum, closing his eyes and resting his head on chair's headrest.")
		saynn("[say=pierre]Ahhhhhh. So good. I've been chewing this brand since I were little, out of all things, it never gets old.[/say]")
		saynn("He looks back at you.")
		if GM.main.getModuleFlag("PierreModule", "Quest_Bonked") == true:
			saynn("[say=pierre]I assume no more, akhem, ”wall incidents”?[/say]")
			saynn("He grins")
		saynn("[say=pierre]And with just that you've passed my first test. Congratulations! I knew you could do it.[/say]")
		saynn("[say=pierre]That would be it for today. For your next time I'll have to prepare a little. I should have something for you tomorrow, so please come then.[/say]")
		addButton("Alright", "Leave", "endthescene")
		# Which body part you hold dearest?
		# 2 questions based on stories from Tavi, and Rahi, using their flags to phrase the questions
		# Trolley problem?
		# Favorite species
		# 

func calculateHaremScore():
	var score = 0
	score += GM.pc.getPersonality().getStat("Subby")*10  # -10 - 10
	score += GM.pc.getReputation().getRepLevel(RepStat.Whore)*10  # 0 - 90
	return int(score) # -10 - 100

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
