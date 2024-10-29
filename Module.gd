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
		"Azazel_Catnip_taken_today": flag(FlagType.Bool)
		}
		

func _init():
	id = "PierreModule"
	author = "Frisk"
	
	events = [
		"res://Modules/PierreModule/EventTileOnEnter.gd",
		"res://Modules/PierreModule/GreenhouseCatnip.gd"
		]
		
	scenes = [
		"res://Modules/PierreModule/PierreTalkMain.gd",
		"res://Modules/PierreModule/GreenhouseCatnipStealScene.gd",
		"res://Modules/PierreModule/PetsTalkMain.gd"
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
		"res://Modules/PierreModule/CatnipItem.gd"
	]
	
	quests = [
		"res://Modules/PierreModule/PierresPetQuest.gd"
	]

func resetFlagsOnNewDay():
	GM.main.setModuleFlag("PierreModule", "Azazel_Catnip_taken_today", false)
