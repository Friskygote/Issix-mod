extends GameExtender

const Globals = preload("res://Modules/IssixModule/Globals.gd")

func _init():
	id = "IssixModGE"

func register(_GES:GameExtenderSystem):
	_GES.register(self, ExtendGame.pcProcessTime)
	_GES.register(self, ExtendGame.pcProcessBattleTurn)

func pcProcessTime(_pc:Player, _seconds):
	# Don't progress time while in a dream
	if GM.main.getModuleFlag("IssixModule", "Azazel_In_Dream", false):
		GM.main.timeOfDay -= _seconds


func pcProcessBattleTurn(_pc: Player):
	if GM.main.getModuleFlag("IssixModule", "Hiisi_Protects_PC") == true:
		if RNG.chance(40):
			var scene = GM.main.getCurrentScene()
			# Make sure we are in generic FightScene and it's the player defending themselves not starting a fight'
			if scene.sceneID != "FightScene" or scene.sceneTag != "interaction_fight_pcdef":
				return
			# Make sure that enemy is not a guard
			var pawn = GM.main.IS.getPawn(scene.enemyID)
			if pawn == null:
				return
			if !pawn.isInmate():
				return
			#scene.endScene(["win", "pain"])  # TODO We may want to change the sceneTag and handle the pawn interactions by ourselves so the player doesn't get XP & rep change'
			GM.main.runScene("RescueFromFight", [scene.enemyID, scene])

