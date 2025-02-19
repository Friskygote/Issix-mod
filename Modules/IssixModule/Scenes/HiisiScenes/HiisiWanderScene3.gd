extends SceneBase
const Globals = preload("res://Modules/IssixModule/Globals.gd")

var pawnID = ""

func _init():
	sceneID = "HiisiWanderScene3"

func _initScene(_args = []):
	var affection_dict = {}
	var all_pawns = GM.main.IS.getPawns()
	for pawn in all_pawns.values():
		if pawn.isInmate():
			affection_dict[pawn.getAffection("pc")] = pawn.charID
	var values = affection_dict.keys()
	values.sort()
	if values.size() == 0:
		pawnID = "rahi"
	else:
		pawnID = affection_dict[values[-1]]  # TODO See if that's accurate'

func resolveCustomCharacterName(_charID):
	if(_charID == "pawn"):
		return pawnID

func _run():
	if(state == ""):
		addCharacter("lamia")
		addCharacter("azazel")
		addCharacter("hiisi")
		saynn(Globals.getSkinWord())
		saynn("You walk near Issix's corner to see three of Issix standing on their blankets. Both Azazel as well as Lamia stand there looking at Hiisi who standing in their inmate uniform is showing the other two his dance moves. Their master seemingly occupied with something else, with bunch of BDSM restraints in his paws.")
		saynn("[say=hiisi]You have to remember about keeping your arms like his and moving them ever so slowly towards yourself while you push your chest forward. It's just some practice, nothing too hard.[/say]")
		saynn("[say=azazel]Hah, easy for you to say, it's difficult for me to focus on my chest when I have to do this with my arms![/say]")
		saynn("Lamia nods his head while listening to Azazel and trying to replicate Hiisi's moves, with very little success.")
		saynn("[say=hiisi]Come on, a little multitasking! Moving multiple parts of your body at the same time in specific way is everything a dance is, look, you do this, and this at the same time.[/say]")
		saynn("Hiisi repeats the same sequence a few times, his arms at first extended straight in front of his own body, with paws making „grabbing” like gesture, as he slowly pulled them towards his chest extending outward behind him and rotating the paws as if he was rotating old-school light bulbs installed horizontally. As he did that he also moved his chest and lunged his leg forward.")
		saynn("[say=azazel]And the leg too? ARRRRRghhhhhhhhhhhh, I can't do this![/say]")
		saynn("[say=hiisi]Of course you can, I bet you make more sophisticated moves when Master stretches your insides.[/say]")
		saynn("Hiisi says jokingly towards Azazel. You watch as Lamia just continues to attempt at doing the same moves as Hiisi just did.")
		saynn("[say=azazel]Ha. Ha. Just so you know, my breeding moves are patented in 4 planetary systems and recognized as cultural heritage in 2 more.[/say]")
		saynn("Azazel tries to say that in straight face but shortly after Hiisi bursts with laughter he cannot contain himself as well and his face lights up.")
		addButton("Listen", "Continue listening and observing the interaction", "stay")
		addButton("Leave", "Their conversation has no interest to you", "endthesecene")

	if state == "stay":
		saynn("Both of them look at Lamia who's been trying to replicate Hiisi's dance moves on their own for a bit.")
		saynn("[say=hiisi]Hmm, try to move your arm more on the left here, you are too close to your body and it makes it look strange. And you don't want to be straight like a plank with your body here, the chest needs to push forward further than the rest.[/say]")
		saynn("[say=azazel]Also, remember when you put the step forward with your right leg to not bend your knee.[/say]")
		saynn("[say=hiisi]What? You do have to bend your knee. It doesn't work when you do it without bending, your chest just won't extend this far. It's more of a long step with your knee bent.[/say]")
		saynn("[say=azazel]When you showed that, you totally kept the leg unbent.[/say]")
		saynn("[say=hiisi]No, no I didn't, stop pulling my leg.[/say]")
		saynn("[say=azazel]You did.[/say]")
		saynn("[say=hiisi]Hey, I know how to dance „Niagara's Rats”, as things are right now, you can barely coordinate your lungs to keep you alive, not to mention dancing.[/say]")
		saynn("Azazel just sticks his tongue at Hiisi, who continues to help Lamia by gently tapping on their body parts and trying to get them in the right shape. Your passive observance eventually caught you in crossfire.")
		saynn("[say=azazel]Hey there {pc.name}, why don't you join us? You've been looking for a while, say - did Hiisi bend his leg when he showed us his moves?[/say]")
		addButton("He did", "Say that Hiisi did bent his knee", "bent")
		addButton("He didn't", "Say that Hiisi didn't bent his knee", "notbent")
		addButton("Whatever", "Say that it doesn't matter whether he did or not", "doesntmatter")
		addButton("I'm out", "You forgot that you've left your iron running... Or make up more believable excuse", "preendthescene")

	if state in ["bent", "doesntmatter", "notbent"]:
		if state == "bent":
			saynn("[say=pc]Yes, Hiisi's leg was bent.[/say]")
			saynn("[say=azazel]Nooooooooo.[/say]")
			saynn("That had to be the most dramatic no you've ever heard, after which he makes a puffy sulking face with his arms crossed on his chest. Hiisi chooses to just ignore the cat and continues to assist Lamia with the moves. Eventually Lamia gets the hang of this and his moves do stay very close to how Hiisi's presentation looked like, fox repeats that a few times before they can confidently do it correctly each time, which he promptly celebrates by few short claps with their paws cementing it with a high five with Hiisi.")
			saynn("[say=hiisi]Good job! You got it![/say]")
			saynn("[say=azazel]Mph.[/say]")
			saynn("[say=hiisi]I can hear you, you don't have to be this moody, you know.[/say]")
			saynn("You pat Azazel's head and it seems like his sulking passes away.")

			saynn("[say=azazel]Cool. Can we do something else? Dancing is cool and all, but I'm already tired.[/say]")
		elif state == "doesntmatter":
			saynn("[say=pc]I don't think it really matters, why not focus on training the moves?[/say]")
			saynn("[say=hiisi]Love the idea.[/say]")
			saynn("[say=azazel]But I'm focusing on training the moves! That's why I'm trying to understand whether you are supposed to bend the knee or not.[/say]")
			saynn("[say=hiisi]You are focusing on convincing me I've done something I haven't done, that's not the same as training.[/say]")

			saynn("[say=azazel]But...[/say]")
			saynn("[say=hiisi]Go next to Lamia and do some more training.[/say]")
			saynn("[say=azazel]Okey...[/say]")
			saynn("He sounded disappointed but continued the repeating patterns of moves alongside Lamia for next 10 minutes. Eventually, after more advice from Hiisi, both of them succeeded to learn this specific move in the greater dance sequence, as they repeat the same move multiple times - each time very accurately they cheer each other on, Lamia and Azazel clap their paws together.")

			saynn("[say=azazel]Yaaaay. We've done this![/say]")
			saynn("[say=hiisi]See? Knew you could do that.[/say]")
			saynn("[say=azazel]Sure, but I'm all spent now.[/say]")

		else:
			saynn("[say=pc]Nope, Hiisi didn't bend his leg.[/say]")
			saynn("[say=azazel]Ha! Told you.[/say]")
			saynn("Hiisi rolls his eyes and simply continues to assist Lamia with the moves, while Azazel with his happy face does a little silly victory dance of his own.")
			saynn("Eventually Lamia gets the hang of this and his moves do stay very close to how Hiisi's presentation looked like, fox repeats that a few times before they can confidently do it correctly each time, which he promptly celebrates by few short claps with their paws cementing it with a high five with Hiisi.")
			saynn("[say=hiisi]Good job! You got it![/say]")
			saynn("[say=azazel]Yay! Lamia nice nice! Great job![/say]")
			saynn("The two are cheering Lamia up.")
			saynn("[say=azazel]Arggggg, I'm spent. Can we do something else? Pleeeease?[/say]")
		saynn("[say=hiisi]You need to workout more then, you know, if your body was-[/say]")
		saynn("[say=azazel]Yeah yeah, I know. You've said it million times.[/say]")
		saynn("[say=hiisi]*sigh* Okey, any ideas then?[/say]")
		saynn("[say=azazel]We could have s-[/say]")
		saynn("Hiisi simply puts his entire paw on Azazel's mouth as he was about to happily suggest having sex muting the horny cat, while turning his head towards you.")
		saynn("[say=hiisi]Any [b]less[/b] horny ideas? {pc.Name}, maybe you have something?[/say]")
		addButton("Sex", "Agree with Azazel's proposal", "proposesex")
		addButton("Stories?", "Maybe some story telling?", "proposestories")

	if state in ["proposesex", "proposestories"]:
		if state == "proposesex":
			saynn("[say=pc]Azazel was right, we should bang.[/say]")
			saynn("Azazel gives you thumbs up with his paws, still having his short muzzle clasped shut by the higher canine, who's the free hand just hit his forehead in facepalming gesture hearing your answer.")
			saynn("[say=hiisi]Lamia, please, save me from those two horndogs, any ideas?[/say]")
			saynn("Lamia thinks for a bit before making some gestures")
			saynn("[say=hiisi]Talking? Oh, stories? Hmm. I guess we could do something of the sort, though I don't have much to tell you all, like, I don't remember my life before the prison so all I have is only what happened in here, unless I just think of something fictional I suppose. {pc.Name}, want to join?[/say]")
			saynn("[say=pc]Of course![/say]")
		else:
			saynn("[say=pc]What about some stories?[/say]")
			saynn("[say=hiisi]Do you have any?[/say]")
			saynn("[say=pc]Not necessarily, I had hoped that maybe you all have something to tell.[/say]")
			saynn("Lamia approves of the idea, heads turn to Hiisi.")
			saynn("[say=hiisi]You know, I think I have the least to share with you, you all remember your lives before the prison, I don't. But sure, I maybe there is something from the prison that I can entertain you with, hmm...[/say]")

		saynn("Hiisi finally releases Azazel's muzzle, feline licks around his muzzle.")
		saynn("[say=azazel]I'm fine with story time. I hope it's horny.[/say]")
		saynn("[say=hiisi]Alright, make yourself all comfortable.[/say]")
		saynn("Each of the pets sit on their respective blankets, you are invited to sit on Hiisi's blanket which you do. All eyes are on Hiisi now.")
		saynn("[say=hiisi]Akhem, so a few days ago I were going for our Master's favorite gum and on my way I've spotted in one of the engineering rooms connected to the hall 3 engineers and unconscious {pawn.name}. It seemed as if engineers were pent up, or wanted to teach {pawn.him} a lesson, don't fucking know, either way, I don't like when someone prays upon the weak, though I couldn't possibly take all three of them down.[/say]")
		saynn("[say=azazel]Woah, they would be too powerful even for you?[/say]")
		saynn("[say=hiisi]Well, yes. They have heat granades, Bolas and what not. Generally you don't want to mess with them.[/say]")
		saynn("[say=azazel]Bolas do sound kinky though.[/say]")
		saynn("[say=hiisi]Ehhhh. this isn't a point Azazel. Please... So. What I did was I went a bit further in the hall, found some big metal thing, looked like some machinery, it had levers and all kind of metallic switches. I pushed some of them, it started making noise, I hid in the ventilation shaft. The nerds predictably left the room to see what happens, I entered the room, got {pawn.name} and ran out of there. Admittedly they did see me as I were running away with their pray but I already disappeared behind the corner. Got {pawn.name} in safe place in the cells.[/say]")
		saynn("Lamia seems amazed by the story, asking him some questions regarding the details, while Azazel looks impressed but still more or less bored.")
		addButton("Congratulate", "Commend Hiisi on helping the inmate", "commend")
		addButton("Criticize", "Criticize Hiisi's choice to help the inmate", "criticize")

	if state in ["commend", "criticize"]:
		if state == "commend":
			saynn("[say=pc]Great job! I don't know if I would have done the same, but you did that for an inmate, that's super nice of you.[/say]")
			saynn("[say=hiisi]Really, was the right thing to do. Fuck staff in here, they think they can do everything and are superior.[/say]")
			saynn("Lamia nods in agreement")
		elif state == "criticize":
			saynn("[say=pc]You shouldn't have done that. What if there was another reason they were all in that room? Or what if you failed at rescue mission and caused harm either to the inmate or your Master for messing with staff? Wasn't your responsibility to intervene there.[/say]")
			saynn("[say=azazel]Huh? Of course it was. Hiisi was supposed to just walk past it as if nothing happened? Leave the inmate at will of some shitty engineers? There is no way 3 engineers and unconscious inmate in one room was anything good.[/say]")
			saynn("You continue defending your points, while all three of pets strongly argue against them. Eventually everyone gets tired of the discussion.")

		saynn("[say=hiisi]Alright, is everyone content now? Can I go do some cleaning?[/say]")
		saynn("[say=azazel]I suppose so.[/say]")
		saynn("[say=hiisi]Great, I'm off then, see ya {pc.name}.[/say]")
		saynn("[say=pc]Bye.[/say]")
		addButton("Leave", "Story time is over, leave the place", "endthescene")


	if state == "preendthescene":
		saynn("[say=pc]Actually, I were just going to mines and I think I'm late already, gotta go now![/say]")

		saynn("[say=azazel]Wait!! Why do you even need to haste yourself there, you can mind any minute! Heeey![/say]")
		saynn("You can hear Azazel getting frustrated while Hiisi and Lamia laugh, as you continue going in the general direction of the mines.")
		addButton("Leave", "Leave the scene", "endthescene")

func saveData():
	var data = .saveData()

	data["pawnID"] = pawnID

	return data

func loadData(data):
	.loadData(data)

	pawnID = SAVE.loadVar(data, "pawnID", null)


func getDevCommentary():
	return "For this one I felt like we needed something else than Hiisi just doing the guardian angel thing he has done in past two scenes. And so, he doesn't! Next scene will be the big climax with fancy flashy fight, but this one? This one is just chill."

func hasDevCommentary():
	return true


func _react(_action: String, _args):
	if _action == "commend":
		processTime(5*60)

	if _action == "criticize":
		processTime(15*60)

	if _action in ["bent", "notbent", "doesntmatter"]:
		processTime(10*60)

	if(_action == "endthescene"):
		setModuleFlag("IssixModule", "Hiisi_Encounter_scene", 4)
		endScene()
		return

	setState(_action)
