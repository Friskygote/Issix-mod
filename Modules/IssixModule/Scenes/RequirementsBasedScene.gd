extends SceneBase
class_name RequirementsBasedScene

const Globals = preload("res://Modules/IssixModule/Globals.gd")
var id:String = "error"


func checkIfFullfillsRequirements() -> bool:
	return true

func defaultCategory() -> String:
	return "REWARD"

func oneTimeOnly(checkID: String):
	return Globals.checkIfAchieved(checkID, id)
