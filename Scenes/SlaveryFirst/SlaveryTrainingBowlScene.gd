extends SceneBase

func _init():
	sceneID = "IssixSlaveryBowlTraing"

func _run():
	if(state == ""):
		playAnimation(StageScene.Duo, "kneel", {npc="issix", npcAction="stand"})
		saynn("[say=issix]Are you hungry perhaps today, pet?[/say]")
		saynn("He looks at you with his smile you know so well at this point.")
		# warning-ignore:integer_division
		if (GM.pc.getStamina() / GM.pc.getMaxStamina()) < 0.8:
			saynn("[say=issix]You do seem to be a little beaten up, that's great, because today I expect you to re-learn how you are supposed to eat.[/say]")
		else:
			saynn("[say=issix]Doesn't seem like you need much food, but no matter. Today I'll teach you how I expect you to eat from now on.[/say]")
		saynn("[say=issix]I'm sure you are used to eating food given to you on a plate. This is how anthros eat. But as you must have noticed - my pets don't eat like this. So from now on I'd want you to learn how to eat like a pet. From a bowl.[/say]")
		saynn("He grabs a bowl. It looks like a very standard pet bowl, with the lowered ridge. On one side of it your name displayed. At the bottom of the empty bowl there is a pawprint symbol.")
		saynn("[say=issix]Hope you like it. This one is yours.[/say]")
		saynn("Similarly to every other pet's bowl, he puts yours on the edge of the blanket that is closest to him. You only now notice how his foot paws are surprisingly close to the bowls from which his pets eat.")
		saynn("[say=issix]Let's see what do we have for you today...[/say]")
		saynn("He browses his bag")
		saynn("[say=issix]Oh, a treat! Hmm. Perhaps not. First I'd want to look how well you can eat from the bowl... Okey, here it is.[/say]")
		saynn("He pours from the container he grabbed from the bag some kind of shredded gelatinous irregularly sized chunks with some more opaque fragments of something into your bowl. It's hard to say what it is, it doesn't give any smell, really.")
		saynn("[say=issix]Don't give it that look, try it. It's a little bit better than what's in canteen, though don't expect luxury.[/say]")
		saynn("At first your instinct is to use your paws, but you remember you are just a pet now, that's now how pets eat nor what your Master expects of you. Your muzzle lowers to the bowl and you run your tongue over one of the chunks for initial taste. It feels a little salty, definitely watery with a touch of something you can't really put your finger on. Under close watch of your Master you start lapping your tongue over the food and properly biting into it. As your Master said, it's better than canteen paste but you wouldn't call it a great food either.")
		saynn("[say=issix]So, how is it? Do you like what your Master feeds you?[/say]")
		addButton("Yes", "Nod your head in approval, you feel like shaking your head would offend your Master", "yesfood")
		addButton("No", "Shake your head in disapproval", "nofood")

	if state == "yesfood":
		saynn("You nod your head in approval of your food your Master shared with you.")

		saynn("[say=issix]Very good. That's exactly what I hoped to hear.[/say]")
		saynn("He pets your head gently. Then proceeds to pour the same in bowls of his other pets, each one of them getting very similar amount of food that has been given to you.  Each one of the other pets thanks their Master for the meal.")
		saynn("[say=azazel]Thank you Master![/say]")
		saynn("[say=hiisi]Thank you Master.[/say]")
		saynn("Lamia gives his smile alongside with a distinct ear movement that can only possibly mean ”thank you”.")
		saynn("You eventually finish your own meal, licking your plate clean as if to show appreciation to your Master.")
		saynn("[say=issix]Good good. Do not let the food go to waste. Good pets deserve a reward.[/say]")
		saynn("He pulls out a box with something grainy and loud as he shakes the insides, tilting the container above your bowl. A large amount of dry breakfast cereal comes out and fills your bowl.")
		saynn("[say=issix]Don't get used to it.[/say]")
		saynn("He chuckled. You lap your tongue over the cereal - they stick to your tongue making it relatively easy to get them out of the bowl. As expected, they are a sweet treat, a rarity of rarities in this corner. Your Master must be pulling some strings to get such a treat for his pets, it only shows how much he cares about them.")
		saynn("[say=pc]Thank you, Master![/say]")
		saynn("A gentle smile fills his face.")
		saynn("[say=issix]Lesson's over now, pet.[/say]")
		addButton("Finish", "Lesson is over now!", "endthescene")

	if state == "nofood":
		saynn("You shake your head signifying that you don't enjoy the food. Your Master responds with piercing look.")
		saynn("[say=issix]Do you not like it? I... Wow. That said, I appreciate the honesty.[/say]")
		saynn("He looks distraught. Saddened, perhaps with little bit of anger. His tail swishes through the air, his body looking tired.")
		saynn("[say=issix]Well, I still expect you to eat it. I don't have anything better for you and I don't want the food to go to waste. Chop chop.[/say]")
		saynn("You continue eating, slowly munching the gelatinous mass. You feel like it's slowly growing on you, it isn't a delicacy, but it's a step up from canteen food. Master proceeds to pour the same in bowls of his other pets, each one of them getting very similar amount of food that has been given to you. Each one of the other pets thanks their Master for the meal.")
		saynn("[say=azazel]Thank you Master![/say]")
		saynn("[say=hiisi]Thank you Master.[/say]")
		saynn("Lamia gives his smile alongside with a distinct ear movement that can only possibly mean ”thank you”.")
		saynn("You eventually finish your own meal, leaving bits of food here and there. You excuse yourself.")
		addButton("Finish", "Lesson is over now!", "endthescene")


func _react(_action: String, _args):
	processTime(2*60)

	if _action == "nofood":
		GM.pc.addStamina(30)
		GM.pc.addPain(-10)
		setModuleFlag("IssixModule", "Progression_Day_Next", GM.main.getDays()+6)

	if _action == "yesfood":
		GM.pc.addStamina(60)
		GM.pc.addPain(-10)
		setModuleFlag("IssixModule", "Progression_Day_Next", GM.main.getDays()+3)

	if(_action == "endthescene"):
		increaseModuleFlag("IssixModule", "PC_Training_Level")
		increaseModuleFlag("IssixModule", "Progression_Points")
		IssixModule.addSceneToWatched(sceneID)
		setModuleFlag("IssixModule", "Taught_To_Use_Bowl", true)
		endScene()
		return

	setState(_action)
