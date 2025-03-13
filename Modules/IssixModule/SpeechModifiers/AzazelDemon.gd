extends SpeechModifierBase

func _init():
	id = "AzazelDemon"
	priority = 1001

func appliesTo(_speaker: BaseCharacter) -> bool:
	return _speaker.getID() == "lamia"

func modify(_text: String, _speaker: BaseCharacter) -> String:
	return "[pulse color=#ac1eff height=0.9 freq=0.6]"+_text+"[/pulse]"
