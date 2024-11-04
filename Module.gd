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
		"PC_Enslavement_Status": flag(FlagType.Number),
		"Azazel_Catnips_given": flag(FlagType.Number),
		"Quest_Bonked": flag(FlagType.Bool),
		"Quest_Wait_Another_Day": flag(FlagType.Bool),
		"Activated_Cabinets": flag(FlagType.Dict),
		"Medical_Peeked": flag(FlagType.Bool),
		"QuestionnaireQ1": flag(FlagType.Bool),
		"QuestionnaireQ2": flag(FlagType.Bool),
		"QuestionnaireQ3": flag(FlagType.Text),
		"QuestionnaireQ4": flag(FlagType.Bool),
		"QuestionnaireQ5": flag(FlagType.Text),
		"QuestionnaireQ6": flag(FlagType.Bool),
		"QuestionnaireQ7": flag(FlagType.Bool),
		"QuestionnaireQ8": flag(FlagType.Text),
		"QuestionnaireQ9": flag(FlagType.Bool),
		"QuestionnaireQ10": flag(FlagType.Number),
		"QuestionnaireQ11": flag(FlagType.Bool)
		}
		

func _init():
	id = "IssixModule"
	author = "Frisk"
	
	events = [
		"res://Modules/IssixModule/EventTileOnEnter.gd",
		"res://Modules/IssixModule/GreenhouseCatnip.gd",
		"res://Modules/IssixModule/EngRoomClosetEvent.gd",
		"res://Modules/IssixModule/IssixQuestionnaireEvent.gd",
		"res://Modules/IssixModule/MedicalPeekEvent.gd"
		]
		
	scenes = [
		"res://Modules/IssixModule/IssixTalkMain.gd",
		"res://Modules/IssixModule/GreenhouseCatnipStealScene.gd",
		"res://Modules/IssixModule/PetsTalkMain.gd",
		"res://Modules/IssixModule/EngRoomScene.gd",
		"res://Modules/IssixModule/IssixQuestionnaireScene.gd",
		"res://Modules/IssixModule/NoPetsTalkMain.gd",
		"res://Modules/IssixModule/MedicalPeekScene.gd"
		]
		
	characters = [
		"res://Modules/IssixModule/IssixCharacter.gd",
		"res://Modules/IssixModule/LamiaCharacter.gd",
		"res://Modules/IssixModule/HiisiCharacter.gd",
		"res://Modules/IssixModule/AzazelCharacter.gd"
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

func resetFlagsOnNewDay():
	GM.main.setModuleFlag("IssixModule", "Azazel_Catnip_taken_today", false)
	GM.main.setModuleFlag("IssixModule", "Activated_Cabinets", {})
	GM.main.setModuleFlag("IssixModule", "Quest_Wait_Another_Day", false)
