extends SceneBase

func _init():
	sceneID = "IssixBringsComicbooks"

func _run():
	if(state == ""):
		playAnimation(StageScene.Duo, "kneel", {npc="issix", npcAction="stand"})
		saynn("When you approach the corner today you can see all of pets engaged in intense reading of something, each one of them holding a small booklet with colorful characters on the covers.")
		saynn("[say=pc]What's up? What are you reading there?[/say]")
		saynn("[say=azazel]Comic books. we have a few super hero, some horror and some drama ones.[/say]")
		saynn("[say=pc]Huh, they look very oldschool, aren't most digital now?[/say]")
		saynn("[say=azazel]They are, those are veeery old, even so, they still provide some entertainment value. Do you want to see?[/say]")
		saynn("[say=pc]Of course![/say]")
		saynn("Azazel grabs one book laying around in his paw and extends it towards you. You take it and look at it, the cover shows an upside down dark anthopomorphic bat with closed eyes and long fangs, the title on the cover is „Bloody Hell” in the kind of font that you'd expect from a book of this genre, rather horror looking like.")
		addButton("Open", "Start reading the book", "bookreading")

	if state == "bookreading":
		saynn("You start to read the provided book, page by page the story describes events that took place in a small village of name Baranowo, where the villagers were one-by-one disappearing every specific night of the year. So far, 4 villagers have disappeared in mysterious circumstances, which prompted the village elder to gather enough of coins to hire a detective from the city to solve the case. Comic first shows the perspective of a detective from nearby city hired to investigate the disappearances, who arrived just before the fatal night, he listens to the villagers explaining the situation in great detail. Readers quickly learn of detective's methods and get glimpses of his previous cases which paint him as a really good detective. The fateful night detective is hard at work being village's faithful eye, looking out for cause or perpetrator of disappearances, ultimately however, he fails. Next morning a female villager named Eliza is found to be missing. Detective immediately begins to investigate, finding clues in Eliza's home. The book ends with him finding a vital clues - a few drops of dizzying liquid in the rug as well as a little bit of fur, that couldn't have been shed by the Eliza.")
		saynn("You close the comic.")
		addButton("Part 2", "Ask Azazel if there is a second part to this book", "secondpart")
		addButton("Meh", "Not interested in another book, you ask Azazel if there is a different one", "differentbook")
		addButton("Nope", "Comic books don't interest you much, you will not entertain reading another", "endthescene")
		# His thorough investigation of disappearance of yet another villager during the night leads him to a a little bit distant cave, where he discovers all of the villagers alive and well, thralls to the anthropomorphic bat they worship. The end of the book

	if state == "secondpart":
		saynn("[say=pc]Hey, Azazel, does this one have a second part?[/say]")
		saynn("[say=azazel]Hah, interested? „Bloody Hell” hmm, I don't remember reading this one before, and I don't believe I've seen another part in today's pile. It often happens that the other parts come in other drops of those. So perhaps wait for the future drop. Master brings us those fairly regularly every 7 days or so, if your are lucky it may have next part of that series.[/say]")
		addButton("Back", "Wait for the second part", "endthescene")
		if (GM.pc.getPersonality().getStat(PersonalityStat.Impatient) > 0.3):
			saynn("[say=pc]I want it now thoouughh, I cannot wait to see how the story develops![/say]")
			saynn("[say=azazel]I feel you {pc.name}, I feel you. Can't do much about that though, sorry. You might ask Master about it but there is little chance he can help you either.[/say]")
			saynn("[say=pc]There must be a way![/say]")
			saynn("[say=azazel]You are all over that one I see haha. Cool to see you enjoy them.[/say]")
			saynn("[say=pc]It's really good, and it ended on a cliff hanger (kind of, maybe).[/say]")
			saynn("[say=azazel]I feel like most of those do, it was a detective story wasn't it? Yeah, they tend to do that.[/say]")
			addButton("Issix", "Ask issix about the second part", "issixask")
		else:
			saynn("[say=pc]I see, guess I'll wait then. Thanks, Azazel.[/say]")
			saynn("[say=azazel]Of course, no problem cutie.[/say]")

	if state == "differentbook":
		saynn("[say=pc]Are there any other books I could read?[/say]")
		saynn("[say=azazel]Yeah, of course, there are still "+ str(getModuleFlag("IssixModule", "Comic_Books", 0))+" other books. Feel free to check them out whenever.[/say]")
		saynn("[say=pc]Thanks Az[/say]")
		saynn("You headpat the feline, they purr in appreciation.")
		addButton("Back", "Nothing to do but wait", "endthescene")

	if state == "issixask":
		saynn("[say=pc]Master, Master, do you know anything about this series?[/say]")
		saynn("You show him the cover of „Bloody Hell”. He takes it, studies it and thinks for a second.")
		saynn("[say=issix]No, I'm afraid not, what about it, pet?[/say]")
		saynn("[say=pc]I've read the first book and wondered if you know anything about the second part, or if you've seen it, or have it or or...[/say]")
		saynn("[say=issix]Calm down, pet. I understand. Sadly, I have to disappoint you, I don't know anything of this series, nor I remember seeing other parts. Perhaps in the future I'll find one. You'll have to be a bit more patient, okey?[/say]")
		saynn("[say=pc]Awww, okey Master, thank you.[/say]")
		saynn("Master kisses you on your forehead as you accept the fact you'll have to wait to see if there are more parts of the series you can check out.")
		addButton("Back", "Nothing to do but wait", "endthescene")



func _react(_action: String, _args):
	if _action == "issixask":
		processTime(2*60)

	if _action == "bookreading":
		increaseModuleFlag("IssixModule", "Pet_Time_Interaction_Today", 30*60)
		processTime(30*60)
		increaseModuleFlag("IssixModule", "Comic_Books", -1)
		setModuleFlag("IssixModule", "Comic_Book_Unlocked", true)

	if(_action == "endthescene"):
		var scenes = GM.main.getModuleFlag("IssixModule", "Misc_Slavery_Info", {"scenes_seen": []})
		scenes["scenes_seen"].append(sceneID)
		GM.main.setModuleFlag("IssixModule", "Misc_Slavery_Info", scenes.duplicate(true))
		setModuleFlag("IssixModule", "Progression_Day_Next", GM.main.getDays()+3)
		GM.pc.addSkillExperience("Pet", 60)
		endScene()
		return

	setState(_action)
