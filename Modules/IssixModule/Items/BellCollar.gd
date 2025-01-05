extends ItemBase

func _init():
	id = "inmatecollarbell"

func getVisibleName():
	return "Inmate collar with bell"

func getDescription():
	return "Bulky and very uncomfortable collar made out of casted iron. Has a magnetic lock and a constantly blinking red light. A bell is placed in a loop of this one."

func getClothingSlot():
	return InventorySlot.Neck

func getBuffs():
	return [
		]

func getTakeOffScene():
	return "CollarTuggingScene"

func getTags():
	return [ItemTag.AllowsEnslaving]


func isImportant():
	return true

func isRestraint():
	return true

func generateRestraintData():
	restraintData = RestraintUnremovable.new()

func getUnriggedParts(_character):
	return {
		"neck": ["res://Modules/IssixModule/Items/Models/CollarModel.tscn"],
	}

func getInventoryImage():
	return "res://Images/Items/bdsm/collar.png"
