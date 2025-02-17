extends SceneBase

const Globals = preload("res://Modules/IssixModule/Globals.gd")

func _init():
	sceneID = "IssixSlaveryCommandTraining"

func _run():
	if(state == ""):
		playAnimation(StageScene.Duo, "kneel", {npc="issix", npcAction="stand"})
		# CON
		saynn("[say=pc]Master, I'd like to learn something new, to be a better pet for you.[/say]")
		saynn("[say=issix]Something new? I hope you understand that you are great just the way you are, my pet.[/say]")
		saynn("[say=pc]Yes, of course, but what could I learn to serve you even better? I don't want to stop [/say]")
		saynn("[say=issix][b]Lay[/b] on your front then, pet.[/say]")
		saynn("You do as you are told.")
		saynn("[say=issix]Fine then, there is something we can work on. You see, you did comply with my request, however it was a conscious action on your part, you processed what I've said and acted accordingly. I could see this in your movement, there was a brief amount of time where you were looking at me after I exclaimed my wish. Normally that's what I expect of my pets, but if you want to be a better pet we can turn that conscious decision into one that you do without even thinking about it - an unconscious decision that you'll have no actual say in doing.[/say]")
		saynn("[say=pc]Is that even possible, Master?[/say]")
		saynn("[say=issix]Of course it is "+Globals.getPlayerPetName()+". Brains are just a bunch of matter that can be reprogrammed, organic or not. That said, it's up to you if you really want this. This isn't entirely without a consequence.[/say]")
		saynn("[say=pc]Oh? What's the consequence, Master?[/say]")
		saynn("[say=issix]You can program mind to react to commands without thinking, but once you achieve that, the command is stuck in your little brain there. If others know the command they can use it too, it doesn't work for just me, your Master. So you'd be additionally vulnerable to advances from others.[/say]")
		saynn("[say=pc]I see...[/say]")
		saynn("[say=issix]If you ask me, I don't mind this. No other inmate can touch you anyways.[/say]")
		addButton("Accept", "Proceed with training for commands (makes your more vulnerable in the future)", "accept_training")
		addButton("Refuse", "Refuse training for commands", "refuse_training")
		# NONCON TODO

	if state == "refuse_training":
		saynn("[say=pc]I don't think I'm up for that, sorry Master.[/say]")
		saynn("[say=issix]It's entirely okey, this is a choice you have and I won't make you go with it against your own will. There are things I'm mostly ambivalent about, and this being one of them earns you a right to say no.[/say]")
		addButton("Thank", "Thank your Master (end the conversation)", "endthescene")

	if state == "accept_training":
		saynn("[say=pc]I understand, in this case I'd love you to teach me tricks, Master.[/say]")
		saynn("[say=issix]Perfect, I'll make my obedient little pet be a good, clever puppy for me soon enough.[/say]")
		saynn("He says chucking at the end.")
		saynn("[say=issix]I don't have my training tools in here, we'll have to go back to my cell, be a good pet and show me your neck.[/say]")
		saynn("You move your head backwards and allow your Master easy access to the collar. He attaches a leash with satisfying click.")
		saynn("[say=issix]Good. Hiisi, this will take a while, if anyone wants me I'll be in my cell.[/say]")
		saynn("[say=hiisi]Of course, Master. Understood.[/say]")
		saynn("[say=issix]Now we can go.[/say]")
		saynn("Issix pulls on the leash attached to your neck and you follow him.")
		addButton("Follow", "Follow your Master", "follow_to_cell")

	if state == "follow_to_cell":
		saynn("You follow your Master to his own cell. One the way a rude guard bumped pretty hard into you while going in direction opposite to yours, Your master noticed because you lost your balance making the leash pull Master's paw backwards. After making sure everything is okey, Your Master continued walking and you behind him, led on a leash.")

		saynn("You are back at the crampy cell of your Master. Little space there is doesn't afford you much comfort, you are just standing almost in the entrance, in the inner part of the cell.")
		saynn("[say=issix]You can sit here.[/say]")
		saynn("Master points at the floor. There is a brief moment of confusion in your eyes, as there is nothing to sit on there, no chair, no expensive looking sofas like the ones in the halls of cell blocks. The reality quickly sets in your mind, your Master told you to sit on the floor because you are a pet, after all. Pets don't sit on chair, their place is on the floor.")
		saynn("You nod and sit on the cold floor below you. Master opens his stash and browses its contents while you look around his cell again. It didn't change much since you were last there - on your branding day. It still largely serves just as sleep place for your Master, despite this the place looks clean and tidy, the bed is made, there is no trash laying around as you've seen in some other cells. Your Master does like things organized, which only makes sense considering his position.")
		saynn("[say=issix]Here they are, pretty deep considering it hasn't been long, oh well.[/say]")
		saynn("Issix turns around holding a rectangular box, you notice a bunch of labels on the side written in language you can't read. Ornate orange shapes decorate the mostly back box.")

		saynn("[say=issix]This, my dear pet is a full training kit I've acquired before I arrived in here. It has all we need for today.[/say]")
		addButton("He opens", "Issix opens the box", "opening_box")

	if state == "opening_box":
		saynn("Master Issix opens the box, he is standing so you can't see the contents, he does however take a few items from the box into his paws, closing the box and putting it aside on a shelf attached to the wall.")
		saynn("[say=issix]Training brain to certain commands can be done in multiple ways, in the past creatures did it by repeating commands and rewarding compliance, as well as punishing misbehavior. Centauries later the vast majority of methods to do this kind of training continue to use the same elements - repetition and reward. Do you know why?[/say]")
		saynn("[say=pc]I do not, Master.[/say]")
		saynn("[say=issix]It's because they work, of course. What we want to achieve is so the synapses in your brain form strong pathways associating commands with actions. We want this to be so deep ingrained in you that you do it without question. There are certain other actions you do without thinking - breathing, blinking, using muscles. There are also other instincts we hold - such as survival instincts, more complex actions we take without thinking too much about them.[/say]")
		saynn("[say=issix]Technology came a long way, so we no longer need to train processing commands the same way like we did in the past, however technological wonder ranges from training aids that only make this process a little bit easier to fully-fledged brain fryers that skip entire process and assert the will of the operator. What I have here are simple aids, meant to speed it all up. They rely on feeding information into auditory and visual systems to make learning process much faster.[/say]")
		saynn("You grow a little concerned by the explanation and shape of the items Issix holds, which your Master sees from your face expression.")
		saynn("[say=issix]Do not fret, those are more or less simple ear pieces they feed you nothing else other than sounds.[/say]")
		saynn("He kneels and passes to you two small, round pieces. There is no wire to be seen, they are wireless, you look at them, studying their shape. Their color is not special in any way - a dark grey, they really do like like standard earpieces. After finishing studying them, Master takes them back from your paws and puts them inside of your ears.")
		saynn("[say=issix]And they are in, can you hear me fine?[/say]")
		saynn("[say=pc]Yes, Master.[/say]")
		saynn("[say=issix]Perfect. one of four is in place.[/say]")
		addButton("Another one", "Master shows you another item", "next_item")

	if state == "next_item":
		saynn("[say=issix]Now this is a crux of entire operation you see, it goes on your head and it analyzes impulses inside of your brain. It feeds the information into central device which in turn- Ahh, why do I bother, you don't really care about technical explanation, do you?[/say]")
		saynn("You shrug")
		saynn("[say=issix]I'll just say, this theory behind this entire training kit is extremely cool. Basically it self-improves in showing you the appropriate auditory and visual stimuli that best fits the learning process.[/say]")
		saynn("Issix fixes the device upon your "+GM.pc.getBodypart(BodypartSlot.Head).getName()+". The metal points of the circular material feel fairly heavy and give you a small discomfort. You aren't sure how the device feels affixed to your head, however it doesn't seem to slide off it"+(" despite being on your hair." if GM.pc.hasHair() else "."))
		# if GM.pc.hasAnus(): TODO
		saynn("[say=issix]Looks good. Since it only gathers data, you won't feel anything from it, hopefully. Now, the next one may seem simple and known to you, however I advise you don't treat it as such.[/say]")
		saynn("Issix's paws reveal to you a butt plug, or at least an item that looks like one.")
		saynn("[say=issix]I know it looks like a butt plug, and it serves [i]mostly[/i] the same function. It will be your reward system for the training, the carrot on a stick - if you will. It will help you create positive association for completing commands, present to me, pet.[/say]")
		saynn("You quickly understand what is expected of you and turn around.")
		if GM.pc.getInventory().hasSlotEquipped(InventorySlot.UnderwearBottom) or GM.pc.getInventory().hasSlotEquipped(InventorySlot.Body):
			saynn("Your Master displaces your clothes.")
		if GM.pc.getInventory().hasSlotEquipped(InventorySlot.Anal):
			saynn("[say=issix]Ah, what is this doing here, let me just pull it out for the training.[/say]")
			saynn("Issix pulls out "+GM.pc.getInventory().getEquippedItem(InventorySlot.Anal).getVisibleName()+" out of your ass and replaces it with his device.")
		else:
			saynn("[say=issix]Master Issix puts the device into your ass.[/say]")

		saynn("[say=pc]Yip![/say]")
		saynn("The device slides more or less effortlessly, at first it doesn't feel any different from other butt add-ons, however the story quickly changes seconds after the device is fully inserted inside.")
		saynn("[say=issix]It might feel funny at first, yes. It's getting „connected” with you. You will know when its done when you feel pleasure for a shirt second.[/say]")
		saynn("You can't even tell what you are feeling, those are not vibrations you expected, the device almost feels alive - full of intent, your internals feel as if they were almost merging with it. Eventually, the strange feeling gives its way for jolt of pleasure that reverberates through your body making you whimper like a horny bunny in "+("a heat" if GM.pc.hasAnyWomb() else "a rut")+", feeling quickly subsides, you look at your Master who is amused by your reaction.")
		saynn("[say=issix]Done now? Hehe. Your face looked really funny.[/say]")
		saynn("[say=pc]Y-yes, thank you Master.[/say]")

		saynn("[say=issix]Good, now for the final piece, it's yet another visor. This one however, is synced with the rest of the system.[/say]")

		saynn("He puts on the visors on your face, what you see after putting it on though surprises you. It's the same cell you are in but filtered through some kind of filter, instead of Issix's bed you see a... Crib? A large pastel colored crib above which there are hanging toys. You take a look at your Master, who looks like an imposing dragon even more so than before, it also feels like the floor is closer to your head now, making you feel incredibly small.")
		saynn("[say=issix]*ekhem* Sorry, the system had wrong preset, should be better now.[/say]")
		saynn("Everything you previously saw disappears, and your height seems increased, even if still feels oddly wrong. You look around once more. The entrance to the cell behind you that in part is made out of metal bars is now full solid red no entry sign, signifying no enter zone for you. If you felt confined within the tiny cell already, it feels even more claustrophobic now.")
		saynn("[say=issix]Take a minute to get used to everything in here, I'll calibrate the main unit.[/say]")
		addButton("Continue", "Continue", "training")

	if state == "training":
		saynn("As your Master is calibrating you can't get rid of a tingling feeling on your head, you put your paw on your head and touch around the place where the small device was put on, it helps a little with getting rid of strange feeling. Moments later a white noise begins to fill your ears, the sounds of prison, the buzzing of light and any small movement is drowned by the droning white noise. A worry hits you, if there is white noise, how are you going to hear commands? Master is going to give you commands, right? You take a quick look at your Master, the imposing figure fiddling with the something, trying things into a small device with a mini monitor, before he returns a look.")
		saynn("[say=issix]It's okey, you can still hear me.[/say]")
		saynn("Words of your Master - clear as a day - fed directly into your ears melt any worry you've had about not hearing your Master.")
		saynn("[say=issix]I'm done here. We are going to start now. I expect you to follow my every command to best of your abilities. I want you to do this as fast as you can. I want you to read my mind and know what is expected of you even before I say a word. And now... [b]On fours[/b].[/say]")
		saynn("You follow the command, and from sitting position you stand on your knees and front paws, the correct reaction is rewarded with a click sound inside of your ears as well as a small - but pleasurable ping in your ass.")
		addButton("„Stand”", "Your Master gives you another order", "stand_up")

	if state == "stand_up":
		saynn("[say=issix][b]Stand up[/b].[/say]")
		saynn("Once again, you follow the order, this time also putting more effort into doing it quicker. You continue looking at your Master, his face neutral as he gives you commands. After you stood up - you immediately hear a clicking sound and pleasure spreads from within your butt, this time it felt stronger than before, does it depend on your timing?")
		addButton("Sit", "Follow Master's command", "sit")

	if state == "sit":
		saynn("[say=issix][b]Sit[/b].[/say]")
		saynn("And so you do, trying to keep up the pace. Once again the same happens - a click and pleasure.")
		saynn("This continues for the next... You don't really know, you are lost in time. All you do is look at your Master and follow his every command, shortly after you started your training your pace increased, and you yourself noticed just how swifter your reaction to a command is, it's not automatic just yet, but whatever your Master says is immediately followed by you doing what you are told, the time you'd otherwise spend questioning the order is gone. It's not needed anymore, as the commands from your Master are final and absolute. The pleasure you feel from fulfilling the commands increases as your reaction time increases. The incentive for following every command as quickly as possible becomes your entire world now, the pleasure broke your composure a few times during training, breaking you into a whimpering mess, but ultimately there was no time for „you”, what mattered was fulfilling Master's order, and that's it.")
		saynn("[say=issix][b]Roll[/b][/say]")
		saynn("You attempt to roll, only to roll only a little bit due to constrained space. Regardless, you've been rewarded with your dopamine rush coming from the clicking sound as well as pleasure in the ass.")

		saynn("Some time later you notice that your reactions are slowed, you don't get as much of pleasure as you hoped for. There is a very clear reason for your increasingly poorer performance though - after an eternity of following commands the exhaustion finally caught up with you and moving around became a real chore, where the ppleasure from commands stopped being as rewarding as it was at the start.")
		saynn("[say=issix][b]Good {pc.boy}[/b].[/say]")
		saynn("The moment your Master finishes the last word, the device in your butt gives you the biggest dose of plasure yet, it fills your entire body, makes you feel warm and drolly happy, you are laying on the floor, consumed by bliss, unable to do anything other than lay and enjoy.")
		if GM.pc.hasPenis():
			if GM.pc.hasReachablePenis():
				saynn("Your {pc.penisDesc} {pc.penis} is not spared from the wave of pleasure, it immediately went into overdrive, which makes you react in only way you feel appropriate - by giving it a helping paw and finishing the job.")
			else:
				saynn("Your caged {pc.penis} is not spared from the wave of pleasure, it immediately went into overdrive. Out of all moments, this one quickly turns into a torture, as the relief feels so close, and yet is denied by the "+GM.pc.getWornChastityCage().getVisibleName().to_lower()+". What was supposed to be pleasure, turns into biggest letdown of entire training.")
		elif GM.pc.hasVagina():
			if GM.pc.hasReachableVagina():
				saynn("Your {pc.vagina} is not spared from wave of pleasure overtaking your body, giving you one of the most mindnumbing orgasms you've yet had the pleasure to experience.")
			else:
				saynn("Your {pc.vagina} is not spared from wave of pleasure overtaking your body, however the chasity on your vagina successfully prevents you from giving the orgasm its finish, making you feel incredibly frustrated and let down by what was supposed to be a climax of entire training session.")

		saynn("[say=issix]We will end it here for today. Training is best applied to a ready body, we've done enough today. You are progressing very well. Tomorrow we continue and finish the job, okey?[/say]")
		saynn("[say=pc]Y-ye-yes Master. I-I'll be b-baaack.[/say]")
		saynn("[say=issix]Perfect. Let me just retrieve devices.[/say]")
		saynn("Issix's retrieval of his training tools doesn't take long, you are squirming on the floor so he takes advantage of your numbed state. Taking off the „butt plug” gave you the last jolt of pleasure.")





func _react(_action: String, _args):
	processTime(2*60)
	if _action == "sit":
		processTime(70*60)
		if GM.pc.hasPenis():
			if GM.pc.hasReachablePenis():
				GM.pc.addLust(-100)
			else:
				GM.pc.addLust(100)
		elif GM.pc.hasVagina():
			if GM.pc.hasReachableVagina():
				GM.pc.addLust(-100)
			else:
				GM.pc.addLust(100)

	if _action == "stand_up":
		GM.pc.addLust(30)

	if _action == "training":
		GM.pc.addLust(10)

	if _action == "finish":
		increaseModuleFlag("IssixModule", "PC_Training_Level")
		GM.pc.addSkillExperience("Pet", 200)
		GM.pc.getSkillsHolder().addPerk("Commands")
		setModuleFlag("IssixModule", "Taught_To_Be_Commanded", true)


	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
