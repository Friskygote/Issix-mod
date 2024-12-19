extends SpeechModifierBase

var interruptors = ["hihihi", "*purrrrrrrrr*", "meow", "hiiyyaaa"]
var starters = ["Mrrrowwww!", "Mraahhh!", "Mrrrrrrr.", "Mrrow!"]

func _init():
	id = "CatnipSpeech"
	priority = 3

func appliesTo(_speaker: BaseCharacter) -> bool:
	return _speaker.hasEffect("CatnipOverdose")

func modify(_text: String, _speaker: BaseCharacter) -> String:
	var modified_text = _text.split(" ")
	var is_caps_mode = false
	for index in range(modified_text.size()):
		var word = modified_text[index]
		# Repeat
		if RNG.chance(30):
			var word_index = RNG.randi_range(0, word.length()-1)
			if word[word_index] != "'":
				modified_text[index] = word.substr(0, word_index) + word[word_index].repeat(RNG.randi_range(1, 4)) + word.substr(word_index)
		# Interjection
		if RNG.chance(2):
			modified_text[index] = modified_text[index] + " " + RNG.pick(interruptors)
		word = modified_text[index]
		if is_caps_mode:
			modified_text[index] = word.to_upper()
		# CAPS
		if RNG.chance(7) and not is_caps_mode:
			is_caps_mode = true
			if RNG.chance(50):
				var word_index = RNG.randi_range(0, word.length()-1)
				modified_text[index] = word.substr(0, word_index) + word.substr(word_index).to_upper()
		if is_caps_mode and RNG.chance(25):
			is_caps_mode = false
			if RNG.chance(50):
				var word_index = RNG.randi_range(0, word.length()-1)
				modified_text[index] = word.substr(0, word_index).to_upper() + word.substr(word_index)
		word = modified_text[index]
		# Misplaced letter
		if RNG.chance(10) and word.length() > 2:
			var word_index = RNG.randi_range(1, word.length()-1)
			modified_text[index] = word.substr(0, word_index-1) + word[word_index] + word[word_index-1] + word.substr(word_index+1)
	return RNG.pick(starters) + " " + " ".join(modified_text).replace(".", "!")

