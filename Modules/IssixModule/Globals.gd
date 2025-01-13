const Globals = preload("res://FoxLib/Globals.gd")


static func getSkinWord() -> String:
	var character_skin_name = Globals.ofModule("IssixModule").characterCoverage
	return character_skin_name


# Undress the player of everything but unremovable restraints
static func undressPlayerExceptCollar(name: String):
	for slot in GM.pc.getInventory().getEquippedItems():  # Force unequip all items, why is there getEquippedItems and getAllEquippedItems doing the same thing lol
		var item = GM.pc.getInventory()["equippedItems"][slot]
		if item.isRestraint() and item.getRestraintData() is RestraintUnremovable:  # ignore collar
			continue
		GM.main.addMessage(name+" took off your "+item.getVisibleName()+".")
		GM.pc.getInventory().unequipSlot(slot)
	return

# Check if character is wearing PERMANENT restraints on both vagina and penis
static func hasPermanentChasityOnBoth(characterID: String):
	var blocked_penis = false
	var character = GlobalRegistry.getCharacter(characterID)
	if character == null:
		return null
	if character.hasPenis():
		var item = character.getInventory().getEquippedItem(BodypartSlot.Penis)
		if item != null and item.isRestraint() and item.getRestraintData() is RestraintUnremovable:
			blocked_penis = true
	if character.hasVagina():
		var item = character.getInventory().getEquippedItem(BodypartSlot.Vagina)
		if item != null and item.isRestraint() and item.getRestraintData() is RestraintUnremovable:
			if blocked_penis:
				return true
		blocked_penis = false
	return blocked_penis


# Check if player has any restraints that would be considered unremovable or has any clothes
static func isPlayerSuperNaked() -> bool:
	for slot in GM.pc.getInventory().getEquippedItems():
		var item = GM.pc.getInventory()["equippedItems"][slot]
		if item.isRestraint() and item.getRestraintData() is RestraintUnremovable:  # ignore collar
			continue
		return false
	return GM.pc.isFullyNaked()


# Can you believe it's not in base game? Function to learn interests in array of certain character
static func learnInterestOf(characterID: String, interests: Array):
	var character = GlobalRegistry.getCharacter(characterID)
	if character == null:
		return
	var lust_interests = character.getLustInterests()
	var player_knows = lust_interests.getPlayerKnowledge()
	for interest in interests:
		if !lust_interests.interests.has(interest):
			continue
		if(!player_knows.has(interest) || player_knows[interest] != lust_interests.interests[interest]):
			player_knows[interest] = lust_interests.interests[interest]

# Find a pet name for the player
static func getPlayerPetName():
	if Species.Canine in GM.pc.getSpecies():
		return "puppy"
	elif Species.Feline in GM.pc.getSpecies():
		return "kitty"
	elif Species.Equine in GM.pc.getSpecies():
		return "pony"
	else:
		return "pet"

# If player is enslaved
static func checkIfPCEnslaved() -> bool:
	return GM.main.getModuleFlag("IssixModule", "PC_Enslavement_Role", 0) >= 1

# Check if a state exists inside stateKey dict flag storage
static func checkIfAchieved(flagName: String, stateKey: String) -> bool:
	return GM.main.getModuleFlag("IssixModule", flagName, {}).has(stateKey)

static func returnValueFromStateFlag(flagName: String, stateKey: String, default=null):
	return GM.main.getModuleFlag("IssixModule", flagName, {}).get(stateKey, default)

# Modify state of a state dict flag
static func modifyDictStates(flagName: String, stateKey: String, stateValue):
	var states = GM.main.getModuleFlag("IssixModule", flagName, {})
	states[stateKey] = stateValue
	GM.main.setModuleFlag("IssixModule", flagName, states.duplicate(true))
