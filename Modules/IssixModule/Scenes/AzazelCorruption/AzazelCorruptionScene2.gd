extends SceneBase

var player_fluids = null

func _init():
	sceneID = "AzazelCorruption2"

func _run():
	if(state == ""):
		addCharacter("azazel")
		saynn("Lost in the murmur of big hallways you walk towards your goal when you get gently hit on your chest by a tail, a long leathery red tail ending in a spade. You blink, and realize that the tail you saw is in actuality a regular gray feline tail, you stop in your tracks, confused, looking for tail's owner you follow the appendage, finding Azazel lusty look focused on you.")
		saynn("[say=azazel]What's that in your look? Surprised to see me again outside of the corner?[/say]")
		saynn("[say=pc]Uhh, no, it's just... Ah, forget it.[/say]")
		saynn("He smiles and walks to your right side, his tail curled around the front of your body, climbing upwards, blocking your way. His arms wrap around you, his smell sticking to you as he borrows your personal space entirely. He says, close to your right ear.")
		saynn("[say=azazel]Tell me cutie, have you ever kissed?[/say]")
		addButton("Yes", "You did kiss in the past", "kissed")
		addButton("No", "Didn't kiss before", "notkissed")

	if state == "kissed":
		saynn("[say=azazel]Oh, experienced? I don't have to teach you that important skill then. Though... Everyone's kiss is different, and you never know how it feels until you try![/say]")
		saynn("He giggles playfully into your ear, you turn your head to meet feline's eyes, they look so [color=#ac1eff]inviting[/color].")
		saynn("[say=azazel]This days I rarely kiss lips though, not much space for romance in this place...[/say]")
		saynn("He says the last part quieter than usual, in rather disappointed tone, you barely hear it, before his tone shifts once again to seductive kitten.")
		saynn("[say=azazel]So what do you say about some tongue muscle training with me? I really want to taste you![/say]")
		addButton("Sure", "Accept Azazel's offer (CW: drug use, cum swap)", "agreekiss")
		if (GM.pc.getPersonality().getStat(PersonalityStat.Subby) < 0.3) and GM.pc.getLust() < 70 and !GM.pc.isWearingHypnovisor() and !GM.pc.hasEffect(StatusEffect.Suggestible) and !GM.pc.hasEffect(StatusEffect.UnderHypnosis):
			addButton("Reject", "Reject Azazel's advance", "denykiss")
		else:
			addDisabledButton("Reject", "You are too subby, too lusty or are under forced obedience effect, you cannot resist Azazel's allure")

	if state == "notkissed":


	if state == "agreekiss":
		saynn("[say=pc]Don't see why not, lets do this![/say]")
		saynn("You can feel Azazel's purr coming from your body as you say that. He goes behind you, his tail trailing behind but constantly making contact with your body, teasing you, tasting you. He comes from your left side and goes in front of you, his tail finally leaving you alone as it swishes behind his back. His face in sly grin.")
		saynn("[say=azazel][color=#ac1eff]You look so good.[/color][/say]")
		saynn("Immediately after saying those words he leans into you, his arms wrapping around yours as his lips touch yours. He isn't forceful but he isn't entirely passive either, his tongue mingling with yours, so does his saliva. Your arms wrap around his shoulders as well, which felt like the only natural action you could think of while being embraced by the feline.")
		saynn("What Azazel said before, about everyone's kiss being different is certainly true, you can feel just how much Azazel's kiss feels like his personal „brand” of kiss, which is exactly how you imagined slutty kitten to taste like, feeling salty, like... Cum. The taste intensified, with each moment it felt like more and more of salty cum, which he was now being spit into your mouth.")
		addButton("Continue", "Continue making out with Azazel", "kisscontinue")
		if GM.pc.hasPerk(Perk.CumBreath) or GM.pc.getSkillLevel(Skill.CumLover) > 10:
			saynn("And you eagerly accepted the gift, which you are so well acquainted with. It's just sharing the seed of another male, you are quite good with that.")
		else:
			saynn("At first you wanted to protest, not having a lot of experience and contact with cum in your mouth, but this thought quickly got lost as the idea of swallowing virile male cum somehow made you feel hot, wanting for this treatment.")
			addDisabledButton("Push", "You can't refuse Azazel's gift, it feels too good")

	if state == "kisscontinue":
		if GM.pc.getFetishHolder().getFetishValue(Fetish.DrugUse) > 0:
			saynn("As the kiss continues, you feel Azazel pushing something else along with plentiful of cum, something much more solid - small, but solid, you quickly realize what it is - pills. You don't know what kind of, you don't know where from and what they will do to you, but you want to [color=#ac1eff]swallow them[/color], you want them in your belly, to work on you. Whatever Azazel planned for you, it must be good, and you love this kind of fun. You play around with the pills in your mouth for a moment before you [color=#ac1eff]swallow them[/color] whole into your gullet, awaiting fun effects they may have on you.")
		else:
			saynn("As the kiss continues a realization dawns on you as Azazel pushes something expertly with his skilled tongue - something much more solid than just cum, something small - pills. Panic sets in, you feel betrayed, you want to pull out of the kiss and yet you feel Azazel's paw behind your head, his mouth pushing onto yours with even bigger force locking you in. He continues to push the pills to go inside of your gullet, and... [color=#ac1eff]You let him[/color]. You can't tell if it was your own mistake or you have given in to the moment of lust, but along with cum you swallowed what you think were two pills.")

		saynn("The after 30 seconds of kissing, both of you relent, haaving made mess with your saliva on both faces. Azazel looks at your face and laughs lightheartedly.")

		if player_fluids != null:
			if "Piss" in player_fluids and ("Cum" in player_fluids or "GirlCum" in player_fluids):
				saynn("[say=azazel]Haha, I totally didn't expect you to be way ahead of me in mouth dirtiness, not only I could feel cum inside of your mouth but piss as well! I almost feel defeated![/say]")
				saynn("He laughs after saying that")
			elif "Cum" in player_fluids or "GirlCum" in player_fluids:
				saynn("[say=azazel]Here I were, thinking I'll introduce new flavor to your pretty mouth and you already had plenty of your own inside, damn. Guess both of our us are cum starved [color=#ac1eff]sluts[/color].[/say]")
			elif "Piss" in player_fluids:
				saynn("[say=azazel]You surprised me {pc.name}, I didn't expect you to taste of piss! That's so hot and kinky, how do you like the taste of urine? I mean, I know how was my first time but you get used to it pretty quick.[/say]")

		saynn("[say=azazel]That was really something, thank you {pc.name}![/say]")

		saynn("[say=pc]It was! Thank you Azazel![/say]")

		saynn("Azazel cleans his face with his surprisingly very long tongue, it's still drenched in saliva but now it's not as visible as before, maybe except the obvious lingering smell of cum which you now have as well thanks to all that cum that spilled out when you were making out.")

		saynn("[say=pc]Oh, I almost forgot to ask... Uhh.. What were the two pills that you had for me?[/say]")

		saynn("[say=azazel]Hehehehe, both of them are making you feel good, you don't have to worry about it. I can share more with you if you want, but you'd have to join my Master as his pet, there would be much for you if you did that, and we could make out daily![/say]")



func saveData():
	var data = .saveData()

	data["playetFluids"] = player_fluids

	return data

func loadData(data):
	.loadData(data)

	player_fluids = SAVE.loadVar(data, "playetFluids", null)


func _react(_action: String, _args):
	if _action == "kisscontinue":
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

	if _action == "agreekiss":
		# Cum, Piss, Girlcum
		var azazel = GlobalRegistry.getCharacter("azazel")
		azazel.cummedInBodypartByAdvanced(BodypartSlot.Head, "issix", {"noEvent": true}, FluidSource.Penis, 0.4)
		azazel.bodypartTransferFluidsToAmount(BodypartSlot.Head, "pc", BodypartSlot.Head, 0.8, 0.2)
		GM.pc.addLust(20)

	if _action == "kissed":
		player_fluids = GM.pc.getBodypart(BodypartSlot.Head).getFluids().getFluidList()

	if _action == "hot":
		processTime(5*60)
		GM.pc.addLust(30)
		setModuleFlag("IssixModule", "Azazel_Corruption_Scene", 3)


	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
