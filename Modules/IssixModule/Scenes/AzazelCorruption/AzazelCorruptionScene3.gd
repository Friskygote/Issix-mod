extends SceneBase

var player_fluids = null
var undressed = null

func _init():
	sceneID = "AzazelCorruption3"

func _run():  # TODO Those corruption scenes don't really work when player is blindfolded
	if(state == ""):
		addCharacter("azazel")
		saynn("As you walk in hallways you feel looming presence just behind you, you don't have any trouble recognizing just who's presence that is, by sheer smell their body makes, it's the feline you are so well acquainted with already - Azazel. You turn your head around to ruin their incoming surprise attempt but... You don't see them behind, this fact in itself is already a surprise, because you were perfectly convinced they were just behind you. Your heart skips a bit as your head turns around back to look forward, and a not-so-intimidating but yet unexpected face of feline snows up right in front of you... And a bit below, considering how short the feline is.")
		saynn("[say=azazel]Good to see you {pc.name}! Try to watch out where you walk though, you almost walked over me.[/say]")
		saynn("The seductive and enticing tone of Azazel sticks with him each time he gives you one of those random „visits”.")
		saynn("[say=pc]For the love of the intergalactic squid, how did you do that? I could swear your were ju-[/say]")
		if GM.pc.isGagged():
			saynn("Azazel holds up his arm and puts a paw finger on your "+GM.pc.getInventory().getEquippedItem(InventorySlot.Mouth).getVisibleName())
			saynn("[say=azazel]Shhh. Though, I gotta admit, you sound funny with that gag.[/say]")
		elif GM.pc.isMuzzled():
			saynn("Azazel puts a paw finger on your "+GM.pc.getInventory().getEquippedItem(InventorySlot.Mouth).getVisibleName())
			saynn("[say=azazel]Shhhh.[/say]")
		else:
			saynn("Azazel holds up his arm and puts a paw finger on your mouth.")
			saynn("[say=azazel]Shhhhh.[/say]")
		saynn("You look him straight into his eyes, he smirks. You don't find reason to disobey the feline when he wants you to be silent.")
		saynn("[say=azazel]I want to show you something, but not in here.[/say]")
		saynn("He says as he grabs your paw.")
		addButton("Follow", "Follow feline (musk)", "followedazazel")
		if (GM.pc.getPersonality().getStat(PersonalityStat.Subby) < 0.0) and GM.pc.getLust() < 20 and !GM.pc.isWearingHypnovisor() and !GM.pc.hasEffect(StatusEffect.Suggestible) and !GM.pc.hasEffect(StatusEffect.UnderHypnosis):
			addButton("Reject", "Push Azazel away", "donotfollow")
		else:
			addDisabledButton("Reject", "You are too subby, too lusty or are under forced obedience effect, you cannot resist Azazel's allure")

	if state == "followedazazel":
		aimCamera("cellblock_lilac_nearcell")
		setLocationName("Azazel's cell")
		sayn("Azazel leads you by your paw to the cellblock and to one of the cells of Lilac block. The cell is marginally larger than your own, you wonder where do the size differences even come from, was the designer of this prison under influence when they made the schematics?")
		saynn("Ignoring that thought, you spot some sex toys just laying in the corner. Nothing too extraordinary for this prison, just a vibrator wand, bottles of lube, basket muzzle, rope, vaginal plug, bondage mittens.")
		saynn("[say=azazel]Like my collection? Haha. There are still some items I'd love to have, latex is cool, and if I had entire latex suit I could maybe do some drone roleplay, drones are stupidly hot, they exist only to serve their superior or hives and maybe even convert others, they don't need their identity, maybe just a number or designation of this sort. Ahhhhh, I wish...[/say]")
		saynn("Azazel is seemingly lost in lusty heaven.")
		saynn("You observe the rest of his cell, it's standard as cells go. He doesn't seem to have more belongings than couple of sex items you've already noticed. On the wall, however, there is a sheet of paper with a drawing on it, likely Lamia's work. You can clearly see a dragon and feline on it, both colored in just a way Issix and Azazel look like, both clothed in plain T-shirts. \nWhat's strange is that the picture's background seems to be more of a house setting than a prison, with a rug, pleasant wallpaper and countless fancy decorations adorning the walls. The size difference between the two is really visible in this picture, usually when you see Azazel he is kneeling or laying on the blanket, here the contrast of heights is so great that one could take Azazel's thin posture as dragon's kid.\nThe picture is showing their backs, both are facing away, towards old-school kiln used to heat up the house. Issix's hand is on Azazel's head in a friendly manner, as if ruffling their hair. Generally, the picture gives you very happy vibes, which is why you expect Azazel hung it up in here.")

		if GM.pc.getInventory().hasItemIDEquipped("GasMask"):  # oh man, that will be so much writing for an item that isn't even obtainable in base game I'm fucking insane
			saynn("[say=azazel]Other than that, I think I'm missing a gas ma-[/say]")
			saynn("He stops himself mid-sentence as he looks at you.")
			saynn("[say=azazel]Wait a darn minute, you DO have a gas mask! Woaaaah, how did you get one? I haven't seen one anywhere in here![/say]")
			saynn("He studies every intricate detail of gas mask on your face.")
			saynn("[say=azazel]I know, I know, we could use it![/say]")
			addDisabledButton("Continue", "Continue")
		saynn("[say=azazel]Other than that, I think I'm missing a gas mask... And maybe a few other things...[/say]")
		#addButtonWithChecks("Gas mask", "Say that you do have a gas mask", "gasmaskroute", [], [[ButtonChecks.HasItemID, "GasMask"]])
		addButton("Continue", "Continue", "nogasmask")

	if state == "nogasmask":
		playAnimation(StageScene.Sleeping, "sleep", {pc="pc"})
		saynn("[say=azazel]Anyways, it's not what I wanted to do with you in here today, unless... Maybe some other time. Come hop in here.[/say]")
		saynn("He gestures his cell bed, you [pulse color=#ac1eff height=0.0 freq=1.0]obey[/pulse] and lay on your back.")
		saynn("[say=azazel]Comfy?[/say]")
		saynn("[say=pc]As comfy as one can be in cell bed.[/say]")
		saynn("[say=azazel]Right.[/say]")
		saynn("He comes to his stash hidden away and pulls out some kind of cloth as well as something else making quiet metal clinging sound. He hides both behind as he turns towards you. Smile not leaving his face as he shudders in excitement.")
		saynn("[say=azazel]I apologize in advance if I do something wrong, I cannot find myself in the role I'll take in a moment but it's the only way for me to show you something.[/say]")
		saynn("He takes his paw from behind, in it a leash. You've already experienced being led on a leash in the past, and yet, doing so fully willingly is something completely different. You look into Azazel's eyes, he looks embarrassed? Though one thing difficult to deny is the desire, desire burning in his eyes, unsure what this desire is for, though you have some ideas. After a long breath, Azazel's face becomes much more serious as he clasps the end of the leash unceremoniously to the collar on your neck and pulls on it.")
		saynn("[say=azazel]How does it feel, [pulse color=#ac1eff height=0.9 freq=0.6]pet[/pulse]?[/say]")
		saynn("It's difficult for you to say, perhaps it's the light playing tricks, but Azazel's eyes - look different, you can't get rid of the feeling that their [color=#d026ff]color changed[/color], it's much better now, so... Pleasant, inviting, [pulse color=#ac1eff height=0.9 freq=0.6]comforting[/pulse].")
		if GM.pc.isFullyNaked():
			saynn("[say=azazel]Took your breath away already? That's my job, but lets not precede events.[/say]")
			addButton("Continue", "Continue", "nogasmask2", [false])
		else:
			saynn("[say=azazel]Took your breath away already? That's my job, but lets not precede events. Lets get rid of your clothes.[/say]")
			addButton("Continue", "Continue", "stripping")


	if state == "stripping":
		playAnimation(StageScene.Sleeping, "sleep", {pc="pc", bodyState={naked=true, hard=GM.pc.getLust()>80}})
		saynn("You begin to {pc.undressMessage}.")
		saynn("[say=azazel]Nuh uh, keep your paws steady, I'll be the one undressing you.[/say]")
		saynn("It feels odd to let Azazel do this basic action but you suppose for now... He does [pulse color=#ac1eff height=0.9 freq=0.6]own you[/pulse], you are in his cell, on his bed. He manages to undress you, though he did have to drop the leash for few seconds as he was fiddling with your clothes.")
		saynn("[say=azazel]That's a lot better. Clothes are restraints of their own and not even fun ones, time for me.[/say]")
		if getModuleFlag("IssixModule", "Saw_Azazel_Naked", false) == false:
			saynn("You realize it's the first time you see Azazel naked. Which means that his {azazel.pussyStretch} vagina is now fully visible to you. Above it you can see a [pulse color=#ac1eff height=0.9 freq=0.6]womb tattoo[/pulse] seemingly glowing a bit in shade of red as well as multiple of nipples on his chest.")
			saynn("On his lower back words [pulse color=#ac1eff height=0.9 freq=0.6]”PROPERTY OF ISSIX” branded[/pulse] onto the skin - a mark of his [pulse color=#ac1eff height=0.9 freq=0.6]Master[/pulse].")
		saynn("[say=azazel]Surprised by something [pulse color=#ac1eff height=0.9 freq=0.6]pet[/pulse]?[/say]")
		saynn("Once again, the same shine coming from his eyes, hypnotizing color making your knees weak and yourself happy that you are laying or otherwise Azazel would see what a mess you are.")
		if GM.pc.getLust()>80:
			if GM.pc.hasVagina():
				saynn("It's also undeniable that you are aroused by Azazel's little show, with your {pc.vagina} quivering, which doesn't go unnoticed.")
			elif GM.pc.hasPenis():
				saynn("It's also undeniable that you are aroused by Azazel's little show, with your {pc.penis} standing at full mast, which doesn't go unnoticed.")

			saynn("[say=azazel]My my, talk about preceding events, aren't you a bit too quick? I barely undressed.[/say]")
		saynn("He licks his lips and removes distance between you two.")
		addButton("Continue", "Continue", "nogasmask2", [true])

	if state == "nogasmask2":  # TODO Create a different richtexteffect for corruption related text
		playAnimation(StageScene.Sleeping, "sleep", {pc="pc", npc="azazel", bodyState={naked=true, hard=GM.pc.getLust()>80}, npcBodyState={naked=true, hard=false}})
		if !undressed:
			saynn("[say=azazel]I don't even have to unwrap you of clothes, you are already in your birthday suit, how convenient. Let me match your attire then.[/say]")
			saynn("He says as he removes his inmate uniform off his body.")
			if getModuleFlag("IssixModule", "Saw_Azazel_Naked", false) == false:
				saynn("You realize it's the first time you see Azazel naked. Which means that his {azazel.pussyStretch} vagina is now fully visible to you. Above it you can see a [pulse color=#ac1eff height=0.9 freq=0.6]womb tattoo[/pulse] seemingly glowing a bit in shade of red as well as multiple of nipples on his chest.")
				saynn("On his lower back words [pulse color=#ac1eff height=0.9 freq=0.6]”PROPERTY OF ISSIX” branded[/pulse] onto the skin - a mark of his [pulse color=#ac1eff height=0.9 freq=0.6]Master[/pulse].")
		if GM.pc.isHeavilyPregnant():
			saynn("[say=azazel]Now, what I wanted to do is to lay on you in the bed, our bodies touching, but with your [pulse color=#ac1eff height=0.9 freq=0.6]belly full of cubs[/pulse] I see I'll have to improvise.[/say]")
			saynn("He enters his bed just above you, you both locked in a stare. Both of his legs go around you and he is trying to accommodate your state as much as he can, with his back bent like a pretzel.")
		else:
			saynn("[say=azazel]We are alllmost there.[/say]")
			saynn("He enters the bed, and begins laying on top of you, belly to belly, with stares locked onto one another.")
		if GM.pc.hasPenis() and GM.pc.hasVagina():  # TODO This text needs improvements
			if GM.pc.hasReachablePenis() and GM.pc.hasReachableVagina():
				saynn("You can feel the pressure on your entire body, including your {pc.penisSize} {pc.penis}, your {pc.vagina} is starting to moisturize with this close proximity to another. You don't know what are Azazel's intentions, though you hope your bodly lust doesn't make things awkward.")
		elif GM.pc.hasPenis():
			if GM.pc.hasReachablePenis():
				saynn("You can feel the pressure on your entire body, including your {pc.penisSize} {pc.penis}, you don't know what are Azazel's intentions, though you hope your penis acting up won't mess anything up.")
			else:
				saynn("You can feel the pressure on your entire body, and even though your caged {pc.penisSize} {pc.penis} feels secure within confines of the cage, you can't deny the prospect of laying body to body does make the cage feel quite tight.")
		elif GM.pc.hasVagina():
			saynn("You can feel the pressure on your entire body, including your {pc.vagina}, you don't know what are Azazel's intentions, though you hope your bodly lust doesn't make things awkward.")
		saynn("[say=azazel]Now, I only hope that you feel comfortable, I know I feel pretty comfortable myself.[/say]")
		saynn("He giggles, as he plays with the leash in his paw, giving it slight tugs while staring at you with look of a predator. After a minute, he reaches for something he has dropped just below the bed's frame. It's underwear, you can easily recognize that musk, it's [pulse color=#ac1eff height=0.9 freq=0.6]Issix's underwear[/pulse]. Soon after it's on your face, stretching all over your muzzle leaving your eyes uncovered, you do need them to look at Azazel's pretty eyes, after all.")
		saynn("[say=azazel]Hihi, huff it for me, can you?[/say]")
		saynn("He lowers his head until it basically touches the same cloth that's on your nose. You breathe air, the [pulse color=#ac1eff height=0.9 freq=0.6]smell of musk[/pulse] and a [pulse color=#ac1eff height=0.9 freq=0.6]little bit of cum[/pulse] is [pulse color=#ac1eff height=0.9 freq=0.6]overwhelming[/pulse] so close to your olfactory system.")
		addButton("Embrace", "Embrace the feeling, submit to it, indulge", "nogasmask3")
		addDisabledButton("Reject", "Your mind is scrambled, you cannot just reject the feeling")  # To really ram that feeling of no choice into the player, love it

	if state == "nogasmask3":
		playAnimation(StageScene.Sleeping, "rub", {pc="pc", npc="azazel", bodyState={naked=true, hard=GM.pc.getLust()>80}, npcBodyState={naked=true, hard=false}})
		saynn("Both you and Azazel now breathe in unison, your feel [pulse color=#ac1eff height=0.9 freq=0.6]connected[/pulse], somehow, together indulging in something so... Special. Azazel's half-closed [pulse color=#ac1eff height=0.9 freq=0.6]purple eyes[/pulse] look relaxed now, he no longer feels [pulse color=#ac1eff height=0.9 freq=0.6]dominating[/pulse], that is, if he ever was. He keeps looking straight into your eyes, you really wonder what he sees, how your eyes look like. Are they taken over just the same by the moment of [pulse color=#ac1eff height=0.9 freq=0.6]lust[/pulse]? What's their color? You don't even remember, perhaps it's [pulse color=#ac1eff height=0.9 freq=0.6]crimson purple just like Azazel's eyes[/pulse]? Wouldn't that make you [pulse color=#ac1eff height=0.9 freq=0.6]like him even more[/pulse]?")
		saynn("Would it be bad to [pulse color=#ac1eff height=0.9 freq=0.6]be like Azazel[/pulse]? [pulse color=#ac1eff height=0.9 freq=0.6]Getting pounded by your Master[/pulse] whenever [pulse color=#ac1eff height=0.9 freq=0.6]Master[/pulse] feels like it? [pulse color=#ac1eff height=0.9 freq=0.6]A strong, powerful masculine creature tugging on your leash[/pulse], feeding you? You remember what Azazel said the first time he met you wandering - how his - your [pulse color=#ac1eff height=0.9 freq=0.6]Master[/pulse] still has space in his little corner, how [pulse color=#ac1eff height=0.9 freq=0.6]you'd fit in[/pulse]. You begin to realize that [pulse color=#ac1eff height=0.9 freq=0.6]this life[/pulse] might be for you, Azazel looks happy, [pulse color=#ac1eff height=0.9 freq=0.6]you would be too[/pulse], right?")
		if GM.pc.hasReachableVagina():
			saynn("You can feel Azazel's increasingly [pulse color=#ac1eff height=0.9 freq=0.6]wet {azazel.vagina}[/pulse], dripping on your crotch, mingling with your own love juices.")
		else:
			saynn("You can feel Azazel's increasingly [pulse color=#ac1eff height=0.9 freq=0.6]wet {azazel.vagina}[/pulse], dripping on your crotch.")
		saynn("Both of you lay stuck in a daze, Azazel rubbing his {azazel.vagina} on you. A lot of thoughts run through your head, all of them in some way or form about [pulse color=#ac1eff height=0.9 freq=0.6]submitting[/pulse] and [pulse color=#ac1eff height=0.9 freq=0.6]obeying Master Issix[/pulse], a caring demon-dragon [pulse color=#ac1eff height=0.9 freq=0.6]who's musk is so strong and enticing[/pulse]."+(" [pulse color=#ac1eff height=0.9 freq=0.6]Who's cum you have already swallowed so eagerly. In your mind you are his bitch in heat already, just another bitch, who needs a Master to tell {pc.him} what to do, what to think.[/pulse]" if getModuleFlag("IssixModule", "Azazel_Agreed_Kiss", false) else ""))

		saynn("[pulse color=#ac1eff height=0.9 freq=0.6]Your mind wanders in blissful urges of submission to a superior creature, of giving your freedom away[/pulse], at least until you are woken up from those thoughts by tugs on your collar.")
		addButton("Huh?", "What's going on?", "nogasmask4")

	if state == "nogasmask4":
		playAnimation(StageScene.Solo, "stand", {pc="pc", bodyState={naked=true, hard=true}})
		saynn("You open your eyes and see Azazel on the floor nearby, the piece of clothing no longer on your face. Azazel is putting on his lilac prison uniform, you look at him confused.")
		saynn("[say=azazel]Welcome back! Sorry, I couldn't believe you were so deep, like, I've stood up good 10 minutes ago took the boxers from your face and you didn't even seem to acknowledge that. Are you okey?[/say]")
		saynn("[say=pc]I think so? I just...[/say]")
		saynn("You struggle for a moment with the idea of telling Azazel what you saw and how you felt, but you felt embarrassed about the experience.")
		saynn("[say=azazel]Oh, that's good. I were a bit worried.. Speaking of worried, I'm sorry I can't stay with you longer, it was so fucking amazing just laying with you heree sniffing my Master's dirty boxers, but I don't want to make my Master worried, and that's exactly what I'll do if my toilet break extends to an hour. See you around cutie! Oh, and feel free to have fun with my toys if you want to![/say]")
		saynn("He jumps along the hall, leaving you still trying to make sense of your situation and everything that happened, it felt so... Overwhelming and... Good? You feel conflicted but less so now, the idea of submitting to another creature, of giving them the authority over you is no longer so distant. You sit on the bed before standing up. Maybe Azazel will let you use his toys some other day, maybe you should go back to your cell and relieve yourself of the pent up lust you have gathered... Ugh, your head hurts now.")
		addButton("Leave", "Leave Azazel's cell", "endthescene")

	if state == "donotfollow":
		saynn("You push away Azazel with both of his arms, his hold of your paw breks, he looks at you quizzically.")
		saynn("[say=pc]I don't want to go with you, I don't know what you have planned but I don't like it.[/say]")
		saynn("[say=azazel]How can you not like it if you don't know what it is?[/say]")
		saynn("[say=pc]I just don't want to.[/say]")
		saynn("Azazel signs, disappointed.")
		saynn("[say=azazel]Alright, sorry for bothering you, have a good day...[/say]")
		saynn("He leaves, just like that.")
		addButton("Leave", "Take your leave as well", "endthescene")


func getDevCommentary():
	return ""

func hasDevCommentary():
	return false

func saveData():
	var data = .saveData()

	data["playetFluids"] = player_fluids
	data["pcundressed"] = undressed

	return data


func loadData(data):
	.loadData(data)
	player_fluids = SAVE.loadVar(data, "playetFluids", null)
	undressed = SAVE.loadVar(data, "undressed", null)

func _react(_action: String, _args):
	# if _action == "stripping":
	# 	for slot in GM.pc.getInventory().getAllEquippedItems():  # Force unequip all items, why is there getEquippedItems and getAllEquippedItems doing the same thing lol
	# 		var item = GM.pc.getInventory().getAllEquippedItems()[slot]
	# 		if GM.pc.getInventory().unequipSlotUnlessRestraint(slot):
	# 			addMessage("Azazel took off your "+item.getVisibleName()+".")

	if _action == "nogasmask":
		processTime(10*60)
		GM.pc.addLust(30)

	if _action == "nogasmask2":
		processTime(10*60)
		GM.pc.addLust(40)
		undressed = _args[0]

	if _action == "nogasmask3":
		processTime(40*60)
		GM.pc.addLust(40)
		GM.pc.cummedOnBy("azazel", FluidSource.Vagina, 0.1)
		setModuleFlag("IssixModule", "Saw_Azazel_Naked", true)

	if _action == "followedazazel":
		processTime(10*60)
		GM.pc.setLocation("cellblock_lilac_nearcell")

	if(_action == "endthescene"):
		setModuleFlag("IssixModule", "Azazel_Corruption_Scene", 4)
		endScene()
		return

	setState(_action)
