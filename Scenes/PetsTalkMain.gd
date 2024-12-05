extends SceneBase

var artwork = null
var arts_reviewed = 0
var arts_correct = 0

var pick_up_lamia_art = [
	"You pick up another art from the stash",
	"With some difficulty you manage to separate the last artwork from the pile from the rest to look at it",
	"You grab yet another artwork from the pile",
	"With a swift grab another artwork from the pile is now yours to look at"
	]

var humanoids_lamia_art = [
	"a group of inmates celebrating someone's birthday",
	"a wolf person firing fireworks",
	"a dragon person sitting inside the elevator, reading newspapers in her paws",
	"portrait of a snake person with particularly long fangs sticking out from their maw",
	"an anthro zebra dancing on a strip pole",
	"multiple versions of legs belonging to a bovine anthro, likely drawn for practice"
	]

var animal_flora_lamia_art = [
	"a goat with impressive curly horns",
	"a crow with a yellow circular object held in their beak",
	"feral bear fishing",
	"multiple cats chasing each other as their small ones rest on a pillow nearby",
	"a horse galloping in the distance",
	"a spread purple flower that has multiple petals of various sizes attached"
	]

var humanoids_animals_lamia_art = [
	"an anthro cat holding a little feral mouse on palm of their paw",
	"a cat person leading their feral dog on a leash",
	"coyote person releasing a bird - a white dove from their paws into the air, the dove flies away"
	]

var background_lamia_art = [
	"a large valley full of trees and small stream of water going down",
	"a desert, with one dead tree on it, a couple of paw prints visible in the sand",
	"momentous buildings stretching in all directions, various shuttle tracks between them",
	"darkness extending everywhere, the little light that can be found on the picture gives you a hint that the drawing shows some kind of a mine, with glistering rock and a lake in the distance",
	"stalactites and stalagmites extending from the top and bottom of the cave, a torch is visible somewhere deeper in the cave",
	"what looks to be an empty dog park with various dog attractions in it, in the background you can see sun raising from the horizon - it must be early morning",
	]
	
var animals_backgrounds_lamia_art = [
		"a jungle full of flora, you see giant trees as well as a large amount of green plants, some purple flowers growing here and there",
		"a bird's-eye view of abandoned city, reclaimed by nature, full of thorny vines and trees growing from the houses",
		"a rabbit jumping above a huge ravine, even though they there is no way their paws could put them so high, considering their position they will likely land on the other side",
		"a feral dragon sitting atop a pile of gold, crusty fries, nearby there is a small well filled to the brim with red liquid (ketchup, you presume), with a single giant fry sticking out of it"
	]

var humanoids_backgrounds_lamia_art = [
	"an anthro bull standing at the top of the mountain looking at clear view of green terrains below them",
	"an inmate staring at the cosmos behind the reinforced glass display",
	"various species of humanoids having a party on what looks to be a flying... Egg",
]

var other_lamia_art = [
	"a wide assortment of geometrical figures - squares, triangles and hexadecagons",
	"a collar, very similar to the one every inmate wears, on it a barbed wire"
	]

var all_features_combined_lamia_art = [
		"some sort of a spaceship, multiple people hanging out, laughing and eating in its living area, you can spot a feral bird in one of the cages placed on a table in this wide open space",
		"a bunch of masculine tribe anthropomorphic canines hunting for what looks to be a wyvern of some sort in the air, they use primitive tools like spears thrown into air, the area they are located in seems very swampy with plenty of mud and flora that usually grows in highly watery places"
	]

var odd_lamia_art = [
	"a worm that seems to have a very slippery texture, on one of the ends there is a simple „tail” with spike like ending, while the other seems to be a hollowed circle with numerous tiny teeth around it",
	"at first what seems like a tube of some sorts, though later you notice that this tube ends with a hole on one end, around the „hole” a bunch of yellowish protrusions extending from the fleshy tube"
	]

func _init():
	sceneID = "PetsTalkScene"

func _run():

	if(state == ""):
		playAnimation(StageScene.Solo, "stand", {pc="pc", bodyState={naked=false, hard=false}, npcBodyState={naked=false, hard=false}})
		setLocationName("Issix's Corner")
		saynn("In front of you - three slaves belonging to Issix.")
		addCharacter("azazel")
		addCharacter("lamia")
		addCharacter("hiisi")
		addButton("Azazel", "Approach Azazel", "azazelmain")
		addButton("Hiisi", "Approach Hiisi", "hiisimain")
		addButton("Lamia", "Approach Lamia", "lamiamain")
		addButton("Leave", "Be on your way", "endthescene")
		
	if(state == "azazelmain"):
		playAnimation(StageScene.Duo, "kneel", {pc="azazel", npc="pc", bodyState={naked=false, hard=false}})
		clearCharacter()
		addCharacter("azazel")
		addButton("Talk", "Talk to Azazel", "azazeltalk")
		addButton("Appearance", "Look at Azazel", "azazelappearance")
		if(GM.pc.getInventory().hasItemID("CatnipPlant")):
			saynn("Before you even have the time to approach Azazel, you see his head hovering over his body, his little nose working very hard to track down the source of the curious smell. He looks around with interest, until he sees you approaching.\nHe observes you with interest as you come close.")
			saynn("[say=azazel]Meow! You really smell of a catnip, do you have catnip? Do you??[/say]")
			saynn("{azazel.name} becomes really excited, as exemplified by his tail stretching high as if it was a broom stick. His body constantly sways.")
			addButton("Give Catnip", "Give Azazel the catnip", "catnip")
		else:
			if getModuleFlag("IssixModule", "PC_Enslavement_Role", 0) == 0:
				saynn("You approach Azazel, he recognizes sudden attention given to him, he goes on his fours doing some kitty back streching before kneeling towards you expectandly. You notice he took a quick peek at his master beforehand.")
			else:
				pass  # TODO
		addButton("Back", "Take a step back", "")

	if state == "hiisimain":
		clearCharacter()
		addCharacter("hiisi")
		playAnimation(StageScene.Duo, "kneel", {pc="hiisi", npc="pc", bodyState={naked=false, hard=false}, npcBodyState={naked=false, hard=false}})
		if getModuleFlag("IssixModule", "PC_Enslavement_Role", 0) == 0:
			saynn("You approach Hiisi, he acknowledges your presence but other than that doesn't give you much attention, continuing to lay on his front looking at his master with his muzzle being supported by own arms.")
			addButton("Talk", "Talk to Hiisi", "hiisitalk")
			addButton("Appearance", "Look at Hiisi", "hiisiappearance")
		else:
			saynn("You approach Hiisi, he rolls to the side facing you.")
			addButton("Talk", "Talk to Hiisi", "hiisitalk")
			addButton("Appearance", "Look at Hiisi", "hiisiappearance")
		addButton("Back", "Take a step back", "")
		
	if state == "hiisitalk":
		var HiisiRPS = getModuleFlag("IssixModule", "Hissi_RPS_data")
		if HiisiRPS != null:
			if HiisiRPS["chosen_reward"] == 3 and HiisiRPS["reward_acquired"] == false:
				addButton("Drink", "Ask Hiisi about energy drink that you've won through the game of Rock Paper Scissors", "hiisienergy")
			if HiisiRPS["winh"] > 2 and HiisiRPS["reward_acquired"] == false:
				addButtonWithChecks("Hypnovisor", "Ask Hiisi to fulfill his request with hypnovisors", "hiisihypnovisors", [], [[ButtonChecks.HasItemWithTag, ItemTag.Hypnovisor]])
		if not getModuleFlag("IssixModule", "Hiisi_Name_Helped", false):
			addDisabledButton("Name", "You already asked Hiisi about his name")
		else:
			addButton("Name", "Ask Hiisi about his name", "hiisiname")
		addButton("Back", "Do something else", "hiisimain")

	if state == "hiisiname":
		saynn("[say=pc]Hey Hiisi, can you tell me something more about your name? It feels kind of odd.[/say]")
		saynn("Hiisi looks down")
		saynn("[say=hiisi]I suppose, not a common one. And I don't really know much, I don't know much about my name, I don't remember much of my past.[/say]")
		saynn("[say=pc]Oh? That... Sucks...[/say]")
		saynn("[say=hiisi]Yeah. It's also pretty common that inmates make fun of it.[/say]")
		saynn("[say=pc]Why?[/say]")
		saynn("[say=hiisi]You know... The other word. Even though it's not really pronounced the same way, there are similarities.[/say]")
		saynn("[say=pc]The other wor- Ohhhh. I'm sorry to hear that.[/say]")
		saynn("[say=hiisi]It's not easy to get used to it, should I even get used to it? I don't know. I've heard it so many times now that it only makes me angry. It hurts.[/say]")
		saynn("Hiisi's voice is breaking down, he is about to cry.")
		addButton("Reassure", "Hug Hiisi and let him know you are here for him", "hiisireassure")
		addButton("Silence", "Let Hiisi deal with his feelings by himself", "hiisisilence")
		addButton("Man up", "Tell Hiisi to harden up and stop whining", "hiisiadvice")

	if state == "hiisireassure":
		saynn("You approach Hiisi and embrace him in a warm hug. You choose not to say anything, deciding that this comfort is telling enough, you aren't judging them for crying, it's only natural. They weep for a few seconds, before stopping.")
		saynn("[say=hiisi]... Thank you, I needed this.[/say]")
		saynn("[say=pc]Hey, it's not your fault, people are just jerks.[/say]")
		saynn("[say=hiisi]I know... I know...[/say]")
		saynn("You release Hiisi from your embrace, he still looks like a mess but they seem better now.")
		addButton("Back", "You've helped the doggo", "hiisitalk")

	if state == "hiisisilence":
		saynn("Instead of proactive approach you let Hiisi sort his stuff on his own, he weeps for a minute, not saying anything, after his paws remove countless tears he looks at you again.")
		saynn("[say=hiisi]Sorry... Didn't expect thinking about this to make me feel so miserable *sniff* [/say]")
		saynn("[say=pc]It's alright, sorry it happens to you.[/say]")
		saynn("[say=hiisi]Thank you...[/say]")
		addButton("Back", "You've helped the doggo", "hiisitalk")

	if state == "hiisiadvice":  # it was hurting me to even write this dialogue, toxic masculinity fucking sucks, if you pick this dialogue you are either an idiot or made a mistake, yes, I'm judging you for how you play this game that gives you a choice lol
		saynn("Hiisi starts weeping, tears dropping from their face, despite his attempts to remove them with his arm")
		saynn("[say=pc]Grow up Hiisi, are you really crying because someone makes fun of your name? Are you a child?[/say]")
		saynn("[say=hiisi]I... I... Sor-[/say]")
		saynn("He breaks down completely, he starts crying loudly, getting attention of everyone around")
		saynn("[say=issix]What the fuck did you say to Hiisi? Get away. Hells...[/say]")
		saynn("Issix descends from his chair and kneels next to Hiisi, taking his paws in his and speaks to him. THey exchange looks, Issix gives Hiisi a handkerchief to deal with the tears. You want to explain yourself but one look from Issix towards you efficiently dissuades you from trying.")
		addButton("Leave", "You aren't welcome here for now", "endthescene")

	if state == "hiisienergy":
		saynn("[say=hiisi]Sure, I got it, here you go.[/say]")
		saynn("He passes energy drink can to you. Thanks for brightening my mood that day.")
		saynn("You received 1 Energy Drink.")
		addButton("Back", "Take a step back", "hiisitalk")
			
	if state == "hiisihypnovisors":
		playAnimation(StageScene.Duo, "kneel", {pc="hiisi", npc="pc", npcAction="kneel", bodyState={naked=false, hard=false}, npcBodyState={naked=false, hard=false}})
		saynn("[say=pc]Umm, I have those, you wanted me to wear those the other day, right?[/say]")

		saynn("Hiisi gives you a grin")
		saynn("[say=hiisi]Yeah, I did. Can you pass them to me for a moment?[/say]")
		saynn("[say=pc]Sure?[/say]")
		saynn("You hand the Hypnovisor to Hiisi, he pulls out a small box out of nowhere and swipes it near the hypnovisors, he skillfully baps and presses a few places on the hypnovisors and turns them on for a second as if to confirm something. Satisfied he turns them off and passes back to you.")
		saynn("[say=hiisi]Done! Now just put them on and let me watch![/say]")
		addButton("Refuse", "Say that you feel uncomfortable putting the hypnovisors on with those changes", "hiisihypnono")
		addButton("Put on", "Put the hypnovisors on yourself and turn them on", "hiisihypnoyes")

	if state == "hiisihypnono":
		saynn("[say=pc]Sorry, Hiisi, but I'm not comfortable putting them on after you tinkered with them.[/say]")
		saynn("[say=hiisi]Oh cmoon, you agreed to doing something for me! I just wanted to test something![/say]")
		saynn("[say=pc]That's still a no.[/say]")
		saynn("[say=hiisi]Oh fucking hell. Fine then, be an asshole. I've won fair and square and you treat me like this. Fuck off.[/say]")
		saynn("He is not having any of it, seems like he is sulking now. You are left with the hypnovisors, you attempt to set them to fabric settings and you seemingly succeed. You have your unsabotaged hypnovisors back.")
		addButton("Continue", "Hiisi continues to sulk", "")

	if state == "hiisihypnoyes":
		saynn("[say=pc]Are you sure it's safe?[/say]")
		saynn("[say=hiisi]Yeah...[/say]")
		saynn("He doesn't sound sure about that himself, though you did promise him and he won fair and square.")
		saynn("[say=pc]Okeeeyy, in that case here I go.[/say]")
		saynn("You put on the Hypnovisors. They don't feal any different from regularly working hypnovisors, at least at first. As the time goes you start feeling stressed, anxious even fearful, and despite it, you are [pulse color=#00FFAA height=0.0 freq=1.0]drawn to it[/pulse]. Like moth to the flame, you want to [pulse color=#00FFAA height=0.0 freq=1.1]continue[/pulse]. You allow more of that [pulse color=#00FFAA height=0.0 freq=1.2]violent poison[/pulse] into you, the visor on your face [pulse color=#00FFAA height=0.0 freq=1.3]deciding for you[/pulse]. You have never felt such strong desire to [pulse color=#00FFAA height=0.0 freq=1.4]destroy what you are made of[/pulse]. To [pulse color=#00FFAA height=0.0 freq=1.5]let others make use of you[/pulse]. Your brain is a mush, you are drifting on the sea where the sea has all of the [pulse color=#00FFAA height=0.0 freq=1.6]control[/pulse], every movement is dictated by the waves. The sea [pulse color=#00FFAA height=0.0 freq=1.9]controls you[/pulse] with fear, fear of taking everything of yours...")
		addButton("Black out", "You lose consciousness", "hiisihypnodone")

	if state == "hiisihypnodone":
		playAnimation(StageScene.Duo, "kneel", {pc="issix", npc="pc", npcAction="kneel", bodyState={naked=false, hard=false}, npcBodyState={naked=false, hard=false}})
		saynn("[say=issix]{pc.Name}, {pc.name}? You there?[/say]")
		saynn("You hear your name being called, are you asleep? You open your eyes and see Issix's face.")
		saynn("[say=issix]Oh thank galactic squid you are okey. Fuck.[/say]")
		saynn("Memories flood back to you, you were putting headvisors and all then felt all of those unpleasant and pleasant feelings, but you can't remember what exactly were they, or what they meant or really anything else.")
		if GM.main.getModuleFlag("IssixModule", "PC_Enslavement_Role", 0) == 1:  # is a pet
			saynn("[say=issix]I'm sorry my pet, I should have noticed sooner that something was amiss. Hiisi was doing some experimentation on his own, and clearly it got out of control. How many fingers do you see?[/say]")
			saynn("He shows 2 fingers")
			saynn("[say=pc]Two.[/say]")
			saynn("[say=issix]Okey, your sight looks fine. Can you recall who am I? Where you are? Who you are?[/say]")
			saynn("[say=pc]I think so. You are my Master, name is Issix. I'm {pc.name} and we are in the corner of the main hall of the prison.[/say]")
			saynn("[say=issix]That checks out, good good. I think that even though you lost consciousness, *cough* for whatever reason, you seem just fine. Hiisi![/say]")
			saynn("He looks at the sad leashed pup with anger, tugging on his leash.")
			saynn("[say=hiisi]I'm sorry {pc.name}. I shouldn't have experimented on you.[/say]")
			saynn("[say=issix]I do NOT want to see this happen again, understood?[/say]")
			saynn("[say=hiisi]Yes, Master.[/say]")
			saynn("Pup, with curled ears, completely in submission to his master responds.")
		else:
			saynn("[say=issix]I apologize for my pet Hiisi, I should have known something was amiss. Hiisi was doing some experimentation on his own, and clearly it got out of control. How many fingers do you see?[/say]")
			saynn("He shows 2 fingers")
			saynn("[say=pc]Two.[/say]")
			saynn("[say=issix]Okey, your sight looks fine. Can you recall who am I? Where you are? Who you are?[/say]")
			saynn("[say=pc]I think so. You are Issix, I'm {pc.name} and we both are imprisoned.[/say]")
			saynn("[say=issix]Good good. Sounds about correct. Hiisi![/say]")
			saynn("He looks at the sad leashed pup with anger, tugging on his leash.")
			saynn("[say=hiisi]I'm sorry {pc.name}. I shouldn't have experimented on you.[/say]")
			saynn("[say=issix]I do NOT want to see this happen again, understood?[/say]")
			saynn("[say=hiisi]Yes, Master.[/say]")
			saynn("Pup, with curled ears, completely in submission to his master responds.")
		addButton("Back", "Well, that happened, end the conversation", "")


	if(state == "lamiamain"):
		clearCharacter()
		addCharacter("lamia")
		playAnimation(StageScene.Duo, "kneel", {pc="lamia", npc="pc", bodyState={naked=false, hard=false}})
		if getModuleFlag("IssixModule", "PC_Enslavement_Role", 0) == 0:
			saynn("You approach Lamia")
			var lamia_mood = getModuleFlag("IssixModule", "Lamia_Times_Helped", 0)
			if lamia_mood < -5:
				saynn("He notices you and gives you a neural look of face, awaiting your further interactions.")
			elif lamia_mood < 5:
				saynn("He notices you and smiles.")
			elif lamia_mood < 15:
				saynn("He notices you, gives you a warm smile and invites you onto his blanket.")
			else:
				saynn("He notices you and immediately his fox tail swishes right and left, his face expression very happy to see you he invites you onto his blanket.")
		else:
			pass  # TODO
		addButton("Talk", "Talk to Lamia", "lamiatalk")
		addButton("Appearance", "Look at Lamia", "lamiaappearance")
		if false:  # TODO Get this behind some flag after talking to them
			match getModuleFlag("IssixModule", "Helped_Lamia_With_Drawings_Today"):
				null:
					addButton("Help", "You see a big stack of drawings and some drawers, it seems Lamia categorizes their drawings, ask if you could help?", "lamiahelp")
				true:
					addDisabledButton("Help", "You've helped the fox boyy today already")
				false:
					addButton("Help", "You see a big stack of drawings filled again, ask if you could help sorting it?", "artminigame")
		addButton("Back", "Take a step back", "")
			
	if(state == "catnip"):
		saynn("You take the catnip and slowly reach your paw with the plant to the feline. Halfway there feline snatches the catnip from you paw and throws it in the air. His paws go above and he plays airborne valley...catnip with it? Eventually he misses with his paw and catnip falls on his muzzle, he freezes for a moment as if paralyzed, the pupils in his eyes become large.")
		saynn("[say=pc]Umm, Azazel, are you okey?[/say]")
		sayn("He turns his face towards you again, enlarged pupils still in his eyes, surprised face expression staring at you.")
		saynn("After a moment his pupils go back to normal, and his face expression turns content.")
		saynn("[say=azazel]Meow! I mean... Yes, sorry, I got... A bit carried away.[/say]")
		saynn("He becomes a little embarassed. Looks down at the catnip plant on his blanket. Picks it up with his paw and consumes it.")
		saynn("[say=azazel]Twank yuu {pc.name}. It was really nice![/say]")
		processTime(1 * 60)
		addButton("Back", "End catnip therapy session", "azazelmain")
		#setState("azazelmain")
		
	if(state == "azazeltalk"):
		GM.main.setModuleFlag("IssixModule", "Azazel_Catnip_talked", true)
		var affection = getModuleFlag("IssixModule", "Azazel_Affection_given", 0)
		addButton("Prison", "Ask how did he end up in prison?", "azazelprison")
		addButton("Hobby", "Ask what hobbies does he have", "azazelhobby")
		if affection > 2:
			addButton("Issix", "Ask what he thinks of his master?", "azazelmaster")
		else:
			addDisabledButton("Issix", "You don't have good enough relationship with Azazel to ask about his master")
		if affection > 5:
			addButton("Breeder", "Ask what he thinks of his position as a breeding bitch?", "azazelbreeding")
		else:
			addDisabledButton("Breeder", "You don't have good enough relationship with Azazel to ask about his position as breeding bitch")
		if affection > 10:
			addButton("Fetishes", "He mentioned his fetishes, perhaps he could elaborate?", "azazelfetishes")
		else:
			addDisabledButton("Breeder", "You don't have good enough relationship with Azazel to ask about his fetishes")
		if affection > 18:
			addButton("Pussy", "Azazel has a pussy and yet he is rather masculine", "azazelintersex")
		else:
			addDisabledButton("Pussy", "You don't have good enough relationship with Azazel to ask about his genitalia")
		if(GM.pc.getInventory().hasItemID("CatnipPlant")):
			pass
		else:
			pass
		addButton("Back", "Do something else", "azazelmain")
		
	if(state == "azazelappearance"):
		if(OPTIONS.isContentEnabled(ContentType.Watersports)):
			saynn("When approaching there are two distinct smells coming from Azazel - his own pheromones advertising his fertility to everyone around, as well another strong smell of his master. Azazel has been marked, in more ways than one.")
		else:
			saynn("When approaching there is one distinct smell coming from Azazel - his own pheromones advertising his fertility to everyone around.")
		saynn("You take a closer look at {azazel.name}. He is a very thin and fairly short feline, judging from him sitting he is around " + Util.cmToString(150) + " tall, with no visible muscles, likely not very strong. Overall his body is still mostly masculine, though here and there there are feminine features like his face or shoulders.\nHis fur is in majority dark grey, though his belly and face are of ligher shade of gray. A small set of horns protrudes from his head. On his backside there is a medium sized feline tail.\n\nOne significant detail is that he does not possess a penis, in its place there is a {azazel.pussyStretch} vagina, above which you can see a womb tattoo seemingly glowing a bit in shade of red.")  # TODO Makes no sense player can see that at this point, Azazel is clothed
		saynn("On his lower back words ”PROPERTY OF ISSIX” branded onto the skin - a mark of his master.")
		addButton("Back", "Do something else", "azazelmain")

	if state == "azazelprison":
		saynn("[say=pc]Tell me Azazel, what had happened that you've ended up in this prison? You are a Lilac, so I assume it had something to do with sex.[/say]")
		saynn("[say=azazel]It's true... There is a group on my home planet, they claim they want to cleanse the society of trash, and by trash they of course mean everyone they deem too radical for their own liking.[/say]")
		saynn("Azazel looks down, this conversation seems to bring back bad memories.")
		saynn("[say=azazel]One of the group's members wanted to meet me one day, they wanted to... Procure my services. Turns out it was all just a plot, they got close to me and I didn't really see anything wrong with that, I shared a lot of personal details with them - my life, financial situation even fetishes, they felt really honest and... Caring. Eventually they tore down their mask and said they have all kind of dirt on me. That's where the hell broke loose, their group were on my back for a while, stalking, harassing me. Eventually one of my clients infected me with something transmitted sexually, I think it was the group who sent me that client and...[/say]")
		saynn("Azazel's voice starts to break down.")
		saynn("[say=azazel]They reported me, I had my license taken and now I'm in here.[/say]")
		saynn("You both sit in awkward silence while Azazel recovers.")
		saynn("[say=azazel]I will never understand groups as that one. There are more of those all over the galaxy, I know that. They ruin the lives of so many of us.. Workers. What have we done to wrong them? Nothing, we just sell our time and bodies to give others and ourselves some temporary pleasures in this grim world we live in.[/say]")
		saynn("He sighs, it seems to have calmed him down")
		saynn("[say=azazel]When I first arrived here I were so lost. Still very confused by this series of events, felt betrayed, hurt. Eventually I've met Master, they saw something in me and they guided me through my trauma. I were really happy to become his pet. And honestly? It's not so bad, I have food, shelter and Master who takes care of me. And my heats.[/say]")
		saynn("He says the last one, showing you his tongue at you in a grin")
		saynn("[say=azazel]So... Yeah... That's how I ended up here. Not a happy story, but I doubt anyone's is. Ironically, I think I'm better here, and I can still engage in sex without any stupid license.[/say]")
		addButton("Back", "Do something else", "azazelmain")

	if state == "azazelhobby":
		saynn("[say=pc]What hobbies do you have Azazel?[/say]")
		saynn("[say=azazel]Oh, hobbies! I had some of them before I got sent to prison. Not so many anymore.[/say]")
		saynn("His head lowers and his tail curls around him, you figure he misses something from the past.")
		saynn("[say=azazel]Can you believe I've been a mediator between some communities? You know, like a person to be a bridge between two groups of interest? I've been told I were really good with talking and resolving conflicts, so after few time I've been pushed into uncomfortable situation of mediating between friends or even groups of people I found I really liked that.[/say]")
		saynn("A ever so slightly visible smile creeps onto his face.")
		saynn("[say=azazel]Eventually I've found a need for a volunteer mediator on my planet. Here a citizen group wanted something from the government and needed someone to mediate, here a local community wanted a free entry to an area managed by other community and they had a year long argument about it, that I were able to resolve in just 5 hours. I felt really needed. Granted, what little credits I got out of those meditations didn't really cover costs of living, so my main source of income was selling my body. But helping communities around truthfully gave me purpose, and seeing happy people after successful negotiations was so so cool![/say]")
		saynn("He recalls more cases where he mediated. His voice when he tells those is filled with hope and happiness. He remembers many details about people he had helped - they've made an impact on him.")
		saynn("[say=pc]Have you considered continuing your hobby here?[/say]")
		saynn("[say=azazel]I don't know... Master asked me the same question. Prison is a very... Different place. I don't think it would work, besides, what kind of thing I'd mediate in?[/say]")
		saynn("[say=pc]Guards and prisoners? Prisoners and prisoners? I'm sure there are plenty of things that people could use your skills in here.[/say]")
		saynn("He considers this for a moment")
		saynn("[say=azazel]Maybe... I need to sleep on it. I think. Thanks.[/say]")
		saynn("[say=pc]Of course, kitty.[/say]")
		saynn("He smiles at you, the conversation has ended.")
		addButton("Back", "End this conversation", "azazelmain")
		
	if state == "azazelmaster":
		saynn("[say=pc]So what do you think of your Master?[/say]")
		saynn("[say=azazel]My Master? Hmm. Back when I ended up in the prison he noticed me and gave place to be, he gave me protection, food - well, something else than the regular scrap you get in the prison kitchen, and helped me with my fears and anxiety I've had after coming in here. I really don't know what I'd do if he wasn't here, I think he... Saved me, you know? This place is scary in many ways if you don't have someone to show you around. Some may think that he is a bad person for simply what he has done to me or Lamia but he isn't.[/say]")
		saynn("[say=pc]Is he very strict with you?[/say]")
		saynn("[say=azazel]Not at all! He is a very understanding Master. He cares about us and does his best to keep us happy. What he asks of us is very little, I know how it sounds... But I speak from the bottom of my heart when I say it! He is a good Master.[/say]")
		saynn("[say=pc]Is that so? Hmm. How did you meet him?[/say]")
		saynn("He thinks for a second")
		saynn("[say=azazel]Well, I remember getting in here, being „processed” with the collar and all and basically pushed into new life. My first few days were spent trying to be quiet as a mouse *laughs*, everyone felt intimidating, and I've seen inmates getting harassed and used against their will. This seems to be the culture of this place, restraints are like free candy. There were one or two incidents I had with some bullies, I were assulted and used. One day Master Issix saw me hiding, he approached me and talked to me a bit, about why am I hiding, what am I doing in here and if someone is after me. From then I visited him daily, he... Grew on me. And one day he gave me a proposition to become his pet. At first I were hesitant, as anyone would be, but at the same time, he let himself be a very sweet person to me, and he never assulted me. So I accepted, and became his first sl- *he coughts* pet.[/say]")
		saynn("He smiles at you.")
		saynn("[say=azazel]I think he needed me as much as I needed him. So... Yeah. That's about it.[/say]")
		addButton("Back", "End this conversation", "azazelmain")

	if state == "azazelbreeding":
		saynn("[say=pc]Are you okey with your position as a breeder... Breeding bitch in the harem?[/say]")
		saynn("[say=azazel]Of course! Truth is, I'm the only one who can bear children out of us three... So of course I have huge responsibility. Master says that I'd be a good mother, haha. Can't test that theory in here, but oh well, I don't know. I don't really know why does Master want us to keep breeding, maybe he has something from it? He can't keep them either. Maybe that's just what he likes. Anyways, I don't mind. At this point I'm pretty good at making him litter, and I think he is proud of me too.[/say]")
		saynn("[say=oc]Doesn't it get tiring?[/say]")
		saynn("[say=azazel]Sometimes? I guess. I have those wants and needs when I'm pregnant, but Master always tries his best to keep me happy either way. And besides, if I'm not bred I tend to get really annoying, haha. Yeah...[/say]")
		addButton("Back", "End this conversation", "azazelmain")

	if state == "lamiahelp":
		playAnimation(StageScene.Duo, "kneel", {pc="lamia", npc="pc", npcAction="kneel", bodyState={naked=false, hard=false}})
		arts_reviewed = 0
		arts_correct = 0
		if getModuleFlag("IssixModule", "Helped_Lamia_With_Drawings_Today") == null:
			saynn("You look at Lamia picking his artwork from the pile, staring at it for a moment and putting it into one of 4 containers on the side.")
			saynn("[say=pc]Hey Lamia... Do you need help with that? I think your pile is quite large.[/say]")
			saynn("They look at you with huge smile and nod their head in agreement, aggressively.")
			saynn("[say=pc]Alright alright, but you'll have to show me what you are doing here. You are... Categorizing, right?[/say]")
			saynn("They nod their head once again, grab some crayons, a sheet of paper and start drawing something. Not even a full minute in and they show you the effect.\nOn the drawing you can see four boxes one colored blue, red, green, purple respectively. Above the blue one there is a stick figure.")
			# saynn("[say=pc]Hmm, so like, people?[/say]")
			# saynn("They shake their head, pick a few artworks from the blue box, on them there are pretty regular things, anthro holding a baloon, another simply depicts a glass of water, yet another has just an anthro skunk on it. You wonder for a second, look at artwork in other boxes.")
			saynn("[say=pc]Perhaps... People?[/say]")
			saynn("They give you a smile and a nod, seems like you got that one. You look on the right, there is a red box with two arrows pointing at it from what looks to be a feral goat of some sorts as well as flowers.")
			saynn("[say=pc]Nature maybe? Animals and flowers?[/say]")
			saynn("Lamia nods excited.")
			saynn("[say=pc]I'm getting good at this![/say]")
			saynn("You look at the 3rd box. A green one. This is a rectangle which has a lot of colors on it. As if someone just wanted a colorful rectangle. You look at the artwork at the top of the green box and understand what's this about. It has a very detailed environment, with landscapes you'd never imagine exist in real life. But so beautiful too. It looks to be some sort of sandy area with large sandstone arch in the middle. There is a small but dry dree on the right.")
			saynn("[say=pc]Backgrounds! Right?[/say]")
			saynn("Lamia gives you thumbs up, they are shaking in excitement, one more and they may just have the energy to shoot out of this station. You laugh, and look at 4th box - purple one. This one is strange, there is just an arrow pointing at it from a circle? And square next to it.")
			saynn("[say=pc]Figures maybe?[/say]")
			saynn("Lamia moves their head from side to side. Are you close?")
			saynn("[say=pc]Hmm. Geometrical shapes? Lines?[/say]")
			saynn("They shake their head, that's not it. They again draw first three boxes and cross them out, they point at 4th box.")
			saynn("[say=pc]Umm, whatever doesn't go in the first three goes in the last one?[/say]")
			saynn("Lamia vigorously nods their head, that's it.")
			saynn("[say=pc]Ahhhhhhh. I seeeee...[/say]")
			addButton("Continue", "This doesn't seem to be all of it", "lamiaexplanationcont")
		else:
			saynn("[say=pc]Would you like my help with sorting artwork today?[/say]")
			saynn("Lamia gives you a nod and invites you to sit with him.")
			addButton("Work", "Get to sorting!", "artminigame")

	if state == "lamiaexplanationcont":
		saynn("Lamia draws more things, he draws a stick figure with a goat, circles them and points arrow to the blue box, then they draw a goat, stick figure and a background, connect them in one circle and points arrow to the green box. You enter deep thought what this could mean until an idea dawns on you.")
		saynn("[say=pc]Do you mean connections? Like when one picture has more elements it goes to the blue box?[/say]")
		saynn("Lamia nods.")
		saynn("[say=pc]I seeee, so I assume if something would go to the blue and red box then it belongs in the blue box? Like, humanoids take priority?[/say]")
		saynn("Lamia nods again.")
		saynn("[say=pc]Got you.[/say]")
		saynn("Lamia then draws a goat and a background, but without a stick figure this time, encircles them and points to red box.")
		saynn("[say=pc]If there is something from the red box but it also has a background it should still go to the red box. That does make sense, you want to focus on elements on the drawings when categorizing, and sometimes you just draw background for them but it isn't just the background artwork.[/say]")
		saynn("Lamia confirms your guess. At last they draw a... Tablet? And a baton with sparks? Then a... Flashlight, you think.")
		saynn("[say=pc]Hmm. Electronic devices?[/say]")
		saynn("Lamia nods and makes an arrow pointing to the purple box.")
		saynn("[say=pc]I see, I see.[/say]")
		saynn("With that, Lamia gives you the piece of paper he drew explanations on. This seems to be all... You look at it for the last time and think you are ready to go.")
		saynn("[say=pc]Alright, can you watch me when I try for the first time?[/say]")
		saynn("Lamia nods, very happy with himself.")
		addButton("Help out", "Start sorting through the artwork stash.", "artminigame")

	if state == "artminigame":
		if arts_reviewed:
			saynn("You've rated "+str(arts_reviewed)+"/10 artworks.")
		if artwork[2] == true:
			saynn(RNG.pick(pick_up_lamia_art)+". The new artwork features "+RNG.pick(odd_lamia_art)+". Although after short moment the artwork is swiftly taken from you by Lamia who feels unusually flustered about you seeing it. He flips it upside down so the drawings are not visible to anyone anymore and puts it into the last box like this. Embarrassed he picks up another artwork from the pile and hands it to you. The new artwork features "+artwork[1]+".")
		else:
			saynn(RNG.pick(pick_up_lamia_art)+". The new artwork features "+artwork[1]+".")
		#saynn("DEBUG: "+str(artwork[0])+". VER 1: "+str(verify_response(1))+" VER 2: "+str(verify_response(2))+" VER 3: "+str(verify_response(3))+" VER 4: "+str(verify_response(4)))
		addButton("Blue box", "Put the artwork on top of others in the blue box", "blueboxlamia1")
		addButton("Red box", "Put the artwork on top of others in the red box", "redboxlamia2")
		addButton("Green box", "Put the artwork on top of others in the green box", "greenboxlamia3")
		addButton("Purple box", "Put the artwork on top of others in the purple box", "purpleboxlamia4")
		addButton("Explanation", "Try to remember the rules of categorizing Lamia's artwork", "lamiaartexplanation")

	if state == "lamiaartexplanation":
		saynn("You recall the following about Lamia's explanations:")
		saynn("The [color=blue]blue box[/color] is associatied with PEOPLE, humanoids, anthropomorphic animals. If artwork features only a humanoid, or it has a feral animal along with humanoid, or the humanoid is drawn with a background - the artwork goes to this box.")
		saynn("The [color=red]red box[/color] is associated with feral animals and plants. If the artwork features only animal/plant or animal/plant and a background then it belongs in this box.")
		saynn("The [color=green]green box[/color] is for backgrounds, though optionally artwork goes there if it has all of the elements - so animals/plants, humanoids as well as the background.")
		saynn("The [color=purple]purple box[/color] is for everything that doesn't fit in other boxes. Abstract art, simple text, figures or items.")
		addButton("Back", "Go back to categorizing art!", "artminigameae")


	if state == "artminigamegoodend":
		saynn("Putting the last artwork into the box together both you and Lumia have reached the end of artwork to sort. Lumia very happy the job has been done gives you a pat on your head and a large smile.")
		if RNG.randi_range(1,3)==2:
			saynn("Seeing the great job you've done he also shares half of a cookie with you, which you consume on spot.")
			GM.pc.addStamina(10)

		saynn("[say=pc]So... A job well done?[/say]")
		saynn("Lamia decisively agrees. He grabs boxes, stacks them and puts nearby, stretching their limbs.")
		addButton("Finish", "You've helped Lamia sort through the art, there is no more artwork to be sorted", "lamiamain")

	if state == "artminigamebadend":
		saynn("Putting the last artwork into the box you finally empty the pile of unsorted artwork. Lumia thanks you for your help and sends you off. When you look behind he is picking artwork from some of the sorted piles and moves his work between boxes, have you made mistakes?")
		addButton("Finish", "You've helped Lamia sort through the art, there is no more artwork to be sorted", "lamiamain")

	if state == "lamiatalk":
		var lamia_affection = getModuleFlag("IssixModule", "Lamia_Times_Helped", 0)
		addButton("Try drawing", "You can try and draw something with lamia", "lamiadraw")  # TODO
		addButton("Mute", "Ask if he's been mute since they were born")
		if lamia_affection > 2:
			addButton("Explicit", "You've noticed Lamia doesn't draw any explicit things, perhaps worth asking about it?", "lamiaexplicit")
		if lamia_affection > 6:
			addButton("Prison", "Ask Lamia how they ended up in the prison", "lamiaprison")
		else:
			addDisabledButton("Prison", "You don't feel like there is enough connection between you two to ask him that")
		if lamia_affection > 11:
			addButton("Favorite", "Ask Lamia what is their favorite thing to draw", "lamiafavorite")
		else:
			addDisabledButton("Favorite", "You don't feel like there is enough connection between you two to ask him that")
		if lamia_affection > 17:
			addButton("Draw", "Ask Lamia to draw something for you", "lamiadrawforme")
		else:
			addDisabledButton("Draw", "You don't feel like there is enough connection between you two to ask him to draw for you something")
		addButton("Back", "Do something else", "lamiamain")

	if state == "lamiaappearance":
		saynn("Lamia is very visibly a fox breed, their fur has very vivid and unusual orange/red pallette. Red mostly visible on their arms, tip of their tail and a little bit on their legs. To contrast that, their hair is painted in shades of blue. They are wearing a general block inmate uniform.")
		saynn("There are two slightly curved horns protruding from their head with black base and red endings.")
		addButton("Back", "Stop looking at fox-breed", "lamiamain")

	if state == "lamiaexplicit":
		saynn("[say=pc]I've noticed you haven't drawn any explicit scenes when I were helping you sort your artwork, you don't like drawing those? This prison seems like grounds ripe for this sort of scenes, if you needed inspiration.[/say]")
		saynn("Lamia shrugs, he starts drawing. At first a koala eating a bamboo shows up, a happy face drawn above it. Then he draws canine member and canine pussy with a stick figure doing shrug with their arms. What strikes you as odd is that even though Lamia doesn't seem to draw explicit scenes, their genitalia art is drawn with plenty of detail and effort.")
		saynn("[say=pc]Wow, that's pretty good, but I guess you kinda don't care much for those? Sex and all just doesn't do it for you, huh?[/say]")
		saynn("They nod in agreement.")
		saynn("[say=pc]I con respect that. You are a great artist, and you should draw whatever the fuck you want, that's the way to go.[/say]")
		saynn("You give them headpats.")
		addButton("Back", "Finish this conversation", "lamiamain")


func generate_artwork_desc(descriptors: Array):
	if descriptors.size() > 1 and RNG.randi_range(1, 6) < 3:
		match descriptors:
			[1, 2]:
				return RNG.pick(humanoids_animals_lamia_art)
			[1, 3]:
				return RNG.pick(humanoids_backgrounds_lamia_art)
			[2, 3]:
				return RNG.pick(animals_backgrounds_lamia_art)
			_:
				return RNG.pick(all_features_combined_lamia_art)
	else:
		var result = ""
		descriptors.shuffle()
		while descriptors.size() > 0:
			if result != "":
				result = result + ", "
			var feature = descriptors.pop_front()
			match feature:
				1:
					result = result + RNG.pick(humanoids_lamia_art)
				2:
					result = result + RNG.pick(animal_flora_lamia_art)
				3:
					result = result + RNG.pick(background_lamia_art)
				4:
					result = result + RNG.pick(other_lamia_art)
		return result


func verify_response(response: int):
	if artwork[0] == [1, 2, 3]:
		return response == 3
	elif artwork[0] == [1, 2]:
		return response == 1
	elif 1 in artwork[0]:
		return response == 1
	elif 2 in artwork[0]:
		return response == 2
	elif artwork[0] == [3]:
		return response == 3
	return response == 4

func markHiisiRewardAsAquired():
	var HiisiRPS = getModuleFlag("IssixModule", "Hissi_RPS_data", {})
	HiisiRPS["reward_acquired"] = true
	setModuleFlag("IssixModule", "Hissi_RPS_data", HiisiRPS)

func _react(_action: String, _args):
	if _action in ["blueboxlamia1", "redboxlamia2", "greenboxlamia3", "purpleboxlamia4"]:
		if verify_response(int(_action[-1])):
			arts_correct += 1
		arts_reviewed += 1
		if arts_reviewed >= 10:
			if arts_correct > 7:
				_action = "artminigamegoodend"
			else:
				_action = "artminigamebadend"
			GM.main.setModuleFlag("IssixModule", "Helped_Lamia_With_Drawings_Today", true)
		else:
			_action = "artminigame"

	if _action == "hiisireassure":
		increaseModuleFlag("IssixModule", "Hiisi_Affection", 5)
		setModuleFlag("IssixModule", "Hiisi_Name_Helped", true)

	if _action == "hiisiadvice":
		increaseModuleFlag("IssixModule", "Hiisi_Affection", -5)
		setModuleFlag("IssixModule", "Hiisi_Name_Helped", true)

	if _action == "hiisisilence":
		setModuleFlag("IssixModule", "Hiisi_Name_Helped", true)

	if _action == "hiisihypnono":
		markHiisiRewardAsAquired()
		setModuleFlag("IssixModule", "Hiisi_Put_Sabotaged_Headvisors", false)
		increaseModuleFlag("IssixModule", "Hiisi_Affection", -3)

	if _action == "hiisihypnoyes":
		markHiisiRewardAsAquired()
		GM.pc.addConsciousness(-0.6)
		GM.pc.inventory.forceEquipStoreOther(GM.pc.inventory.getItemsWithTag(ItemTag.Hypnovisor)[0])
		setModuleFlag("IssixModule", "Hiisi_Put_Sabotaged_Headvisors", true)
		increaseModuleFlag("IssixModule", "Hiisi_Affection", 3)

	if _action == "hiisihypnodone":
		processTime(20*60)
		GM.pc.inventory.unequipSlot(InventorySlot.Eyes)
		GM.pc.addConsciousness(1.0)

	if _action == "artminigamegoodend":
		increaseModuleFlag("IssixModule", "Lamia_Times_Helped")

	if _action == "artminigamebadend":
		increaseModuleFlag("IssixModule", "Lamia_Times_Helped", -1)

	if _action == "artminigame":
		# 1 - humanoids and items, 2 - feral animals and flora, 3 - backgrounds, 4 - others/electronic devices
		var art_rand = RNG.pickWeighted([[1], [2], [3], [4], [1, 2], [1, 3], [2, 3], [1, 2, 3]], [15, 15, 15, 5, 15, 15, 5, 4])
		artwork = [art_rand.duplicate(), generate_artwork_desc(art_rand), RNG.randi_range(1,151) == 50]  # Here Frisk learned about how Godot variables lifespan ends with the end of _react leaving a very empty array after this function ends. Gave me quite a lot of confusion, but was fun to debug I suppose, Python would track the reference to a variable, Godot doesn't, sad.

	if _action == "artminigameae":  # Don't reroll new artwork
		_action = "artminigame"

	if(_action == "catnip"):
		GM.pc.getInventory().removeXOfOrDestroy("CatnipPlant", 1)
		GM.main.getCharacter("azazel").addLust(10)
		GM.main.increaseModuleFlag("IssixModule", "Azazel_Affection_given")
	
	if _action == "hiisienergy":
		markHiisiRewardAsAquired()
		GM.pc.getInventory().addItem(GlobalRegistry.createItem("EnergyDrink"))
	
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
