extends EventBase
var scenes = {}

func _init():
	id = "SlaveryScreenOpen"

func registerTriggers(es):
	es.addTrigger(self, Trigger.TalkingToNPC, "slaveryscreen")

func react(_triggerID, _args):
	if GM.main.getModuleFlag("IssixModule", "Todays_Bred_Slave", "") == "pc" and GM.main.getModuleFlag("IssixModule", "Noncon_Mode_Enabled", false) and getModuleFlag("IssixModule", "Had_Sex_With_Issix", false) != true:
		GM.main.pickOption("noncon_issix_sex_start", [])
		return false
	if GM.main.getModuleFlag("IssixModule", "PC_Should_Be_Punished", 0) != 0:
		var scene_to_play = assignScene("PUNISHMENT")
		if scene_to_play:
			runScene(scene_to_play)
			GM.main.reRun()
			GM.main.setModuleFlag("IssixModule", "PC_Should_Be_Rewarded", 0)
			GM.main.setModuleFlag("IssixModule", "PC_Should_Be_Punished", 0)
			return true
	elif GM.main.getModuleFlag("IssixModule", "PC_Should_Be_Rewarded", 0) != 0:
		var scene_to_play = assignScene("REWARD")
		if scene_to_play:
			runScene(scene_to_play)
			GM.main.reRun()
			GM.main.setModuleFlag("IssixModule", "PC_Should_Be_Rewarded", 0)
			return true

	return false

func isRequirementsBased(methods: Array):
	for method in methods:
		if method.get("name", "") == "checkIfFullfillsRequirements":
			return true
	return false

func gatherScenes():
	for scene in GlobalRegistry.scenes:
		if scene == "PunRewPawjob":
			#print(GlobalRegistry.scenes[scene].base_object())
			print(isRequirementsBased(GlobalRegistry.scenes[scene].get_script_method_list()))
		if isRequirementsBased(GlobalRegistry.scenes[scene].get_script_method_list()):
			var iscene = GlobalRegistry.createScene(scene)  # Create temporary scene to be freed after this function runs, this is awful, I hate it, fuck
			if !scenes.has(iscene.defaultCategory()):
				scenes[iscene.defaultCategory()] = []
			if iscene.checkIfFullfillsRequirements():
				scenes[iscene.defaultCategory()].append(scene)

func assignScene(scene_type: String):
	gatherScenes()
	var possible_scenes = []
	for scene in scenes[scene_type]:
		possible_scenes.append(scene)
	return RNG.pick(possible_scenes)


func onButton(_method, _args):
	pass

func getPriority():
	return 20
