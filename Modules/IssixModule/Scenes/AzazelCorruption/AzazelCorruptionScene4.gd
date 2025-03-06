# Currently only a plan for one:
# Very similar to one of Tavi's scenes I believe, where Azazel gives player some drugs after which player is transported into dream world where they marry Issix by him officially collaring him with heavy slave collar like some kind of BDSM wedding (I hope i don't make that community angry, I've never been part of one), also considering the setting do the demonic shenanigans too something something, all pets present at the final ceremony
# Features: Pets as demons, piss stream from the above,
extends SceneBase

const Globals = preload("res://Modules/IssixModule/Globals.gd")

func _init():
	sceneID = "AzazelCorruption4"

func _run():  # TODO Those corruption scenes don't really work when player is blindfolded
	if(state == ""):
		addCharacter("azazel")
		playAnimation(StageScene.Duo, "stand", {pc="pc", npc="azazel"})

		if OPTIONS.isContentEnabled(ContentType.Watersports):
			saynn("What in past felt like a surprise, today is a familiarity. The looming sight set on you, the recognizable strong odor of Issix's piss on someone's marked body, the fertile body announcing itself as viable breeding partner. You look at the direction and see him - Azazel with his knowing smile.")
		else:
			saynn("What in past felt like a surprise, today is a familiarity. The looming sight set on you, the stillness of predator setting on their pray, the fertile body announcing itself as viable breeding partner. You look at the direction and see him - Azazel with his knowing smile.")
		saynn("[say=azazel]How have you been?[/say]")
		saynn("[say=pc]Good. How about you?[/say]")
		saynn("[say=azazel]Oh, I've been doing splendidly, thank you for asking.[/say]")
		saynn("He says, slowly approaching you. His [matrix clean=2.0 dirty=1.0 span=50]leathery spaded tail[/matrix] wrapping around you as he hugs you with his face on your upper chest.")
		saynn("[say=pc]Aww, little kitty is affectionate?[/say]")
		saynn("[say=azazel]That's me. But tell you what, what do you think about coming to my cell again? I think I have something you'd like...[/say]")
		saynn("[say=pc]And what is it kitty?[/say]")
		saynn("[say=azazel]No spoilers.[/say]")
		saynn("He baps you on the nose while giving you a cheerful laugh.")
		saynn("[say=pc]Mysterious, aren't we?[/say]")
		saynn("[say=azazel]It's gonna be fun, I promise.[/say]")
		addButton("Go", "Go with the feline to their cell (drug use, pet play, domination)", "tocell")
		addButton("Don't go", "Refuse feline", "dontgo")

	if state == "dontgo":
		saynn("[say=pc]Maybe not today kitty, don't feel like it.[/say]")
		saynn("[say=azazel]But- But I already prepared and...[/say]")
		saynn("[say=pc]Sorry.[/say]")
		saynn("Azazel pleads with you")
		saynn("[say=azazel]All I wanted is to make you [pulse color=#ac1eff height=0.9 freq=0.6]feel good[/pulse], and show you fun side of [pulse color=#ac1eff height=0.9 freq=0.6]being a pet[/pulse]. I wish you could have given me a chance, did I do something wrong? I.. Don't understand. Pleeeasseeee.[/say]")
		addButton("Go", "Agree to go with the feline to their cell (heavy drug use, pet play, domination)", "tocell")
		addButton("Don't go", "Refuse feline again (this marks the end of Azazel's individual scenes)", "endthescene")

	if state == "tocell":
		playAnimation(StageScene.Duo, "walk", {pc="pc", npc="azazel", npcAction="walk", flipNPC=true})
		saynn("[say=azazel]Yay![/say]")
		saynn("Azazel is super excited, he jumps on you and instinctively you wrap your paws around him locking his small body in embrace where his head is on your own head level. He gives you a small kiss this way and jumps off you.")
		saynn("[say=azazel]But first![/say]")
		saynn("He pretends to pull something out of his... Underwear. He reaches with his paw around your neck and makes a clicking sound, is he pretending he just clipped a [pulse color=#ac1eff height=0.9 freq=0.6]leash[/pulse] onto your collar?")
		saynn("[say=azazel]Now we can go![/say]")
		saynn("His paw is made into a fist, as if he was clutching the other end of the leash as he slowly starts walking towards the cell blocks while looking at you ocassionally. You decide to play along and pretend his leash tugs on your neck making sudden gesture of getting dragged behind smaller feline. When Azazel sees it he laughs and continues walking.")
		addButton("Walk", "Walk towards the cell", "walktocell")

	if state == "walktocell":
		playAnimation(StageScene.Sleeping, "rub", {pc="pc", npc="azazel", bodyState={naked=false, hard=GM.pc.getLust()>80}, npcBodyState={naked=false, hard=false}})
		aimCamera("cellblock_lilac_nearcell")
		setLocationName("Azazel's cell")
		saynn("Azazel's walk seems so carefree, his arms and legs relaxed and swinging forward and backwards as well as to the sides as if they were just limbs barely attached by one strong joint to the rest of his body, and like that „led” on an invisible leash you arrive at Lilac block in one cell dedicated to horny kitten, he invites you in with his paw finger.")
		saynn("[say=azazel]Lay in bed for me, will you? Pretty face up, I want to see it.[/say]")
		saynn("[say=pc]Will you have to leave soon today as well?[/say]")
		saynn("Mischievous grin shows up on the face of feline, his tail standing high.")
		saynn("[say=azazel]Somewhat, somewhat not. Hehe, I'm sure you'll [pulse color=#ac1eff height=0.9 freq=0.6]have enough of me[/pulse] by the end.[/say]")
		saynn("You wonder what kind of mysterious plans does Azazel have in mind with being so cryptic about kind of fun he wants you to participate in. You only have assumption that it will be horny considering his past repertoire.")
		if !Globals.isPlayerSuperNaked():
			saynn("[say=azazel]For what I want to do with you today you'd feel best [pulse color=#ac1eff height=0.9 freq=0.6]naked[/pulse]... Let me take care of this little problem.[/say]")
			addButton("Get undressed", "Let Azazel undress you", "undress")
		else:
			saynn("[say=azazel]Hehe, I don't even need to undress you! One thing less to do, lets get into mood then.[/say]")
			addButton("Continue", "See what the cat has to offer", "smallforeplay")

	if state in ["undress", "smallforeplay"]:
		playAnimation(StageScene.Sleeping, "rub", {pc="pc", npc="azazel", bodyState={naked=true, hard=GM.pc.getLust()>80}, npcBodyState={naked=true, hard=false}})
		if state == "undress":
			saynn("[say=azazel]Alright lets see...[/say]")
			saynn("Azazel skillfully removes your restraints and clothes, he removes his own clothes afterwards as well and throws them all into a pile near.")
			saynn("[say=azazel]Feels so much better.[/say]")
			saynn("[say=pc]Why do you even wear clothes if you don't like them?[/say]")
			saynn("[say=azazel]I don't know... It probably wouldn't be for the best... I feel like exhibitionism could be my thing, but maybe this isn't the best place for it, I don't know. Aaanyways...[/say]")
		# Body description section
		saynn("Azazel looks at you from above, you laying on his bed comfortably naked.")
		if (GM.pc.isCoveredInCum() or GM.pc.isCoveredInGirlCum()) and GM.pc.isCoveredInPiss():
			saynn("[say=azazel]Haha, you are covered in all kinds of stuff. When did you last shower? Not that this bothers me, in fact, I prefer it when your [pulse color=#ac1eff height=0.9 freq=0.6]"+Globals.getSkinWord()+" is sticky and smelly[/pulse], I can be [pulse color=#ac1eff height=0.9 freq=0.6]much dirtier[/pulse] than that![/say]")
			saynn("[say=pc]Is that a challenge?[/say]")
			saynn("He smirks")
			saynn("[say=azazel]Who's to tell?[/say]")
			saynn("He says as he licks some of the fluids from your belly.")
		elif GM.pc.isCoveredInCum() or GM.pc.isCoveredInGirlCum():
			saynn("[say=azazel]Man man, [pulse color=#ac1eff height=0.9 freq=0.6]your "+Globals.getSkinWord()+" is dripping with cum[/pulse]. That's hot![/say]")
		elif GM.pc.isCoveredInPiss():
			saynn("[say=azazel]You smell like a wet dog that slept in an urinal, you know that? And that's exactly what I like! Just another reason why I think [pulse color=#ac1eff height=0.9 freq=0.6]you'd fit so well in our little corner as another pet, we get our Master's mark daily[/pulse].[/say]")
		else:
			saynn("[say=azazel]You are so clean, you know? Nothing wrong with that, though I do like when people I fuck with are [pulse color=#ac1eff height=0.9 freq=0.6]covered with various fluids[/pulse]. I don't know, I think I just like mess and smell of it all.[/say]")

		if GM.pc.getThickness() >= 75:  # Thick
			saynn("[say=azazel]"+GlobalRegistry.getCharacter("azazel").interestVerbalReaction(InterestTopic.ThickBody)+"[/say]")
		elif GM.pc.getThickness() >= 50:  # Average
			saynn("[say=azazel]"+GlobalRegistry.getCharacter("azazel").interestVerbalReaction(InterestTopic.AverageMassBody)+"[/say]")
		else:  # Slim
			saynn("[say=azazel]"+GlobalRegistry.getCharacter("azazel").interestVerbalReaction(InterestTopic.SlimBody)+"[/say]")

		if GM.pc.hasNonFlatBreasts():
			saynn("[say=azazel]Ahhh, you have {pc.breastsSize} breasts. I have to admit, personally I'm not a fan of breasts, but I do get my own whenever I'm pregnant, Master says they are cute, I don't think he likes enormous breasts, but that's not really a big problem I think. Although, lactating breasts are kinda fun? Like, they can get messy and I like messy. Anyways, I guess I don't mind them on you, you are great the way you are![/say]")
			saynn("He says, knowing that his honest moment with you there probably was awkward.")
		else:
			saynn("[say=azazel]I gotta say, lack of breasts on you is kind of a relief. Not that I hate them! I have them sometimes myself, it's just that... I don't particularly enjoy them either? I don't know. Men usually like boobs, but personally I were never the fan, overhyped stuff.[/say]")

		if GM.pc.getFemininity() >= 66:
			saynn("[say=azazel]Ahh, you have a very {pc.feminine} body! I like all kinds of bodies, I myself am a little freaky with that haha. Even though I'm a man I do have girl bits, can bear children and well, my body is pretty {azazel.feminine} as well.[/say]")
		elif GM.pc.getFemininity() >= 33:
			saynn("[say=azazel]Ahh, you have a very {pc.feminine} body! I like all kinds of bodies, I myself am a little freaky with that haha. Even though I'm a man I do have girl bits, can bear children and well, while my body has been described as feminine, I'm fairly androgynous, wouldn't you agree?[/say]")
		else:
			saynn("[say=azazel]Ahh, you have a very {pc.feminine} body, I love that! Masculinity is hot. That said, I do like all kinds of bodies, I myself am a little freaky with that haha. Even though I'm a man I do have girl bits, can bear children and well.[/say]")
		saynn("[say=azazel]Also, have anyone told you your face is cute? Because it is.[/say]")
		addMessage("You've learned many of Azazel's interests.")

		saynn("[say=azazel]Okey okey, enough of admiring your cute body, I want to give you some attention.[/say]")
		if Globals.hasPermanentChasityOnBoth("pc"):
			saynn("[say=azazel]Ah wait! All of your stuff is locked? That's kinky but also... Sad, I had hoped to play a little! Oh well, no matter, I'll still have my fun.[/say]")

		saynn("His excitement and eagerness get replaced by a different face expression, one more fitting the description of embarrassment and abashment.")
		saynn("[say=pc]What's wrong?[/say]")
		saynn("[say=azazel]You know, I wanted to use those on you, for „safety” reasons, but I don't want to do that without your permission...[/say]")
		saynn("He shows you ankle cuffs, regular cuffs and rope.")
		addButton("Allow", "Allow to get bound in his gear", "foreplay", [true])
		addButton("Don't allow", "Don't allow Azazel to restrict you", "foreplay", [false])

	if state == "foreplay":
		playAnimation(StageScene.Sleeping, "rub", {pc="pc", npc="azazel", bodyState={naked=true, hard=GM.pc.getLust()>80}, npcBodyState={naked=true, hard=false}})
		if getModuleFlag("IssixModule", "Azazel_Corr_BDSM_Gear", false):
			saynn("Azazel puts multiple restraints on you, including heavy metal ankle cuffs that he connected to somewhere below the bed, heavy metal wrist cuffs, bondage mittens, he also connects your collar with a chain underneath the bed. To top it off, he dresses you up in a cute pink rope harness.")
			saynn("[say=azazel]You look so good now, awwwwwwwwwwwwwwwwww.[/say]")
			saynn("His paws wander around your body, testing the restraints, teasing you.")
			saynn("[say=azazel]Say, how do you feel![/say]")
			saynn("[say=pc]Fine, and defenseless.[/say]")
			saynn("[say=azazel]Yay! Don't worry, I won't hurt you. I'm not a sadist.[/say]")
		else:
			saynn("[say=azazel]Aww. Well, that sucks, but your choice. would be a lot more fun if you said yes though. But no matter, let me just throw them back onto the pile.[/say]")
			saynn("Feline throws all the restraints he held back onto the pile.")
			saynn("[say=azazel]I just hope you don't wriggle too much later...[/say]")

		if getModuleFlag("IssixModule", "Azazel_Corruption_Musk_Happened", false):
			saynn("[say=azazel]Fun. Let me just get comfortable on top of you, like the last time.[/say]")
		else:
			saynn("[say=azazel]Fun. Let me just get comfortable on top of you.[/say]")
		if GM.pc.hasReachableVagina() and GM.pc.hasReachablePenis():
			saynn("[say=azazel]Since you are such a versatile [pulse color=#ac1eff height=0.9 freq=0.6]good {pc.boy}[/pulse] I'll give you a choice, would you want me to play with your {pc.penisSize} {pc.penis} or perhaps you'd want me to help keep your {pc.vagina} moisturized?[/say]")
			addButton("Penis", "Let Azazel have fun with your penis", "foreplaypenis")
			addButton("Vagina", "Let Azazel have fun with your vagina", "foreplayvagina")
		elif GM.pc.hasReachablePenis():
			addButton("Penis", "Let Azazel have fun with your penis", "foreplaypenis")
		elif GM.pc.hasReachableVagina():
			addButton("Vagina", "Let Azazel have fun with your vagina", "foreplayvagina")
		else:
			if Globals.hasPermanentChasityOnBoth("pc"):
				saynn("[say=azazel]Since your bits are locked, I'll have to find some fun for myself. Sorry! Don't feel like playing with your cute butt today.[/say]")
			else:
				saynn("[say=azazel]Since you are lacking in bits, I'll satisfy myself today on you, sorry, I don't really plan to play with your cute butt today.[/say]")
			addButton("Continue", "Continue", "foreplayazazel")

	if state == "foreplaypenis":
		playAnimation(StageScene.Sleeping, "rub", {pc="pc", npc="azazel", bodyState={naked=true, hard=GM.pc.getLust()>80}, npcBodyState={naked=true, hard=false}})
		saynn("[say=azazel]Soo, how is your {pc.penisSize} {pc.penis} doing today? It's a time for check up, I'd say.[/say]")

		saynn("Azazel turns around, still laying on you but you now can only see his {azazel.analStretch} anus, his legs around your head, he reaches towards your groin with his paws.")
		if GM.pc.getPenisSize() > 50:
			saynn("[say=azazel]Well, I have no idea where have you got a tool this big, but fuck, I don't think I've ever seen anything like this. Might be an experience trying to pleasure it.[/say]")
		elif GM.pc.getPenisSize() > GlobalRegistry.getCharacter("issix").getPenisSize():
			saynn("[say=azazel]It's cute. Larger than my Master's {pc.penis}. But don't worry your cute head about it, I can handle it.[/say]")
		else:
			saynn("[say=azazel]Awww, what a cute little cock! It's smaller than my Master's, but you know what? Small is cute, that's my motto![/say]")
			saynn("He lets a laugh.")

		saynn("Azazel gives your {pc.penis} little strokes, they aren't a lot, but it's certainly a nice start. He spits on your {pc.penis} to lubricate it a little and gradually picks up the pace pawing you off.")
		if getModuleFlag("IssixModule", "Azazel_Corr_BDSM_Gear", false):
			saynn("You get more aroused by the minute, staring at Azazel's pucker and increasingly wetting vagina just underneath. Unfortunately with your collar being attached to a chain you can't move your head close enough to give it rimming, curse the feline being so small!")
		else:
			saynn("You get more aroused by the minute, staring at Azazel's pucker and increasingly wetting vagina just underneath, they looks hypnotizing and make you want to help them get even more wet.")

		saynn("[say=azazel]You are pretty hard already, I'll give your pole a more thorough cleaning now, hold onto your butt cutie.[/say]")

		saynn("The soft surface of Azazel's paws on your {pc.penis} gets replaced with even softer surface of Azazel's mouth taking your length down the throat. You couldn't possibly deny feline's prowess in sucking a cock, you notice yourself starting to breathe heavier as great pleasure radiates from your pleasured tool, with plenty of saliva to lubricate it and smooth inside of his mouth it's a wonderful match, only sometimes teased by rough surface of his tongue giving you a slightly irritating but combined with overall pleasure incredible mix of feelings stimulating you.")
		saynn("It doesn't take long for you to feel like you could unload your load, before you warn the kitty he stops, as if he knew what was coming. But the pleasure stops with it, he turns around.")
		saynn("[say=pc]No no, please, finish me, it was sooo good.[/say]")
		saynn("[say=azazel]Hehe. I know, that's why I stopped.[/say]")
		saynn("He smiles mischievously.")
		addButton("Continue", "Continue", "maindish")

	if state == "foreplayvagina":  # Fair warning, I'm far from being a good writer for those bits
		playAnimation(StageScene.Sleeping, "rub", {pc="pc", npc="azazel", bodyState={naked=true, hard=GM.pc.getLust()>80}, npcBodyState={naked=true, hard=false}})
		saynn("[say=azazel]Hehe, let's give your {pc.vagina} some attention, shall we?[/say]")
		saynn("Azazel turns around, still laying on you but you now can only see his {azazel.analStretch} anus, his legs around your head, he reaches towards your vagina with his paws. You can feel his digits massaging the folds gently. He spits next to your pussy, fixing his mistake with his paw fingers moving the spit into the entrance.")

		saynn("[say=azazel]Brace yourself.[/say]")
		saynn("He says as he plunges his paw finger into your pussy. It's hella pleasurable experience. He continues finger fucking you for a minute adding a second finger shortly after before plunging with his head to meet your juicy folds. He expertly eats you out, even despite the texture of his feline tongue being rough, it only adds to the stimulation for you. This treatment lasts for good 5 minutes, the cat knows how to treat you. Your breath quickens and you tell the kitten.")
		saynn("[say=pc]Yesss, keep going, I'm almost there![/say]")
		saynn("With you being very close to orgasm to your displeasure the cat suddenly stops, he turns around and faces you, his face partially covered with his own spit and your juices.")
		saynn("[say=azazel]Hehehe, not yet. If you want release we will have to do something special, okey?[/say]")
		saynn("[say=pc]Pleaaaseee.[/say]")
		saynn("His mischievous grin widens.")
		addButton("Continue", "Continue", "maindish")

	if state == "foreplayazazel":
		playAnimation(StageScene.Sleeping, "rub", {pc="pc", npc="azazel", bodyState={naked=true, hard=GM.pc.getLust()>80}, npcBodyState={naked=true, hard=false}})
		saynn("[say=azazel]Well, even if you won't have your fun [i]yet[/i], I want to have some of my own okey?[/say]")
		saynn("He stands up and comes to the pile, picking up one of the dildos and climbing back on top of you, with his ass directly above your crotch.")

		saynn("[say=azazel]Guess you'll have nothing else to do than watch.[/say]")
		saynn("[say=pc]Do I have a choice?[/say]")
		saynn("[say=azazel]Nope! But please hold that for me for a second.[/say]")
		saynn("Smiling, he brings his two paw fingers near your mouth and opens it, then pushes the dildo right inside. Despite Azazel preferring things messy, it feels like this specific dildo has been cleaned as you don't feel anything taste wise. The dildo feels of a rather good quality, made of soft material that is pleasant to touch with your tongue. He holds the dildo inside of your mouth for a solid minute, making you unable to say anything other than some lustful moans.")
		saynn("[say=azazel]It's better warm, and this way it comes with lubrication already! Make sure to leave as much of your spit on it as possible. Aww, aren't you a [pulse color=#ac1eff height=0.9 freq=0.6]useful pet[/pulse]?[/say]")
		saynn("After a minute he pulls the dildo out, almost immediately pushing the dildo back, this time however right into his own sensitive folds, you see how kitty's face expression changes really fast as he pushes the fuck stick deeper. He masturbates with it for a while, showing you intricate details of his pussy in between thrusts. Above his love tunnel a "+("a vividly glowing red womb tattoo displayed for you to see" if GlobalRegistry.getCharacter("azazel").isPregnant() else "dark red womb tattoo proudly displayed for you to see")+".")

		saynn("[say=azazel]Ahhhh, I hope you enjoy the view. Haaaaaah. It's... Quite a fun experience for me especially. Ahhhh. I'm... I'm gonna cum. Mmmmmmm.[/say]")

		saynn("Shortly after saying that, he did. Covering your body with ample amount of his {azazel.girlcum}.")
		saynn("[say=azazel]Huff. [pulse color=#ac1eff height=0.9 freq=0.6]Good pet[/pulse], I hope you enjoyed the show.[/say]")
		saynn("[say=pc]Yeah... But I wish I could have gotten a chunk of the pie as well..[/say]")
		saynn("[say=azazel]Nothing to worry about, I got you covered. Let's get to the main dish.[/say]")
		saynn("His mischevious grin widens, he has something prepared.")
		addButton("Continue", "Continue", "maindish")

	if state == "maindish":
		playAnimation(StageScene.Sleeping, "rub", {pc="pc", npc="azazel", bodyState={naked=true, hard=GM.pc.getLust()>80}, npcBodyState={naked=true, hard=false}})
		saynn("[say=pc]You got me curious, what is it?[/say]")
		if getModuleFlag("IssixModule", "Azazel_Player_Donated_Gasmask", false):
			pass  # TODO Unsure if I'll ever do this route, but I'll keep it in mind
		else:
			saynn("He jumps off you and picks up a large mostly black colored object that you recognize as a gas mask.")

			saynn("[say=azazel]Hehe. So, you may remember I've been on the lookout for this thing for ages. Recently came into possession of one. REALLY COOL ISN'T IT?![/say]")
			saynn("He feels so excited, to the point of screaming out the last sentence.")
			saynn("[say=pc]I guess?[/say]")
			saynn("[say=azazel]Hehe, you don't get it, [b]yet[/b]. You know, gas mask can be used in the right way, to filter out the air. Could be useful for that really cool gas some of the guards have that make you go all [pulse color=#ac1eff height=0.9 freq=0.6]needy and horny[/pulse]. But I don't want to keep the gases [i]out[/i]. I want to keep them [i]in[/i].[/say]")
			saynn("You begin to be a little worried at what Azazel might be implying here. Is he into some hardcore stuff? Maybe breath play?")
			saynn("[say=azazel]I got you all worked up, didn't I? You poor thing. But I want to help you out, you just have to let me. You see, I got my paws on something really cool, and by that I mean I begged my Master to let me have it, he knows I love this kind of stuff. It's a [color=red]red[/color] beauty.[/say]")
			if getModuleFlag("TaviModule", "ch2PCStoleDrugs", false):
				saynn("He shows you a vial of something red, you recognize the inviting and dangerous color, it's the same thing you stole from Eliza for Tavi.")
			else:
				saynn("He shows you a vial of something red, it swirls inside the vial. You are unsure what this might be.")

			saynn("[say=azazel]With anything this untested and unknown, I like to experiment by myself. So not to worry my Master, I've sniffed just minuscule amount of this, and it was powerful even at micro doses. It gives you a [pulse color=#ac1eff height=0.9 freq=0.6]„hit”[/pulse]. It's really good. [/say]")
			if getModuleFlag("TaviModule", "ch2DrugsAgreedToTest", false):
				saynn("[say=pc]I know, I stole some of it from medical some other day and when asked to try it knocked me out good.[/say]")
				saynn("[say=azazel]Oh? Wow, you have experience, I didn't expect. How was it?[/say]")
				saynn("[say=pc]In a big summary? Got enslaved by an inmate who turned out to be a demon and wanted to have imps with me, or something to this accord.[/say]")
				saynn("[say=azazel]Wooow. This sounds so good![/say]")
				saynn("[say=pc]...[/say]")
				saynn("[say=azazel]Like a really great wet dream! Ahhh, I should huff this thing even more... Speaking of which, it's time.[/say]")

			saynn("[say=azazel]I want you to try it, it's safe, don't worry, it won't make you hooked or anything. I think some kind of gods invented it, it's just soo good each time I tried it. See this?[/say]")
			saynn("He shows you a round object with one side being flat along with some small holes and the other make a funnel shape.")
			saynn("[say=azazel]This thing attaches to the gasmask. It's supposed to filter the air and it will do just that but... I'll change the filter a bit.[/say]")
			saynn("He opens the part, it's empty inside. He picks up a jockstrap and the vial, opens the vial while stopping to breathe, sticks it to the cloth and turns it upside down so the cloth soaks a little with the liquid, while quickly stopping the process and closing the vial, he puts the soaked jockstrap into the filtering part of the gas masks and closes it tight, all on one breath being very careful not to breathe any fumes in, even trying to spread the air around a little so a large amount of fumes doesn't linger in a single place.")
			saynn("[say=azazel]Yay! [pulse color=#ac1eff height=0.9 freq=0.6]Our toy[/pulse] is now armed. [pulse color=#ac1eff height=0.9 freq=0.6]Jockstrap is Master's[/pulse], I yoinked it before Hiisi went out with the laundry, it [pulse color=#ac1eff height=0.9 freq=0.6]smells really good[/pulse].[/say]")

			saynn("Azazel is incredibly happy while holding the gas mask. He presents it to you.")
			saynn("[say=azazel]Now, I don't want anything bad to happen to you, I'll be here, watching you okey? I'll put it on your pretty face, watch you and I'll take it off right after. I'll try not to [pulse color=#ac1eff height=0.9 freq=0.6]huff it[/pulse] myself just so I can watch over you, won't be easy considering how good it will be, think I'll keep it for later, maybe at night... Or maybe you could watch over me hehe. Anyways, are you ready?[/say]")
			addButton("Yes!", "Beg Azazel to put on the gas mask on you and give you release", "eagermask")
			addDisabledButton("Reconsider", "Ask Azazel not to put on the mask, at this point you are too far gone, Azazel got you good with his denial")


	if state == "eagermask":

		saynn("[say=azazel]Hihi, here it is then![/say]")
		saynn("Azazel comes onto you again, his elbows on sides next to your neck and he covers your face with the gas mask, his paws fiddle with the device securing it with a strap behind your face.")
		saynn("[say=azazel]Does it feel tight? Is it [pulse color=#ac1eff height=0.9 freq=0.6]sealed around your face[/pulse]?[/say]")
		if getModuleFlag("IssixModule", "Azazel_Corr_BDSM_Gear", false):
			saynn("You nod, as much as your restraints you have on you allow you to.")
		else:
			saynn("You nod.")

		saynn("[say=azazel]Goood. Now take some [pulse color=#ac1eff height=0.9 freq=0.6]very deep breaths for me[/pulse] "+Globals.getPlayerPetName()+"! Deeeep breeaaaatthhhssss.[/say]")

		saynn("As you take breaths you smell [pulse color=#ac1eff height=0.9 freq=0.6]musty, warm, AROUSING smell[/pulse], the time slows down.")
		if getModuleFlag("TaviModule", "ch2DrugsAgreedToTest", false):
			saynn("It's different to when you last tried it.")

		saynn("You feel scared. You feel peace.")
		saynn("You feel fear. You feel arousal.")
		saynn("Azazel's face that you saw just a moment ago doesn't look like him anymore, his horns grew out. His eyes are pulsating red orbs. His face expression turned... Evil.")
		saynn("You feel dread. You feel loved.")
		saynn("You feel panic. You feel comfort.")
		saynn("You can't see the rest of your body, it's in part behind the mask, and in part behind Azazel. It feels as if its burning hot. It also feels oddly distant, as if it wasn't your body.")
		saynn("You feel good. You feel at home.")
		saynn("You feel... Content.")
		addButton("Black out", "Lose consciousness...?", "transition")

	if state == "transition":  # Figure out if we can make player blinded without a blindfold?
		playAnimation(StageScene.Sleeping, "sleep", {pc="pc"})
		aimCameraAndSetLocName("petsdream_cellblock_lilac_nearcell")
		GM.pc.setLocation("petsdream_cellblock_lilac_nearcell")
		if GM.main.originalPC.isHeavilyPregnant():
			saynn("You have a strange feeling like you are missing something important, your body doesn't feel so bloated anymore.")
		saynn("You open your eyes, confused. You don't remember much, everything is... Fuzzy, you don't really remember what you were doing before you woke up. Your eyes see whiteness surrounding you bright light at the ceiling, and you are laying on your back, underneath you a hard cold floor.")
		saynn("You smell waft of something powerful from somewhere, the air feels stale, musty, it's a mix of [pulse color=#ac1eff height=0.9 freq=0.6]pheromones[/pulse], wet carpet, a tinge of sulfur.")
		saynn("[say=pc]What the fuck? Where-[/say]")
		saynn("You feel weak, tired, out of energy, but laying in here, won't give you answers.")
		addButton("Stand up", "Stand up", "endthescene")


func getDevCommentary():
	return ""

func hasDevCommentary():
	return false

func _react(_action: String, _args):
	if _action == "transition":
		# We want all of the player parts to look mostly the same. Some things may not survive but that's just how it is. Will track any issues and try to fix
		GM.main.overridePC()
		GM.pc.setName(GM.main.originalPC.getName())
		GM.pc.setGender(GM.main.originalPC.getGender())
		GM.pc.setSpecies(GM.main.originalPC.getSpecies())
		GM.pc.resetSlots()
		for bodypart in GM.main.originalPC.bodyparts:
			if GM.main.originalPC.bodyparts[bodypart] == null:
				continue
			var replacedBodypart = GlobalRegistry.createBodypart(GM.main.originalPC.bodyparts[bodypart].id)
			var body_part_values = GM.main.originalPC.bodyparts[bodypart].getCharCreatorData()
			if body_part_values != null:
				for body_part_attribute in body_part_values:
					replacedBodypart.set(body_part_attribute[0], body_part_attribute[1])
			Console.printLine(str(GM.main.originalPC.bodyparts[bodypart].get_property_list()))
			GM.pc.giveBodypart(replacedBodypart)
		GM.pc.pickedThickness = GM.main.originalPC.getThickness()
		GM.pc.pickedFemininity = GM.main.originalPC.getFemininity()
		GM.pc.pickedSkin = GM.main.originalPC.pickedSkin
		GM.pc.pickedSkinRColor = GM.main.originalPC.pickedSkinRColor
		GM.pc.pickedSkinGColor = GM.main.originalPC.pickedSkinGColor
		GM.pc.pickedSkinBColor = GM.main.originalPC.pickedSkinBColor
		# Not part of the main game yet. Might need to send a pull request later.
		#GM.main.stopProcessingTime()
		# Disable processing characters except PC so there are no pregnancies or other events that could ruin the immersion
		setModuleFlag("IssixModule", "Azazel_In_Dream", true)
		GM.main.charactersToUpdate.clear() # TODO Remember to regenerate on exit
		GM.pc.updateNonBattleEffects()

	if _action == "undress":
		Globals.undressPlayerExceptCollar("Azazel")

	if _action == "foreplayazazel":
		GM.pc.cummedOnBy("azazel", FluidSource.Vagina)

	if _action == "undress" or _action == "smallforeplay":
		processTime(10*60)
		Globals.learnInterestOf("azazel", [InterestTopic.FeminineBody, InterestTopic.MasculineBody, InterestTopic.AndroBody, InterestTopic.CoveredInCum, InterestTopic.CoveredInLotsOfCum, InterestTopic.BigBreasts, InterestTopic.SmallBreasts, InterestTopic.NoBreasts, InterestTopic.MediumBreasts, InterestTopic.LactatingBreasts, InterestTopic.AverageMassBody, InterestTopic.ThickBody, InterestTopic.SlimBody])

	if _action in ["foreplaypenis", "foreplayvagina", "foreplayazazel"]:
		GM.pc.addLust(80)
		processTime(10*60)

	if _action == "foreplay":
		processTime(10*60)
		var geared_up = _args[0]
		setModuleFlag("IssixModule", "Azazel_Corr_BDSM_Gear", geared_up)
		if geared_up:  # Dress up time
			var item = GlobalRegistry.createItem("ropeharness")
			var inventory = GM.pc.getInventory()
			item.clothesColor = Color.deeppink
			inventory.equipItem(item)
			addMessage(item.getVisibleName() + " has been put on your body.")
			item = GlobalRegistry.createItem("inmateanklecuffs")
			inventory.equipItem(item)
			addMessage("Your ankles have been restrained by "+item.getVisibleName())
			item = GlobalRegistry.createItem("inmatewristcuffs")
			inventory.equipItem(item)
			addMessage(item.getVisibleName() + " are now restraining your wrists.")
			item = GlobalRegistry.createItem("bondagemittens")
			inventory.equipItem(item)
			addMessage(item.getVisibleName() + " made your paws useless.")

	# if _action == "stripping":
	# 	for slot in GM.pc.getInventory().getAllEquippedItems():  # Force unequip all items, why is there getEquippedItems and getAllEquippedItems doing the same thing lol
	# 		var item = GM.pc.getInventory().getAllEquippedItems()[slot]
	# 		if GM.pc.getInventory().unequipSlotUnlessRestraint(slot):
	# 			addMessage("Azazel took off your "+item.getVisibleName()+".")
	if _action == "walktocell":
		GM.pc.setLocation("cellblock_lilac_nearcell")

	if _action == "eagermask":
		GM.pc.getInventory().equipItem(GlobalRegistry.createItem("GasMask"))

	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
