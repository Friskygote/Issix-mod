extends "res://Game/InteractionSystem/PawnTypes/Guard.gd"

func onPawnSpawned(_pawn:CharacterPawn):
	_pawn.getChar().npcAttacks.append("PetCommandSit")
	_pawn.getChar().npcAttacks.append("PetCommandRoll")
