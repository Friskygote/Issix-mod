
static func getSkinWord() -> String:
	var character_skin_name = "fur"
	if checkIfFoxlib():
		var Globals = load("res://FoxLib/Globals.gd")
		character_skin_name = Globals.ofModule("IssixModule").characterCoverage

	return character_skin_name

# Check if FoxLib is installed (this is shitty, we should check version too but I'm lazy)
static func checkIfFoxlib():
	var loaded_mods = GlobalRegistry.getLoadedMods()
	for item in loaded_mods:
		if "FoxLib" in item:
			return true
	return false


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

# Return average time for which there should be a walk
static func averageWalkTime() -> int:
	return 9

static func untilNextWalk(fake = false) -> int:
	var last_walk = GM.main.getModuleFlag("IssixModule", "Last_Walk", GM.main.getDays())
	var rng = RandomNumberGenerator.new()
	rng.seed = last_walk
	var variation = rng.randi_range(-2, 2)
	if fake:
		variation += rng.randi_range(1, 1)
	return last_walk + averageWalkTime() + variation - GM.main.getDays()

# Modify state of a state dict flag
static func modifyDictStates(flagName: String, stateKey: String, stateValue):
	var states = GM.main.getModuleFlag("IssixModule", flagName, {})
	states[stateKey] = stateValue
	GM.main.setModuleFlag("IssixModule", flagName, states.duplicate(true))

# Add Issix's mood'
static func addIssixMood(mood: int):
	GM.main.setModuleFlag("IssixModule", "Issix_Mood", clamp(GM.main.getModuleFlag("IssixModule", "Issix_Mood", 50)+mood, 0, 100))

# Get item that covers given inventory slot
static func getBodyCoveringItem(character, bodyslot):
	var equippedItems = character.getInventory().getAllEquippedItems()
	for inventorySlot in equippedItems:
		var item = equippedItems[inventorySlot]
		if(item.coversBodypart(bodyslot)):
			return true

	return null

# Verify requirements for pawns, requirements is array of two arrays, first one are methods which should return true in CharacterPawn obj and second is same but for BaseCharacter
static func verifyRequirements(pawn: CharacterPawn, requirements: Array) -> bool:
	if pawn.isPlayer():
		return false
	for method in requirements[0]:
		if !pawn.has_method(method) or !pawn.call(method):
			return false
	var base_character = pawn.getCharacter()
	for method in requirements[1]:
		base_character.has_method(method)
		if !base_character.call(method):
			return false
	return true

# Find pawns that succeed requirements in list of lists
# It returns list of lists of pawnIDs like dynamicnpc32
static func findPawns(requirements) -> Array:
	var all_pawns = GM.main.IS.getPawns()
	var results = []
	for pawn_requirement in requirements:
		var meet_criteria = []
		for pawn in all_pawns:
			if !verifyRequirements(all_pawns[pawn], pawn_requirement):
				continue
			meet_criteria.append(pawn)
		results.append(meet_criteria)
	return results

# Pick a unique random item for each of arrays
static func pick_unique_one(input_array: Array) -> Array:
	var sizes_of_arrays = []  # We will need to compare sized of arrays to first process smallest arrays
	var processed_array = input_array.duplicate(true)
	for array in input_array:
		sizes_of_arrays.append(array.size())

	for _item in range(input_array.size()):
		var smallest_array = sizes_of_arrays.min()
		var index = sizes_of_arrays.find(smallest_array)
		for _i in range(smallest_array):
			var pick = processed_array[index].pick_random()
			if pick in processed_array:
				processed_array[index].erase(pick)
				continue
			processed_array[index] = pick
			break
		if processed_array[index] is Array:
			processed_array[index] = null
		sizes_of_arrays[index] = 999999
	return processed_array

# This is a replacement for addButtonWithChecks which is entirely non-flexible in terms of adding new checks
static func addButtonCheckNoncon(text: String, tooltip: String, method: String, args=[]):
	if GM.main.getModuleFlag("IssixModule", "Noncon_Mode_Enabled", false) == true:
		GM.ui.addDisabledButton(text, RNG.pick(["That's not what Master wants to hear", "I don't want to be a bad pet!", "This isn't available to me, good pet obeys"]))
	else:
		GM.ui.addButton(text, tooltip, method, args)
