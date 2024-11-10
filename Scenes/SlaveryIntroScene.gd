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
		saynn("[say=issix]That's most wonderful to hear. You've had multiple opportunities to reject becoming my pet and yet you persisted. Good.[/say]")
		saynn("[say=issix]From this time onward, you'll always refer to me as Master or Master Issix. As my pet, I consider your body belongs to me now.[/say]")
		saynn("[say=issix]Tell me now, what role would you like to accept as defacto my slave? A pet or a prostitute?[/say]")
		addButton("Pet", "Tell Issix you'd rather become his pet, just like his other 3 pets", "petrole")
		addDisabledButton("Prostitute", "This option is not yet available in the mod, it is planned in the future however")  # TODO 1.1

	if state == "petrole":
		setModuleFlag("IssixModule", "PC_Enslavement_Role", 1) # pet
		saynn("[say=pc]I'd like to become your pet, Master.[/say]")
		saynn("[say=issix]Excellent. In that case... There is one, maybe final question for you today. None of my pets decided on that, but I figured you might be interested. I'm not going to lie, I'm not too fond of this method as I like my pets to still have some control, but what I can offer you is to completely give yourself to me. not just your body, but your very SOUL as well. Just like with becoming my pet, once you make this decision, there is no going back. You will do exactly as I say, you won't have an option to disobey me. I'll become extension of your will, at best you'll have second wheel - entirely insignificant, a mere puppet. I'll own you fully, and you'll be just a husk of yourself.[/say]")
		saynn("[say=issix]If that's not for you that's all the better. It's an option for those who not only want to dedicate their life in servitude, but also surrender the keys to their soul and mind - to become broken beyond any comprehension. Some people call it becoming a drone. Some people call it simply killing a person. I prefer „surrendering soul”. Kinda romantic, don't you think? Or perhaps it's just demon humor. Either way, tell me, what do you want?[/say]")
		addButton("Yes", "Tell your Master that you want him to take your soul (WARNING: this is EXTREME, you won't have a chance to avoid certain content, it will literally strip you of choice and make your game MORE DIFFICULT. Not for the fainthearted, CW: parasite, soul vore, non-con, watersports, blood)", "becomepuppet")
		addButton("No", "Tell your Master that you wish to retain your mind (recommended)", "normalroute")

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
			for slot in GM.pc.getInventory().getEquippedItems():  # Force unequip all items, why is there getEquippedItems and getAllEquippedItems doing the same thing lol
				saynn("Issix took off your "+GM.pc.getInventory()[slot].getVisibleName()+".")
				GM.pc.getInventory().unequipSlot(slot)
			#GM.pc.unequipAllRestraints()
		else:
			saynn("[say=issix]You are such a good pet that you are already naked. That's really good, as I want to know every part of your body before I have fun with you.[/say]")
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
		saynn("Various moans coming from both of you ")


	if state == "maybelater":
		saynn("[say=pc]I need to take my time to make my decision... It's a lot to take in.[/say]")
		saynn("[say=issix]Take your time. I do believe you are ready, but you have to make the final choice by yourself. I'll be waiting.[/say]")
		saynn("[say=pc]Thank you Master Issix.[/say]")
		saynn("He smiles and lets you go.")
		addButton("Continue", "End the conversation", "endthescene")

	if state == "rejection":
		saynn("Issix raises his eyebrows. This was not an answer he expected or wanted to hear.")
		saynn("[say=issix]That's... Surprising. You are a perfect candidate, you could become MY pet. MY plaything, and yet you reject it? Why? Is it that you are worried about being under someone? You don't like my other pets? Did you not like the walk? Are you scared of questions I asked you during questionnaire? Did the talk about forever having my mark burned into you scare you? Do you value your time so much, that you'd rather not spend time with me and my harem? Or do you value your life so much that you think you'd do a better job living it by yourself than under me?[/say]")
		saynn("He grew visibly more frustrated with each question. Each question, adding more oil into already enormous flames consuming everything around. His aura so intense, his eyes so enraged. This version of the dragon-demon is the most intimidating creature you've ever seen, so far from the image of him you've had in your head for past days doing his tasks and so on. And yet... He closes his eyes, connects palms of his paws and takes a deep breath. His aura changes again, it's calm and composed, as if it was a completely different person from the one you've seen just seconds ago. He opens his eyes.")
		saynn("[say=issix]I must apologize. I had certain expectations that were not met, however I realize I were in no position to make demands of you. You have made your decision and as I said, I have to respect it. Thank you for letting me know what is your final decision. I'll be here if you ever want to donate restraints. Have a good day, {pc.name}.[/say]")
		saynn("His voice still raspy, but composed. His dominant persona doesn't handle well „no” as an answer, however you aren't his pet, at least today. And now, you never will. That was your decision, however.")
		addButton("Continue", "End the conversation", "endthescene")

func _react(_action: String, _args):

	if _action == "normalroute2":
		var itemRef = GlobalRegistry.getItemRef("HeatPill")
		if(itemRef == null):
			return
		itemRef.useInSex(GM.pc)


	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
