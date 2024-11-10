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
		"PC_Enslavement_Role": flag(FlagType.Number),
		"PC_Enslavement_Noncon": flag(FlagType.Bool),
		"Azazel_Affection_given": flag(FlagType.Number),
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
		"Shared_Marshmallows": flag(FlagType.Bool)
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
		"res://Modules/IssixModule/Events/PlayerCellModifierEvent.gd"
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
		"res://Modules/IssixModule/Scenes/PlayerCellModifierScene.gd"
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
		"res://Modules/IssixModule/CatnipItem.gd",
		"res://Modules/IssixModule/MapItem.gd",
		"res://Modules/IssixModule/CookieItem.gd"  # I just felt like this game needs more variety in items, even if by themselves they don't do much
	]
	
	quests = [
		"res://Modules/IssixModule/IssixPetQuest.gd"
	]

# External
# "res://Scenes/ParadedOnALeashScene.gd"
# "res://Game/World/Floors/Closet.gd"
# "res://Game/World/Floors/Closet.tscn"

func resetFlagsOnNewDay():
	GM.main.setModuleFlag("IssixModule", "Azazel_Catnip_taken_today", false)
	GM.main.setModuleFlag("IssixModule", "Activated_Cabinets", {})
	GM.main.setModuleFlag("IssixModule", "Quest_Wait_Another_Day", false)
