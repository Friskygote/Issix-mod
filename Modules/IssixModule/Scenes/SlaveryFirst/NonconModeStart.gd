extends SceneBase

const Globals = preload("res://Modules/IssixModule/Globals.gd")

func _init():
	sceneID = "NonconModeStart"

func _run():
	if(state == ""):
		saynn("[say=issix]{pc.name}, come with me.[/say]")
		saynn("Master comes up to you and clasps the leash onto the collar on your neck. Other pets look at you with interest as you walk away with Master.")
		saynn("[say=issix]Excited? You wanted this.[/say]")
		saynn("This confirms what Master has in mind - it's your request to become fully his in body and mind. The thought that you are so close to it fills you both with adrenaline but also excitement and... Arousal. After all, your desire is grounded in your very subby nature ingrained deep inside.")
		saynn("[say=pc]Yes, Master! I can't wait![/say]")
		saynn("You jump from excitement.")
		saynn("[say=pc]So, where are we going? To the medical? Is there something I need to know beforehand?[/say]")
		saynn("[say=issix]I'm not sure how one can prepare for this, so my only recommendation is to enjoy the moment. And yes, we are going to the medical, same place your received your branding.[/say]")
		addButton("Walk", "Walk with your Master to the medical", "medical_walk")

	if state == "medical_walk":
		aimCameraAndSetLocName("med_lobbymain")
		saynn("You arrive at medical lobby, familiar scent of medical rooms hits you. Issix approaches Eliza.")
		saynn("[say=issix]We have an appointment.[/say]")
		saynn("[say=eliza]You do, and I still do not understand the reason for today's „reservation”.[/say]")
		saynn("[say=issix]Eliza, please. Everything has been properly filled and accepted don-[/say]")
		saynn("[say=eliza]By the captain, maybe. But I'm the head doctor of this station and I'm responsible for health of everyone, so I do want to know how are you going to use medical confessionary with that inmate of yours.[/say]")
		saynn("Issix sighs, he doesn't seem very enthusiastic about arguing with Eliza.")
		saynn("[say=issix]I assure you, {pc.name} under my supervision is not under any threat to their health. I want all the best for {pc.him}. In fact, what we are here for is entirely of their own volition.[/say]")
		saynn("[say=eliza]Is that so?[/say]")
		saynn("She looks at you expectantly, Master allows you to speak.")
		saynn("[say=pc]Yes, what Master speaks is true.[/say]")
		saynn("[say=eliza]And what did you ask your Master to do?[/say]")
		saynn("[say=issix]Look Eliza, thi-[/say]")
		saynn("[say=eliza]Then why the hell you don'd disclose what you want to do to {pc.him}?! Why is this a grand mystery?[/say]")
		saynn("Master leans to Eliza and whispers to her ears something briefly. Her look changes drastically, it goes from look of anger to one of shock, disbelief.")
		saynn("[say=issix]Can we go now, [i]Doctor[/i]?[/say]")
		saynn("[say=eliza]Y-yes, t-the room is r-ready...[/say]")
		saynn("[say=issix]Perfect.[/say]")
		if getModuleFlag("IssixModule", "QuestionnaireQ1", false) == true:
			addButton("Continue", "Continue walking", "confessionary_soul")
		else:
			addButton("Continue", "Continue walking", "confessionary_med")

	if state == "confessionary_soul":
		aimCameraAndSetLocName("medical_confessionary")
		saynn("You resume walking towards the medical room, the very same you were branded in. Master opens it, it still looks the same, though there is a single bit that sticks out, a single large bed at the very center, noteworthy are countless shackles wielded to it, for legs, arms, torso, neck, feet, wrists... The entire bed is affixed to the hooks coming out of the ground making it pretty resistant to any possible shaking coming from the patient.")
		saynn("You gulp down saliva, thinking what exactly your Master plans to do here. He closes the doors behind him and approaches the bed - he puts his paw on it, moving it slightly on top of the bedding as to check it out and explore it.")
		saynn("[say=issix]It's not sleeping quality but I assure you it should be good enough for little time I expect us to spend here.[/say]")
		saynn("[say=pc]It is entirely safe, right?[/say]")
		saynn("[say=issix]Not so much for your soul. I avoided answering what we are doing here today to Eliza because I know she wouldn't approve, or understand in the first place for that matter. Not many would. The experience, the life you seek is beyond what many could imagine wanting on your own. Many would label it as you being completely crazy, coerced or believe that I'm an abuser forcing this onto you.[/say]")
		saynn("Your Master is walking around, he puts his bag on nearby chair and takes out various items from it. Countless... Candles? He puts them around the bed in the center.")
		saynn("[say=pc]But I want it![/say]")
		saynn("[say=issix]And so you do. And yet, the taboo, the sheer irrationality of this decision is difficult to comprehend for many. You yearn for it though, to be re-made, to be a slave with no possibility of changing that ever, to serve someone until end of your days. Or perhaps you love me? Is that what it is? Whatever it is, I see it in you, there is no mistaking it - this is your deepest desire.[/say]")
		saynn("You counted at least 12 candles put around the bed in a circle, Master Issix starts to light them up.")
		if !GM.pc.isFullyNaked():
			saynn("[say=issix]Please remove all of your clothing, then you can hop on the bed, get comfortable. I'll secure you when I'm done here.[/say]")
			saynn("Your strip all of the clothing you have on you.")
		else:
			saynn("[say=issix]You can hop on the bed, get comfortable. I'll secure you when I'm done here.[/say]")
		addButton("Hop on bed", "Do as Master says", "confessionary_soul2")
		addDisabledButton("Leave", "It's a bit late for that, and you are too excited for whatever Master has planned")

	if state == "confessionary_med":
		aimCameraAndSetLocName("medical_confessionary")
		saynn("You resume walking towards the medical room, the very same you were branded in. Master opens it, it still looks the same, though there is a single bit that sticks out, a single large bed at the very center, noteworthy are countless shackles wielded to it, for legs, arms, torso, neck, feet, wrists... The entire bed is affixed to the hooks coming out of the ground making it pretty resistant to any possible shaking coming from the patient.")
		saynn("You gulp down saliva, thinking what exactly your Master plans to do here. He closes the doors behind him and approaches the bed - he puts his paw on it, moving it slightly on top of the bedding as to check it out and explore it.")
		saynn("[say=issix]It's not sleeping quality but I assure you it should be good enough for little time I expect us to spend here.[/say]")
		saynn("[say=pc]It is entirely safe, right?[/say]")
		saynn("[say=issix]I assure you'll live through it and not hurt, though you won't be the same after I'm done. However this is what you wanted, is it not?[/say]")
		saynn("[say=pc]Yes, of course, Master.[/say]")
		saynn("[say=issix]Great.[/say]")
		saynn("Your Master is walking around, he puts his bag on nearby chair and takes out various items from it, a plastic container for something, bunch of pills, some kind of device with small screen. You stand there awkwardly as Master fiddles with items, starting the device, clicking bunch of things.")
		saynn("[say=pc]...[/say]")
		saynn("He looks at you briefly before turning his sight back on the items, and says.")
		if !GM.pc.isFullyNaked():
			saynn("[say=issix]Please remove all of your clothing, then you can hop on the bed, get comfortable. I'll secure you when I'm done here.[/say]")
			saynn("Your strip all of the clothing you have on you.")
		else:
			saynn("[say=issix]You can hop on the bed, get comfortable. I'll secure you when I'm done here.[/say]")
		addButton("Hop on bed", "Do as Master says", "confessionary_med2")
		addDisabledButton("Leave", "It's a bit late for that, and you are too excited for whatever Master has planned")

	if state == "confessionary_soul2":
		saynn("You jump with your legs slightly and get on the bed, laying on your back. You can't get rid of eerie feeling considering situation you are in. What are the candles for? Is this some kind of ancient ritual or does Master want to bring in the mood? The bed is not too far from what you are used in your typical doctor's office, it's still very hard and not made for lying in for long periods of time. Smell of antiseptic in the air is slowly replaced by pleasant smell of... Incense? Looking around you see one laying on metallic surface of one of the desks.")
		saynn("[say=issix]We are almost ready. Let me help here.[/say]")
		saynn("He comes to your bed and positions your legs so they neatly fit between the reinforced metal clasps of the bed, moving some of them to fit appropriate parts of your body, next he closes them one by one, giving a pull to test sturdiness of this secure mechanism. It doesn't budge one bit. Unless something releases whatever lock makes those clasps stick - it's not coming off. Master closed at least 6 of them so far, all on your legs. First one around your {pc.feet}, next ones around your knees and finally last ones on upper part of your legs around your hips.")
		saynn("Then a single clasp on the center of your torso. Your arms are fitted and secured next followed by sturdy securement of your neck. That concludes all of the locks you've seen so far.")
		saynn("[say=issix]Those aren't necessary, but for your own security they are highly advised. Can you try to wriggle out of them?[/say]")
		saynn("You don't really see a point of this exercise. the cold metal parts could probably contain even bots with hydraulic joints. You try to wriggle to no avail, as expected.")
		saynn("[say=issix]Thank you.[/say]")
		saynn("The movement you are able to do with your head is fairly restricted. But you can hear your Master going towards the door of confessionary and flipping the light switch. Darkness only lit by dozen of candles lights up room, and you can mostly see only the ceiling. 12 points reflected in it, shimmering, flicking, left, right, up, down but never dying.")
		saynn("[say=issix]You do believe in souls. That was the first question I asked you in a questionnaire when making you my pet. Nature of souls is complicated, us - demons are spiritual creatures. Our race holds much knowledge unknown to modern science. I love both, the science and spirituality. They compliment each other.[/say]")
		saynn("Master approaches you, you can see his face, it's pretty darn serious.")
		saynn("[say=issix]Some fear us, the notion of „soul-eaters”, the demonic vampires feeding of innocent people. There is little truth to that, we are not required to feed on souls, we are very fine with food every other race eats, but the truth is that we [i]can[/i] consume souls, and my race did it in the past to those who either crossed the demonic or willingly submitted to them. To consume a soul today is to break a taboo, we don't do that these days, both because it's unnecessary and because it causes more trouble for our kind later on. But, from time to time, there is a situation where it might be safe for us to do so. That said... It's undeniable that doing so is a very special - not only it is extremely pleasurable for us to do so, but also consuming someone else's soul creates a link between two creatures no material ownership can provide. Slaves can be mentally broken, they can be physically bound - yes. But technically they can run away, they can resist. But to consume a soul is to create eternal connection. There is a loss, but there is also a change, one that makes resistance impossible. In our world this is the ultimate sacrifice after which for the consumed - there is nothing more, and it establishes clear hierarchy of owner and owned.[/say]")
		saynn("[say=issix]How do you feel about all of this, having heard it?[/say]")
		saynn("In fact, his entire explanation only made you more horny.")
		saynn("[say=pc]Haven't changed my mind, Master. Though I still wonder, why the candles and incense? I thought that's just in fantasy books.[/say]")
		saynn("[say=issix]In every fiction, there is a grain of truth, as I like to think. Candles will help guide your soul when it's out of your body, they are a natural barrier, incense will make the travel between bodies easier and more pleasurable for you, my dear pet. If you are all good, lets proceed.[/say]")
		addButton("Continue", "Continue", "confessionary_soul3")

	if state == "confessionary_med2":
		saynn("You jump with your legs slightly and get on the bed, laying on your back. You can't get rid of eerie feeling considering situation you are in. Why the restraints? How is Master preparing for what's to come? How will giving up your mind to him work exactly? Your Master is facing away from you, still working with something in his paws.")
		saynn("[say=issix]In the meantime, take this.[/say]")
		saynn("He hands you a blister pack with many tablets in it, as well as a glass of water.")
		saynn("[say=issix]Pop 2 of those, have also this.[/say]")
		saynn("You follow his commands, you take one tablet, pop it inside of your mouth and drink water to gulp it all down. Then you repeat that for another one.")
		saynn("[say=issix]Great, I'll take it away. They are simply needed to assist the module in integrating with you.[/say]")
		saynn("[say=pc]Module? Integrating?[/say]")
		saynn("[say=issix]Yes. I've made a decision that the safest and best method to fulfill your wish is to us a brain implant. Those are very well functioning and can be used for exactly this purpose, they are just... Hard to get, and generally if someone wants to break mind of another creature there are much cheaper ways to do it.[/say]")
		saynn("[say=pc]Huh? Master, are you sure it's safe? And why it specifically?"+(" Couldn't you use a Slave Candy?" if getModuleFlag("IssixModule", "Mindlessness_Walkies_Status", 0) <= 3 or GM.pc.getInventory().hasItemID("ObeyPill") else "")+"[/say]")
		saynn("[say=issix]I can assure you it's safe, in fact this method passed more safety tests than any other one that allows for changing behavior in complex brain structures. Other methods are often unreliable, can have bad side effects or straight up have a chance to kill you. Sadly brutes of the world often don't care about consequences, since finding another slave is often cheaper than using something that is reliable.[/say]")
		if getModuleFlag("IssixModule", "Mindlessness_Walkies_Status", 0) <= 3 or GM.pc.getInventory().hasItemID("ObeyPill"):
			saynn("[say=issix]As to slave candy – it's one that can have bad side effects. It's certainly very easy in application, and fairly cheap too. But if you saw amount of contraindications and excessive brain damage it can cause you'd quickly come to a conclusion this is wrong way to go about it.[/say]")

		saynn("Master's explanation puts you at ease, it does appear he did research this and knows more than you do about various methods of mind control.")
		saynn("[say=issix]And so, brain implant are the only option. Far from being cheap but it allows for more complex changes in addition to being safer of them all.[/say]")
		saynn("He turns around, seems like whatever he was doing is now done as he moves towards the upper part of bed, a large mechanical arm extends from the ground.")
		saynn("[say=issix]Let's proceed.[/say]")
		addButton("Proceed", "Continue", "confessionary_med3")


	if state == "confessionary_soul3":
		saynn("[say=issix]A word of warning, you might feel a bit of nausea during [color=#F75079]the ritual[/color]. This is expected.[/say]")
		saynn("[say=pc]Understood, Master.[/say]")
		saynn("He stands next to the bed you are laying on and puts his paw right below the metal bar going over your belly.")
		if ResourceLoader.exists("res://Modules/FoxLib/Resources/NotoSansRunic-Regular.ttf"):
			saynn("[say=issix][runic]ᛗᛟᚱᛏᚨᛚ'ᛋ ᛋᛟᚢᛚ ᛒᛟᚾᛞᛖᛞ ᛏᛟ ᛏᚺᛖ ᚠᛚᛖᛋᚺ.[/runic][/say]")
			saynn("[say=issix][runic]ᛏᛟ ᛒᛖ ᚠᚱᛖᛖᛞ ᚠᚱᛟᛗ ᛁᛏᛋ ᛒᛁᚾᛞ.[/runic][/say]")
			saynn("[say=issix][runic]ᛏᚺᛖ ᛗᛁᚾᛞ ᛏᛟ ᛒᛖ ᚠᛟᚱᛖᚡᛖᚱ ᚲᚺᚨᚾᚷᛖᛞ, ᛏᛟ ᛋᛖᚱᚡᛖ.[/runic][/say]")
			saynn("[say=issix][runic]ᚠᛟᚱ ᛒᛟᛞᚤ ᚨᛚᚱᛖᚨᛞᚤ ᚺᚨᛋ ᚨᚾ ᛟᚹᚾᛖᚱ.[/runic][/say]")
			saynn("[say=issix][runic]ᛋᛟᚢᛚ ᛋᚺᚨᛚᛚ ᛒᛖ ᛗᛁᚾᛖ.[/runic][/say]")
		else:
			saynn("Master speaks in language you don't recognize.")
		saynn("[say=issix]Repeat after me, slave:[/say]")
		saynn("[say=issix]My mortal body belongs to a Master.[/say]")
		saynn("[say=pc]My mortal body belongs to a Master.[/say]")
		saynn("You can't tell, whether it's just your mind playing tricks, or after you said that it immediately got hotter.")
		saynn("[say=issix]I devote my life to my Master.[/say]")
		saynn("[say=pc]I devote my life to my Master.[/say]")
		saynn("Your body gets warmer as well, candle light reflections in the ceiling become stronger, creating a full reflective circle above you")
		saynn("[say=issix]My Master's will is my own. And his wish is absolute.[/say]")
		saynn("[say=pc]My Master's will is my own. And his wish is absolute.[/say]")
		saynn("It becomes harder and harder to speak, as if someone was making it really hard to breathe. You start sweating profusely, and for some reason you feel as if you were twice, as if there were two of you instead of a one.")
		saynn("[say=issix]My soul is mine no more, as I offer it to my Master to his own desires. From now on, Master Issix is the owner of body, soul and mind of {pc.name} - forever. [/say]")
		addButton("Say it", "Repeat after Master", "confessionary_soul4")

	if state == "confessionary_med3":
		saynn("Master Issix puts a tiny viol inside of the container of mechanical arm before the enclosure seals itself shut. There are loud whirling sounds coming from it until they end.")
		saynn("[say=issix]We are almost ready. Let me help here.[/say]")
		saynn("He comes to your bed and positions your legs so they neatly fit between the reinforced metal clasps of the bed, moving some of them to fit appropriate parts of your body, next he closes them one by one, giving a pull to test sturdiness of this secure mechanism. It doesn't budge one bit. Unless something releases whatever lock makes those clasps stick - it's not coming off. Master closed at least 6 of them so far, all on your legs. First one around your {pc.feet}, next ones around your knees and finally last ones on upper part of your legs around your hips.")
		saynn("Then a single clasp on the center of your torso. Your arms are fitted and secured next followed by sturdy securement of your neck, last one, a sturdy but much more flexible belt goes over your forehead fixing it in place. That concludes all of the locks you've seen so far.")
		saynn("[say=issix]Those aren't necessary, but for your own security they are highly advised. Can you try to wriggle out of them?[/say]")
		saynn("You don't really see a point of this exercise. The cold metal parts could probably contain even bots with hydraulic joints. You try to wriggle to no avail, as expected.")
		saynn("[say=issix]Thank you. I'll initiate the implantation process. Do not worry, it's painless and safe. However you should prepare for some really strange feelings and thoughts that may not feel yours. The implant comes with some default template of a brain map, at integration time it is expected to feel very unusual like that.[/say]")
		saynn("[say=issix]After it's integrated you'll have to get used to the feeling of being in the second seat anyways, but that's exactly what you want.[/say]")
		saynn("He gives a little chuckle. Soon he positions the metal arm you saw earlier until its metal part gently touches tip of your head. Issix takes a step back, or so you think based on sounds. With no available head movement there isn't anything you can really see, other than the ceiling.")
		addButton("Click", "You hear a distinct click sound along with spring sound soon after", "confessionary_med4")


	if state == "confessionary_soul4":
		saynn("[say=pc]My soul is mine no more, as I offer it to my Master to his own desires. From no- on, Master Issix is the owne- of -ody, soul and min- of {pc.name} - fore-. [/say]")
		saynn("You are disoriented. You remember saying first sentence, but you didn't finish it, additionally the ceiling seems higher than usual, is the bed leviting? No, you... You are levitating. Or at least you think you are? You can see yourself, moving your mouth below you, your face expression vacant of any thought, Is this true nature of soul? It feels so freeing, to be able to move around without muscles, to swim and move. No bodily limitations, no tiredness, no stress... You look around, the circular orange wall around, you want to touch it, feel it, you try to move towards it but... You can't. The feeling of freedom is immediately taken away from you. It's like you were wrapped in a heavy chain, pulling you towards... Oh right, your Master. Master Issix as your body remembered him. He is looking at you, you above the body, the body that doesn't belong to you. He pulls his arm forwards towards you and smiles. His black eyes twinkling as he grabs you, or more accurately you are pulled towards him. It doesn't bother you though. Freedom wasn't meant for you.")
		saynn("You were always meant to be a slave. To be someone's. To serve them forever. There are others, who want freedom. But what exactly is freedom? In universe where factions fight and use pawns under them to clash against each other, in universe where you either belong to a faction or perish. Where set of rules are pushed on you, without your own permission or desire. No. You preferred to be a slave on your own terms. You yearned for not being able to think for yourself, for someone to choose how you look, how you feel, how you behave. That's what you wanted. And that's exactly what awaits you. You are led inside of Master, the pull is slow and gentle, helped by his clawed paws. Though his flesh you go until you see something mesmerizing - a ball of some sort. A core - words come to you. That's your Master's spiritual core. That's where his own soul resides, and you are now in it too. His soul blackened, but huge compared to your bright small... Bulb. You somehow know that there is no way outside of here. Once you became part of the spiritual core there is no way out. And the big blackened soul of your Master feels warm, and... Empty, it's nibbling on you, on your soul. It puts you at ease. Increasingly empty, devoured by him, fed on like a vampire biting its victim. Draining them of their blood bit by bit. You feel at ease, because you trust your Master. Even if it feels so empty, so wrong, so alien, you give in to the feeling and let the blackened orb feed on you. On whole you.")
		addButton("Darkness", "World gets dark, is it bliss? Is it death?", "confessionary_soul_wakeup")

	if state == "confessionary_med4":
		saynn("A click sounds followed by a sound of loaded spring release ring out through the confessionary. Silence is what happens next. Unsure of what is happening you open your mouth to say something but before you speak out a cacophony of feelings and memories that do not seem to be yours spring up in your mind at the same time. Some of those feelings you recognize, you felt them before during Master's trainings, some are more distant, subtle.")
		saynn("Your head aches, so many feelings at once, it's splitting your head in half. Feelings of subservience, of belonging, of need for external validation from your Master. They all were there already but now they mix with even more intense versions of themselves. Slowly, those feelings were fading, and world was becoming more and more how you remember it.")
		saynn("[say=pc]Uhhhhhhhhh, thiiis is strange...[/say]")
		saynn("[say=issix]Should be getting better now.[/say]")
		saynn("[say=pc]It iss but- Ahhh.[/say]")
		saynn("[say=issix]Some creatures compare the experience to one on illicit substances, drugs. I assume it is similar for you.[/say]")
		saynn("You see a paw before your eyes.")
		saynn("[say=issix]How many fingers do you see?[/say]")
		saynn("[say=pc]Three[/say]")
		saynn("[say=issix]Good, you can hear, you can see. How do you feel.[/say]")
		saynn("[say=pc]Dizzy, but getting better.[/say]")
		saynn("[say=issix]Splendid.[/say]")
		saynn("The metal that previously was touching your head is no longer there, moved away by the Master. You can feel the metal restraints releasing one by one, your body getting more space to move.")
		saynn("[say=issix]That's all of them. Sit down, take it easy.[/say]")
		saynn("You do as commanded, sitting on the side of medical bed, all of the strange feelings are no longer there, however you feel they didn't disappear completely, rather... Became less potent? As if they moved somewhere else, yet they are there in your head to stay for good.")
		saynn("[say=issix]Are you able to stand?[/say]")
		saynn("[say=pc]I believe so, yes.[/say]")
		saynn("You stand on your {pc.feet} just fine, there doesn't seem to be any issue with you keeping balance. Your Master comes to you and hugs your naked body. It takes you by surprise, but it's very pleasant to have another warm body next to yours, especially if this body is one of your Master.")
		addButton("End?", "Is it all? Why does it feel so... Normal?", "confessionary_med_end")

	if state == "confessionary_med_end":
		saynn("[say=pc]Uhh, so what actually changed? Other than nausea I've had I don't feel any different.[/say]")
		saynn("[say=issix]Lick it.[/say]")
		saynn("He shows a palm of his paw to you next thing you do is lick it as he commanded. Immediately you realize that you didn't [i]think[/i] of doing it, yet you immediately started licked Master's paw, you also feel no control over it, not that you feel the need to stop it, you feel quite good doing what your Master orders.")
		saynn("[say=issix]You can stop now. I hope this was enough of presentation, for both of us.[/say]")
		saynn("[say=pc]I... Wow. I..[/say]")
		saynn("[say=issix]Good "+Globals.getPlayerPetName()+".[/say]")
		saynn("He pets your head.")
		saynn("[say=issix]Let me clean up here and let's go back, alright? Enough of emotions for today, for you especially.[/say]")
		saynn("You nod happy to your Master.")
		if !GM.pc.isFullyNaked():
			saynn("You also put on your clothes.")
		addButton("Head back", "Wait for Master and head back to the corner", "corner_med_end")

	if state == "confessionary_soul_wakeup":
		saynn("You(?) open your eyes, there is blurred darkness. You(?) blink a few times. The blur sharpens into more defined shapes. You were...")
		saynn("[say=issix]{pc.name}[/say]")
		saynn("[say=pc]Right, that was my(?) name, I(?)...[/say]")
		saynn("[say=issix]Feel strange. Disoriented. Yes. That's how it is. Take time.[/say]")
		saynn("You(?) instinctively raise your(?) paw before your(?) face, it looks familiar, its Master's. Or yours(?)")
		saynn("[say=issix]All of it is mine, remember? The concept might be confusing to you still, that's normal. What is you, what is me...[/say]")
		saynn("[say=issix]„You” still exist, in some form. It is not whole, no. Not after today. It's part of you. You have some control, over body I own. Nobody, not even us - demons can possess two bodies at the same time, that's just not how spirits work. For sake of simplicity, you can still think of yourself as you, and your body as yours. It's not factually correct, but spiritual concepts are difficult to mortals. Deep inside you know that what is you is deeply complicated and you are no longer in charge of your life. If it makes it any easier, think of me - your Master as some sort of omnipresent guard - making choices for you, seeing what you see, thinking for you sometimes... You don't have to always tell me what you think, I'll know it. Just like I know you are starting to feel better now. Sit now, I already unlocked the bindings.[/say]")
		saynn("You simply sit. Though you didn't feel like you did, your entire body moved on its own, like a puppet on strings.")
		saynn("[say=issix]I like this comparison a lot - a puppet on strings. Here I made the decision and moved for you. But this is now how it always will be. Try to wave to me.[/say]")
		saynn("You put the paw in the air and wave to your Master. This time it feels like the wave was fully thought and done by „you”.")
		saynn("[say=issix]It will require getting used to it, you'll get it eventually. Stand now.[/say]")
		saynn("You stand, it felt weird, as if part of the movement was done by you, and part was coming from Master. As you stand next to the bed your Master wraps his arms around your feeble and weak feeling body and hugs it.")
		saynn("[say=issix]My lovely little pet. It is only my hope that you are at peace now, being fully mine. I promise to not hurt you... Too bad, anyways.[/say]")
		saynn("He chuckles.")
		saynn("[say=issix]Let's go back, okey? That's enough of all of this for today.[/say]")
		saynn("Before both of you go, he grabs your paw like a parent grabs the hand of their child and gives you a stern squeeze. Thoughts flood into your mind - it's for you, since the body feels weakened by the ritual. And so you walk slowly towards the doors, Master's bag already packed back on his back. There is no trace of candles on the ground, he must have packed them when you were „out”. You leave.")
		addButton("Corner", "Come back at the corner", "corner_soul_end")

	if state == "corner_soul_end":
		aimCamera("hall_ne_corner")
		setLocationName("The Corner")
		saynn("You eventually arrive back at the corner. Kinda slumping forward with your body still getting used to it all.")
		saynn("[say=issix]Hey, everything good here?[/say]")
		saynn("Master looks towards Hiisi, who along with two other pets looks with interest at you and your Master.")
		saynn("[say=hiisi]That's correct, Master. May we ask?[/say]")
		saynn("[say=issix]You may, but stay respectful, I'll not answer every question you have either.[/say]")
		saynn("[say=azazel]So... Is {pc.name} still there?[/say]")
		saynn("[say=pc]I.. Yes, it's still me.[/say]")
		saynn("[say=azazel]So what changed?[/say]")
		saynn("Lamia is squinting their eyes as if trying to see something invisible.")
		saynn("[say=pc]We've been at medical and Master took me as his own, again. It felt... Strange.[/say]")
		saynn("[say=hiisi]May me ask how?[/say]")
		saynn("You were about to answer but your mouth didn't even open. That's now what your Master wants you to do.")
		saynn("[say=issix]You may not. I love you all, but this better be between me and {pc.name}.[/say]")

		saynn("[say=hiisi]Understood, apologies Master.[/say]")
		saynn("Lamia holds their paw in the air, Master allows them to ask. He shows a drawing with you arrow pointing away from you towards lots of scribbly mess and another arrow pointing again at you, looking a bit different. Then the arrow comes from the cribbly mess and points towards Lamia, Hiisi and Azazel with a question mark.")
		saynn("[say=azazel]Lamia asks whether Master wants us all to go through what Master did to {pc.name}[/say]")
		saynn("Azazel puts it bluntly")
		saynn("[say=issix]Please, no! What I did to {pc.name} was a result of their own want. They yearned for making them my pet forever in body and mind. But you are my pets and I love you just the same. You don't need to go through the same to be my pets, understood?[/say]")
		saynn("It seems like what Issix has said made all of them less tense, relieved.")
		saynn("[say=issix]Anyways, to brighten the mood, who wants some cookies?[/say]")
		saynn("Everyone started cheering up for the offer, Lamia almost knocked the Master out of their chair as Master pulled out a jar of cookies, you got two, one you stored and one you ate right there, with others.")
		saynn("It appears that this was everything that was required of you today. You feel.. Happy, fulfilled, and a bit emptier than usual. But that's the price you were willing to pay for your dream.")
		addButton("End", "You are a great pet, forever", "endthescene")

	if state == "corner_med_end":
		aimCamera("hall_ne_corner")
		setLocationName("The Corner")
		saynn("You eventually arrive back at the corner.")
		saynn("[say=issix]Hey, everything good here?[/say]")
		saynn("Master looks towards Hiisi, who along with two other pets looks with interest at you and your Master.")
		saynn("[say=hiisi]Yes, Master. May we ask?[/say]")
		saynn("[say=issix]You may, but stay respectful, I'll not answer every question you have either.[/say]")
		saynn("[say=azazel]So... Is {pc.name} still there?[/say]")
		saynn("[say=pc]I.. Yes, it's still me.[/say]")
		saynn("[say=azazel]So what changed?[/say]")
		saynn("Lamia is squinting their eyes as if trying to see something invisible.")
		saynn("[say=pc]We've been at medical and Master made me all his - in body and mind. It felt... Strange.[/say]")
		saynn("[say=hiisi]May me ask how?[/say]")
		saynn("You were about to answer but your mouth didn't even open. That's now what your Master wants you to do.")
		saynn("[say=issix]You may not. I love you all, but this better be between me and {pc.name}.[/say]")
		saynn("[say=hiisi]Understood, apologies Master.[/say]")
		saynn("Lamia holds their paw in the air, Master allows them to ask. He shows a drawing with you arrow pointing away from you towards lots of scribbly mess and another arrow pointing again at you, looking a bit different. Then the arrow comes from the cribbly mess and points towards Lamia, Hiisi and Azazel with a question mark.")
		saynn("[say=azazel]Lamia asks whether Master wants us all to go through what Master did to {pc.name}[/say]")
		saynn("Azazel puts it bluntly")
		saynn("[say=issix]Please, no! What I did to {pc.name} was a result of their own want. They yearned for making them my pet forever in body and mind. But you are my pets and I love you just the same. You don't need to go through the same to be my pets, understood?[/say]")
		saynn("It seems like what Issix has said made all of them less tense, relieved.")
		saynn("[say=issix]Anyways, to brighten the mood, who wants some cookies?[/say]")
		saynn("Everyone started cheering up for the offer, Lamia almost knocked the Master out of their chair as Master pulled out a jar of cookies, you got two, one you stored and one you ate right there, with others.")
		saynn("It appears that this was everything that was required of you today. You feel.. Happy, fulfilled, and less burdened by choice. But that's the price you were willing to pay for your dream.")
		addButton("End", "You are a great pet, forever", "endthescene")


func _react(_action: String, _args):
	if _action == "medical_walk":
		processTime(5*60)

	if _action == "confessionary_soul":
		processTime(10*60)

	if _action == "confessionary_soul2":
		processTime(5*60)

	if _action == "confessionary_soul3":
		processTime(8*60)

	if _action == "confessionary_soul4":
		processTime(8*60)

	if _action == "confessionary_med":
		processTime(10*60)

	if _action == "confessionary_med2":
		processTime(5*60)

	if _action == "confessionary_med3":
		processTime(12*60)

	if _action == "confessionary_med4":
		processTime(8*60)

	if _action == "confessionary_soul_wakeup":
		processTime(50*60)

	if _action in ["corner_soul_end", "confessionary_med_end"]:
		processTime(20*60)
		GM.pc.getInventory().addItemID("Cookie")
		GM.pc.addStamina(15)
		setModuleFlag("IssixModule", "Noncon_Mode_Enabled", true)
		increaseModuleFlag("IssixModule", "Pet_Time_Interaction_Today", 2*60*60)

	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

