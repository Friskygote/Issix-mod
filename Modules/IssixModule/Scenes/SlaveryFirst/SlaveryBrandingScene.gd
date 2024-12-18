extends SceneBase

var attitude = null
var timedifference = 0

func _init():
	sceneID = "IssixSlaveryBranding"

func _run():
	if(state == ""):
		playAnimation(StageScene.Duo, "kneel", {npc="issix", npcAction="stand"})
		saynn("[say=issix]It is the day pet. Today we are marking you with a mark that cannot be washed away. It will be burned into your body forever. You are getting my brand.[/say]")
		saynn("He looks at you, judging for your reaction")
		addButton("Eager", "You are eager to get your Master's brand on your body", "brandtalk", [1])
		addButton("Hesitant", "You aren't sure about getting your Master's brand on your body", "brandtalk", [2])
		addButton("Scared", "You are scared of the prospect of permanent mark on your body", "brandtalk", [3])

	if state == "brandtalk":
		playAnimation(StageScene.Duo, "kneel", {npc="issix", npcAction="stand", bodyState={leashedBy="issix"}})
		match attitude:
			1:
				saynn("[say=issix]My my. You seem to be burning to get yourself branded. Are you a pain slut? You do know that we aren't going to sedate the area of your skin before we apply a very very searing brand iron to it? Let's not kid ourselves, it will be painful. But then, maybe that's your kind of pleasure, I don't judge.[/say]")
			2:
				saynn("[say=issix]No taking anything back, remember. You've made your choice days ago and you knew what is going to happen. Are you worried about the pain? Or my permanent mark? If it's the former just remember we only have to do this once, you won't die from it. If it's the latter... Not much I can help with that. I own you, and my property is marked as such with eternal mark. I expect you to bear that mark proudly.[/say]")
			3:
				saynn("[say=issix]Understandable. Each one of my pet was terrified of this procedure. But they lived through that experience, I'm sure you will too. It will sting for a few weeks - sure, I can't deny this. But bad times go away, and your body will forever have my mark on it, isn't it wonderful? Isn't this what you wanted when you decided to become my pet?[/say]")
				saynn("Those were rhetorical questions.")
		saynn("He pulls out a leash and attaches it to your collar with a click.")
		saynn("[say=issix]It's best you get branded at doc's. More sterile and I feel better when my pets go through it at place where they can immediately get medical attention.[/say]")
		saynn("Without saying a word he also pulls three other leashes which he attaches to Azazel's, Hiisi's and Lamia's collars comfortably sitting on their necks.\nAzazel faces you and gives your face a lick.")
		saynn("[say=azazel]It hurts like a bitch, but only once. Don't worry if you faint, it's pretty normal.[/say]")
		saynn("[say=pc]I'll try my best for the Master.[/say]")
		saynn("Azazel gives you a nod.")
		saynn("[say=issix]We will go to my cell first, need to fetch branding iron. Let's go.[/say]")
		addButton("Walk", "Go with Issix", "firstwalk")


	if state == "firstwalk":
		saynn("You arrive at his cell. It feels oddly small, even claustrophobic with you two in it. Has the essentials and that's about it. It surprises you considering what character Issix is, but then, he spends most of his time in the main hall with his pets. Perhaps he doesn't need luxury in here. \nYou await for him along with his other pets as he opens his stash at the opposite part of his cell, pulls some items out in search of branding iron. You take a look at other pets. Lamia separated from his main activity is looking in various directions observing the environment deep in thought, Hiisi seems to be in his usual gloomy mood while Azazel looks at you with a smile.")
		saynn("[say=azazel]Nervous?[/say]")
		if attitude > 1:
			saynn("You nod your head\nAzazel offers you a delicate head pat which you accept.")
			saynn("[say=azazel]Temporary inconvenience for life marked by our Master, it's a great deal, really.[/say]")
		else:
			saynn("[say=pc]Not really, quite the opposite, actually.[/say]")
			saynn("[say=azazel]Oh? You are a strange one then. Each one of us was pretty nervous before getting branded. Even though we want-[/say]")
			saynn("He stops himself")
		saynn("[say=azazel]We became pets and branding just comes naturally with it. Or at least so Master believes. Not every pet gets branded in general but our Master has a different idea about that. Nowadays I really like my brand to be honest. Out of all the things I feel like it's the most intimate connection I have with Master Issix.[/say]")
		saynn("You think about this for a second, he is genuine, his mark is a source of his pride. It isn't just a whim of your common Master to him, but something more personal, it's part of himself, a scar so intimate he wants it.")
		saynn("[say=pc]Thank you, Azazel.[/say]")

		saynn("[say=pc]Do you come here often? To Master's cell, that is.[/say]")
		saynn("[say=azazel]No, not really. Usually only when Master needs something from the stash, of course we all know where Master has his cell. In rare case there is a night emergency he would need to be called in.[/say]")
		saynn("[say=pc]Called in? Night emergency?[/say]")
		saynn("[say=azazel]Extremely rare. If something happens to any of us pets, Master is called in by the prison staff as well, due to him being our owner.[/say]")
		saynn("[say=pc]Oh, I had no idea.[/say]")
		saynn("[say=azazel]Yeah. It's really cool.[/say]")
		saynn("Finally a metal pole emerges from your Master's stash as he pulls it out, for something such as branding iron it looks fairly... Modernized? You've only imagined some kind of metal sticks with badly dented prongs, and while the stick looks fairly standard, the end of the pole is a singular rectangular block wholly white, it has no gaps or letters from the side of the stick. Master hits one of his paw with it a few times as to test its weight, closes the stash and walks towards you.")
		saynn("[say=issix]We got everything we needed, let's go.[/say]")
		addButton("Go", "Go to medical ward", "secondwalk")

	if state == "secondwalk":
		addCharacter("eliza")
		addCharacter("issix")
		aimCameraAndSetLocName("med_lobbymain")
		saynn("You eventually arrive in medical lobby. Eliza is sitting behind the counter.")
		saynn("[say=issix]Hey Queen, how is your day?[/say]")
		saynn("[say=eliza]Suddenly 5 times worse, I've asked you not to call me that.[/say]")
		saynn("Issix lets a laugh while Eliza rolls her eyes unamused.")
		saynn("[say=issix]Come on, cheer up. I can't be that bad.[/say]")
		saynn("[say=eliza]Ekhem. What's the problem, inmate? I assume you expect me to mark your leashed forth for you?[/say]")
		saynn("Eliza looks you over")
		saynn("[say=issix]Precisely. You don't have to worry about bureaucracy this time, they are all filed and capt-[/say]")
		saynn("[say=eliza]While I'm glad the papers are done, I have more important things to do than scar your pets for life.[/say]")

		saynn("Issix gives Eliza a serious look, she relents")
		saynn("[say=eliza]Fine. Just how many other pets do you plan to have? You are going to eventually run out of space in your little corner.[/say]")
		saynn("She hits her datapad a few time, focusing on something")
		saynn("[say=issix]Might end of this one, optionally I'm going to build to extend the main hall with some more space.[/say]")
		saynn("[say=eliza]Yeah, I'd love to see you try. Keep your pets leashed.[/say]")
		saynn("She instinctively reaches for a leash and comes closer to Master Issix before stopping herself just before Issix, who was occupied looking at Eliza with face showing mix of curiosity and smirk")
		saynn("[say=eliza]Right, let's proceed.[/say]")
		saynn("Eliza puts the leash away and walks towards the medical wing, Issix drags all of you behind. Eliza opens the staff doors for you all.")
		addButton("Follow", "Continue", "thirdwalk")

	if state == "thirdwalk":
		var rahiBranded = getModuleFlag("RahiModule", "rahiMile8Branded", false)  # check for clothes
		if rahiBranded:
			saynn("You are led to a dimly-lit room, the same one where you led your own kitty Rahi to get branded. This time, the same fate awaits you. The smell of antiseptic lingers on, which combined with your circumstances feels to you as if you were at vet's.")
		else:
			saynn("You are led to a dimly-lit room the smell of antiseptic lingers on, which combined with your circumstances feels to you as if you were at vet's.")
		saynn("[say=eliza]I'd normally ask if the inmate agreed to the scar, but who would I kid, of course {pc.he} did, I also expect they are fully aware of what it means to be branded?[/say]")
		saynn("[say=issix]But of course, you know how I do things, Eliza.[/say]")
		saynn("[say=eliza]And you know what I think of branding, Iss- inmate.[/say]")
		saynn("Master chuckles")
		saynn("[say=issix]Yeah yeah, animalistic and brutal. Spare me the story.[/say]")
		if !GM.pc.isFullyNaked():
			saynn("[say=eliza]Please strip the inmate.[/say]")
			saynn("Issix comes to you and methodically strips you of everything you have on yourself.")
			for slot in GM.pc.getInventory().getEquippedItems():
				saynn("Master took off your "+GM.pc.getInventory()["equippedItems"][slot].getVisibleName()+".")
				GM.pc.getInventory().unequipSlot(slot)
			saynn("He takes a step back as if to admire your body.")
			saynn("[say=issix]{pc.He} is ready.[/say]")

		saynn("Eliza takes the branding iron from Issix and puts it in a strange device, she then looks at you.")

		saynn("[say=eliza]Can you?[/say]")
		saynn("[say=issix]With pleasure.[/say]")
		# saynn("Issix grabs you sensually by your hips and pushes you until you are positioned under one of the hooks adorning the ceiling. He then grabs the cuffs that lie on the table nearby and skillfully restrains your wrists in them, promptly testing the cuffs shortly after by jiggling the chain connecting them in different directions. They are pretty tight.")
		# saynn("[say=issix]Nice and secure. Arms up.[/say]")
		# saynn("You put your arms upwards, he reaches the hook and attaches it to the chain by which your wrists are connected. ")
		saynn("Issix goes to one end of the room and grabs something that looks like gymnastic equipment, with long, soft, rectangular padding at the top that sits atop of metal scaffolding underneath. The metal scaffolding has multiple restraints attached to it. At the middle there is a long leather like belt attached to left side. The purpose of this sloped device hits you after a moment, it's a breeding stock, but made for anthros. It moves on many wheels attached to the bottom of it. Issix invites you onto it by hitting the top of it with his paw.")
		saynn("[say=issix]It's pretty comfortable once you get onto it, the restraints are less comfortable but much needed, we wouldn't want the brand to come out all wrong, do we?[/say]")
		if attitude > 1:
			saynn("You approach the breeding stocks carefully, putting your leg up and onto the other side of the device. In just 20 seconds you comfortably lie on your belly with your arms and legs hanging down, supported by cold metal of device's scaffolding.")
		else:
			saynn("You approach the breeding stocks with excitement, not wasting any moment of everyone's time, placing yourself on its top, with your front comfortably laying on the soft part while your legs and arms are hanging down supported by cold metal scaffolding of the device.")
		saynn("[say=issix]I wish we had such toy in our little corner, ay?[/say]")
		saynn("Issix walks to your left, kneels and attaches your left wrist to the cuff underneath. Your arm is very straight not letting you move even a little bit without shifting your position on cushioned top. He moves to your ankle and secures {pc.your} ankle as well, in the same manner, you do not have any ability to pull or bend your leg. The same is then repeated for your right side. You are absolutely helpless in this position, the only thing you can do is move your head around... To a certain degree anyways. Master Issix chuckles.")
		saynn("[say=issix]Comfortable?[/say]")
		saynn("If you didn't feel helpless enough, your Master then approaches the middle of the device and puts the long belt over the middle of your back, walks to the right side of the device ans tightly secures the other end in the appropriate lock, this completely immobilizes any movements with your back you could even dream of doing. Due to your position you can't see everyone in the room, though this doesn't stop you from feeling the audience of five staring at your immobilized body at mercy of two creatures. Master Issix makes 2 rounds around your body like a predator assessing its pray.")
		saynn("[say=issix]They are ready.[/say]")
		addButton("Continue", "See what happens next", "bound")

	if state == "bound":
		playAnimation(StageScene.WoodenHorseSolo, "bent", {pc="pc", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})  # supported, unsupported, Frisk wants to get bent so he will get bent TODO repurpose WoodenHorseSolo by cutting the top of the texture and maybe adding something more to the texture? Treat this animation rather as a placeholder, also, the animation is in DollSkeleton.blend1
		saynn("A device in which the strange branding iron was held made an annoying beeping sound. Master Issix kneels to your level and gives you a kiss on your cheek, before coming to Doctor Eliza who retrieved the branding iron from the device and passed it to Master Issix's paws. To your surprise, Azazel comes forward and stands before you leaning to the front with his paw on your head " + ("petting your head and ruffling your hair" if GM.pc.hasHair() else "petting your head and purring") + ",")
		saynn("[say=azazel]Just look at me okey? Don't worry.[/say]")
		saynn("Master issix walks around you to your back.")
		saynn("[say=issix]You may have noticed this branding iron is a bit unusual. It's much bulkier, heavier and different from the regular ones. As I've mentioned, it's a gift, specifically commissioned for myself, from someone who knew what kind of life I craved for and what I'll be doing after serving my final year in AlphaCorp. It's a very high quality metal blend along with some clever modular temperature management mechanisms inside that allow to make sure that the brand looks perfect on slave's body. While it's a giant rectangle, only the letter parts are of incredibly hot temperature, everything else is colder than the air temperature. Thanks to that the amount of time needed to leave a mark is also shortened, making it just a little bit more bearable for receivers of the mark. Very fancy technology. I wouldn't be myself if I didn't add something from myself though. The brand is infused with a little bit of demonic energy, think of it as some sort of a marker, you don't have to worry about it... Did I mention it's also very easy to clean? Not that I have to do that often anyways.[/say]")
		saynn("This made you think, you didn't really see the other side of the branding iron - or whatever this tool was. The actual part that will be touching your body very soon feels mysterious, even though I've already seen effects of it touching body from other pets marked in this cruel way.")
		saynn("[say=issix]Get ready, your back is going to sting.[/say]")
		if attitude > 1:
			saynn("You look at Azazels face in front of you, he is smiling, he is now holding your bound paws while looking at you. His smile is genuine, you feel, he went through the same and he knows you are going to do just fine. You give Azazel's paws a gentle squeeze.")
		else:
			saynn("[say=pc]I'm ready, Master, please brand me![/say]")
			saynn("Issix chuckles")
			saynn("[say=issix]What a pain slut.[/say]")
		saynn("After few moments you register some pressure on your back above your butt. At first your body doesn't know what to make of it, it feels important but it doesn't know why. Split of a second later the receptors know why, the searing pain hits you like a ton of bricks, your body spasms, as much as it can, so in reality - not much, you can't help but scream, those things are not something you have any control over, they just happen. Your internal instincts to protect yourself can do nothing against the restraints in which you were put in. Many letters proclaiming your status as someone's thing - not a living person, a thing, are being currently etched into your body, your skin forever changed in those places. Fur will never grow there, you've seen the exact same thing on other Issix's pets.")
		saynn("The moment feels like eternity, but it ends. you open your teary eyes, which closed by themselves, and through blurry image you can see a face of Azazel looking at you, he puts his face to yours and hugs you as much as he can in your position, connecting his paws on your back, giving you some comfort, the next thing you feel is the smell, smell of burned fur and flesh. It's very intense, and awful. Azazel stops hugging you and joins the other pets near the wall of the room, replaced by your Master Issix in your field of view.")
		saynn("[say=issix]You did good, pet, very good.[/say]")
		saynn("The place on your back still hurts as hell. You hear more movement in the room, though you feel incredibly week from all this pain and it's hard for your to focus on anything else than the front of you, where Master Issix gives you a kiss on your nose, he puts his paw under your muzzle and grabs it as you suddenly feel a different kind of sting on your back, just where mere moments away your skin burned. It's Eliza disinfecting the area of skin, the stinging is quickly replaced by moderate relief of cold fluid hitting the same place.")
		saynn("[say=issix]Have some rest, pet. You deserve it. I need to talk with the doctor outside for few minutes, don't touch anything pets.[/say]")
		saynn("Eliza takes off her latex gloves, puts them into bin and gives you a curious look before leaving the room with Master Issix, leaving you, Azazel, Lamia and Hiisi alone. Only now you realize that you've been breathing heavily for past minute or two, perception of reality very slowly coming back to you, with constant feeling of pain on your back as if something very hot was still there.")
		saynn("[say=hiisi]You okey?[/say]")
		saynn("Hiisi says, not moving an inch from the wall he stands next to.")
		saynn("[say=pc]I... Think. It hurts like hell still.[/say]")
		saynn("[say=hiisi]Yeah, it does... For me it still did that after 3 weeks, it takes maybe a month to stop doing that.[/say]")
		saynn("[say=pc]Shit. How was first night?[/say]")
		saynn("[say=hiisi]Haven't slept, second one was fine though, you sort of get used to it and eventually it goes away completely.[/say]")
		saynn("[say=pc]I see.[/say]")
		saynn("[say=azazel]You also shouldn't wear any clothes for a while, and try to avoid touching anything or anyone with your back, you know, for safety.[/say]")
		saynn("Room fills with relative silence, some mumbling can be heard through the not very isolated doors to the hallway, you can't make out anything coherent though.")
		addButton("Continue", "See what happens next", "unbound")

	if state == "unbound":
		saynn("Finally the doors open once again, Master Issix goes through first, after him Eliza. Without saying anything Master kneels again next to you and one by one unlocks the restraints holding your body. Even after the last one finally is removed you continue laying on your front, you worry that if you move the pain will be even worse.")
		saynn("[say=issix]Do you need a bit more cold water on there?[/say]")
		saynn("You nod, while not great, this relief gave you some amount of comfort previously and you are certain it can do that again. Master brings a hose and stream of cold water once again hits the burned place. Even though the cold water hitting other parts of your body doesn't feel pleasant, you still feel relieved by temporary escape from the most persistent and unpleasant feeling of being burned under your skin. Your Master's paw ruffles your fur on the back above the branding, which gives you yet another pleasant feeling. After few minutes like that you felt your body getting really cold and asked Master to stop, which he did, not before jokingly turning the stream towards his other pets who got a small cold shower and wet fur, a joke appreciated only by your Master, even though you would lie if you said they didn't look funny.\nEventually you felt confident to sit on the device, which only led you to get dizzy and stumping on the cushioned top of the breeding stocks.")
		saynn("[say=issix]Aww. that took a lot from you did it? It's okey, don't worry about it, you can rest.[/say]")
		saynn("Master grabs you by your hips and picks up your mostly limp and pained body on his shoulder, at this point you drift off, not remembering much.")
		addButton("Wake up", "Wake up", "afterbrandingwakeup")

	if state == "afterbrandingwakeup":
		aimCamera("hall_ne_corner")
		saynn("Your eyes open, first thing that you feel is disorientation, you can see the blurry legs of red dragon in front of you, things slowly getting sharper, you are on your left side? You grumble moving your head a little to look around, you see your Master nearby who also starts looking at you seeing your woke up.")
		saynn("[say=issix]Hello there, what a timing, how are you feeling?[/say]")
		saynn("[say=pc]Ummm.. I don't know. Confused? Where are the others?[/say]")
		saynn("[say=issix]They went to their cells just moments ago, I were wondering if I should get you to yours as well, can you walk?[/say]")
		saynn("The pain on the back creeps in. You memory of recent events flood your brain.")
		saynn("[say=pc]How long have I been out?[/say]")
		if timedifference > 2*60*60:
			saynn("[say=issix]For few hours, at least, you had a nice sleepy time, other pets were worried about you.[/say]")
		else:
			saynn("[say=issix]Surprisingly, not that long, just a while, didn't stop other pets from worrying about you.[/say]")
		saynn("[say=pc]Thank you, Master, should I go to my cell too?[/say]")
		saynn("[say=issix]That depends. We do have to go to our cells already, but whether you get there by yourself or not depends if you can walk or not.[/say]")
		saynn("You get on your butt while avoiding any contact with newly branded part above your butt, so far so goo. You stand up on your paws and just stand there, trying to see if you'll have a similar blackout like the last time.")
		saynn("[say=pc]Hmm, I think I'm fine now. That nap gave me some energy, I guess.[/say]")
		saynn("[say=issix]Are you sure? Hmm. I see. If that's the case then you are free to go back to your cell on your own. I'll be right behind, a good night of sleep will do good for both of us.[/say]")
		saynn("[say=pc]Yeah...[/say]")
		saynn("You take few steps forward, feeling pretty normal, shouldn't have a difficult time going back to the cell on your own.")
		if GM.pc.getPersonality().getStat("Mean") < 0:
			saynn("[say=pc]... Thank you, Master, for... Everything.[/say]")
			saynn("Your Master smiles at you")
			saynn("[say=issix]But of course, pet.[/say]")
		addButton("Leave", "Leave the corner", "endthescene")



func saveData():
	var data = .saveData()

	data["branding_attitude"] = attitude

	return data

func loadData(data):
	.loadData(data)

	attitude = SAVE.loadVar(data, "branding_attitude", null)



func _react(_action: String, _args):
	processTime(2*60)

	if _action == "afterbrandingwakeup":
		GM.pc.setLocation("hall_ne_corner")
		timedifference = GM.main.getTimeCap() - GM.main.timeOfDay
		processTime(timedifference)
		increaseModuleFlag("IssixModule", "Progression_Points")

	if _action == "brandtalk":
		attitude = _args[0]

	if _action == "bound":
		processTime(20*60)
		GM.pc.addStamina(-300)
		GM.pc.addPain(300)
		GM.pc.addEffect("AfterBrandPain")

	if _action == "firstwalk":
		processTime(10*60)
		runScene("ParadedOnALeashScene", ["issix", GM.pc.getLocation(), "cellblock_red_nearcell", [
			"Better get ready, pet",
			"Eyes on me, pet",
			"Watch the pace, pet",
		], "cellblock_red_nearcell", "crawl"])

	if _action == "secondwalk":
		processTime(4*60)
		runScene("ParadedOnALeashScene", ["issix", GM.pc.getLocation(), "med_lobbymain", [
			"Better get ready, pet",
			"This thing is heavier than I remember it",
			"I can already feel the smell of burned fur in the air",
		], "med_lobbymain", "crawl"])

	if _action == "thirdwalk":
		processTime(4*60)
		runScene("ParadedOnALeashScene", ["issix", GM.pc.getLocation(), "medical_confessionary", [
			"Everything in here smells so nauseating",
			"What a great day for marking a pet",
			"I got this branding iron as a gift, actually. not a very standard one, would you agree?",
		], "medical_confessionary", "crawl"])

	if(_action == "endthescene"):
		setModuleFlag("IssixModule", "Progression_Day_Next", GM.main.getDays()+4)
		var scenes = GM.main.getModuleFlag("IssixModule", "Misc_Slavery_Info", {"scenes_seen": []})
		scenes["scenes_seen"].append(sceneID)
		GM.main.setModuleFlag("IssixModule", "Misc_Slavery_Info", scenes.duplicate(true))
		endScene()
		return

	setState(_action)
