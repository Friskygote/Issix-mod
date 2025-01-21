extends Attack
# TODO Teach some population of pawns this attack
func _init():
	id = "PetCommandSit"
	category = Category.Special
	aiCategory = AICategory.Offensive

func getVisibleName(_context = {}):
	return "Command: Sit"

func getVisibleDesc(_context = {}):
	return "Use implanted pet directive to make you sit.."

func _doAttack(_attacker, _receiver, _context = {}):
	var texts = [
		"{attacker.name} orders {receiver.name} to sit like a good puppy {receiver.he} is.",
		"{attacker.name} points at the floor with {attacker.his} finger and commands {receiver.name} to sit"
	]
	var text = RNG.pick(texts)

	if(_receiver.addEffect(StatusEffect.Stunned, [1])):
		text += "\n[b]{receiver.name} obeys the command without question.[/b]"

	return {
		text = text,
	}

func _canUse(_attacker, _receiver, _context = {}):
	if(_attacker.isGagged()):
		return false

	if(_receiver.hasPerk("Commands") && !_receiver.statusEffects.has(StatusEffect.Stunned)):
		return true

	return false

func getAnticipationText(_attacker, _receiver):
	return "{attacker.name} opens {attacker.his} mouth while pointing at floor."

func getAttackSoloAnimation():
	return "throw"

func getRequirements():
	return [AttackRequirement.FreeHands, AttackRequirement.CanTalk]

func getRecieverArmorScaling(_attacker, _receiver, _damageType) -> float:
	return 0.0
