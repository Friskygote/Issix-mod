extends SceneBase

func _init():
	sceneID = "IssixSlaveryIntroCont"

func _run():
	if(state == ""):
		playAnimation(StageScene.Duo, "kneel", {npc="issix", npcAction="stand"})
		saynn("As you approach the corner your Master stands, grinning. You assume your position on your blanket.")
		saynn("[say=issix]Good day, pet.[/say]")
		if(OPTIONS.isContentEnabled(ContentType.Watersports)):
			if GM.pc.getFluids().hasFluidTypeWithCharID("Piss", "issix"):
				saynn("[say=issix]My my. My piss slut came back and {pc.he} is still smelling like myself. Good job.[/say]")
				saynn("He leans down and pets your head. You yip in appreciation.")  # TODO Yip/meow/bark
				saynn("[say=issix]Since you are such a good pet, today I'd like to train you a little. Are you ready?[/say]")
			else:
				saynn("[say=issix]You don't smell like me, what happened? Someone woke you up with a water bucket on your head? That's not great. It was your first order as my pet and you blew it. I'm incredibly disappointed.[/say]")
				saynn("A look of disappointment is on Masters's face. He expected you to still have his mark from yesterday.")
				saynn("[say=issix]I'm not going to punish you, but I'm also not going to reward you either.[/say]")
				saynn("He clips a leash to your collar.")
				saynn("[say=issix]On your back.[/say]")
				saynn("You obediently lie on your back, unsure what to expect. Master takes your blanket and without further comment starts relieving himself above you. His hot piss hitting your belly. He doesn't drench you in piss like the last time. Rather just leaving enough for anyone nearby to smell him on you.")
				saynn("[say=issix]I expect you to stay here one hour, I'm not going to give you a reward.[/say]")
		else:
			setModuleFlag("IssixModule", "Progression_Day_Next", GM.main.getDays()+3)
			saynn("[say=issix]I'm glad to see you. Are you ready for your first day of training?[/say]")
		addButton("Yes", "You are ready for the training", "training1")

	if state == "training1":
		playAnimation(StageScene.Duo, "kneel", {npc="issix", npcAction="stand", bodyState={leashedBy="issix"}})
		saynn("[say=issix]Excellent. In that case we will do a bit more of what we've already done in the past - I'm going to walk my pet. This is not only to train you to get used to this, but also I want other inmates to see you, walking behind on my leash.[/say]")
		saynn("He attaches his leash to your collar")
		saynn("[say=issix]Now, I expect you to keep up, go at my pace and when I stop - stop as well. Focus on me, not on other inmates. Do you understand? Yes? Good. Let's go. Azazel - will be only 5 minutes.[/say]")
		addButton("Walk", "Go on a walk with your Master", "walkies1")

	if state == "walkies1":
		aimCamera("gym_entrance")
		saynn("Issix stops")
		saynn("[say=issix]So far so good. You've been doing an ok job so far. Seems like some inmates definitely saw you. That's good.[/say]")
		saynn("[say=issix]Do you come here often? The Gym, I mean. Not a terrible place in this institution, minus the bullies. I can't see them right now, but I really hope they get the hint. I've had to persuade them not to touch my pets when they need some exercises. If you ever have an issue with them, just mention my name.[/say]")
		addButton("Yes", "You've are a regular in here", "walkiesgymyes")
		addButton("No", "You are not a regular in here", "walkiesgymno")

	if state == "walkiesgymyes":
		saynn("[say=issix]I see. Well, again, if bullies are ever an issue let me know. I'm always happy to know my pets are keeping in shape.[/say]")
		addButton("Continue", "Continue the walk", "walkies2")

	if state == "walkiesgymno":
		saynn("[say=issix]I see. Well, again, if bullies are ever an issue let me know. Perhaps though you should visit the gym from time to time. It's pretty good for your health, and healthy pet is a good pet[/say]")
		addButton("Continue", "Continue the walk", "walkies2")

	if state == "walkies2":
		saynn("[say=issix]Alright. That was short but meaningful. We will have more of those walks in the future, so get used to them. You can crawl on your own as an exercise if you want.[/say]")
		saynn("[say=pc]Thank you, Master![/say]")
		saynn("He smiles and unclips your leash.")
		addButton("End", "End today's training", "endthescene")


func _react(_action: String, _args):

	if _action == "training1":
		var scenes = GM.main.getModuleFlag("IssixModule", "Misc_Slavery_Info", {"scenes_seen": []})
		scenes["scenes_seen"].append(sceneID)
		GM.main.setModuleFlag("IssixModule", "Misc_Slavery_Info", scenes.duplicate(true))
		if(OPTIONS.isContentEnabled(ContentType.Watersports)):
			if GM.pc.getFluids().hasFluidTypeWithCharID("Piss", "issix") == false:
				GM.pc.cummedOnBy("issix", FluidSource.Pissing, 0.4)
				setModuleFlag("IssixModule", "Progression_Day_Next", GM.main.getDays()+5)
			else:
				setModuleFlag("IssixModule", "Progression_Day_Next", GM.main.getDays()+2)
		GM.pc.getSkillsHolder().addPerk("PetWalkies")

	if _action == "walkies2":
		processTime(4*60)
		# runScene("ParadedOnALeashScene", ["issix", GM.pc.getLocation(), "gym_entrance", [
		# 	"Good job, keep it up",
		# 	"Eyes on me, pet",
		# 	"Watch the pace, pet",
		# ], "hall_ne_corner", "crawl"])

	if(_action == "walkies1"):
		processTime(4*60)
		runScene("ParadedOnALeashScene", ["issix", GM.pc.getLocation(), "gym_entrance", [
			"Good job, keep it up",
			"Eyes on me, pet",
			"Watch the pace, pet",
		], "gym_entrance", "crawl"])

	if(_action == "endthescene"):
		increaseModuleFlag("IssixModule", "Progression_Points")
		increaseModuleFlag("IssixModule", "PC_Training_Level")
		endScene()
		return

	setState(_action)
