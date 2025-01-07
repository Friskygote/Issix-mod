extends GameExtender

func _init():
	id = "IssixModGE"

func register(_GES:GameExtenderSystem):
	_GES.register(self, ExtendGame.pcProcessTime)

func pcProcessTime(_pc:Player, _seconds):
	# Don't progress time while in a dream
	if GM.main.getModuleFlag("IssixModule", "Azazel_In_Dream", false):
		GM.main.timeOfDay -= _seconds


