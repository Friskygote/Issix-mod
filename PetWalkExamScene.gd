extends SceneBase

var answer = null
var rock_paper_scissors = {1: 3, 2: 1, 3: 2}  # 1 = rock, 2 = paper, 3 = scissors
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
		aimCamera("main_yard_connector")
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
		if getModuleFlag("IssixModule", "Lamia_Is_Hungry", false):
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
				saynn("[say=hiisi]I'm not sure...[/say]")
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
			addButton("Celebrate", "You've won, wooho", "hissirpspcwin")
		elif rpc_data["winh"] > 2:
			addButton("Lost", "You've lost the game fair and square", "hissirpshiisiwin")
		else:
			addButton("Rock", "Use rock in this round", "hiisirps", [1])
			addButton("Paper", "Use paper in this round", "hiisirps", [2])
			addButton("Scissors", "Use scissors in this round", "hiisirps", [3])
		
	if state == "hissirpspcwin":
		saynn("[say=pc]Haha, I did it. Nice game, thanks for playing Hissi.[/say]")
		saynn("You've noticed that his mood has brightened, and he isn't so gloomy anymore.")
		saynn("[say=hiisi]Yeah, thank you for that, was actually pretty nice, glad we could have this one.\nYou know... You are pretty cool {pc.name}.[/say]")
		saynn("He looks down, but with slight grin on his face.")
		saynn("[say=pc]Awwwww. Thank you Hiisi! You are pretty cool yourself too, you know![/say]")
		# TODO
		
	if state == "hissirpshiisiwin":
		saynn("T")
		# TODO
		
	if state == "lamia":
		playAnimation(StageScene.Duo, "kneel", {npc="lamia", npcAction="kneel"})  # TODO We need laying down!
		saynn("Lamia lays on his belly, holds one of the colorful pencils from his drawing kit and draws. Next to him a stack of empty paper sheets as well as a visibly smaller but still impressive stack of filled out papers")
		if getModuleFlag("IssixModule", "Lamia_Is_Hungry") == null:
			addButton("Drawings", "Look at the drawings", "lamiadrawings")
		else:
			addDisabledButton("Drawings", "You've already asked about the drawings")
		addButton("Try drawing", "Try drawing something", "lamia")
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
		saynn("[say=pc]Aww, hungry? Unfortnetely I have brought no snacks with myself. Sorry![/say]")
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
		# TODO Make it so the player can put it on the wall in their cell
		
	if state == "hugandthank":
		saynn("Stunned, your heart melted, the first thing that comes to your mind is to hug the fox. You do that completely on impulse with no hesitation. Fox at first taken aback by that gesture (embarassed, blushing hard), eventually embraces the hug and reciprocates. Still hugging you say")
		saynn("[say=pc]Thank you Lamia, I love it so much. I'll cherish it.[/say]")
		saynn("They smile and nod twice to you excitedly.")
		addButton("Back", "End the conversation", "lamia")
				
	if state == "headpat":
		saynn("Stunned, your heart melted, the first thing that comes to your mind is to give the fox a headpat. You put your paw on their head and gently pat them. Their ears flatten and their face seems very pleased by your patting.")
		saynn("[say=pc]Thank you Lamia, I like it very much.[/say]")
		saynn("They smile and nod to you excitedly.")
		addButton("Back", "End the conversation", "lamia")
		
	if state == "else":
		saynn("You are thinking of doing something else. With plenty of space you could do plenty of activities, even if alone, considering all of the others don't seem to be keen on doing anything.")
		addButton("Walk", "Go for a walk near your group", "elsewalk")
		addButton("")
		
	
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
		
	if _action == "giveapple":
		GM.pc.getInventory().removeXOfOrDestroy("appleitem", 1)
		
	if _action == "givecookie":
		GM.pc.getInventory().removeXOfOrDestroy("Cookie", 1)
	
	if(_action == "endthescene"):
		endScene()
		return
		
	setState(_action)
