extends SpeechModifierBase

func _init():  # Assure that Lamia never is assigned any kind of dialogue by the game
	id = "LamiaMute"
	priority = 1001

func appliesTo(_speaker: BaseCharacter) -> bool:
	return _speaker.getID() == "lamia"

func modify(_text: String, _speaker: BaseCharacter) -> String:
	return "..."
