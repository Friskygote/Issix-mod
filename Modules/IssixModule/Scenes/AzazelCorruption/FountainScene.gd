extends SceneBase

const Globals = preload("res://Modules/IssixModule/Globals.gd")

func _init():
	sceneID = "AzazelDreamFountainScene"

func _run():
	if(state == ""):
		saynn("You approach a „fountain” at the crossing of hallways. It looks out of place, being in the center like this.")
		if(OPTIONS.isContentEnabled(ContentType.Watersports)):
			saynn("Judging by the smell, the liquid falling from the ceiling is unmistakably urine. You can't wrap your head around the question where does it come from nor how there is just so much of it. At the center there is a a pillar, though the current of urine makes it difficult to make out how it looks like. You could try to come closer but you'd have to sacrifice the dry state of your "+Globals.getSkinWord()+".")
		else:
			saynn("You look at the „fountain”, there is large amount of water falling from the ceiling. You can't wrap your head around the question where does it come from. At the center there is a a pillar, though the current of water makes it difficult to make out how it looks like. You could try to come closer but you'd have to sacrifice the dry state of your "+Globals.getSkinWord()+".")
		if Globals.returnValueFromStateFlag("Azazel_Corr_Dream_State", "Fountain_Checks", 0) < 8:
			addButton("Check", "Come closer and check the pillar", "checkthepillar")
		else:
			addDisabledButton("Check", "Seriously, stop.")
		addButton("Leave", "Leave the fountain alone", "endthescene")

	if state == "checkthepillar":  # TODO Make sure the font is properly working before the release
		saynn("You decide to come closer to the pillar. It's ordained by numerous symbols, none of which you understand.")
		sayn("[color=#ac1eff][runic]ᚺᛖᚱ ᛚᛁᛈᛋ ᛒᛖᚷᚨᚾ ᛏᛟ ᛋᚲᛟᚱᚲᚺ,[/runic][/color]")
		sayn("[color=#ac1eff][runic]ᛏᚺᚨᛏ ᛃᚢᛁᚲᛖ ᚹᚨᛋ ᚹᛟᚱᛗᚹᛟᛟᛞ ᛏᛟ ᚺᛖᚱ ᛏᛟᚾᚷᚢᛖ,[/runic][/color]")
		sayn("[color=#ac1eff][runic]ᛋᚺᛖ ᛚᛟᚨᛏᚺ’ᛞ ᛏᚺᛖ ᚠᛖᚨᛋᛏ:[/runic][/color]")
		sayn("[color=#ac1eff][runic]ᚹᚱᛁᛏᚺᛁᚾᚷ ᚨᛋ ᛟᚾᛖ ᛈᛟᛋᛋᛖᛋᛋ’ᛞ ᛋᚺᛖ ᛚᛖᚨᛈ’ᛞ ᚨᚾᛞ ᛋᚢᚾᚷ,[/runic][/color]")
		sayn("[color=#ac1eff][runic]ᚱᛖᚾᛏ ᚨᛚᛚ ᚺᛖᚱ ᚱᛟᛒᛖ, ᚨᚾᛞ ᚹᚱᚢᚾᚷ[/runic][/color]")
		sayn("[color=#ac1eff][runic]ᚺᛖᚱ ᚺᚨᚾᛞᛋ ᛁᚾ ᛚᚨᛗᛖᚾᛏᚨᛒᛚᛖ ᚺᚨᛋᛏᛖ,[/runic][/color]")
		sayn("[color=#ac1eff][runic]ᚨᚾᛞ ᛒᛖᚨᛏ ᚺᛖᚱ ᛒᚱᛖᚨᛋᛏ.[/runic][/color]")
		sayn("[color=#ac1eff][runic]ᚺᛖᚱ ᛚᛟᚲᚴᛋ ᛋᛏᚱᛖᚨᛗ’ᛞ ᛚᛁᚴᛖ ᛏᚺᛖ ᛏᛟᚱᚲᚺ[/runic][/color]")
		sayn("[color=#ac1eff][runic]ᛒᛟᚱᚾᛖ ᛒᚤ ᚨ ᚱᚨᚲᛖᚱ ᚨᛏ ᚠᚢᛚᛚ ᛋᛈᛖᛖᛞ,[/runic][/color]")
		sayn("[color=#ac1eff][runic]ᛟᚱ ᛚᛁᚴᛖ ᛏᚺᛖ ᛗᚨᚾᛖ ᛟᚠ ᚺᛟᚱᛋᛖᛋ ᛁᚾ ᛏᚺᛖᛁᚱ ᚠᛚᛁᚷᚺᛏ,[/runic][/color]")
		sayn("[color=#ac1eff][runic]ᛟᚱ ᛚᛁᚴᛖ ᚨᚾ ᛖᚨᚷᛚᛖ ᚹᚺᛖᚾ ᛋᚺᛖ ᛋᛏᛖᛗᛋ ᛏᚺᛖ ᛚᛁᚷᚺᛏ[/runic][/color]")
		sayn("[color=#ac1eff][runic]ᛋᛏᚱᚨᛁᚷᚺᛏ ᛏᛟᚹᚨᚱᛞ ᛏᚺᛖ ᛋᚢᚾ,[/runic][/color]")
		sayn("[color=#ac1eff][runic]ᛟᚱ ᛚᛁᚴᛖ ᚨ ᚲᚨᚷᛖᛞ ᛏᚺᛁᚾᚷ ᚠᚱᛖᛖᛞ,[/runic][/color]")
		saynn("[color=#ac1eff][runic]ᛟᚱ ᛚᛁᚴᛖ ᚨ ᚠᛚᚤᛁᚾᚷ ᚠᛚᚨᚷ ᚹᚺᛖᚾ ᚨᚱᛗᛁᛖᛋ ᚱᚢᚾ.[/runic][/color]")
		saynn("[say=pc]What the fuck.[/say]")
		saynn("Deciding that staying in here under the assault of "+("piss" if OPTIONS.isContentEnabled(ContentType.Watersports) else "water")+" from above isn't the best idea, you come back.")
		addButton("Leave", "Leave", "")

	if state == "playerisbeingsilly":
		addCharacter("hiisidemon")
		addCharacter("azazeldemon")
		saynn("You go against the waterfall of wat fluid for 8th time, wanting to see the runic writing on it. This time the runes pulsate with bright purple color blinding you momentarily, you feel your knees go weak, your entire body collapsing, you lose consciousnesses completely soaked at the bottom of the fountain. While you are unconscious, the following conversation plays around you.")
		saynn("[say=hiisidemon]Should we do something? {pc.He} looks kinda miserable in there.[/say]")
		saynn("[say=azazeldemon]Nah, I think we should leave {pc.him} alone. they won't drown in this puddle.[/say]")
		saynn("[say=hiisidemon]How did that even happen?[/say]")
		saynn("[say=azazeldemon]I think, exhaustion? Maybe?[/say]")
		saynn("[say=hiisidemon]From what? Just how weak do you have to be to collapse in a fountain like that? What were they even trying to do here? There is nothing here other than this dumb poem.[/say]")
		saynn("[say=azazeldemon]It's not dumb, it's a beautiful story... From what I see, there are some traces of corruptive residue on {pc.him}, odd.[/say]")
		saynn("[say=hiisidemon]Where did that come from?[/say]")
		saynn("[say=azazeldemon]Can't tell. Anyways, lets head back before they wake up, not like we are short on time. The ceremony is going to happen when {pc.he} is ready.[/say]")
		saynn("[say=hiisidemon]Okey then, beats me.[/say]")
		saynn("* Some time later *")
		addButton("Stand up", "There is more to do here", "endthescene")


func getDevCommentary():
	return ""

func hasDevCommentary():
	return false


func _react(_action: String, _args):
	if _action == "checkthepillar":
		if(OPTIONS.isContentEnabled(ContentType.Watersports)):
			GM.pc.coverBodyWithFluid("Piss", 2000.0)
		else:
			GM.pc.coverBodyWithFluid("Water", 2000.0)
		var fountain_checks = Globals.returnValueFromStateFlag("Azazel_Corr_Dream_State", "Fountain_Checks", 0)
		if fountain_checks == 7:
			_action = "playerisbeingsilly"
		Globals.modifyDictStates("Azazel_Corr_Dream_State", "Fountain_Checks", fountain_checks+1)

	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
