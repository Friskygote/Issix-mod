extends SceneBase

var answer = null
var strapon_selected = null
var rock_paper_scissors = {1: 3, 2: 1, 3: 2}
var rock_paper_scissors_translation = {1: "Rock", 2: "Paper", 3: "Scissors"}

func _init():
	sceneID = "IssixPetWalk"


func _run():
	if(state == ""):
		#if GM.main.getTime() < 75600:
		saynn("[say=issix]So here you are, kneeling, like a good pet. You know, if you don't like it, you can still say no. Once I make you my pet, you won't have much choice in that matter, so I really hope you know what you are doing.[/say]")
		saynn("Looks at you, grinning seductively, licking his lips.")
		addButton("Own me", "Say that you want Issix to own you", "walkstart")
		addButton("Abandon", "Abandon your quest for a master", "refusal")
		
	if(state == "refusal"):
		saynn("[say=issix]Disappointing, after everything you've done, but better late than never, huh? In that case you can stop kneeling, your training ended prematurely. If you need anything of me, I'll be here.[/say]")
		setModuleFlag("IssixModule", "Quest_Status", 5)
		setModuleFlag("IssixModule", "Quest_Rejected_By_Issix", 3)
		addButton("Continue", "Finish this talk", "endthescene")
		
	if(state == "walkstart"):
		playAnimation(StageScene.Duo, "kneel", {npc="issix", npcAction="stand", bodyState={leashedBy="issix"}})
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("basketmuzzle"))
		saynn("[say=issix]Wondeful, here is how this is going to go. I'm going on a little walk with my three pets in here, we are going to certain, very quiet place. I'm going to clip this leash to your collar and you are going to follow like a good pet.[/say]")
		saynn("Not the first time you've been leashed, but this time it would be special, you'll be led by Master Issix along with his other pets.")
		saynn("[say=issix]However, I want you to remember - this is a test. Depending on how you perform, you may or may not become my pet. But even if not, I hope it still proves to be a fun experience for you.")
		saynn("[say=issix]Now come closer and show me your pretty neck.[/say]")
		saynn("You come a little closer, your head is basically in Issix's crotch, until you look at his face. He smiles, puts his fingers under your chin and lifts your head further, holding the end of a leash up to your collar, finally clicking it in place.")
		saynn("[say=issix]You look almost perfect, I think I'm missing one more thing, just this time.[/say]")
		saynn("He pulls out basket muzzle from behind, you allow him to cover your face with it. His paw reaches behind and fastens the backet muzzle onto your head until it sits securely in place.")
		saynn("[say=issix]Perfect, how do you feel?[/say]")
		addButton("Good", "Say you feel good", "walkies", [true])
		addButton("Uncomfortable", "Say you feel uncomfortable", "walkies", [false])
		
	if state == "walkies":
		if answer:
			saynn("[say=issix]As you should. We are good to go now.[/say]")
		else:
			saynn("[say=issix]Aww, well, you can always say no after walk is over, see if you change your mind until the end, okey? We are good now here.[/say]")
		saynn("[say=issix]For the walk I expect you to refer to me as Master. You listen to me only, you don't fuck with random people we walk past. If you are confused what you are to do, look at my other pets for guidence.[/say]")
		saynn("[say=issix]Azazel, Hiisi, Lamia, we are going for a walk to the pasture.[/say]")
		saynn("[say=hiisi]Is {pc.name} coming with us this time?[/say]")
		saynn("[say=issix]He wants to see how is it being my pet, I expect you lot to be nice to {pc.him} and no having sex without their permission, understood? He isn't my pet yet.[/say]")
		saynn("Every pet nod their head in unison")
		saynn("[say=azazel]So happy we've got a friend to walk with us today![/say]")
		saynn("[say=issix]So am I, come.[/say]")
		addButton("Let's go", "Follow your (temporary) master on fours", "walkies2")
		
	if state == "walkies2":
		processTime(10*60)
		aimCameraAndSetLocName("main_yard_connector")
		setLocationName("Corridor")
		addCharacter("issix")
		addCharacter("nova")
		playAnimation(StageScene.Duo, "stand", {pc="nova", npc="issix", npcAction="stand"})
		saynn("[say=nova]Got yourself a new pet Issix?[/say]")
		saynn("[say=issix]Not exactly, let's just say {pc.he} is on a... Probation.[/say]")
		saynn("Issix chuckles, clearly happy wiith his joke.")
		if getModuleFlag("NovaModule", "Nova_GotHumiliatedByPC", false):
			saynn("[say=nova]Watch out for this one, this one is feisty one.[/say]")
			saynn("[say=issix]Oh, speaking from experience?[/say]")
			saynn("[say=nova]Experience I'd rather not have, but yes.[/say]")
			saynn("[say=issix]I'll keep that in mind. So far they've been well-behaved.[/say]")
			saynn("[say=nova]Better keep that leash tight then.[/say]")
		else:
			saynn("[say=nova]Cute one.[/say]")
			saynn("[say=issix]Had experience meeting them yet?[/say]")
			if getModuleFlag("NovaModule", "Nova_SawPC") || getModuleFlag("NovaModule", "Nova_Introduced"):
				saynn("[say=nova]Indeed. Not much to say about {pc.him} though.[/say]")
				saynn("[say=issix]Cool, we will be on our way then.[/say]")
			else:
				saynn("[say=nova]Not really, no.[/say]")
				saynn("[say=issix]Strange, they are a quite popular of a slut. Oh well, we'll be on our way.[/say]")
		saynn("[say=nova]Have a nice walk, Issix.[/say]")
		saynn("Nova winks at you and continues to walk towards the stocks.")
		addButton("Continue", "Continue the walk", "walkies3")
		
	if state == "walkies3":
		processTime(15*60)
		clearCharacter()
		aimCamera("yard_waterfall")
		setLocationName("Pasture")
		addCharacter("azazel")
		addCharacter("hiisi")
		addCharacter("lamia")
		saynn("Eventually, you reach your destination, a quiet place near a small lake. On the east high above you you can see greenhouses. A very faint sound of water hitting water can be heard coming from the waterfall. Issix places a large blanket near the lake and invites his pets (including you) on it. Surprisingly he comes to each one of you, unclips the leashes, puts them in side pocket of his bag which he leaves near the blanket and comes closer to the lake, wetting his feet. All done without a word, in relative silence only broken by humming of the station along with sound of waterfall in proximity. Three pets around you lose their top clothes, it would be a bit difficult with your basket muzzle.")
		saynn("You look at other pets, trying to understand what you should do. \"Pasture\" is the word Issix used to describe this place, is it not? It seems like Azazel lays on their back, looking up in the skylight, at countless stars in the distance. Hiisi seemingly lost in thought watching his Master relaxing just up close, with his feet in the lake while Lamia, taking his stacks of paper from Master's bag keeeps practicing drawing.")
		addButton("Azazel", "Talk to Azazel", "azazel")
		addButton("Hiisi", "Talk to Hiisi", "hiisi")
		addButton("Lamia", "Talk to Lamia", "lamia")
		addButton("Look around", "Do something else?", "else")
		
	if state == "walkies4":
		playAnimation(StageScene.Solo, "kneel")
		#saynn("Eventually, you reach your destination, a quiet place near a small lake. On the east high above you you can see greenhouses. A very fait sounds of water hitting water can be heard coming from the waterfall. Issix places a large blanket near the lake and invites his pets (including you) on it. Surprisingly he comes to each one of you, unclips the leashes, puts them in side pocket of his bag which he leaves near the blanket and comes closer to the lake, wetting his feet. All done without a word, in relative silence only broken by humming of the station along with sound of waterfall in proximity.")
		saynn("You look at other pets, trying to understand what you should do. \"Pasture\" is the word Issix used to describe this place, is it not? It seems like Azazel lays on their back, looking up in the skylight, at countless stars in the distance. Hiisi seemingly lost in thought watching his Master relaxing just up close, with his feet in the lake while Lamia, taking his stacks of paper from Master's bag keeeps practicing drawing.")
		addButton("Azazel", "Talk to Azazel", "azazel")
		addButton("Hiisi", "Talk to Hiisi", "hiisi")
		addButton("Lamia", "Talk to Lamia", "lamia")
		addButton("Look around", "Do something else?", "else")
		
	if state == "azazel":
		processTime(1*60)
		playAnimation(StageScene.Duo, "kneel", {npc="azazel", npcAction="kneel"})   # TODO We need laying down!
		saynn("Azazel looks at the stars, his face content.")
		addButton("What now?", "Ask what the group usually does coming here", "azazelwhathere")
		if getModuleFlag("IssixModule", "Azazel_Sky_Response") == null:
			addButton("Stars", "Ask Azazel what does he see in the sky", "azazelsky")
		else:
			addDisabledButton("Stars", "You've already asked Azazel about the stars")
		if getModuleFlag("IssixModule", "Lamia_Is_Hungry", true):
			addButton("Lamia", "Tell Azazel Lamia is hungry, maybe he'll be able to help", "azazelfood")
		addButton("Back", "End the conversation", "walkies4")	
	
	if state == "azazelsky":
		saynn("[say=pc]What do you see up there?[/say]")
		saynn("[say=azazel]Possibilities. Stars, around which there are planets. Trillions of different creatures living across the galaxies. All with their own memories, lives, worries, cherished family members, friends, connections, stories to tell... Meow.[/say]")
		saynn("You lay beside Azazel, looking at stars above, he continues.")
		saynn("[say=azazel]We live for a fraction of time in the general timeline, we have a little time to tell our own stories before they are gone, and then there are also people who can shorten our lifespan because of simple hatered or economic reasons. How many stories are untold? How many people forgotten? Why do we even matter in grand scheme of things all of this considered?[/say]")
		saynn("You prepare to respond, but before you can start speaking he continues")
		saynn("[say=azazel]I like to imagine, I really like to imagine, that somewhere out there there is a planet with creatures who don't have existencial worries, who's lives are filled with pleasures, where they can be who they are without being judged, humiliated or killed. I like to think that they pass down stories through generations, maybe write them down and each new generation has access to them, drawing wisdom and not repeating mistakes of the past. They don't have to worry about AlphaCorp, Syndicate and whatever else is out there, not about groups hunting them down for who they are. They live in a moment, they lie on the blanket and look above, at the stars, holding paw of their partner, imagining the worlds full of happy people like them out there.[/say]")
		saynn("You listen to Azazel's monologue in curiosity, deciding not to interrupt or add anything, you just lie beside him, thinking along him of such a planet full of happy creatures. After a while, he speaks again.")
		saynn("[say=azazel]Do you think such a planet exists?[/say]")
		addButton("Hopeful", "You do think such a planet exists", "azazelskyresponse", [true])
		addButton("Doubtful", "You don't believe such a planet exists", "azazelskyresponse", [false])
	
	if state == "azazelskyresponse":
		if answer:
			saynn("While you don't see Azazel's face, judging from tone of his voice are fairly certain he is smiling, happy")
			saynn("[say=azazel]I think so too.[/say]")
		else:
			saynn("Azazel, sounding a little let down says")
			saynn("[say=azazel]I see. I think... Personally... That such a planet exists. I really want it to.[/say]")
		saynn("[say=azazel]Thanks for listening, by the way. I think about those things a lot, it's good to have someone new beside me to listen to them.[/say]")
		addButton("Back", "Focus on something else", "azazel")
		
	if state == "azazelwhathere":
		saynn("[say=pc]I'm a bit lost, what do you usually do when you come here? What are the rules? Why are we not on the leash?[/say]")
		saynn("Azazel laughs")
		saynn("[say=azazel]Sorry, hearing those questions is kind of funny. This place is what we call „pasture”. We sometimes come here to relax and play. The atmosphere in here lets us forget we are in a prison and there is so much space in here. „Pasture” came from our little inside joke, but I like it and I think it fits this place fairly well.[/say]")
		saynn("You see Azazel taking a small piece of dirt from the ground and throwing it at Hiisi, before it hits Hiisi he immediately repositions his body as to pretend he wasn't the culprit of random act of falling dirt, while continuing the conversation to make his alibi stronger")
		saynn("[say=azazel]So yeah, in general Master unclips our leash and expects us to use the free time in our own way. It really depends on what we want to do, sometimes we fuck with each other, sometimes Master joins it, sometimes we relax like I do today, sometimes we play hide and seek or tag. I'm afraid that if you are hoping for some action today - you might be disappointed. If I had to guess the rest of us is rather tired or not in the mood.[/say]")
		saynn("After piece of dirt reached Hiisi he took notice and looked around for culprit. His eyes eventually met Azazel's who smiled while at the same time speaking to you and trying to keep eye contact with you. Hiisi rolled his eyes and continued staring at Master.")
		saynn("[say=azazel]As to the rules? All of the usual ones apply, just don't go too far so Master doesn't have to worry about you, don't fuck with other inmates without Master's permission, and maybe don't bother those who don't want to be bothered, it's everyone's time for some peace, I guess.[/say]")
		saynn("[say=azazel]Sorry that it's so uneventful in your trial day, perhaps next time we go and you join us as Master's pet there would be more we could do.")
		addButton("Back", "Thank Azazel for explanation", "azazel")
		
	if state == "azazelfood":
		setModuleFlag("IssixModule", "Lamia_Is_Hungry", false)
		saynn("[say=pc]I talked a bit with Lamia, they are hungry, do you have any food?[/say]")
		saynn("[say=azazel]Ughhh, I don't know what's up with him. It's not the first time like this. Master explained to them many times already that snacks are in the bag we take every day when we go on pasture and we are free to take any. For some reason Lamia chooses to avoid taking out the snacks from them even though it's fine for them to do so. Thanks for telling me this {pc.name}, I'll take care of it right away.[/say]")
		saynn("Azazel crawls to the bag at the edge of the blanket, rummages it for a minute and takes out an apple and energy bar from it, coming to Lamia and giving them the snacks. Lamia pauses their drawing to consume some snacks, they thanked Azazel by their head nods.")
		addButton("Back", "Your job is done here", "walkies4")
		
	if state == "hiisi":
		playAnimation(StageScene.Duo, "kneel", {npc="hiisi", npcAction="kneel"})
		saynn("Hiisi sits with his hands hugging legs, staring at his Master, and a lake in silence.")
		addButton("Master", "Ask why is he staring at his Master", "hiisimaster")
		addButton("Distraction", "Hiisi seems nervious, maybe he'd be up for some temporary distraction?", "hiisirpc")
		addButton("Back", "End the conversation", "walkies4")
		
	if state == "hiisimaster":
		processTime(5*60)
		saynn("[say=pc]Is there something wrong with Master?[/say]")
		saynn("[say=pc]Oh, {pc.name}? I don't know.[/say]")
		saynn("He says without looking at you, continuing to look at his Master")
		saynn("[say=hiisi]Usually when Master is down he is irritated and sometimes even aggressive. He isn't this time, he just feels off. I asked him about this before but he hasn't given me an answer.[/say]")
		saynn("[say=pc]Do you have any theories?[/say]")
		saynn("[say=hiisi]... No.[/say]")
		saynn("[say=pc]Certainly odd. He does feel strange.[/say]")
		saynn("Hiisi doesn't respond, he continues observing back of his master who is currently sitting and looking across the lake.")
		addButton("Back", "End the conversation", "hiisi")
		
	if state == "hiisirpc":
		saynn("[say=pc]Hey Hiisi, you seem a bit anxious, how about we play a bit of rock, paper, scissors to lighten the mood?[/say]")
		saynn("Hissi looks at you, his face quite sad but he seems convinced.")
		saynn("[say=hiisi]I guess... We could play until 3 wins if you want... Do you want to play for something?[/say]")
		saynn("[say=pc]Sure, what would you like to play for?[/say]")
		saynn("[say=hiisi]What about a future favor? I promise it won't be anything harmful... I'd just want to try something.[/say]")
		saynn("[say=pc]Sounds suspicious but I'm in, as for myself...[/say]")
		addButton("Good time", "Ask Hiisi for sex", "hiisirpsfirst", [1])
		addButton("Snuggle", "Wholesome version of close contact fun, but maybe that's what Hiisi needs", "hiisirpsfirst", [2])
		addButton("Drink", "Ask Hiisi for something regular, energy drink shouldn't be that hard to get right?", "hiisirpsfirst", [3])
		
	if state == "hiisirpsfirst":
		match getModuleFlag("IssixModule", "Hissi_RPS_data")["chosen_reward"]:
			1:
				saynn("[say=pc]How about good time as a reward? Right after the game?[/say]")
				saynn("[say=hiisi]I'm not sure... You are not Master's pet yet...[/say]")
				saynn("[say=pc]That's true, and nonetheless Master Issix decided to take me for a walk here, I don't think he would mind.[/say]")
				saynn("He thinks for good 20 seconds about your proposition.")
				saynn("[say=hiisi]Alright, you're on.[/say]")
			2:
				saynn("[say=pc]How about a hug as a reward? Right after the game?[/say]")
				saynn("[say=hiisi]... Just a hug? You are not using hug as an euphemism, right?[/say]")
				saynn("[say=pc]Nope. Just a hug.[/say]")
				saynn("Hiisi seems surprised a little, you can see his tail move hearing that.")
				saynn("[say=pc]Sounds great, I like it, you're on.[/say]")
			3:
				saynn("[say=pc]You could give me something... Like an energy drink? Not right now, at some other time.[/say]")
				saynn("[say=hiisi]Just that? An energy drink? Sounds doable.[/say]")
				saynn("[say=pc]Just that.[/say]")
				saynn("[say=pc]Sure, you're on.[/say]")
		saynn("[say=pc]Great! Let's do this. Three... Two... One...[/say]")
		addButton("Rock", "Use rock in this round", "hiisirps", [1])
		addButton("Paper", "Use paper in this round", "hiisirps", [2])
		addButton("Scissors", "Use scissors in this round", "hiisirps", [3])
		
	if state == "hiisirps":
		var rpc_data = getModuleFlag("IssixModule", "Hissi_RPS_data")  # {"winpc": 0, "winh": 0, "chosen_reward": answer, "reward_acquired": false, "last_used": 0}
		saynn("[say=pc]"+rock_paper_scissors_translation[rpc_data["last_used"]%10]+"![/say]")
		saynn("[say=hiisi]"+rock_paper_scissors_translation[rpc_data["last_used"]/10]+"![/say]")
		match rps_win_conditions(rpc_data["last_used"]%10, rpc_data["last_used"]/10):
			1:
				saynn("{pc.name} wins!")
			2:
				saynn("Hissi wins!")
			3:
				saynn("It's a tie!")
		if rpc_data["winpc"] or rpc_data["winh"]:
			saynn("Current standings: \n{pc.name}: {winpc}\nHissi: {winh}".format(rpc_data))
		
		if rpc_data["winpc"] > 2:
			addButton("Celebrate", "You've won, wooho", "hiisirpspcwin")
		elif rpc_data["winh"] > 2:
			addButton("Lost", "You've lost the game fair and square", "hissirpshiisiwin")
		else:
			addButton("Rock", "Use rock in this round", "hiisirps", [1])
			addButton("Paper", "Use paper in this round", "hiisirps", [2])
			addButton("Scissors", "Use scissors in this round", "hiisirps", [3])
		
	if state == "hiisirpspcwin":
		saynn("[say=pc]Haha, I did it. Nice game, thanks for playing Hissi.[/say]")
		saynn("You've noticed that his mood has brightened, and he isn't so gloomy anymore.")
		saynn("[say=hiisi]Yeah, thank you for that, was actually pretty nice, glad we could have this one.\nYou know... You are pretty cool {pc.name}.[/say]")
		saynn("He looks down, but with slight grin on his face.")
		saynn("[say=pc]Awwwww. Thank you Hiisi! You are pretty cool yourself too, you know![/say]")
		saynn("[say=hiisi]Yeah... As to your reward...[/say]")
		match getModuleFlag("IssixModule", "Hissi_RPS_data")["chosen_reward"]:
			1:
				saynn("[say=hiisi]We can do that in here... If you want. But, would you like to be in charge or should I?[/say]")
				addButton("Dom Hiisi", "Say you'd like to dominate Hiisi", "hiisisubsex")
				addButton("Sub Hiisi", "Say you'd like Hiisi to take charge", "hiisidomsex")  # TODO
			2:
				saynn("[say=hiisi]Let's do it![/say]")
				saynn("He exlaims, excited")
				addButton("Hug", "Hug the doggo", "hiisihug")
			3:
				saynn("[say=hiisi]Please ask me once when we are back in our corner, I should have one energy drink by then[/say]")
				addButton("Back", "Say that sure, you're going to ask him about it then", "hiisi")
				
	if state == "hiisihug":
		playAnimation(StageScene.Hug, "hug", {pc="pc", npc="hiisi", bodyState={naked=true, hard=false}, npcBodyState={naked=true, hard=false}})
		saynn("You come really close to Hiisi, stretching your arms and embracing the puppy")
		saynn("[say=pc]It's all fine, okey? You are a good boy.[/say]")
		saynn("He embraces you back, applying some strength into a hug. This hug feels really intimate for some reason, you can feel Hiisi's breath, you can feel his heartbeat with how close he is. You stay like this for a while.")
		saynn("[say=hiisi]Thank you, I needed that.[/say]")
		addButton("Back", "This path is not yet finished, sorry!", "hiisi")
		
	if state == "hiisisubsex":
		saynn("You reach with your paws to pull Hiisi up close, he puts up no resistance as you embrace him in a tight hug, your paws exploring his back going lower and lower until reaching his butt and squeezing his butt cheeks. He yelps.")
		saynn("[say=pc]Is the puppy ready for some action? I'll try to be gentle.[/say]")
		saynn("[say=hiisi]Let's just get it over with already.[/say]")
		saynn("[say=pc]Good. Let's start.[/say]")
		if GM.pc.hasReachablePenis():
			addButton("Anal", "Use your tool in doggy ass", "hiisisubanal")
			addButton("Oral", "Make the doggo suck your tool", "hiisisuboral")  # TODO
		elif (GM.pc.isWearingStrapon() or GM.pc.hasStrapons() and GM.pc.canWearStrapon()):
			var strapons: ItemBase = GM.pc.getStrapons()
			for strapon in strapons:
				addButton("Anal", "Use a "+strapon.getCasualName()+" on doggy ass", "hiisisubanal", [strapon.id])
				#addButton("Oral", "Make the doggo suck your "+strapon.getCasualName(), "hiisisuboral", [strapon])
		#if GM.pc.hasReachableVagina():
		#	addButton("Vaginal", "Make the dog fuck your pussy", "hiisisubvaginal")  # TODO low priority

	if state == "hiisisubanal":
		playAnimation(StageScene.SexAllFours, "tease", {pc="pc", npc="hiisi", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=false}})
		# You may believe me or not, but after 7 years of reading furry smut I can't write smut myself. The following is probably my first attempt at writing any kind of sexual scene all by myself, please be gentle with the criticism <3
		saynn("[say=pc]What a good subby dog you are! How about you turn around so I can prepare you?[/say]")
		saynn("You let go of Hiisi, he turns around on his knees and puts his front paws on the ground, nicely staying on his fours for you. Presenting you with his back full of  light gray fur and on lower part of it a brand ”PROPERTY OF ISSIX”. A reminder of what's to come if you decide to dedicate yourself to Master Issix. You run your fingers through the fur on his back gently touching the brand itself, its texture pretty smooth.")
		saynn("[say=hiisi]Are you waiting for something? Don't want to hurry you up, just unsure if you want something of me.[/say]")
		saynn("[say=pc]You are good, the color of your fur is just so good.[/say]")
		if GM.pc.getInventory().hasItemID("lube"):
			GM.pc.getInventory().removeXOfOrDestroy("lube", 1)
			saynn("You apply some lube onto canine's pucker hole")
		saynn("[say=hiisi]Ahhhh, cold![/say]")
		saynn("[say=pc]Only for a moment, we are going to make it hot really soon. Hang on tight there Hiisi.[/say]")
		saynn("You don't waste your chance to stimulate the dog with your fingers. First putting just one to test out the waters. Hiisi's hole isn't tight nor loose, though one finger already makes the dog lose his composure. He starts panting a little. You insert second finger intensifying the sounds coming from the other end. You massage his ring to relax it a little bit.")
		saynn("[say=pc]You okey there?[/say]")
		saynn("He respond just with huffs. It really didn't take a lot to stimulate the gray furred canine. You take out your fingers and see glistening hole.")
		if strapon_selected != null:
			saynn("You fit in place your {pc.penisOrStrapon}, and tease Hiisi with the tip.")
		else:
			saynn("You tease doggo pucker with the tip of your {pc.penis}.")
		saynn("[say=pc]Does the dog want a bone now, or should I keep teasing?[/say]")
		saynn("[say=hiisi]Nooo. Please put it in me.[/say]")
		addButton("Continue", "Put the bone inside the dog ass", "hiisisubanal2")

	if state == "hiisisubanal2":
		playAnimation(StageScene.SexAllFours, "sex", {pc="pc", npc="hiisi", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("[say=pc]Heere we go, ahh.[/say]")
		saynn("[say=hiisi]Mmmphhh.[/say]")
		saynn("Hiisi lets another yelp as you push your {pc.strapon} into Hiisi's backdoor. "+("Your stapon" if strapon_selected else "Your penis")+" slid with little issues, but the slickness of the hole increased as you continued to ram Hiisi's backside. It was clear that Hiisi didn't want to make too much noise, which has made his pleasure moans even more cute.")
		saynn("[say=pc]How are you doing cutie? Should I go faster? Slower?[/say]")
		saynn("[say=hiisi]Mhhhmm. You are fine.[/say]")
		saynn("Barely comprehensible speech of canine could be hears coming from his muzzle on the other side, pleasure melting away ability to speak well. You slightly quicken the pace being close to orgasm.")
		addButton("Creampie?", "Does the canine want you to pull out?", "hiisisubanal3")

	if state == "hiisisubanal3":
		playAnimation(StageScene.SexAllFours, "fastflop", {pc="pc", npc="hiisi", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("[say=pc]Umm, Hiisi, do you want me to cum inside or pull out?[/say]")
		saynn("[say=hiisi]HMmmaaahhhhh.[/say]")
		saynn("Seemingly unable to properly respond you decide to pull out before you reach orgasm, feeling like it's what Hiisi would want. You only now notice Hiisi's hard cock beneath as if there wasn't enough of evidence canine was enjoying the treatment.")  # No you stupid bitch of a writer, why would a reader want that??????
		saynn("Hiisi's front arms eventually give up and only his butt is sticking out in the air as you ram "+("your stapon" if strapon_selected else "your penis")+" in his pleasure tunnel, eventually feeling that soon your pleasure will achieve its final destination.")
		addButton("Pull out", "Pull out of the puppy", "hiisisubanal4")

	if state == "hiisisubanal4":
		playAnimation(StageScene.SexAllFours, "teaseflop", {pc="pc", npc="hiisi", pcCum=true, npcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Eventually you feel like you are really close to orgasm and pull out of Hiisi's hole, painting it white just half a second after your tip leaves. Similarly, Hiisi leaves plenty of his own jizz on the blanket below. You both moan in ecstasy drawing looks from pets around and Master Issix. Those aren;t looks of judgement, but rather just curiosity.")
		saynn("[say=hiisi]T-thanks. Was okey.[/say]")
		saynn("Very restrained words of thanks from Hiisi. But you still take them.")
		saynn("[say=pc]Same. Was fun![/say]")
		saynn("After a little required cleanup, Hiisi trying to clean up cumstains both from the blanket as well as excessive cum from his ass, you can consider your session truthfully over.")
		addButton("Finish", "Your little session with Hiisi is over now, time to go back to other stuff", "hiisi")

	if state == "hiisidomsex":
		addButton("Back", "This path is not yet finished, sorry!", "hiisi") # TODO
		#getCharacter("hiisi").prepareForSexAsDom()
		#runScene("GenericSexScene", ["hiisi", "pc"], "subbysex")
		
	if state == "hissirpshiisiwin":
		saynn("[say=hiisi]Awesome! I didn't expect to win, that was fun.[/say]")
		saynn("He seems somewhat relieved he has won. With a smile on his face he says")
		saynn("[say=hiisi]So, regarding my reward. Could you perhaps get one of the Hypnovisors and come to the corner tomorrow? I'd like to test something.[/say]")
		saynn("[say=pc]Uhhh, hypnovisors?[/say]")
		saynn("[say=hiisi]Yeah, I've seen them around. They seem to be extremaly rare in here, but at least one inmate I saw had one. I'm just curious...[/say]")
		saynn("[say=pc]I mean, sure, but are you sure about it? They can make you very vulnerable for a few hours.[/say]")
		saynn("[say=hiisi]Well.. I was hoping to mess around with them for a second and use them on you actually...[/say]")
		saynn("[say=pc]On me? I'm really not sure about that.[/say]")
		saynn("[say=hiisi]Pleaase! I'm just curious, I won't do anything dangerous, and hypnosis doesn't make you go against your will anyways, you can always stop yourself.[/say]")
		saynn("It's true that hypnovisors don't really force things onto their wearer, just significantly affect their submissiveness, but would it be a good idea to let Hiisi mess with Hypnovisors and put them on you?")
		saynn("[say=pc]Fine, you did win after all. But promise me you won't try to mess with my brain.[/say]")
		saynn("[say=hiisi]Of course! I won't.[/say]")
		addButton("Back", "You agreed to Hiisi's Hypnovisor session, the conversation ended here", "hiisi")
		
	if state == "lamia":
		playAnimation(StageScene.Duo, "kneel", {npc="lamia", npcAction="kneel"})  # TODO We need laying down!
		saynn("Lamia lays on his belly, holds one of the colorful pencils from his drawing kit and draws. Next to him a stack of empty paper sheets as well as a visibly smaller but still impressive stack of filled out papers")
		if getModuleFlag("IssixModule", "Lamia_Is_Hungry") == null:
			addButton("Drawings", "Look at the drawings", "lamiadrawings")
		else:
			addDisabledButton("Drawings", "You've already asked about the drawings")
		addButton("", "", "lamia")  # TODO 2nd option walkies for Lamia is needed
		addButton("Back", "End the conversation", "walkies4")
		
	if state == "lamiadrawings":
		processTime(10*60)
		saynn("You crawl to Lamia's stack of drawings, the one at the top is a fairly detailed drawing of a bird. Lamia notices your interest and smiles at you. He takes the top sheet of paper from his drawn pile and invites you to browse.")
		saynn("The drawing underneath the bird shows an inmate in orange uniform sitting in front of a table that has a cake on it, considerint the look of the cake you can guess its a birthday cake. Around the inmate there are 4 other inmates.")
		saynn("[say=pc]Those are really good. Are they showing real events? Are those things you've seen?[/say]")
		saynn("You quickly realize that asking two questions at the same time might make it very difficult for Lamia to answer in a way you'd understand, you quickly correct yourself.")
		saynn("[say=pc]Ekhem, I mean, for example, the scene with the birthday cake, or a bird, do you draw based on things you've personally been a witness of?[/say]")
		saynn("They look at you and move their head to the sides putting their shoulders slightly higher, you interpret it as „sometimes, sometimes not”.")
		saynn("[say=pc]I see, so just sometimes[/say]")
		saynn("They nod to confirm")
		saynn("You look at their current drawing, it's Issix, with what looks to be like a fishing rod. You look at Issix, just to be sure, he certainly does not hold any fishing rod, but other than that everything else seems to be correct from position of Lamia. Suddenly an idea comes to your mind.")
		saynn("[say=pc]Lamia, I do wonder, how would you draw your current feelings?[/say]")
		saynn("Without a moment of hesitation, Lamia turns the paper to the other side, pulls out a brown pencil, draws a circle with some darker brown irregular circle like figures inside. After a moment you have a good idea that it's a cookie. Then they draw a very simple sad face.")
		saynn("Cookie sad? Sad cookie? Umm... Are you... Hungry perhaps?")
		saynn("Lamia nods, their paw on their belly, further confirming your guess.")
		addButtonWithChecks("Apple", "Give the fox breed an apple", "giveapple", [], [[ButtonChecks.HasItemID, "appleitem"]])
		#addButtonWithChecks("Energy drink", "Give the fox breed an energy drink... Out of lack of better things?", "givedrink", [], [[ButtonChecks.HasItemID, "EnergyDrink"]])
		addButtonWithChecks("Cookie", "Give the fox breed a cookie", "givecookie", [], [[ButtonChecks.HasItemID, "Cookie"]])
		addButton("Nothing", "You have nothing to give to the fox breed, hoping that they find other way to sate their little hunger", "nofood")
		
	if state == "nofood":
		setModuleFlag("IssixModule", "Lamia_Is_Hungry", true)
		saynn("[say=pc]Aww, hungry? Unfortunately I have brought no snacks with myself. Sorry![/say]")
		saynn("Lamia is visibly saddened after hearing that, however they quickly return to drawing, occupying their mind.")
		addButton("Back", "End the conversation", "lamia")
		
	if state == "giveapple":
		setModuleFlag("IssixModule", "Lamia_Is_Hungry", false)
		saynn("[say=pc]Here, have an apple. That's all I have.[/say]")
		saynn("You pass an apple to the fox, they take a bite and give you a warm smile, munching it slowly. You hope it satiates them a bit.")
		addButton("Back", "End the conversation", "lamia")
		
	if state == "givecookie":
		processTime(15*60)
		setModuleFlag("IssixModule", "Lamia_Is_Hungry", false)
		setModuleFlag("IssixModule", "Received_Portrait_From_Lamia", true)
		saynn("[say=pc]Hmm, cookie you say? So it happens I have one, you pull the cookie in front of them.[/say]")
		saynn("Their eyes lit up like candles, you stare at the cookie, pleading look in their face. They need no words to let you know just how much are they starved for such a sweet treat.")
		saynn("[say=pc]You are not allergic, right? Wouldn't want to cause an incident.[/say]")
		saynn("They shake their head - no, clearly. It feels that if you don't give them cookie very soon, not only the blanket will be wet by salivating fox, but you may eventually lose a finger, or two. You decide to pass the cookie to the fox.\nThey take it, and to your surprise, they do not devour it immediately. They take very small bites, seems like they are treasuring every single bite of that cookie. Watching them be so happy about such a little thing fills your heart with warmth. You could stare at this fox delectating themselves with the cookie for an hour, and it would still be worth watching. Shortly after they eat half of it they show you a pointing finger, a sign you should wait a moment. They pull out a new piece of paper and start drawing.")
		saynn("You look at them, being very focused, they look at you too, from time to time. After 15 minutes they are done. They take their artwork and show it to you, being incredibly proud of themselves, closing their eyes.\nYou are astounded. On the paper your very "+GM.pc.getBodypart(BodypartSlot.Head).getName().split("head")[0] +" face. It's a portrait of you from side view, what's special about this portrait however, is that inside of your mouth you have a cookie. Basket muzzle didn't make the cut, probably because it would ruin the portrait. While the portrait looks incredibly silly, the happiness of artist holding it could potentially kill if it was able to.")
		addButton("Hug", "Thank and hug Lamia as thanks", "hugandthank")
		addButton("Headpat", "Give the artist fox a headpat", "headpat")
		
	if state == "hugandthank":
		saynn("Stunned, your heart melted, the first thing that comes to your mind is to hug the fox. You do that completely on impulse with no hesitation. Fox at first taken aback by that gesture (embarassed, blushing hard), eventually embraces the hug and reciprocates. Still hugging you say")
		saynn("[say=pc]Thank you Lamia, I love it so much. I'll cherish it.[/say]")
		saynn("They smile and nod twice to you excitedly.")
		addButton("Back", "End the conversation", "lamia")
				
	if state == "headpat":
		playAnimation(StageScene.Grope, "pat", {pc="pc", npc="lamia", bodyState={naked=true, hard=false}, npcBodyState={naked=true, hard=false}})
		saynn("Stunned, your heart melted, the first thing that comes to your mind is to give the fox a headpat. You put your paw on their head and gently pat them. Their ears flatten and their face seems very pleased by your patting.")
		saynn("[say=pc]Thank you Lamia, I like it very much.[/say]")
		saynn("They smile and nod to you excitedly.")
		addButton("Back", "End the conversation", "lamia")
		
	if state == "else":
		saynn("You are thinking of doing something else. With plenty of space you could do plenty of activities, even if alone, considering all of the others don't seem to be keen on doing anything.")
		if getModuleFlag("IssixModule", "Shared_Marshmallows") == null:
			addButton("Walk", "Go for a walk near your group", "elsewalk")
		else:
			addDisabledButton("Walk", "You've already taken a walk")
		addButton("Wait", "Spend time until Master calls it the end of the little picnic (you won't be able to come back to other activities)", "elsewait")
		
	if state == "elsewalk":
		playAnimation(StageScene.Solo, "stand", {pc="pc", bodyState={naked=false, hard=false}})
		processTime(10*60)
		saynn("You slowly are walking alongside the lake. Eventually you arrive at short waterfall. You can come so close to it, that you can feel the droplets of water hitting your fur, the air more humid and the sounds louder but yet still gentle. You look at the opposite side, greenhouses high above you. It's surprising how little attention this place gets with so many inmates in the prison.")  # TODO Fur? Skin?
		saynn("As you focus on the waterfall you suddenly get spooked by the sounds behind you, you turn around and just see another inmate jogging. Talk about lack of inmates... They reach the wall, touch it and go back the way they came from. What catches your attention however is a pack of... Something dropping on the ground as the inmate turned around and started running away. Curious, you approached the lost item and found it's a very small bag of... Marshmallows of some sorts? If that's so, that would be considered a treat in the prison, sweets such as that are pretty expensive rarity. You look back at the inmate, however at this point they are beyond the point where shouting at them makes sense, that's one athletic jogger. You grab the bag and decide what to do with it.")
		addButton("Share", "Come back to your group and share with everyone", "sharemarshmallows")
		addButton("Eat", "There aren't a lot of them in the bag, enough to share with the group but then, you could just eat them yourself?", "eatmarshmallows")

	if state == "sharemarshmallows":
		setModuleFlag("IssixModule", "Shared_Marshmallows", true)
		playAnimation(StageScene.Duo, "crawl", {pc="pc", npc="issix", bodyState={naked=false, hard=false}, npcBodyState={naked=true, hard=false}})
		saynn("You come back to your group walking rather fast, being excited about sharing something you've found with everyone else.")
		saynn("[say=pc]Hey, I've found this little bag, they seem like marshmallows? There aren't a lot of them, do you want some?[/say]")
		saynn("This catches the attention of Issix, who gives you a signal to approach him. You get on your knees and come to him with the bag in your maw.")
		saynn("[say=issix]A bag of „marshmallows” huh? Where did you get it from? Give it to me.[/say]")
		saynn("You explain it fell of the pocket of one of the joggin inmates. He opens the bag and takes a sniff.")
		saynn("[say=issix]Hmm. That's not an ordinary bag of marshmallows, I've seen things such as those before in this prison. They are a little „extra” you'd say. Pretty sure I know who your jogging inmate was.[/say]")
		saynn("He laugs, taking one of the „marshmallows” out of the bag before putting it into his mouth.")
		saynn("[say=issix]Yeah, it's a fun one. Feel free to share them with other pets, they aren't bad, just a little packed, who knows, maybe it will brighten the mood.[/say]")
		saynn("He gives you back the opened bag, before turning around and continuing his feet wetting activity. You come back to the blanket.")
		saynn("[say=pc]Master Issix said those are fine, they aren't regular marshmallows as they seem to be with something in them, but they are fine. Who wants one?[/say]")
		saynn("[say=azazel]I'll take one![/say]")
		saynn("[say=hiisi]So will I.[/say]")
		saynn("Lamia taking a break from drawing nods their head in approval. You hand everyone their marshmallows, Azazel gets 2, Hiisi 1, Lamia 2 and you are left with the last one. You all eat them together discussing its sweet but a bit strange taste that leaves a weird aftertaste, which you all try to get rid of with water bottle from Master's bag, unsuccessfully.")
		addButton("Back", "Feast is over", "else")

	if state == "eatmarshmallows":
		setModuleFlag("IssixModule", "Shared_Marshmallows", false)
		saynn("Your eyes wander. You are a bit away from your group and they are all occupied. Besides, that's stranger food, you don't know if it's safe to eat, and you wouldn't want to poison Master and his pets! You open the pack and pick the marshmallows and eat them one by one, they are incredibly sweet, though they leave a very strange aftertaste in your mouth. Odd. After consuming them all you throw away the packaging a decide to come back, finding yourself back in your little picnic like group, feeling a bit doozy.")
		addButton("Back", "You ate the marshmallows and came back from your little walk", "else")
		
	if state == "elsewait":
		saynn("During an hour or so Master came back to the blanket and spent the time with you and his other pets. He talked about various things he saw in his life as well as deals he has struck in the time he spent in the prison. Azazel, Hiisi and Lamia all put on their inmate uniforms. Eventually he started packing - blanket, paper sheets, toys and other things, came to each one of us, clipped the leash to our collars and looked around.")
		saynn("[say=issix]Everyone got all of their stuff? Good good. Let's head back to our corner, we'll talk there {pc.name}.[/say]")
		saynn("With that, you've all started walking towards the corner.")
		processTime(30*60)
		addButton("Leave", "Let's head back", "walkies5")

	if state == "walkies5":
		aimCamera("hall_ne_corner")
		setLocationName("Issix's Corner")
		if GM.main.isVeryLate():
			saynn("You arrive in Issix's corner. Since it's pretty late Issix talks with his other pets and promptly lets them go to their cells, he asks you to stay. He sits on his chair and starts talking.")
		else:
			saynn("You arrive in Issix's corner. Other pets situate themselves on their own blankets on the floor. Issix is unpacking stuff from the bag, you stay there kneeling next to him, observing his every move. He makes some conversations with his other pets. Eventually he finishes, sits down and faces you.")
		saynn("[say=issix]So, how was the walk? Have you enjoyed it?[/say]")
		addButton("I did", "Say that you enjoyed the walk", "walkenjoyed")
		addButton("Nope", "Say that you didn't enjoy the walk", "walkbad")

	if state == "walkenjoyed":
		playAnimation(StageScene.Duo, "kneel", {npc="issix", npcAction="stand", bodyState={leashedBy="issix"}})
		saynn("[say=pc]Yeah, it was fun to „camp” on the pasture, how often do you go there?[/say]")
		saynn("[say=issix]Every 9 days or so, whenever I feel like I need some time out. Being in here all the time, among this noise requires breaks to hang out with just my pets or at least get away from all this hustle. Today it was... More passive, mostly due to myself needing some time for myself. That's not usually how our walks there go, but it happens.[/say]")
		saynn("You nod your head in understanding")
		if GM.pc.isMuzzled():
			saynn("[say=issix]Also, let me take this off you now, it served its purpose, you did look cute in it though.[/say]")
			saynn("Issix says before fiddling with the fastener of your basket muzzle still on your face.")
			GM.pc.getInventory().removeItemFromSlot(InventorySlot.Mouth)
			saynn("[say=issix]Here you go. I'll take it.[/say]")
		saynn("[say=issix]Anyways, you are probably wondering if you passed the last trial. I was mainly testing how well you'd do with my other pets, I've talked with them briefly after the walk. Let's see...[/say]")
		addButton("Results", "Listen to Issix's summary of the walk", "walkresults")

	if state == "walkbad":
		saynn("[say=pc]To be quite honest I didn't enjoy the walk. I expected more out of it, instead I was bored for a while and every other pet felt absorbed by their own thing.[/say]")
		saynn("[say=issix]I see. I appreciate your honesty. It's true that today's walk has been rather passive I'd say. I too didn't particularly have the mood to do much with my pets. It's not how usually walks go by - to be frank. Wish you've a better experience though.[/say]")
		saynn("He looks saddened, he really must have wished you had better time during the walk")
		if GM.pc.isMuzzled():
			saynn("[say=issix]Also, let me take this off you now, it served its purpose, you did look cute in it though.[/say]")
			saynn("Issix says before fiddling with the fastener of your basket muzzle still on your face.")
			GM.pc.getInventory().removeItemFromSlot(InventorySlot.Mouth)
			saynn("[say=issix]Here you go. I'll take it.[/say]")
		saynn("[say=issix]I bet you are curious how well did you do on the last trial. Let's summarize, shall we?[/say]")
		addButton("Summary", "Listen to Issix's summary of the walk", "walkresults")

	if state == "walkresults":
		var lamia_task = getModuleFlag("IssixModule", "Lamia_Is_Hungry")
		var azazel_talk = getModuleFlag("IssixModule", "Azazel_Sky_Response")
		var hiisi_game = getModuleFlag("IssixModule", "Hissi_RPS_data")
		var walk_result = getModuleFlag("IssixModule", "Shared_Marshmallows")
		var walk_score = pet_handle_flag_response(lamia_task) + pet_handle_flag_response(azazel_talk != null) + pet_handle_flag_response(hiisi_game != null) + pet_handle_flag_response(walk_result)
		if lamia_task == false:
			saynn("[say=issix]Lamia was all happy and enjoyed your company. Said that you helped with their hunger issue. I still don't understand why they don't just take food from my bag on during the walks but they are stubborn about it.[/say]")
		else:
			saynn("[say=issix]When I took out food from my bag Lamia practically begged me for food, they know full well where the food is during our walks and yet they haven't taken it out by themselves. I wouldn't want to put you on spotlight for not tending and inquiring about how they feel, but I had hoped you'd at least help them out somehow.[/say]")
		if azazel_talk == true or azazel_talk == false:
			saynn("[say=issix]Azazel was really happy to have a conversation partner. Hiisi was too focused on me for the walk and Lamia was doing his own thing. I'm really happy that you kept them company on the pasture. They can have their own philosophical ramblings from time to time, guess they got it after me.[/say]")
			saynn("He laugs")
			saynn("[say=issix]But seriously, that's really nice of you to engage them in one of those.[/say]")
		else:
			saynn("[say=issix]Azazel mentioned that you didn't exactly talk with them much during the walk. That's a little disappointing but they themselves weren't really outgoing that day so I understand. However please tend to the needs of my other pets next time.[/say]")
		if hiisi_game != null:
			saynn("[say=issix]It's quite an amazing feat, but I've also heard you engaged Hiisi in a game! That's phenomenal! I know lately he is very focused on me, he is concerned about my wellbeing, what a cute pet. No matter how many times I tell him to stop worrying he never does. Such is that puppy.[/say]")
			if hiisi_game["winpc"] == 3 and hiisi_game["chosen_reward"] == 1:
				saynn("[say=issix]Normally if someone was trying to mate with my pet without my permission I'd make an example of them for entire prison. However for today you were temporally my pet on probation. So it was pretty cute seeing Hiisi engaging in some fun with you for a change. He usually isn't this forward. Good job out there.[/say]")
				saynn("You blush")
		else:
			saynn("[say=issix]Hiisi was very down for the entire walk, I did not expect you to not even attempt to brighten his mood. I believe you should have thought of that, you had plenty of time. What a shame.[/say]")
		if walk_result == true:
			saynn("[say=issix]I'm also really happy you decided to share the „marshmallows” with us all. It's been a while since I last ate one of those, so that helped me plenty considering I myself were a bit downed today, and other pets seemed to like them as well.[/say]")
		if walk_score < 2:
			setModuleFlag("IssixModule", "Quest_Rejected_By_Issix", 3)
			saynn("[say=issix]Ultimately, I'm afraid you've failed the last trial. While I can't really call the relationship my pets have with me and themselves „family”, since they are my property, we aren't equal and they are listening to me without any question, they do have to take care of each other. If my new pet doesn't have any care in the world about my other pets, I don't think it would be a good fit. I can train many things, but empathy is one of those things I'm not willing to spend time on.[/say]")
			saynn("He says that with sadness in his voice. It's clear he doesn't like the decision he has made by is sticking to his convictions.")
			addButton("Apologize", "Apologize and ask for forgiveness", "issixapologize")
			addButton("Accept", "Accept the decision", "issixacceptdefeat")
			return
		elif walk_score < 4:
			saynn("[say=issix]I'm glad that you've spend the time with my other pets, that's exactly waht I wanted to see and I'm relieved you knew what to do. I'm proud to announce that you've passed my last trial and you have my permission to become my pet, though the details of how this will work we'll have to figure out tomorrow. It's late already and I'd like to attend to other matters. Think about it for one more night, after you agree to become my pet there is no going back. See you tomorrow, pet.[/say]")
		else:
			saynn("[say=issix]I have to say, you've exceeded my expectations. You've been a large part of today activities and you engaged everyone. You cared about problems of every pet and addressed them in one way or another. That's exactly what I wanted to see and more, I'm relieved you knew what to do. I'm proud to announce that you've passed my last trial and you have my permission to become my pet, though the details of how this will work we'll have to figure out tomorrow. It's late already and I'd like to attend to other matters. Think about it for one more night, after you agree to become my pet there is no going back. See you tomorrow, pet.[/say]")
		GM.main.setModuleFlag("IssixModule", "Quest_Wait_Another_Day", true)
		setModuleFlag("IssixModule", "Quest_Status", 7)
		addButton("Agree", "Thank Issix and agree to come tomorrow", "endthescene")

	if state == "issixapologize":
		saynn("[say=pc]I apologize, I didn't know, I were stressed on my first walk and I didn't know what to do. I spent it in silence because that's a new situation for me. Please give me another chance Master Issix![/say]")
		saynn("[say=issix]I'm sorry {pc.name} but that's not good enough. My decision was hard to make but final. Spend more time and look at creatures around you, even in such grim place as this one, there are many that need it.[/say]")
		saynn("As brutal as it is, it doesn't seem like you can do much more here. It's time to accept your failure and move on.")
		addButton("Leave", "You've been rejected, nothing more to do here", "endthescene")

	if state == "issixacceptdefeat":
		saynn("[say=pc]I understand, thank you for giving me an opportunity to prove myself, and I'm sorry for not doing enough.[/say]")
		saynn("[say=issix]It's a lesson for the future. I'm glad you took my rejection just fine. Try to focus on needs of others, even in such grim place as this one there are creatures hurting, you always have the power to help them in your own way, don't waste it.[/say]")
		addButton("Leave", "You've been rejected, nothing more to do here", "endthescene")


	
func pet_handle_flag_response(response):  # true + true doesn't exist in GDScript :(
	if response == null or response == false:
		return 0
	if response == true:
		return 1
	return 1

## Function to determine a winner of given Rock Paper Scissors game
## Takes Player answer that is an int from 1 to 3 (1: Rock, 2: Paper, 3: Scissors)
## And NPC answer of same format
## Returns 1 if player wins, 2 if NPC wins, 3 if it's a tie	
func rps_win_conditions(pc_answer: int, h_answer: int):
	if pc_answer == h_answer:  # tie
		return 3
	if rock_paper_scissors[pc_answer] == h_answer:  # player win
		return 1
	return 2  # npc wins

		
func _react(_action: String, _args):
	if _args:
		answer = _args[0]
		
	if _action == "hiisisubanal":
		strapon_selected = answer
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(strapon_selected)
		GM.pc.addLust(30)

	if _action == "hiisisubanal2":
		GM.pc.addLust(30)

	if _action == "hiisisubanal3":
		GM.pc.addLust(30)

	if _action == "hiisisubanal4":
		GM.pc.orgasmFrom("rahi")
		GM.main.getCharacter("hiisi").cummedOnBy("pc")
		GM.pc.addLust(-100)

	if _action == "azazelskyresponse":
		setModuleFlag("IssixModule", "Azazel_Sky_Response", answer)
		
	if _action == "hiisirpsfirst":
		setModuleFlag("IssixModule", "Hissi_RPS_data", {"winpc": 0, "winh": 0, "chosen_reward": answer, "reward_acquired": false, "last_used": 0})
		
	if _action == "hiisirps":
		var current_data = getModuleFlag("IssixModule", "Hissi_RPS_data")
		var npc_answer = RNG.randi_range(1,3)
		match rps_win_conditions(answer, npc_answer):
			1:
				current_data["winpc"] += 1
			2:
				current_data["winh"] += 1
		current_data["last_used"] = answer+(npc_answer*10)
		setModuleFlag("IssixModule", "Hissi_RPS_data", current_data)
		
	if _action == "walkies2":
		runScene("ParadedOnALeashScene", ["issix", GM.pc.getLocation(), "main_yard_connector", [
			"Lamia, please try to keep up",
			"Azazel, watch out, inmate on your right is aboout to reach her climax",
			"Hiisi, stop sniffing every inmate, you are slowing us all down",
			"{pc.name} stay in between Lamia and Hiisi, you fit there perfectly"
		], "main_yard_connector", "crawl"])
		
	if _action == "walkies3":
		playAnimation(StageScene.Duo, "kneel", {npc="issix", npcAction="stand", bodyState={leashedBy="issix"}})
		runScene("ParadedOnALeashScene", ["issix", GM.pc.getLocation(), "yard_waterfall", [
			"Lamia, please try to keep up",
			"Azazel, watch out, inmate on your right is aboout to reach her climax",
			"Hiisi, stop sniffing every inmate, you are slowing us all down",
			"{pc.name} stay in between Lamia and Hiisi, you fit there perfectly"
		], "yard_waterfall", "crawl"])
		
	if _action == "walkies5":  # Heading back
		playAnimation(StageScene.Duo, "kneel", {npc="issix", npcAction="stand", bodyState={leashedBy="issix"}})
		runScene("ParadedOnALeashScene", ["issix", GM.pc.getLocation(), "hall_ne_corner", [
			"Lamia, I understand you are tired but please try to keep up",
			"Azazel, can you focus? You are stepping on me",
			"Hiisi, head up"
		], "hall_ne_corner", "crawl"])

	if _action == "eatmarshmallows":
		GM.pc.addIntoxication(0.5)

	if _action == "sharemarshmallows":
		GM.main.getCharacter("azazel").addIntoxication(0.2)
		GM.main.getCharacter("hiisi").addIntoxication(0.1)
		GM.main.getCharacter("lamia").addIntoxication(0.2)
		GM.pc.addIntoxication(0.1)

	if _action == "giveapple":
		GM.pc.getInventory().removeXOfOrDestroy("appleitem", 1)
		
	if _action == "givecookie":
		GM.pc.getInventory().removeXOfOrDestroy("Cookie", 1)
	
	if(_action == "endthescene"):
		endScene()
		return
		
	setState(_action)
