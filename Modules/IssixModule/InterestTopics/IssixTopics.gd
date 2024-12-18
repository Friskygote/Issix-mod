extends TopicBase

func _init():
	handles_ids = [
		"IssixBrand"
	]

func getTopicValue(_topicID, _pc):
	if(_topicID == "IssixBrand"):
		if(GM.main.getModuleFlag("IssixModule", "Issix_Branded_PC") == true):
			return 1.0

	return 0.0

func getVisibleName(_topicID):
	if(_topicID == "IssixBrand"):
		return "Issix's brand"


	return "error:"+str(_topicID)

func getAddsToFocus(_topicID, _focus) -> float:
	if(_topicID == "IssixBrand"):
		if(_focus == LustFocus.Butt):
			return 1.0

	return 0.0
