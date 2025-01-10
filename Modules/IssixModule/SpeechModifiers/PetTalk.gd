extends SpeechModifierBase

var petNoises = {Species.Canine: ["Woof", "Bark"], Species.Feline: ["Meow", "Mew"], Species.Equine: ["Neigh!"], Species.Unknown: ["Yip"]}
var regex = RegEx.new()

func _init():
	id = "PetTalk"
	priority = 500
	regex.compile("([\\!\\.\\?]*)")

func appliesTo(_speaker: BaseCharacter) -> bool:
	return _speaker.hasPerk("PetSpeech")

func modify(_text: String, _speaker: BaseCharacter) -> String:
	var species = petNoises[Species.Unknown]
	for single_species in _speaker.getSpecies():
		if single_species in species:
			species = petNoises[single_species]
			break
	var return_text = ""
	var split_text = _text.split(" ")
	for word in split_text:
		if RNG.chance(20):  # Don't make a sound
			continue
		var addition = RNG.pick(species)
		if word.length() > addition.length():
			addition = addition.substr(0, 1) + addition[1].repeat(word.length()-addition.length()+1) + addition.substr(2)
		var result = regex.search(word)
		return_text = return_text + " " + addition + (result.get_string() if result else "")
	if(GM.pc.hasPerk(Perk.BDSMGagTalk)):
		return return_text.dedent() +" ("+_text+")"
	else:
		return return_text.dedent()

