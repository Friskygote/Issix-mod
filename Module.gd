extends Module
class_name PierreModule

func getFlags():
	return {
		"Pierre_Introduced": flag(FlagType.Bool),
		"Pets_Introduced": flag(FlagType.Bool),
		"Score_Explored": flag(FlagType.Number),
		"Quest_Status": flag(FlagType.Number),
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
		"QuestionnaireQ11": flag(FlagType.Bool),
		}
		

func _init():
	id = "PierreModule"
	author = "Frisk"
	
	events = [
		"res://Modules/PierreModule/EventTileOnEnter.gd",
		"res://Modules/PierreModule/GreenhouseCatnip.gd",
		"res://Modules/PierreModule/EngRoomClosetEvent.gd",
		"res://Modules/PierreModule/PierreQuestionnaireEvent.gd",
		"res://Modules/PierreModule/MedicalPeekEvent.gd"
		]
		
	scenes = [
		"res://Modules/PierreModule/PierreTalkMain.gd",
		"res://Modules/PierreModule/GreenhouseCatnipStealScene.gd",
		"res://Modules/PierreModule/PetsTalkMain.gd",
		"res://Modules/PierreModule/EngRoomScene.gd",
		"res://Modules/PierreModule/PierreQuestionnaireScene.gd",
		"res://Modules/PierreModule/NoPetsTalkMain.gd",
		"res://Modules/PierreModule/MedicalPeekScene.gd"
		]
		
	characters = [
		"res://Modules/PierreModule/PierreCharacter.gd",
		"res://Modules/PierreModule/LamiaCharacter.gd",
		"res://Modules/PierreModule/HiisiCharacter.gd",
		"res://Modules/PierreModule/AzazelCharacter.gd"
		]
		
	worldEdits = [
		"res://Modules/PierreModule/PierreWorldEdit.gd"
	]
	
	items = [
		"res://Modules/PierreModule/CatnipItem.gd",
		"res://Modules/PierreModule/MapItem.gd",
		"res://Modules/PierreModule/CookieItem.gd"  # I just felt like this game needs more variety in items, even if by themselves they don't do much
	]
	
	quests = [
		"res://Modules/PierreModule/PierresPetQuest.gd"
	]

func resetFlagsOnNewDay():
	GM.main.setModuleFlag("PierreModule", "Azazel_Catnip_taken_today", false)
	GM.main.setModuleFlag("PierreModule", "Activated_Cabinets", {})
	GM.main.setModuleFlag("PierreModule", "Quest_Wait_Another_Day", false)
