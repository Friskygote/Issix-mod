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
		#"wrist.L": ["res://Inventory/UnriggedModels/Cuff/CuffModel.tscn"],
		#"wrist.R": ["res://Inventory/UnriggedModels/Cuff/CuffModel.tscn"],
		#"ankle.L": ["res://Inventory/UnriggedModels/Cuff/CuffModel.tscn"],
		#"ankle.R": ["res://Inventory/UnriggedModels/Cuff/CuffModel.tscn"],
	}

#func getRiggedParts(_character):
#	return {
#		"harness": "res://Inventory/RiggedModels/RopeHarness/RopeHarness.tscn",
#	}

#func getRiggedParts(_character):
#	return {
#		"asd": "res://Player/Player3D/Parts/Legs/DigiLegs/DigiLegs.tscn",
#		"asd2": "res://Player/Player3D/Parts/Arms/HumanArms/HumanArms.tscn",
#	}
#
#func getHidesParts(_character):
#	return {
#		BodypartSlot.Penis: true,
#	}

func getInventoryImage():
	return "res://Images/Items/bdsm/collar.png"
