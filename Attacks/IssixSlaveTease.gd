extends Attack

func _init():
	id = "IssixSlaveTease"
	category = Category.Lust
	aiCategory = AICategory.Lust

func getVisibleName(_context = {}):
	return "Collar Tease"

func getVisibleDesc(_context = {}):
	return "Shouldn't see this"

func _doAttack(_attacker, _receiver, _context = {}):
	var text = ""
	var lust = 0
	var pain = 0
	if _receiver.getPersonality().getStat(PersonalityStat.Subby) > 0.4:
		if(checkDodged(_attacker, _receiver, DamageType.Physical)):
			return genericDodgeMessage(_attacker, _receiver, "collar teasing")
		lust = RNG.randi_range(40, 60)
		text = "{attacker.name} spins around an old slave collar attached to a leash. {receiver.name} observes the collar with {receiver.his} will breaking down wanting to submit."
		if(!_receiver.isDefocusing() && _receiver.addEffect(StatusEffect.Weakness, [1])):
			text += " {receiver.Name} feels [b]weak[/b]."
	else:
		if(checkDodged(_attacker, _receiver, DamageType.Physical)):
			return genericDodgeMessage(_attacker, _receiver, "collar throw")
		text = "{attacker.name} spins around an old slave collar attached to a leash until he changes the direction of swinging to hit {receiver.name} managing to hit {receiver.him} with the bulky collar."
		pain = RNG.randi_range(15, 30)

	return {
		text = text,
		lust = lust,
		pain = pain,
	}

func _canUse(_attacker, _receiver, _context = {}):
	return !_receiver.isBlindfolded()

func getAnticipationText(_attacker, _receiver):
	var text = "{attacker.name} grabs an old collar from behind and clasps a leash to it."

	return text

func getRequirements():
	return [AttackRequirement.FreeArms, AttackRequirement.FreeHands, AttackRequirement.CanSee]
