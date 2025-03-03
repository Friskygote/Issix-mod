extends SceneBase

const Globals = preload("res://Modules/IssixModule/Globals.gd")

var path: Array = []

func _init():
	sceneID = "NonconCornerOvertime"

func _initScene(_args = []):
	path = GM.world.calculatePath(GM.pc.getLocation(), "hall_ne_corner")
	if(path.size() <= 0):
		endScene()

# Move to the harem only if it's after 17:00 or PC missed previous day
func _run():
	if(state == ""):
		saynn("Your body starts moving on its own. There is nothing you can do, what happens is beyond your control as legs move you towards the corner.")
		addButton("Continue", "Observe", "move")

	if state == "move":
		saynn("Your body continues towards the corner.")
		# Show room information
		var roomID = GM.pc.getLocation()
		var _roomInfo = GM.world.getRoomByID(roomID)
		aimCameraAndSetLocName(roomID)

		if(GM.pc.isBlindfolded() && !GM.pc.canHandleBlindness()):
			saynn(_roomInfo.getBlindDescription())
		else:
			saynn(_roomInfo.getDescription())

		var roomMemory = GM.main.getRoomMemory(roomID)
		if(roomMemory != null && roomMemory != ""):
			saynn("[i]"+roomMemory+"[/i]")
		addButton("Continue", "Observe", "move")


func _react(_action: String, _args):
	if _action == "move":
		var loc = path.pop_front()
		GM.pc.setLocation(loc)
		aimCamera(loc)
		setLocationName("Master's Corner")
		if loc == "hall_ne_corner":
			_action = "open_pet_tasks"

	if _action == "open_pet_tasks":
		endScene()
		runScene("SlaveryScreenOpen")
		return

	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

func getDebugActions():
	return [
		{
			"id": "forceEndNoncon",
			"name": "EndNoncon",
			"args": [
			],
		}
	]

func doDebugAction(_id, _args = {}):
	if(_id == "forceEndNoncon"):
		setModuleFlag("IssixModule", "Last_Day_Visited_Master", GM.main.getDays())
		endScene()


