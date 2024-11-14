extends SceneBase

func _init():
	sceneID = "IssixSlaveryIntro"


func _run():
	if(state == ""):  # TODO Involve Lamia, Azazel and Hiisi
		playAnimation(StageScene.Duo, "kneel", {npc="issix", npcAction="stand"})
		saynn("[say=pc]Master Issix, can we talk about me becoming your pet?[/say]")
		saynn("He grins as you say that. His black void eyes once again stare deep down into you, they drill you to the very core. You kneel before your new Master, knowing that mere minutes separate you from losing whatever freedom you have left in this place.")
		saynn("Issix stands, walks around you, his eyes studying again every part of your body. He salivates, you can feel it. You are his morsel, pet to be.")
		saynn("[say=issix]I'd love to devour you right here, right now, but I need to ask you a few more things before I do that.[/say]")  # Beastars? Anyone? :) https://youtu.be/zcNYc_r9GrU
		saynn("[say=issix]Before I can make you my pet, I need you to understand what it means. As you've likely already seen - all of my pets are my property. I want you to make no mistake, whether I'm a „kind” master or not, I'm still their master with everything this entails. They understand they are inferior to me and I make most of their decisions for them. They gave themselves to me willingly. On their backs they have my brand engraved onto their skin and fur forever. Everyone who sees their back sees my brand and knows who they belong to. The brand is non-negotiable and you will have it too if you choose to become my pet.[/say]")
		saynn("[say=issix]I'm an understanding master however. I'll give you a choice what do you want to become under my command. You can choose to continue being a prison whore like you've been until now, you got plenty of reputation for yourself there and I'll benefit from this too. I'll expect large share of your profits. You can also join Azazel, Lamia and Hiisi in simply being my pet, in which I expect you to spend time with them and myself on daily basis.[/say]")
		saynn("[say=issix]No matter what choice you make here, I do not tolerate damage of my property, and you'll be under my protection. My protection however, is not far reaching, I can do a lot, but messing with the guards is not an option. If you choose to start a war with Captain or guards - it's your business.[/say]")
		saynn("[say=issix]Any questions?[/say]")
		saynn("[say=pc]Will I have time for myself? Other pets are leashed here all the time.[/say]")
		saynn("[say=issix]They do so of their own volition. They don't believe there is a better place to be than at my side, I give them place and they worship me as their master deserves. But if you so desire, you do not have to be at my side all the time. However I'll still have expectations of you, you will be my tool to mold and I expect you to be at my disposal at all times.[/say]")
		if GM.pc.getGender() == Gender.Female:
			saynn("[say=issix]Also, as you have seen, all of my pets are masculine identifying as male pets. I've never had a female before. I don't say that to make you scared or anything, I'm fairly certain in my ability to train and care for pets of all gender expressions, but I figured you should take that into consideration before you make a decision. My little... Harem in here is very male dominated.[/say]")
		addButton("Slave", "Tell Issix you are ready to become his slave (WARNING: this will make the game generally harder and may involve a tedious daily tasks, but is the only way to continue PC slavery option)", "acceptslavery")
		addButton("Need time", "Tell Issix you need to think more about this decision", "maybelater")
		addButton("Reject", "Tell Issix you will not become his slave", "rejection")

	if state == "acceptslavery":
		playAnimation(StageScene.Duo, "kneel", {npc="issix", npcAction="stand", bodyState={leashedBy="issix"}})
		GM.main.setModuleFlag("IssixModule", "Quest_Status", 11)
		saynn("[say=issix]That's most wonderful to hear. You've had multiple opportunities to reject becoming my pet and yet you persisted. Good.[/say]")
		saynn("[say=issix]From this time onward, you'll always refer to me as Master or Master Issix. As my pet, I consider your body belongs to me now.[/say]")
		saynn("[say=issix]Tell me now, what role would you like to accept as defacto my slave? A pet or a prostitute?[/say]")
		addMessage("You gained 100 experience for completing „Becoming something lesser” quest")
		addButton("Pet", "Tell Issix you'd rather become his pet, just like his other 3 pets", "petrole")
		addDisabledButton("Prostitute", "This option is not yet available in the mod, it is planned in the future however")  # TODO 1.1

	if state == "petrole":
		setModuleFlag("IssixModule", "PC_Enslavement_Role", 1) # pet
		saynn("[say=pc]I'd like to become your pet, Master.[/say]")
		saynn("[say=issix]Of course. In this case, you'll be my pet from now on. Let's discuss what I expect of you.[/say]")
		saynn("[say=issix]You are free to talk. But you have to know when to talk. I'm sure you will learn your place after you spend some time in here. My other pets are already well trained, you can follow their lead on this. [/say]")


	# The following lines pertain to a functionality which in first iteration I wanted to be one of the first choices player makes when it comes to enslavement, stripping them of future choices. However as I develop the mod I think there are various reasons (wanting to be over with initial mod release, leaving significant changes to gameplay available as a reward for progression) why I decided to develop this functionality later as something player can obtain as a reward

	# if state == "petrole":
	# 	setModuleFlag("IssixModule", "PC_Enslavement_Role", 1) # pet
	# 	saynn("[say=pc]I'd like to become your pet, Master.[/say]")
	# 	saynn("[say=issix]Excellent. In that case... There is one, maybe final question for you today. None of my pets decided on that, but I figured you might be interested. I'm not going to lie, I'm not too fond of this method as I like my pets to still have some control, but what I can offer you is to completely give yourself to me. not just your body, but your very SOUL as well. Just like with becoming my pet, once you make this decision, there is no going back. You will do exactly as I say, you won't have an option to disobey me. I'll become extension of your will, at best you'll have second wheel - entirely insignificant, a mere puppet. I'll own you fully, and you'll be just a husk of yourself.[/say]")
	# 	saynn("[say=issix]If that's not for you that's all the better. It's an option for those who not only want to dedicate their life in servitude, but also surrender the keys to their soul and mind - to become broken beyond any comprehension. Some people call it becoming a drone. Some people call it simply killing a person. I prefer „surrendering soul”. Kinda romantic, don't you think? Or perhaps it's just demon humor. Either way, tell me, what do you want?[/say]")
	# 	addButton("Yes", "Tell your Master that you want him to take your soul (WARNING: this is EXTREME, you won't have a chance to avoid certain content, it will literally strip you of choice and make your game MORE DIFFICULT. Not for the fainthearted, CW: parasite, soul vore, non-con, watersports, blood)", "becomepuppet")
	# 	addButton("No", "Tell your Master that you wish to retain your mind (recommended)", "normalroute")
 #
	# if state == "becomepuppet":
	# 	playAnimation(StageScene.Duo, "kneel", {npc="issix", npcAction="stand", bodyState={leashedBy="issix"}})
	# 	setModuleFlag("IssixModule", "PC_Enslavement_Noncon", true)
	# 	saynn("[say=pc]I-I'd like that. I'd want to become your servant in mind and body. I don't want control of my own, Master.[/say]")
	# 	saynn("[say=issix]That's okey my pet. That's your choice you are making, your LAST choice. If you are truthfully ready to give me everything you have, to become a forever puppet of mine then I'll make your last wish true.[/say]")
	# 	saynn("He leans forward and attaches a leash to your collar.")
	# 	saynn("[say=issix]Let's go then. We will do that in my cell. Azazel, you know the drill, I'm out till tomorrow, you know where to find me.[/say]")
	# 	saynn("[say=azazel]Of course, Master![/say]")
	# 	addButton("Continue", "Follow your Master", "walktocell")
 #
	# if state == "walktocell":
	# 	processTime(5*60)
	# 	aimCamera("cellblock_red_nearcell")
	# 	setLocationName("Issix's Cell")
	# 	saynn("You arrive at his cell. It feels oddly small, even claustrophobic with you two in it. Has the essentials and that's about it. It surprises you considering what character Issix is, but then, he spends most of his time in the main hall with his pets. Perhaps he doesn't need luxury in here.")
	# 	saynn("[say=issix]Welcome. This is my cell. It's small but enough for us two. I'd say get comfortable but it's not what we are going to do here. Can you just stand behind me? Great.[/say]")
	# 	GM.pc.addConsciousness(-0.2)
	# 	if getModuleFlag("IssixModule", "QuestionnaireQ1", "false"):
	# 		saynn("He kneels next to his stash in opposite side of the cell from the entrance. His paws are searching, looking for something. He pulls out various restraints.")
	# 	else:
	# 		saynn("He kneels next to his stash in opposite side of the cell from the entrance. His paws are searching, looking for something. Finally he puts aside what looks to be googles? Mask? Hypnovisors? Hard to tell. He pulls various restraints. His search continues for a while longer. He does find what he was looking for, pulling some kind of small object you didn't have the time to see before he hid it behind his paw.")
	# 	saynn("[say=issix]Wonderful. I think that's should be... It. Yeah, now, put your paws above.[/say]")
	# 	if getModuleFlag("IssixModule", "QuestionnaireQ1", "false"):
	# 		addButton("Comply", "Put your paws in the air", "soulfull")
	# 	else:
	# 		addButton("Comply", "Put your paws in the air", "soulless")
 #
	# if state == "soulfull":
	# 	playAnimation(StageScene.HangingDuo, "idle", {pc="pc", npc="issix", bodyState={naked=true}, npcBodyState={naked=true}})
	# 	saynn("[say=issix]Good, good.[/say]")
	# 	saynn("He attaches your wrists to the ceiling. Your feet paws comfortably stand on the floor, though if you were one centimeter shorter you'd likely have to make effort to stand. He then picks up ankle cuffs attaching them to the floor, you can't really do much in this state even if you wanted to.")
	# 	saynn("[say=issix]Safety and comfort measures. I think you are ready.[/say]")
	# 	saynn("He circles you, as much as he can with space in his cell. Being so vulnerable, your fur in full display. He touches parts of your body every now and then. You are hanging like meat on a hook.")
	# 	saynn("[say=issix]I never thought anyone would be so easy. You willingly want to give me your very soul. I can't complain, though it makes me wonder, why? Do you really hate life so much you don't want to participate in it? Do you hate choices? Do you trust me so much, that you think I'll be better you than yourself? You will soon stop mattering in the slightest. You will be rendered nothing. There will be only me and what I want. To go this far and give up your very self to me... I can't say I understand, mortal. Maybe you are just a sucker for someone else taking control...[/say]")
	# 	saynn("You open your mouth to explain yourself, he puts his finger on your lips.")
	# 	saynn("[say=issix]It doesn't matter. What you have to say no longer matters. You made your last choice 10 minutes ago. Now, the only thing that matters is what I say and think.[/say]")
	# 	saynn("You nod your head in silence.")
 #
	# if state == "soulless":
	# 	playAnimation(StageScene.HangingDuo, "idle", {pc="pc", npc="issix", bodyState={naked=true}, npcBodyState={naked=true}})


	if state == "normalroute":
		playAnimation(StageScene.SexMissionary, "tease", {pc="issix", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		setModuleFlag("IssixModule", "PC_Enslavement_Noncon", false)
		if getModuleFlag("IssixModule", "QuestionnaireQ1"):
			saynn("[say=pc]I'd prefer to retain my soul, if that's okey with you Master.[/say]")
		else:
			saynn("[say=pc]I'd still prefer to retain my mind like Azazel and your other pets, Master.[/say]")
		saynn("[say=issix]But of course, you are most welcome to it. Retaining what little autonomy you have is an option I prefer for you myself.[/say]")
		saynn("His face is filled with a cruel smile once again.")
		if !GM.pc.isFullyNaked():
			saynn("[say=issix]Now, with decisions made, I need to tell you what I intend to happen. I want you to strip naked for me. I want to see your entire body again, completely bare. I want to know what I'm working with. You'll have to lose whatever conception of shame you have and embrace being completely naked as normal. At least for now. You will still be able to wear your inmate uniform, I don't mind. But you have to lose inhibitions you have.[/say]")
			#GM.pc.unequipAllRestraints()
		else:
			saynn("[say=issix]You are such a good pet that you are already naked. That's really good, as I want to know every part of your body before I have fun with you.[/say]")
		for slot in GM.pc.getInventory().getEquippedItems():  # Force unequip all items, why is there getEquippedItems and getAllEquippedItems doing the same thing lol
			saynn("Issix took off your "+GM.pc.getInventory()[slot].getVisibleName()+".")
			GM.pc.getInventory().unequipSlot(slot)
		saynn("He grabs a leash hanging from the armrest of his chair, shows it to you.")
		saynn("[say=issix]Ready to become my pet for real this time? You've already given your fate into my paws, we might as well get this over with.[/say]")
		saynn("He once again raises your head by your chin, this time more forcefully than last time. With ease he attaches the end of the leash and gives it some pulls.")
		saynn("[say=issix]You look almost the part. We will take care of lack of my brand on your beautiful body some other time. Right now I want to taste your body, I want to claim you.[/say]")
		saynn("Your new Master gets on his own knees to your level. You can feel the stare of his other pets on you, looking as you become Issix's pet, just like them. Surrendering yourself to an alpha. His smell becomes much more potent now, it's as if he is now in your head. For the first time you truthfully feel him. Without word of warning he dives in and forces his own tongue into your mouth, giving you a deep deep kiss. He explores your mouth, it doesn't feel at all as if his tongue is truthfully just a guest in your mouth, no, he owns you. He is just exploring his property in full, from the inside. You let out a moan, feeling his saliva mixing with yours, both of your mouths becoming more and more messy with saliva. You want him to continue, even if forceful his kiss still feels so right. His tongue mingling with yours, checking out your teeth. Eventually he pulls out, a string of saliva connecting you two.")
		saynn("[say=issix]That was gooood. Let's us proceed to the main dish, I've waited long for this.[/say]")
		saynn("He pushes you onto your back on the blanket")
		addButton("Continue", "Give yourself to Master Issix", "normalroute2")

	if state == "normalroute2":
		playAnimation(StageScene.SexMissionary, "sex", {pc="issix", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("His paw gently ruffles the fur on your chest. All of this beautiful body, mine now. He is delighted by your body. His paws going on the sides of your {pc.thick} body. After he is content, he lays on you, pinning you to the blanket below. His warm reeking with manly musk - alpha musk grinding into your belly. His face so close to yours.")  # TODO Fur?
		if GM.pc.isInHeat():
			saynn("[say=issix]I feel your body yearns for me. You're a bitch in heat. You want me to take care of that little problem, do you? You want me to breed you. Is this why you came to me today? Do you need to be bred so much that you are willing to become my pet? No matter. What done is done. You'll be crying for my children in no time.[/say]")
		else:
			saynn("[say=issix]I feel like I'm missing something. And I think I know what it is. Your body is not squirmy enough, I want you to be more needy that this.[/say]")
			saynn("He fishes a package with pills in it. Takes one pill of it, opens your mouth and pushes it in. You gulp it in, imagining but not knowing what is it.")
			saynn("[say=issix]It will help you be more receptive to me in few moments, just relax and take it in.[/say]")
			saynn("You feel effects shortly after. Your body convulses as the primal need for mating becomes your body's priority.")
			saynn("[say=issix]Yesss. Do you feel it? Do you feel innate desires? The need to submit to your master so he can claim you in every way he desires? I promise I'll make it exquisite.[/say]")
		if GM.pc.hasVagina():
			saynn("Issix raises one of his paws with a leash in the air, pulling your head higher while he gives you another deep kiss. At the same time, his second paw prepares your {pc.pussyStretch} pussy, he inserts his finger, then two fingers and pistons your love tunnel in and out further putting you into breeding frenzy,")
		else:
			saynn("Issix raises one of his paws with a leash in the air, pulling your head higher while he gives you another deep kiss. At the same time, his second paw explores your backdoor. He puts one finger in, using your anal juices, stretching it for his grand entrance, spiraling you further into orgasmic joy.")

		saynn("[say=issix]Mmm. A new pet to break in for the first time.[/say]")
		saynn("He teases your hole with his relatively large penis, rubbing it. His bod making contact with your fur in every place, your mind losing itself in orgasmic bliss. He whispers sweet promises of what he will do to you in your ear.")
		saynn("[say=issix]I hope you are ready, I'm not waiting for you.[/say]")
		saynn("Deep inside you already want him to claim you, his prolonged teasing and preparations, while giving you immense amount of pleasure, deny you the grand finale, the climax of it all. You beg for him to enter you.")
		saynn("[say=issix]Good pet, you learned how to beg so quickly. This deserves a little reward.[/say]")
		saynn("Finally your prayers get answered. You can feel him slowly, gently entering you. Every thrust ever so deeper inside. His penis disappearing out of view, and yet you can feel it more than ever, inside of you, claiming yet even more of you")

		saynn("[say=issix]Fuck yeah, you've trained for this. This will really be easy.[/say]")
		addButton("Continue", "", "normalroute3")

	if state == "normalroute3":
		playAnimation(StageScene.SexMissionary, "fast", {pc="issix", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("[say=issix]Keep that up and some day you may become as good as Azazel at this. Ahhh.[/say]")
		saynn("[say=pc]I, ahhh. Will tryyy.[/say]")
		saynn("Various moans coming from both of you, you catch glimpses of Azazel's lustfully jealous looks and rather neutral looks of the other pets or passerby's. Every passerby seeing a dragon-demon thrusting into your body like it was a daily ritual. And you think, it might just be one, your thoughts of submission making you feel like you wouldn't mind, no. You'd LOVE that. Issix's thrusts are synchronized, not erratic, not irregular. He takes his time with you, very slowly (and barely noticeably) speeding up.")
		saynn("[say=issix]Still holding up? Lets see how you handle THIS.[/say]")
		saynn("Suddenly he started thrusting deeper, his member feeling bigger than before, spreading your insides.")
		saynn("[say=pc]AWwhhhhhhhh[/say]")
		saynn("Seemingly unable to communicate anymore due to bliss resulting from your breeding. You realize at some point that your are very close to your climax. You can only imagine that your Master so lost in his breeding frenzy is in similar situation.")
		saynn("[say=issix]I'm. Close. PET.[/say]")
		addButton("Climax", "Reach your own climax", "normalroute4")

	if state == "normalroute4":
		playAnimation(StageScene.SexMissionary, "inside", {pc="issix", npc="pc", pcCum=true, npcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		if GM.pc.hasVagina():
			saynn("Your whimpers finally reach the apex and you climax, covering your Master's hard cock with your pussy juices as he continues to ram you.")
		else:
			saynn("Your whimpers finally reach the apex and you climax, covering the blanket underneath with your sperm, your Master, however, is not done breeding your ass.")
		saynn("Although you can feel that those are his last thrusts, his speed declining. You are as ready as you ever will be for your Master's first breeding of you. And just moments later he gives in and puts his virile load into your " + ("vagina" if GM.pc.hasVagina() else "anus") + ". He stays inside of you for a minute, as he recollects himself.")
		saynn("[say=issix]First claiming done. Though, I would prefer if my seed stayed in you for a while longer. Wouldn't you want that?[/say]")
		saynn("[say=pc]Yes, Master, I'd love that.[/say]")
		saynn("You vibrate with pleasure as your Master plugs your "+("vagina" if GM.pc.hasVagina() else "hole") + " with a plug.")
		saynn("[say=issix]Good pet. Let it stay inside of you and continue making you mine.[/say]")
		addButton("Continue", "End the breeding session", "normalroute5")

	if state == "normalroute5":
		playAnimation(StageScene.Duo, "kneel", {npc="issix", npcAction="stand", bodyState={leashedBy="issix"}})
		saynn("He stands up, still holding his end of leash connected to a collar on your neck. He puts his foot on your belly to further ingrain in your mind that he has control over you now.")
		saynn("[say=issix]That was good. I expect of you to allow me to breed you just like this when I feel like it. Understood?[/say]")
		saynn("[say=pc]Yes..,[/say]")
		saynn("[say=issix]Yes?[/say]")
		saynn("[say=pc]Yes Master Issix.[/say]")
		saynn("[say=issix]Good puppy.[/say]")  # TODO puppy/kitten need to find a way to put those.
		saynn("He takes his foot out of your belly.")
		if(OPTIONS.isContentEnabled(ContentType.Watersports)):
			saynn("[say=issix]For today there is one more thing for me to do. Azazel, can you tell my new pet what it is?[/say]")
			saynn("[say=azazel]Master wants... To leave his mark on you, the other kind of mark.[/say]")
			saynn("Issix grins as he slightly tugs on your leash.")
			saynn("[say=issix]Very convenient timing, because I were just about to go to toilet before you showed up. Let me just...[/say]")
			saynn("He takes out the blanket from under your back in a swift manner. A cold, hard floor makes contact with your floor. Those blankets have a very important function after all. Your Master stands above you, his feet on both sides of your body, his penis directed at your head, he is about to pee.")
			addButton("Open mouth", "Open your mouth and close your eyes in anticipation of the golden shower", "pissnormalmouth")
			addButton("Stay closed", "Don't open your mouth in anticipation of the golden shower", "pissnormal")
		else:
			saynn("[say=issix]This will be all for today. Wouldn't want to reward you too much in just one day, you could get the wrong idea. I expect to see you tomorrow, just like every other day. I know you are busy. Other than that, feel free to spend time with my other pets.[/say]")
			addButton("Leave", "Leave the place", "endthescene")

	if state == "pissnormalmouth":
		saynn("You open your mouth, close your eyes, showing you don't mind your Master's nectar in your mouth. You want to taste it, to feel it at deeper level. To be marked in as many ways as you can. Seeing this Issix chuckles and you feel impact of his fluid assulting your face. It falls on various parts of your face, sometimes inside, mostly around. The sweet and bitter taste hits you like a train, the aroma of your master in your nose becomes truthfully pungent. You gulp down his piss.")
		saynn("[say=issix]Didn't think you have that in you, a natural piss slut. What a treat.[/say]")
		saynn("His stream moves towards your lower part of the body, for a brief moment hitting your neck but then staying on chest, arms, your not so private anymore parts as well as your legs. His objective very clear - to cover as much of your body as possible, to mark you - no, to drench you in his smell. As his stream from his hose drains and he stops pissing, while you feel there are still one or two dry spots on your body, the rest is wet with your Master's piss. You reek of your Master stronger than any other of his pets. Is that introductory treatment? Why are you so special? You ask yourself, your questions answered shortly after.")
		saynn("[say=issix]Don't be surprised. I like to mark my new pets GOOD, I want you to get used to my smell. And this is the best way I can think of. I expect you to come back tomorrow reeking of day old piss, my piss, do you understand? I don't want you to shower until we meet again.[/say]")
		saynn("This is your order, coming from your Master. Do not shower, take in his smell and sleep with it.")
		saynn("[say=pc]Your order is my command, Master![/say]")
		saynn("After obtaining permission from your Master you stand up. Feeling small ticking in your fur as the fluids travel downwards along your body. You'll be dripping with his piss for a while. Your Master produces some kind of a cloth to clean up his piss from the floor and put your blanket back in this place. You leave.")
		saynn("[say=issix]This will be all for today. Wouldn't want to reward you too much in just one day, you could get the wrong idea. I expect to see you tomorrow, just like every other day. I know you are busy. Other than that, feel free to spend time with my other pets.[/say]")
		addButton("Leave", "Leave the place", "endthescene")

	if state == "pissnormal":
		saynn("You decide to keep your mouth closed. You close your eyes and await. Finally, you can feel it, a shower of your Master's piss landing on various parts of your face. The aroma of your master in your nose becomes truthfully pungent.")
		saynn("[say=issix]A shame you seem a bit reluctant with taking in my sweet nectar. We will work on that.[/say][/say]")
		saynn("His stream moves towards your lower part of the body, for a brief moment hitting your neck but then staying on chest, arms, your not so private anymore parts as well as your legs. His objective very clear - to cover as much of your body as possible, to mark you - no, to drench you in his smell. As his stream from his hose drains and he stops pissing, while you feel there are still one or two dry spots on your body, the rest is wet with your Master's piss. You reek of your Master stronger than any other of his pets. Is that introductory treatment? Why are you so special? You ask yourself, your questions answered shortly after.")
		saynn("[say=issix]Don't be surprised. I like to mark my new pets GOOD, I want you to get used to my smell. And this is the best way I can think of. I expect you to come back tomorrow reeking of day old piss, my piss, do you understand? I don't want you to shower until we meet again.[/say]")
		saynn("This is your order, coming from your Master. Do not shower, take in his smell and sleep with it.")
		saynn("[say=pc]Your order is my command, Master![/say]")
		saynn("After obtaining permission from your Master you stand up. Feeling small ticking in your fur as the fluids travel downwards along your body. You'll be dripping with his piss for a while. Your Master produces some kind of a cloth to clean up his piss from the floor and put your blanket back in this place. You leave.")
		saynn("[say=issix]This will be all for today. Wouldn't want to reward you too much in just one day, you could get the wrong idea. I expect to see you tomorrow, just like every other day. I know you are busy. Other than that, feel free to spend time with my other pets.[/say]")
		addButton("Leave", "Leave the place", "endthescene")

	if state == "maybelater":
		saynn("[say=pc]I need to take my time to make my decision... It's a lot to take in.[/say]")
		saynn("[say=issix]Take your time. I do believe you are ready, but you have to make the final choice by yourself. I'll be waiting.[/say]")
		saynn("[say=pc]Thank you Master Issix.[/say]")
		saynn("He smiles and lets you go.")
		addButton("Continue", "End the conversation", "endthescene")

	if state == "rejection":
		GM.main.setModuleFlag("IssixModule", "Quest_Rejected_By_Issix", 4)
		saynn("Issix raises his eyebrows. This was not an answer he expected or wanted to hear.")
		saynn("[say=issix]That's... Surprising. You are a perfect candidate, you could become MY pet. MY plaything, and yet you reject it? Why? Is it that you are worried about being under someone? You don't like my other pets? Did you not like the walk? Are you scared of questions I asked you during questionnaire? Did the talk about forever having my mark burned into you scare you? Do you value your time so much, that you'd rather not spend time with me and my harem? Or do you value your life so much that you think you'd do a better job living it by yourself than under me?[/say]")
		saynn("He grew visibly more frustrated with each question. Each question, adding more oil into already enormous flames consuming everything around. His aura so intense, his eyes so enraged. This version of the dragon-demon is the most intimidating creature you've ever seen, so far from the image of him you've had in your head for past days doing his tasks and so on. And yet... He closes his eyes, connects palms of his paws and takes a deep breath. His aura changes again, it's calm and composed, as if it was a completely different person from the one you've seen just seconds ago. He opens his eyes.")
		saynn("[say=issix]I must apologize. I had certain expectations that were not met, however I realize I were in no position to make demands of you. You have made your decision and as I said, I have to respect it. Thank you for letting me know what is your final decision. I'll be here if you ever want to donate restraints. Have a good day, {pc.name}.[/say]")
		saynn("His voice still raspy, but composed. His dominant persona doesn't handle well „no” as an answer, however you aren't his pet, at least today. And now, you never will. That was your decision, however.")
		addButton("Continue", "End the conversation", "endthescene")

func _react(_action: String, _args):
	if _action == "walktocell":
		runScene("ParadedOnALeashScene", ["issix", GM.pc.getLocation(), "cellblock_red_nearcell", [
			"We're almost there, don't worry",
			"Hope you are ready, there is no going back from this",
			"Looking forward to letting go?",
			"Thinking is too hard for you, that's why you came to me. Don't worry, I'll relieve you of this burden soon",
			"You've made your choice, very soon you won't be able to make another"
		], "cellblock_red_nearcell", "crawl"])

	if _action == "soulfull":
		var cuff = GlobalRegistry.createItem("inmateanklecuffs")
		GM.pc.getInventory().forceEquipStoreOther(cuff)

	if _action == "acceptslavery":
		GM.pc.addExperience(100)
		setModuleFlag("IssixModule", "Misc_Slavery_Info", {"day_enslaved": GM.main.getDays(), "scenes_seen": []})
		setModuleFlag("IssixModule", "Progression_Points", 1)
		setModuleFlag("IssixModule", "Progression_Day_Next", GM.main.getDays()+1)

	if _action == "normalroute2":
		var itemRef = GlobalRegistry.getItemRef("HeatPill")
		if(itemRef == null):
			return
		itemRef.useInSex(GM.pc)

	if _action == "normalroute4":
		if GM.pc.hasVagina():
			GM.pc.cummedInVaginaBy("issix", FluidSource.Penis, 150.0)
			var item = GlobalRegistry.createItem("vaginalplug")
			GM.pc.getInventory().forceEquipByStoreOtherUnlessRestraint(item, "issix")
		else:
			GM.pc.cummedInAnusBy("issix", FluidSource.Penis, 150.0)
			var item = GlobalRegistry.createItem("buttplug")
			GM.pc.getInventory().forceEquipByStoreOtherUnlessRestraint(item, "issix")

	if _action == "pissnormalmouth":
		GM.pc.cummedInMouthBy("issix", FluidSource.Pissing, 0.7)
		GM.pc.cummedOnBy("issix", FluidSource.Pissing, 1.0)
		#GM.pc.coverBodyWithFluid()
		
	if _action == "pissnormal":
		GM.pc.cummedOnBy("issix", FluidSource.Pissing, 1.0)

	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
