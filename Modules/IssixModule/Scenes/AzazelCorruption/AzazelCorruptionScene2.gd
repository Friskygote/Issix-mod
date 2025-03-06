extends SceneBase

var player_fluids = null
var player_restraint = null  # store player's item

func _init():
	sceneID = "AzazelCorruption2"

func _run():
	if(state == ""):
		addCharacter("azazel")
		playAnimation(StageScene.Hug, "idle", {pc="pc", npc="azazel", bodyState={naked=false}, npcBodyState={naked=false}})
		saynn("Lost in the murmur of big hallways you walk towards your goal when you get gently hit on your chest by a tail, a long leathery red tail ending in a spade. You blink, and realize that the tail you saw is in actuality a regular gray feline tail, you stop in your tracks, confused, looking for tail's owner you follow the appendage, finding Azazel lusty look focused on you.")
		saynn("[say=azazel]What's that in your look? Surprised to see me again outside of the corner?[/say]")
		saynn("[say=pc]Uhh, no, it's just... Ah, forget it.[/say]")
		saynn("He smiles and walks to your right side, his tail curled around the front of your body, climbing upwards, blocking your way. His arms wrap around you, his smell sticking to you as he borrows your personal space entirely. He says, struggling to stand as high on his toes, close to your right ear.")
		saynn("[say=azazel]Tell me cutie, have you ever kissed?[/say]")
		addButton("Yes", "You did kiss in the past", "kissed")
		addButton("No", "Didn't kiss before", "notkissed")

	if state == "kissed":
		saynn("[say=azazel]Oh, experienced? I don't have to teach you that important skill then. Though... Everyone's kiss is different, and you never know how it feels until you try![/say]")
		saynn("He giggles playfully into your ear, you turn your head to meet feline's eyes, they look so [pulse color=#ac1eff height=0.0 freq=1.0]inviting[/pulse].")
		saynn("[say=azazel]This days I rarely kiss lips though, not much space for romance in this place...[/say]")
		saynn("He says the last part quieter than usual, in rather disappointed tone, you barely hear it, before his tone shifts once again to seductive kitten.")
		saynn("[say=azazel]So what do you say about some tongue muscle training with me? I really want to taste you![/say]")
		addButton("Sure", "Accept Azazel's offer (CW: drug use, cum swap)", "agreekiss")
		if (GM.pc.getPersonality().getStat(PersonalityStat.Subby) < 0.3) and GM.pc.getLust() < 70 and !GM.pc.isWearingHypnovisor() and !GM.pc.hasEffect(StatusEffect.Suggestible) and !GM.pc.hasEffect(StatusEffect.UnderHypnosis):
			addButton("Reject", "Reject Azazel's advance", "denykiss")
		else:
			addDisabledButton("Reject", "You are too subby, too lusty or are under forced obedience effect, you cannot resist Azazel's allure")

	if state == "notkissed":
		saynn("[say=pc]Truth be told, I've never kissed anyone...[/say]")
		saynn("[say=azazel]Did you?! Woaaah, this is such an opportunity to learn! Oh man, I'm so excited![/say]")
		saynn("You can see Azazel's tail going haywire behind him at edge of your vision, his voice incredibly excited.")
		saynn("[say=azazel]You must know, everyone's kiss is different, all have different taste and ways they kiss! It's always a combination of factors like forcefulness, approach, timing, grace... I've had many kisses! Well... Maybe not in here exactly...[/say]")
		saynn("Suddenly his demeanor changes as he says last sentence, his body less... Vibrating, his speech much quieter - barely audible, there is sadness in his voice, all of those quickly come back to previous state with his next sentence, you face Azazel's face, he seems so enthusiastic and happy, his eyes look [pulse color=#ac1eff height=0.0 freq=1.0]inviting[/pulse].")
		saynn("[say=azazel]But it's all fine with you in here, why cry over something like that when we could do exactly that! What do you say? Would you want me to still your first kiss cutie? Please, let me, let me! I want to taste you and show you![/say]")
		addButton("Sure", "Accept Azazel's offer (CW: drug use, cum swap)", "agreekiss")
		if (GM.pc.getPersonality().getStat(PersonalityStat.Subby) < 0.3) and GM.pc.getLust() < 70 and !GM.pc.isWearingHypnovisor() and !GM.pc.hasEffect(StatusEffect.Suggestible) and !GM.pc.hasEffect(StatusEffect.UnderHypnosis):
			addButton("Reject", "Reject Azazel's advance", "denykiss")
		else:
			addDisabledButton("Reject", "You are too subby, too lusty or are under forced obedience effect, you cannot resist Azazel's allure")

	if state == "denykiss":
		saynn("[say=pc]I don't think I want that Azazel, sorry.[/say]")
		saynn("His face fills with sorrow, tail drops, along with his arms and eyes. He is defeated.")
		saynn("[say=azazel]But... Why? I... Only wanted to help, and, and... Give us some fun moments to remember...[/say]")
		saynn("[say=pc]I'm just... Not really into that, sorry kitten.[/say]")
		saynn("[say=azazel]No, it's... Fine... Just...[/say]")
		saynn("He lets go of you and slowly begins to stumble towards different direction.")
		saynn("[say=azazel]I had hoped... It was so perfect...[/say]")
		saynn("He mumbles to... Himself? While slowly walking away.")
		addButton("Leave", "Time to take your leave", "endthescene")

	if state == "agreekiss":
		playAnimation(StageScene.Hug, "kiss", {pc="pc", npc="azazel", bodyState={naked=false}, npcBodyState={naked=false}})
		saynn("[say=pc]Don't see why not, lets do this![/say]")
		saynn("You can feel Azazel's purr coming from your body as you say that. He goes behind you, his tail trailing behind but constantly making contact with your body, teasing you, tasting you. He comes from your left side and goes in front of you, his tail finally leaving you alone as it swishes behind his back. His face in sly grin.")
		if player_restraint != null and player_restraint.getRestraintData().getRestraintType() == RestraintType.Muzzle:
			saynn("[say=azazel]But you know, maybe first we should stash that thing somewhere, I think it looks phenomenally on you and makes you look so much like a pet, but you know, it may be a littttle bit of hindrance when kissing. Don't worry though, I have some experience with those, I can relieve you of it for just a few minutes and then I'll put it on.[/say]")
			saynn("Azazel stashes your "+player_restraint.getVisibleName())
		elif player_restraint != null and player_restraint.getRestraintData().getRestraintType() == RestraintType.Gag:
			saynn("[say=azazel]But you know, maybe first we should stash that thing somewhere, I think you sound really funny with it, but not gonna lie, kinda makes kissing more difficult. I have some experience with those, I can relieve you of it for just a few minutes and then I'll put it on.[/say]")
			saynn("Azazel stashes your "+player_restraint.getVisibleName())
		saynn("[say=azazel][pulse color=#ac1eff height=0.0 freq=1.0]You look so good.[/pulse][/say]")

		saynn("Immediately after saying those words he leans into you, his arms wrapping around yours as his lips touch yours. He isn't forceful but he isn't entirely passive either, his tongue mingling with yours, so does his saliva. Your arms wrap around his shoulders as well, which felt like the only natural action you could think of while being embraced by the feline.")
		saynn("What Azazel said before, about everyone's kiss being different is certainly true, you can feel just how much Azazel's kiss feels like his personal „brand” of kiss, which is exactly how you imagined slutty kitten to taste like, feeling salty, like... Cum. The taste intensified, with each moment it felt like more and more of salty cum, which he was now being spit into your mouth.")
		addButton("Continue", "Continue making out with Azazel", "kisscontinue")
		if GM.pc.hasPerk(Perk.CumBreath) or GM.pc.getSkillLevel(Skill.CumLover) > 10:
			saynn("And you eagerly accepted the gift, which you are so well acquainted with. It's just sharing the seed of another male, you are quite good with that.")
		else:
			saynn("At first you wanted to protest, not having a lot of experience and contact with cum in your mouth, but this thought quickly got lost as the idea of swallowing virile male cum somehow made you feel hot, wanting for this treatment.")
			addDisabledButton("Push", "You can't refuse Azazel's gift, it feels too good")

	if state == "kisscontinue":
		playAnimation(StageScene.Hug, "idle", {pc="pc", npc="azazel", bodyState={naked=false}, npcBodyState={naked=false}})
		if GM.pc.getFetishHolder().getFetishValue(Fetish.DrugUse) > 0:
			saynn("As the kiss continues, you feel Azazel pushing something else along with plentiful of cum, something much more solid - small, but solid, you quickly realize what it is - pills. You don't know what kind of, you don't know where from and what they will do to you, but you want to [pulse color=#ac1eff height=0.0 freq=1.0]swallow them[/pulse], you want them in your belly, to work on you. Whatever Azazel planned for you, it must be good, and you love this kind of fun. You play around with the pills in your mouth for a moment before you [pulse color=#ac1eff height=0.0 freq=1.0]swallow them[/pulse] whole into your gullet, awaiting fun effects they may have on you.")
		else:
			saynn("As the kiss continues a realization dawns on you as Azazel pushes something expertly with his skilled tongue - something much more solid than just cum, something small - pills. Panic sets in, you feel betrayed, you want to pull out of the kiss and yet you feel Azazel's paw behind your head, his mouth pushing onto yours with even bigger force locking you in. He continues to push the pills to go inside of your gullet, and... [pulse color=#ac1eff height=0.0 freq=1.0]You let him[/pulse]. You can't tell if it was your own mistake or you have given in to the moment of lust, but along with cum you swallowed what you think were two pills.")

		saynn("The after 30 seconds of kissing, both of you relent, having made mess with your saliva on both faces. Azazel looks at your face and laughs lightheartedly.")

		if player_fluids != null:
			if "Piss" in player_fluids and ("Cum" in player_fluids or "GirlCum" in player_fluids):
				saynn("[say=azazel]Haha, I totally didn't expect you to be way ahead of me in mouth dirtiness, not only I could feel cum inside of your mouth but piss as well! I almost feel defeated![/say]")
				saynn("He laughs after saying that")
			elif "Cum" in player_fluids or "GirlCum" in player_fluids:
				saynn("[say=azazel]Here I were, thinking I'll introduce new flavor to your pretty mouth and you already had plenty of your own inside, damn. Guess both of our us are cum starved [pulse color=#ac1eff height=0.0 freq=1.0]sluts[/pulse].[/say]")
			elif "Piss" in player_fluids:
				saynn("[say=azazel]You surprised me {pc.name}, I didn't expect you to taste of piss! That's so hot and kinky, how do you like the taste of urine? I mean, I know how was my first time but you get used to it pretty quick.[/say]")

		saynn("[say=azazel]That was really something, thank you {pc.name}![/say]")

		saynn("[say=pc]It was! Thank you Azazel![/say]")

		saynn("Azazel cleans his face with his surprisingly long tongue, it's still drenched in saliva but now it's not as visible as before, maybe except the obvious lingering smell of cum which you now have as well thanks to all that cum that spilled out when you were making out. You feel... Dazed, either due to experience or the pills, you can't tell.")

		saynn("[say=pc]Oh, I almost forgot to ask... Uhh.. What were the two pills that you had for me?[/say]")

		saynn("[say=azazel]Hehehehe, both of them are making you [pulse color=#ac1eff height=0.0 freq=1.0]feel good[/pulse], you don't have to worry about it. If you were to [pulse color=#ac1eff height=0.0 freq=1.0]join my Master[/pulse] as his pet I could share more of those with you, that and [pulse color=#ac1eff height=0.0 freq=1.0]so much more[/pulse], and we could make out daily![/say]")
		if player_restraint != null:
			saynn("[say=azazel]Oh, and have this back.[/say]")
			saynn("Azazel puts on your "+player_restraint.getVisibleName() +" back on.")
			saynn("[say=azazel]It fits you.[/say]")

		saynn("[say=pc]Hihi, I'd love that![/say]")
		saynn("[say=azazel]I'm sure you would.[/say]")
		saynn("He says with proudness and authority in his voice, before he turns towards different direction and slowly walking away.")
		saynn("[say=azazel]I'm off now, see you later cutie![/say]")
		saynn("[say=pc]Seeee you, Az![/say]")
		addButton("Leave", "No reason to linger around, unless you need a moment with that dizzy head of yours", "endthescene")



func saveData():
	var data = .saveData()

	data["playerRestraint"] = player_restraint
	data["playetFluids"] = player_fluids

	return data

func loadData(data):
	.loadData(data)

	player_fluids = SAVE.loadVar(data, "playetFluids", null)
	player_restraint = SAVE.loadVar(data, "playerRestraint", null)


func getDevCommentary():
	return ""

func hasDevCommentary():
	return false

func _react(_action: String, _args):
	if _action == "kisscontinue":
		processTime(3*60)
		var itemRef = GlobalRegistry.getItemRef("HeatPill")
		if(itemRef == null):
			return
		itemRef.useInSex(GM.pc)
		GM.pc.getPersonality().addStat(PersonalityStat.Subby, 0.25)
		addMessage("You became more subby after the pill given to you by Azazel")
		if GM.pc.getFetishHolder().getFetishValue(Fetish.DrugUse) > 0:
			GM.pc.addLust(50)
		else:
			GM.pc.addLust(20)
		GM.pc.addIntoxication(0.3)
		if player_restraint != null:
			GM.pc.getInventory().equipItem(player_restraint)

	if _action == "agreekiss":
		var pc_inv = GM.pc.getInventory()
		if GM.pc.isMuzzled() or GM.pc.isGagged():  # TODO Predict GasMask like equipment as well
			player_restraint = pc_inv.getEquippedItem(InventorySlot.Mouth)
			# if player_restraint[0].getRestraintData().hasSmartLock():
			# 	player_restraint[1] = true
			pc_inv.unequipSlot(InventorySlot.Mouth)
		processTime(3*60)
		var azazel = GlobalRegistry.getCharacter("azazel")
		azazel.cummedInBodypartByAdvanced(BodypartSlot.Head, "issix", {"noEvent": true}, FluidSource.Penis, 0.4)
		azazel.bodypartTransferFluidsToAmount(BodypartSlot.Head, "pc", BodypartSlot.Head, 0.8, 0.2)
		GM.pc.addLust(20)
		setModuleFlag("IssixModule", "Azazel_Agreed_Kiss", true)

	if _action == "kissed":
		processTime(3*60)
		player_fluids = GM.pc.getBodypart(BodypartSlot.Head).getFluids().getFluidList()
		setModuleFlag("IssixModule", "Azazel_Corruption_Scene", 3)

	if _action == "notkissed":
		processTime(3*60)
		setModuleFlag("IssixModule", "Azazel_Corruption_Scene", 3)



	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
