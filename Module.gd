extends Module
class_name IssixModule

func getFlags():
	return {
		"Issix_Introduced": flag(FlagType.Bool),
		"Pets_Introduced": flag(FlagType.Bool),
		"Score_Explored": flag(FlagType.Number),
		"Quest_Status": flag(FlagType.Number),
		"Quest_Rejected_By_Issix": flag(FlagType.Number),
		"Azazel_Catnip_talked": flag(FlagType.Bool),
		"Azazel_Catnip_found": flag(FlagType.Bool),
		"Azazel_Catnip_taken_today": flag(FlagType.Bool),
		"Azazel_Affection_given": flag(FlagType.Number),
		"Lamia_Times_Helped": flag(FlagType.Number),
		"Hiisi_Affection": flag(FlagType.Number),
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
		"Received_Portrait_From_Lamia": flag(FlagType.Bool),
		"Placed_Portrait_In_Cell": flag(FlagType.Bool),
		"Hissi_RPS_data": flag(FlagType.Dict),
		"Hiisi_Name_Helped": flag(FlagType.Bool),
		"Shared_Marshmallows": flag(FlagType.Bool),

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
		"Is_Player_Forced_Today": flag(FlagType.Number)  # If player is forced to stay in harem this will have amount of seconds player needs to spend in the harem today
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
		"res://Modules/IssixModule/Events/SlaveryIntroEvent.gd"
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
		"res://Modules/IssixModule/Scenes/SlaveryInfoScreenScene.gd"
		]
		
	characters = [
		"res://Modules/IssixModule/Characters/AzazelCharacter.gd", 
		"res://Modules/IssixModule/Characters/HiisiCharacter.gd", 
		"res://Modules/IssixModule/Characters/IssixCharacter.gd", 
		"res://Modules/IssixModule/Characters/LamiaCharacter.gd"
		]
		
	worldEdits = [
		"res://Modules/IssixModule/IssixWorldEdit.gd"
	]
	
	items = [
		 "res://Modules/IssixModule/Items/CatnipItem.gd", "res://Modules/IssixModule/Items/ClosetMap.gd", "res://Modules/IssixModule/Items/CookieItem.gd" # I just felt like this game needs more variety in items, even if by themselves they don't do much
	]
	
	quests = [
		"res://Modules/IssixModule/IssixPetQuest.gd"
	]

	GlobalRegistry.registerLustTopicFolder("res://Modules/IssixModule/InterestTopics/")
	GlobalRegistry.registerSkinsFolder("res://Modules/IssixModule/Skins/")
	GlobalRegistry.registerStatusEffectFolder("res://Modules/IssixModule/StatusEffects/")
	GlobalRegistry.sortRegisteredStatusEffectsByPriority()
	GlobalRegistry.registerMapFloorFolder("res://Modules/IssixModule/Floors/")

# External
# "res://Scenes/ParadedOnALeashScene.gd"
# "res://Game/World/Floors/Closet.gd"
# "res://Game/World/Floors/Closet.tscn"

static func addSceneToWatched(scene: String):
	var scenes = GM.main.getModuleFlag("IssixModule", "Misc_Slavery_Info", {"scenes_seen": []})
	scenes["scenes_seen"].append(scene)
	GM.main.setModuleFlag("IssixModule", "Misc_Slavery_Info",scenes)

static func addIssixMood(mood: int):
	GM.main.setModuleFlag("IssixModule", "Issix_Mood", clamp(GM.main.getModuleFlag("IssixModule", "Issix_Mood", 50)+mood, 0, 100))

static func getPlayerRole():
	return "pet" if GM.main.getModuleFlag("IssixModule", "PC_Enslavement_Role", 1) == 1 else "prostitute"

func breedSlaveIfNpc():
	## Function to process breeding by Master on randomly selected TODO maybe do that during the day as an event?
	var current_slave = GM.main.getModuleFlag("IssixModule", "Todays_Bred_Slave")
	if current_slave == "pc" or (GM.main.getDays() % 3 != 0):
		return  # This will be handled by separate event
	current_slave = GM.main.getCharacter(current_slave)
	if RNG.chance(5):
		current_slave.cummedInMouthBy("issix")
	if current_slave.hasVagina():  # azazel
		current_slave.cummedInVaginaBy("issix")
		if RNG.chance(40):
			current_slave.cummedInAnusBy("issix")
	else:  # hiisi
		current_slave.cummedInAnusBy("issix")

func resetFlagsOnNewDay():
	GM.main.setModuleFlag("IssixModule", "Azazel_Catnip_taken_today", false)
	GM.main.setModuleFlag("IssixModule", "Activated_Cabinets", {})
	GM.main.setModuleFlag("IssixModule", "Quest_Wait_Another_Day", false)
	GM.main.setModuleFlag("IssixModule", "Is_Player_Forced_Today", 0)
	GM.main.setModuleFlag("IssixModule", "Todays_Bred_Slave", RNG.pick(['azazel', 'pc', 'hiisi']))
	if GM.main.getModuleFlag("IssixModule", "Helped_Lamia_With_Drawings_Today") != null:
		GM.main.setModuleFlag("IssixModule", "Helped_Lamia_With_Drawings_Today", false)
	addIssixMood(RNG.randi_range(-7, 7))
	GM.main.setModuleFlag("IssixModule", "Pet_Time_Interaction_Today", 0)
