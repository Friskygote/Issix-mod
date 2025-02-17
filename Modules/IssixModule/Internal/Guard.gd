extends "res://Game/InteractionSystem/PawnTypes/Guard.gd"

func onPawnSpawned(_pawn:CharacterPawn):
	.onPawnSpawned(_pawn)
	if RNG.chance(50):
		_pawn.getChar().npcAttacks.append("PetCommandSit")
	if RNG.chance(50):
		_pawn.getChar().npcAttacks.append("PetCommandRoll")
