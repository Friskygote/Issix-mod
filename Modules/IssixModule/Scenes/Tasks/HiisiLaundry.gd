extends SceneBase

const Globals = preload("res://Modules/IssixModule/Globals.gd")

var variations1 = ["You pick up a bucket as well as a few T-Shirts.", "You pick up a small basket inside of which there are many counts of used underwear, the entire pile gives a very musky smell.", "Today you only pick up a bottle with some kind of badly smelling fluid, some kind of detergent?", "Hiisi's basket is overflowing with things and two briefs have fallen from the basket pile, he asks you to help out which you do, picking the dropped briefs from the ground and placing them on top of the pile."]
var variations2 = ["The laundry at this time is empty. There aren't other inmates roaming around.", "There are a few creatures around the laundry, however they mind their own business.", "Two creatures stand at the furthest-from-entrance end of the laundry and chat, looking at anyone entering the room. Their look fills you with unease."]
var will_surprise = false


func _init():
	sceneID = "HiisiLaundryTask"

func _run():
	if(state == ""):
		saynn("You notice a basket with dirty clothes nearby.")

		saynn("[say=pc]Hey, Hiisi, do you plan to do laundry soon?[/say]")
		saynn("[say=hiisi]Hmm, I suppose. Want to help?[/say]")
		saynn("[say=pc]Yes![/say]")
		saynn("[say=hiisi]Aren't you a bit too excited? It's just laundry. *sigh* Whatever, come.[/say]")
		saynn("He points at things you are supposed to pick up and move while himself he picks up a large basket with clothes. "+RNG.pick(variations1))
		saynn("Having everything you both need, you head towards the laundry.")
		addButton("Continue", "Continue", "laundry")

	if state == "laundry":
		saynn("You both arrive at the laundry. "+(RNG.pick(variations2)) if !will_surprise else variations2[-1])
		saynn("Hiisi shows you where, how to put clothes as well as how to program machines for best results"+(", you can hear hushed voices in the back of the laundry" if will_surprise else "")+". It all kind of goes through your head. Hiisi starts the bulky machines one-by-one. They make a loud static noise as machines apply various methods of cleaning the clothes. From water based cleaning to laser cleaning and some other methods you don't recognize and which names of flash on the small and simple display. While waiting for machines to finish, you strike a small talk with Hiisi.")
		if getModuleFlag("IssixModule", "Hiisi_Affection", 0) < 20:
			saynn("[say=pc]Those machines look pretty old. Even the consumer grade stuff on medium-advanced planets have newer and faster laundry machines.[/say]")
			saynn("[say=hiisi]They get the job done. Don't think prison staff cares about anything more.[/say]")
			saynn("[say=pc]I suppose...[/say]")
			saynn("[say=hiisi]It doesn't take this long anyway.[/say]")
			saynn("You both stare at laundry machine finishing up the job, making beeping noise.")
		else:
			saynn("[say=pc]Any cool rumors you've overheard recently?[/say]")
			saynn("[say=hiisi]Hmmm... No, not really. Last few days were rather boring.[/say]")
			saynn("[say=pc]Really? Nothing? Bummer. I was hoping we could gossip a little while waiting for this boring junk to finish its job.[/say]")
			saynn("[say=hiisi]Come on, it doesn't take this long.[/say]")
			if will_surprise:
				saynn("Hiisi's ears perk up, you notice that he seems to be on guard for some reason, it's barely noticeable, and you only spot it because you've spent a while near Hiisi at this point to recognize his body language.")
			if GM.pc.getPersonality().getStat(PersonalityStat.Impatient) > 0:
				saynn("[say=pc]Not long? It takes aaaageeessss. Couldn't we just come back to the corner while it does its thing?[/say]")
				saynn("[say=hiisi]It's really not that long, you can't possibly be this impatient?[/say]")
				saynn("[say=pc]I'm not impatient, I'm just trying to save time![/say]")
				saynn("Hiisi sighs")
			else:
				saynn("[say=pc]I guess you are right. How much you think it will take still?[/say]")
				saynn("[say=hiisi]4 minutes give or take.[/say]")
				saynn("[say=pc]Doable.[/say]")

		addButton("Continue", "Continue", "laundrycontinued")

	if state == "laundryattack":

		saynn("Machine claims that it should be done in just a minute, you yawn, preparing yourself to start doing [i]something[/i] useful again. Out of nowhere something feels wrong, you've heard slight noise from your right - place you didn't look at for a bit, there were two creatures talked in hushed tones before, the noise you've heard feels really off. You look in the direction of the noise to see an object approaching your face fast.")
		addButtonWithChecks("Duck", "Duck!", "laundryattackducked", [], [[ButtonChecks.StatCheck, Stat.Agility, 20]])
		addButton("Stand", "Don't move", "laundryattacksuccess")


	if state == "laundryattackducked":
		saynn("You duck just in time before the object hits your face, shortly after two individuals come at you from the same direction as the thrown object which lands on the floor behind you with a plastic sound.")
		if GM.pc.getStat(Stat.Strength) > 20 or RNG.chance(20):
			saynn("Effortlessly you manage to handle the oncoming attack, thwarting it with aggressor relenting.")
		else:
			saynn("You struggle with the attack, yanking at each other until you separate.")
		saynn("Hiisi manages to floor the opponent that attacked them, his {hiisi.foot} steadily keep the aggressor to the ground. He looks your way to assess situation.")
		saynn("[say=hiisi]Let me help, keep this one.[/say]")
		saynn("He pulls {hiisi.foot} from inmate laying on the ground that you replace with your own {pc.foot}. He approaches the other inmate that you just fought with, inmate is redying their stance but not fast enough before Hiisi's fist runs over their face and knocks them out in one hit.")

		saynn("[say=pc]Woah...[/say]")

		saynn("[say=hiisi]You okey?[/say]")

		saynn("[say=pc]Yeah, I think...[/say]")

		saynn("[say=hiisi]Bunch of twerps, as usual. I've had an eye on them for a bit since we entered the laundry. They basically smelled of „no good” energy.[/say]")
		saynn("[say=pc]Will they be okey?[/say]")
		saynn("[say=hiisi]There is no reason for them not to be, they are just knocked out. This one however...[/say]")
		saynn("He grabs the inmate from under your {pc.foot} by the collar of their uniform, grabbed inmate looks indifferent but defeated.")
		saynn("[say=hiisi]Try that again and I'll make sure you are next fuckmeat in stocks.[/say]")

		saynn("Hiisi releases grip on the inmate who thumps to the ground.")
		saynn("[say=hiisi]It's finished, let's get it over with {pc.name}.[/say]")
		addButton("Continue", "Take the clothes off the laundry and finish here", "laundryend")

	if state == "laundryend":
		saynn("The process finally finishes and both of you open the doors of the laundry machines and pick up the clothing inside, putting them all back into the baskets. Clothing is already dry and doesn't have any folds, that's the industrial washing process for you.")
		saynn("[say=pc]Looks and smells good.[/say]")
		saynn("[say=hiisi]Mhm.[/say]")
		if will_surprise:
			saynn("The two inmates are still laying on the floor as you finish packing, one of them has opened eyes and looks at you as if waiting for you to leave.")

		saynn("[say=hiisi]We got everything, let's go.[/say]")
		saynn("You follow Hiisi with bunch of stuff back to the corner. Thankfully it's a short walk.")

		saynn("[say=hiisi]Place it there, I'll sort it, no worries. Thanks for the help.[/say]")
		saynn("[say=pc]Sure, always happy to help.[/say]")
		saynn("[say=issix]Good {pc.boy}.[/say]")
		saynn("He says as he ruffles your "+("hair" if GM.pc.hasHair() else "fur")+".")
		addButton("Task complete", "You've completed the task", "endthescene")

	if state == "laundryattacksuccess":
		saynn("The object hits you straight in face leaving you in pain and confusion. You are unsure what hit you, though judging by texture, and weight of what hit you you can sayy it was likely plastic. There is commotion around you, and among ringing sound in your ears you feel punches violating your body.")

		saynn("Vision eventually clears, what you see are two other inmates laying with their backs to the ground.")
		saynn("You look at yourself, there is blood coming from your nose and you feel in pain both on your face as well as your torso.")
		saynn("[say=pc]I... No, not really.[/say]")
		saynn("[say=hiisi]Darn, we will patch you up in the corner. Let's go.[/say]")
		saynn("[say=pc]What about laundry?[/say]")
		saynn("[say=hiisi]Doesn't matter, I'll get it later.[/say]")
		addButton("Come back", "Come back to the harem", "comeback")

	if state == "comeback":
		saynn("You take Hiisi's paw and walk from the laundry to the corner.")

		saynn("[say=pc]So, do you know the two?[/say]")
		saynn("[say=hiisi]They are new here, just some ruffians who didn't know any better.[/say]")
		saynn("[say=pc]What did they even wanted from us?[/say]")
		saynn("[say=hiisi]Who the hell knows. they were reds, they don't need a reason to attack someone.[/say]")
		saynn("[say=pc]You are red too...[/say]")
		saynn("[say=hiisi]Have you seen me attack anyone not in an act of defense?[/say]")
		saynn("[say=pc]No.[/say]")
		saynn("[say=hiisi]There you have it.[/say]")
		saynn("Your short walk ends as you arrive at the harem. Hiisi take a few things from the first aid kit. Your Master looks at you.")
		saynn("[say=issix]Nothing serious, I assume?[/say]")
		saynn("[say=pc]Nah, just a-[/say]")
		saynn("[say=hiisi]He is bruised but fine. Two newbies attacked us at the shower.[/say]")
		saynn("[say=issix]I see, what about you?[/say]")
		saynn("[say=hiisi]I'm fine, Master. They sucked at throwing punches as much as they sucked at thinking.[/say]")
		saynn("[say=issix]Understood[/say]")
		saynn("Issix shifts his focus back to his other tasks while Hiisi applies some kind of gel to places you were bruised at, it stings for few seconds before giving in to coldness.")
		saynn("[say=hiisi]Should be fine soon. Disinfected, this should get you better quick. I'll get the laundry, thanks for all the help, stay here and take it easy for a while, okey? [/say]")
		saynn("[say=pc]Sure you don't need help taking it all back? It was more than one person can take.[/say]")
		saynn("[say=hiisi]It's okey, I'll just do two rounds. See ya.[/say]")
		saynn("He leaves.")
		addButton("Task complete", "You've completed the task", "endthescene")


func _react(_action: String, _args):
	if _action == "laundrycontinued":
		if will_surprise:
			_action = "laundryattack"
		else:
			_action = "laundryend"
		processTime(15*60)

	if _action == "comeback":
		processTime(10*60)
		GM.pc.addPain(-30)

	if _action == "laundryend":
		processTime(10*60)

	if _action == "laundryattacksuccess":
		GM.pc.addPain(50)

	if _action == "laundryattackducked":
		GM.pc.addPain(5)

	if _action == "laundry":
		if RNG.chance(20):
			will_surprise = true
		processTime(5*60)

	if(_action == "endthescene"):
		Globals.addIssixMood(3)
		setModuleFlag("IssixModule", "Did_Task_Today", true)
		addMessage("Issix's mood has improved")
		endScene()
		return

	setState(_action)
