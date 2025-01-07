extends Module
class_name IssixModule

# If a var matches with your config ID, the config option will be sycronized with the config value
var characterCoverage = "fur"

func onFoxLibModInit(foxModuleAPI):
	foxModuleAPI.addListOption("characterCoverage", "Character's coverage", [["fur", "Fur"], ["skin", "Skin"], ["scales", "Scales"]], "Pick how to refer to what kind of coverage your character has", "fur")

const APPROX_WALK_DELAY = 9

func getFlags():
	return {
		"Issix_Introduced": flag(FlagType.Bool),
		"Pets_Introduced": flag(FlagType.Bool),
		"Score_Explored": flag(FlagType.Number),
		"Quest_Status": flag(FlagType.Number),
		"Quest_Rejected_By_Issix": flag(FlagType.Number),
		"Azazel_Catnip_noticed": flag(FlagType.Bool),
		"Azazel_Catnip_taken_today": flag(FlagType.Bool),
		"Azazel_Affection_given": flag(FlagType.Number),
		"Lamia_Times_Helped": flag(FlagType.Number),
		"Hiisi_Affection": flag(FlagType.Number),
		"Hiisi_Put_Sabotaged_Headvisors": flag(FlagType.Bool),
		"Helped_Lamia_With_Drawings_Today": flag(FlagType.Bool),
		"Quest_Bonked": flag(FlagType.Bool),
		"Quest_Wait_Another_Day": flag(FlagType.Bool),
		"Activated_Cabinets": flag(FlagType.Dict),
		"Medical_Peeked": flag(FlagType.Bool),
		"QuestionnaireQ1": flag(FlagType.Bool), # Creatures possess a soul
		"QuestionnaireQ2": flag(FlagType.Bool),
		"QuestionnaireQ3": flag(FlagType.Text),
		"QuestionnaireQ4": flag(FlagType.Bool),
		"QuestionnaireQ5": flag(FlagType.Text),
		"QuestionnaireQ6": flag(FlagType.Bool),
		"QuestionnaireQ7": flag(FlagType.Bool),
		"QuestionnaireQ8": flag(FlagType.Text),
		"QuestionnaireQ9": flag(FlagType.Bool),
		"QuestionnaireQ10": flag(FlagType.Number),
		"QuestionnaireQ11": flag(FlagType.Bool),
		"Lamia_Is_Hungry": flag(FlagType.Bool),
		"Azazel_Sky_Response": flag(FlagType.Bool),
		"Azazel_Catnip_given_today": flag(FlagType.Number),
		"Received_Portrait_From_Lamia": flag(FlagType.Bool),
		"Placed_Portrait_In_Cell": flag(FlagType.Bool),
		"Hissi_RPS_data": flag(FlagType.Dict),
		"Hiisi_Name_Helped": flag(FlagType.Bool),
		"Shared_Marshmallows": flag(FlagType.Bool),
		"Saw_Azazel_Naked": flag(FlagType.Bool),
		"Lamia_Chosen_Drawing": flag(FlagType.Text),
		"PC_Saw_Artwork_At_Lamias": flag(FlagType.Bool),
		"Hiisi_Crossword_Used": flag(FlagType.Number),
		"Hiisi_Helped_Today": flag(FlagType.Bool),
		"Azazel_Corruption_Scene": flag(FlagType.Number),
		"Azazel_Had_Corruption_Scene_Today": flag(FlagType.Bool),
		"Azazel_Agreed_Kiss": flag(FlagType.Bool),
		"Azazel_Corruption_Musk_Happened": flag(FlagType.Bool),
		"Azazel_Player_Donated_Gasmask": flag(FlagType.Bool),
		"Azazel_In_Dream": flag(FlagType.Bool),
		"Azazel_Corr_Dream_State": flag(FlagType.Dict),
		"Hiisi_Encounter_scene": flag(FlagType.Number),
		"Hiisi_Had_Encounter_Scene_Today": flag(FlagType.Bool),
		"Issix_Donation_Meter": flag(FlagType.Number),
		"Issix_Used_Donations": flag(FlagType.Number),
		"Got_Luck_Token_Before": flag(FlagType.Bool),
		"Announcer_PC_Naive": flag(FlagType.Bool),

		# Slavery related
		"PC_Enslavement_Role": flag(FlagType.Number),
		"PC_Enslavement_Noncon": flag(FlagType.Bool),
		"PC_Training_Level": flag(FlagType.Number),
		"Issix_Mood": flag(FlagType.Number),
		"Todays_Bred_Slave": flag(FlagType.Text),
		"Progression_Day_Next": flag(FlagType.Number),
		"Last_Day_Visited_Master": flag(FlagType.Number),
		"Misc_Slavery_Info": flag(FlagType.Dict),
		"Progression_Points": flag(FlagType.Number),
		"Taught_To_Use_Bowl": flag(FlagType.Bool),
		"Issix_Branded_PC": flag(FlagType.Bool),
		"Pet_Time_Interaction_Today": flag(FlagType.Number),
		"Is_Player_Forced_Today": flag(FlagType.Number),  # If player is forced to stay in harem this will have amount of seconds player needs to spend in the harem today
		"Last_Walk": flag(FlagType.Number),
		"Eaten_Today": flag(FlagType.Bool),
		"Comic_Books": flag(FlagType.Number),
		"Comic_Book_Unlocked": flag(FlagType.Bool),
		"Strikes_For_Disobedience": flag(FlagType.Number),
		"Unwelcome_At_Corner": flag(FlagType.Bool),
		"Had_Sex_With_Issix": flag(FlagType.Bool),
		"Litter_Guessing_Game": flag(FlagType.Dict),
		"Have_Received_Headpats_Lamia": flag(FlagType.Bool),
		"Received_Headpats_From_Lamia": flag(FlagType.Number),
		"Total_Fluids_Milked": flag(FlagType.Dict),
		"Has_Been_Milked_Today": flag(FlagType.Bool),
		"Submission": flag(FlagType.Number),
		"Trained_With_Hiisi_Combat": flag(FlagType.Bool),
		"PC_Pet_Didnt_Fullfill_Daily": flag(FlagType.Bool),
		"PC_Pet_Didnt_Mate": flag(FlagType.Bool),
		#"Gym_Bullies_Left_Alone": flag(FlagType.Bool)  Currently cannot change the behavior of this :(
		}
		

func _init():
	id = "IssixModule"
	author = "Frisk"
	
	events = [
		"res://Modules/IssixModule/Events/EngRoomClosetEvent.gd",
		"res://Modules/IssixModule/Events/EventTileOnEnter.gd", 
		"res://Modules/IssixModule/Events/GreenhouseCatnipEvent.gd", 
		"res://Modules/IssixModule/Events/IssixQuestionnaireEvent.gd", 
		"res://Modules/IssixModule/Events/MedicalPeekEvent.gd", 
		"res://Modules/IssixModule/Events/PetWalkExamEvent.gd", 
		"res://Modules/IssixModule/Events/PlayerCellModifierEvent.gd",
		"res://Modules/IssixModule/Events/CornerPriorityEvent.gd",
		"res://Modules/IssixModule/Events/SlaveryIntroEvent.gd",
		"res://Modules/IssixModule/Events/IssixRegularSearch.gd",
		"res://Modules/IssixModule/Events/LamiaCellEvent.gd",
		"res://Modules/IssixModule/Events/TalkNovaEvent.gd",
		"res://Modules/IssixModule/Events/PetWanderEvent.gd",
		"res://Modules/IssixModule/Scenes/AzazelCorruption/StopsEvent.gd",
		"res://Modules/IssixModule/Events/AnnouncerLuckTokenEvent.gd",
		]
		
	scenes = [
		"res://Modules/IssixModule/Scenes/EngRoomScene.gd", 
		"res://Modules/IssixModule/Scenes/GreenhouseCatnipStealScene.gd", 
		"res://Modules/IssixModule/Scenes/IssixQuestionnaireScene.gd", 
		"res://Modules/IssixModule/Scenes/IssixTalkMain.gd", 
		"res://Modules/IssixModule/Scenes/MedicalPeekScene.gd", 
		"res://Modules/IssixModule/Scenes/NoPetsTalkMain.gd", 
		"res://Modules/IssixModule/Scenes/PetsTalkMain.gd", 
		"res://Modules/IssixModule/Scenes/PetWalkExamScene.gd", 
		"res://Modules/IssixModule/Scenes/PlayerCellModifierScene.gd",
		"res://Modules/IssixModule/Scenes/Overwrites/EatInCanteenScene.gd",
		"res://Modules/IssixModule/Scenes/SlaveryFirst/SlaveryIntroContScene.gd",
		"res://Modules/IssixModule/Scenes/SlaveryFirst/SlaveryTrainingBowlScene.gd",
		"res://Modules/IssixModule/Scenes/SlaveryFirst/SlaveryBrandingScene.gd",
		"res://Modules/IssixModule/Scenes/CaughtInTheCloset.gd",
		"res://Modules/IssixModule/Scenes/SlaveryIntroScene.gd",
		"res://Modules/IssixModule/Scenes/SlaveryInfoScreenScene.gd",
		"res://Modules/IssixModule/Scenes/SlaveryFirst/IssixBringsComicbooks.gd",
		"res://Modules/IssixModule/Scenes/SlaveryFirst/IssixFindsAvoidingPlayer.gd",
		"res://Modules/IssixModule/Scenes/IssixNovaTalkScene.gd",
		"res://Modules/IssixModule/Scenes/AzazelCorruption/AzazelCorruptionScene.gd",
		"res://Modules/IssixModule/Scenes/AzazelCorruption/AzazelCorruptionScene2.gd",
		"res://Modules/IssixModule/Scenes/AzazelCorruption/AzazelCorruptionScene3.gd",
		"res://Modules/IssixModule/Scenes/AzazelCorruption/AzazelCorruptionScene4.gd",
		"res://Modules/IssixModule/Scenes/HiisiScenes/HiisiWanderScene.gd",
		"res://Modules/IssixModule/Scenes/HiisiScenes/HiisiWanderScene2.gd",
		"res://Modules/IssixModule/Scenes/HiisiScenes/HiisiWanderScene3.gd",
		"res://Modules/IssixModule/Scenes/IssixDonationScene.gd",
		"res://Modules/IssixModule/Scenes/AnnouncerLuckTokensDialogue.gd",
		]
		
	characters = [
		"res://Modules/IssixModule/Characters/AzazelCharacter.gd", 
		"res://Modules/IssixModule/Characters/HiisiCharacter.gd", 
		"res://Modules/IssixModule/Characters/IssixCharacter.gd", 
		"res://Modules/IssixModule/Characters/LamiaCharacter.gd"
		]
		
	gameExtenders = [
		"res://Modules/IssixModule/GameExtender/processTimeCatcher.gd"
	]

	worldEdits = [
		"res://Modules/IssixModule/IssixWorldEdit.gd"
	]
	
	items = [
		 "res://Modules/IssixModule/Items/BellCollar.gd",
		 "res://Modules/IssixModule/Items/CatnipItem.gd",
		 "res://Modules/IssixModule/Items/ClosetMap.gd",
		 "res://Modules/IssixModule/Items/CookieItem.gd", # I just felt like this game needs more variety in items, even if by themselves they don't do much
		 "res://Modules/IssixModule/Items/LuckToken.gd"
	]
	
	quests = [
		"res://Modules/IssixModule/IssixPetQuest.gd"
	]

	computers = [
		"res://Modules/IssixModule/Scenes/ClosetComputer.gd"
	]
	skills = [
		"res://Modules/IssixModule/Skills/Pet.gd"
	]
	perks = [
		"res://Modules/IssixModule/Skills/Perks/BowlTraining.gd",
		"res://Modules/IssixModule/Skills/Perks/FollowCommands.gd",
		"res://Modules/IssixModule/Skills/Perks/PavlovsDog.gd",
		"res://Modules/IssixModule/Skills/Perks/PetName.gd",
		"res://Modules/IssixModule/Skills/Perks/PetSpeech.gd",
		"res://Modules/IssixModule/Skills/Perks/PetWalk.gd",
		"res://Modules/IssixModule/Skills/Perks/Relocated.gd",
	]
	statusEffects = [
		"res://Modules/IssixModule/StatusEffects/BrandingPain.gd",
		"res://Modules/IssixModule/StatusEffects/CatnipOverdose.gd"
	]
	speechModifiers = [
		"res://Modules/IssixModule/SpeechModifiers/CatnipSpeech.gd",
		"res://Modules/IssixModule/SpeechModifiers/LamiaMute.gd"
	]
	GlobalRegistry.registerLustTopicFolder("res://Modules/IssixModule/InterestTopics/")
	GlobalRegistry.registerSkinsFolder("res://Modules/IssixModule/Skins/")
	GlobalRegistry.registerMapFloorFolder("res://Modules/IssixModule/Floors/")
	GlobalRegistry.registerAttackFolder("res://Modules/IssixModule/Attacks/", true)

func postInit():
	# Overwrite scenes for dealing with bullies, they need to be initiated in here due to module initialization order overwriting our modules
	GlobalRegistry.registerScene("res://Modules/IssixModule/Scenes/Overwrites/BullyGangScene.gd", "Rahi")  # Still consider it mostly Rahi's creation'
	GlobalRegistry.registerEvent("res://Modules/IssixModule/Events/Overwrites/BullyGangEvent.gd")
	#GM.ES.registerEventTrigger("OpeningSlaveryScreen", EventTriggerLocation.new())  # TODO Find a way to do that

static func addSceneToWatched(scene: String):
	var scenes = GM.main.getModuleFlag("IssixModule", "Misc_Slavery_Info", {"scenes_seen": []})
	scenes["scenes_seen"].append(scene)
	GM.main.setModuleFlag("IssixModule", "Misc_Slavery_Info", scenes.duplicate(true))

static func addIssixMood(mood: int):
	GM.main.setModuleFlag("IssixModule", "Issix_Mood", clamp(GM.main.getModuleFlag("IssixModule", "Issix_Mood", 50)+mood, 0, 100))

static func getWalkDelay():
	return APPROX_WALK_DELAY

static func getPlayerRole():
	return "pet" if GM.main.getModuleFlag("IssixModule", "PC_Enslavement_Role", 1) == 1 else "prostitute"

static func playerToFuck():
	return (int(GM.main.getDays()-1) % 2 == 1) and GM.main.getModuleFlag("IssixModule", "Todays_Bred_Slave", "") == "pc"  # every uneven day

static func getPlayerPetName():
	if Species.Canine in GM.pc.getSpecies():
		return "puppy"
	elif Species.Feline in GM.pc.getSpecies():
		return "kitty"
	elif Species.Equine in GM.pc.getSpecies():
		return "pony"
	else:
		return "pet"

static func hackProcessingCharacters():
	for charID in GM.main.getCharacters():
		var character = GlobalRegistry.getCharacter(charID)
		#character.checkOldWayOfUpdating(currentDay, timeOfDay)
		if(character.shouldBeUpdated()):
			GM.main.startUpdatingCharacter(charID)
	for charID in GM.main.dynamicCharacters:
		var character = GlobalRegistry.getCharacter(charID)
		#character.checkOldWayOfUpdating(currentDay, timeOfDay)
		if(character.shouldBeUpdated()):
			GM.main.startUpdatingCharacter(charID)

func breedSlaveIfNpc():
	## Function to process breeding by Master on randomly selected TODO maybe do that during the day as an event?
	# if (int(GM.main.getDays()) % 2 == 0):  # Breed only every second day?
	# 	GM.main.setModuleFlag("IssixModule", "Todays_Bred_Slave", "thischardoesntexist")
	# 	return
	var available_slaves = ['azazel', 'pc', 'hiisi']
	available_slaves.erase(GM.main.getModuleFlag("IssixModule", "Todays_Bred_Slave", "pc"))  # Don't repeat same slave every day'
	var current_slave = RNG.pick(available_slaves)
	GM.main.setModuleFlag("IssixModule", "Todays_Bred_Slave", current_slave)
	if current_slave == "pc":
		return  # This will be handled by separate event
	current_slave = GM.main.getCharacter(current_slave)
	GlobalRegistry.getCharacter("issix").prepareForSexAsDom()
	if current_slave.hasVagina():  # azazel
		current_slave.cummedInVaginaBy("issix", FluidSource.Penis, 1.8)
		print("Azazel cummed in")
		if RNG.chance(40):
			current_slave.cummedInAnusBy("issix", FluidSource.Penis, 1.2)
	if RNG.chance(5):
		current_slave.cummedInMouthBy("issix")
	else:  # hiisi
		print("Hiisi cummed in")
		current_slave.cummedInAnusBy("issix")

func calculateDailyScore() -> int:
	## For calculating player's daily activities at the end of the day
	var score = 0
	if playerToFuck():  # TODO Need to check when this hook is run because likely wrong day
		if GM.main.getModuleFlag("IssixModule", "Had_Sex_With_Issix", false) == false:
			score -= 5
			GM.main.setModuleFlag("IssixModule", "PC_Pet_Didnt_Mate", true)
		else:
			score += 5
	if GM.main.getModuleFlag("IssixModule", "PC_Enslavement_Role", 0) == 1:
		var time_forced = GM.main.getModuleFlag("IssixModule", "Is_Player_Forced_Today", 0)
		var time_served = GM.main.getModuleFlag("IssixModule", "Pet_Time_Interaction_Today", 0)
		if time_forced > 0:
			if time_served >= time_forced:
				score += 1
			else:
				score -= 7
				GM.main.setModuleFlag("IssixModule", "PC_Pet_Didnt_Fullfill_Daily", true)
		else:
			if time_served >= 60*60:
				score += 1
			else:
				score -= 5
				GM.main.setModuleFlag("IssixModule", "PC_Pet_Didnt_Fullfill_Daily", true)
	return score

func tickDay():
	addIssixMood(RNG.randi_range(-7, 7))
	if GM.pc.getLocation() == "medical_paddedcell_player":
		pass  # TODO Bust out scene
	elif (GM.main.getDays() - GM.main.getModuleFlag("IssixModule", "Last_Day_Visited_Master", GM.main.getDays()) > 1):
		addIssixMood(-10)
	addIssixMood(calculateDailyScore())
	if int(GM.main.getDays()) % 7 == 0:
		GM.main.increaseModuleFlag("IssixModule", "Comic_Books", RNG.randi_range(5, 8))
	if int(GM.main.getDays()) % 30 == 0 and GM.main.getModuleFlag("IssixModule", "Strikes_For_Disobedience", 0) > 0:  # every 30 days remove one strike
		GM.main.increaseModuleFlag("IssixModule", "Strikes_For_Disobedience", -1)
	if GM.main.getDays()-1-GM.main.getModuleFlag("IssixModule", "Last_Walk", GM.main.getDays()) == APPROX_WALK_DELAY:
		GM.main.setModuleFlag("IssixModule", "Last_Walk", GM.main.getDays()-1)


func resetFlagsOnNewDay():  # I apologize for abusing this hook, but startNewDay does not have ANY other hooks I can use and SleepInCell as a trigger is not covering all cases of days passing by
	if GM.main.getModuleFlag("IssixModule", "PC_Enslavement_Role", 0) > 0:  # Slavery module
		tickDay()
		if GM.main.getModuleFlag("IssixModule", "Have_Received_Headpats_Lamia") != null:
			GM.main.setModuleFlag("IssixModule", "Have_Received_Headpats_Lamia", false)
	GM.main.setModuleFlag("IssixModule", "Azazel_Catnip_taken_today", false)
	GM.main.setModuleFlag("IssixModule", "Activated_Cabinets", {})
	GM.main.setModuleFlag("IssixModule", "Quest_Wait_Another_Day", false)
	GM.main.setModuleFlag("IssixModule", "Unwelcome_At_Corner", false)
	GM.main.setModuleFlag("IssixModule", "Had_Sex_With_Issix", false)
	GM.main.setModuleFlag("IssixModule", "Is_Player_Forced_Today", 0)
	GM.main.setModuleFlag("IssixModule", "Azazel_Catnip_given_today", 0)
	breedSlaveIfNpc()
	if GM.main.getModuleFlag("IssixModule", "Helped_Lamia_With_Drawings_Today") != null:
		GM.main.setModuleFlag("IssixModule", "Helped_Lamia_With_Drawings_Today", false)
	GM.main.setModuleFlag("IssixModule", "Pet_Time_Interaction_Today", 0)
	GM.main.setModuleFlag("IssixModule", "Eaten_Today", false)
	GM.main.setModuleFlag("IssixModule", "Has_Been_Milked_Today", true)
	if GM.main.getModuleFlag("IssixModule", "Trained_With_Hiisi_Combat") != null:
		GM.main.setModuleFlag("IssixModule", "Trained_With_Hiisi_Combat", false)
	GM.main.setModuleFlag("IssixModule", "Azazel_Had_Corruption_Scene_Today", false)
	GM.main.setModuleFlag("IssixModule", "Hiisi_Helped_Today", false)
	GM.main.setModuleFlag("IssixModule", "Hiisi_Had_Encounter_Scene_Today", false)
