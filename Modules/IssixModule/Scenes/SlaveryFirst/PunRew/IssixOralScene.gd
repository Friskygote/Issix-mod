extends "res://Modules/IssixModule/Scenes/RequirementsBasedScene.gd"

var preference = 0

func _init():
	sceneID = "PunRewOral"

func _run():
	if(state == ""):
		saynn("You admire the Harem and prepare yourself to preform another task for master~ However just before you can get started you hear a click then you see that you are being tugged to a chair by non other than Your Master himself~ Issix, as he Holds you with a leash~")

		saynn("[say=pc]Eeep!~[/say]")
		saynn("[say=issix]Now now~ Don't worry my pet~ I've got a better task for you to do that needs your immediate attention~[/say]")
		saynn("You watch as he tugs you to his chair and he gets you to your knees as you look up at him, Then as you look down his body your eyes are met with a nice bulge~ And as he sees you eying his bulge he nods")
		saynn("[say=issix]Yes my Pet~ You are going to service me nicely~ I need to use that Nice maw of yours so could you be so Kind an open up please?[/say]")
		saynn("As you are asked to open your maw you watch him strip his pants of and out flops his hard and thick dragon cock~")
		addButton("Open Wide", "Listen to your master and open that pretty maw of yours~", "normal")
		addButton("Reject", "You don't want to suck him to enjoy your maw", "reject")

	if state == "normal":

		saynn("You blush watching him gently tug on the leash to pull your head closer to his length~ As he does so you open your maw nice and wide for him to slide into with plenty of ease however he smirks and looks at you")
		saynn("[say=issix]Not yet~ You need to admire and polish this before I send it into your wanting maw Pet~ You need to work before you are rewarded~[/say]")
		saynn("After he tells you this you nod and start to lick all around his nice and now throbbing length as it starts to harden up~ while he watched you polish and make his dragon cock shine with your saliva~")
		saynn("[say=issix]Good pet There you go~ Give my tip some polishing and then I can feed you your reward~[/say]")
		saynn("You nod and start to suck and lick his tip~ Making sure he enjoys it, you look up at him and watch as he keeps smirking and slowly nodding as you can start to taste a bit of precum leaking from his tip~")
		saynn("[say=issix]Alright now pet~ Now open wide~ Time to put that throat to use and give you the reward you deserve~[/say]")
		addButton("Continue~", "Now he is gonna enjoy that throat of yours~", "normal2")

	if state == "normal2":
		saynn("Watching as Issix nicely commands you to open wide, you listen and do exactly that as you show off your nice dripping maw~ Ready for his thick dragon cock, And for extra points you hang your tongue out showing how ready you are for it~")
		saynn("[say=issix]I see someone is eager for a maw full of demon dragon cock~ Now don't worry~ I'm gonna enjoy every bit of that soaking wet maw of yours~[/say]")

		saynn("He tugs on your leash and you feel the tip of his cock boops your nose as a blush creeps up your face seeing his cock up close once more and he nods to you expecting you to know what to do and you nod slightly before slowly sliding it into your maw and starting to suck up and down his ribbed length slowly to pleasure him~")

		saynn("[say=issix]That's it~ Keep it up pet~ As you might just make me like you more than Azazel~[/say]")

		saynn("He said with a smirk before slightly leaning his head back as he enjoyed your maw while you expertly suck his cock down, like the good pet he said you are~")
		addButton("Continue", "Might As well speed it up~ Gotta get his delicious cream~", "normal3")



func oneTimeOnly(_checkID: String):
	return true

func _react(_action: String, _args):
	if _action == "normal":
		GM.pc.addLust(20)

	if _action == "normal2":
		GM.pc.addLust(20)

	if _action == "normal3":
		GM.pc.addStamina(-40)

	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)


func getSceneCreator():
	return "Phoenix"
