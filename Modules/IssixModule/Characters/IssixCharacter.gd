extends Character

func _init():
	id = "issix"
	npcHasMenstrualCycle = false
	npcCharacterType = CharacterType.Inmate
	
	pickedSkin="HardcoreSkin"
	pickedSkinRColor=Color("ffca3030")
	pickedSkinGColor=Color("ff720505")
	pickedSkinBColor=Color("ff000000")
	npcSkinData={
	"head": {"skin": "CunningSkin",},
	"hair": {"r": Color("ffb05745"),"g": Color("ffb05745"),"b": Color("ff2288ab"),},
	"horns": {"r": Color("ffa9a9a9"),},
	"penis": {"g": Color("ffff0000"),"b": Color("ff8b0000"),},
	"legs": {"skin": "SplotchedSkin",},
	}
	npcPersonality = {
		PersonalityStat.Brat: 0.5,
		PersonalityStat.Mean: 1.0,
		PersonalityStat.Subby: -1.0,
		PersonalityStat.Impatient: 0.1,
		PersonalityStat.Naive: -1.0,
		PersonalityStat.Coward: -0.7,
	}
	npcLevel = 50
	npcBasePain = 400
	npcBaseLust = 400
	npcBaseStamina = 500
	npcArmor = {
		DamageType.Physical: 15,
		DamageType.Lust: 30,
	}
	npcStats = {
		Stat.Strength: 40,
	}
	npcDefaultFetishInterest = FetishInterest.Neutral
	npcFetishes = {
		Fetish.AnalSexReceiving : FetishInterest.ReallyDislikes,
		Fetish.AnalSexGiving : FetishInterest.Hates,
		Fetish.VaginalSexGiving : FetishInterest.Hates,
		Fetish.VaginalSexReceiving : FetishInterest.Loves,
		Fetish.OralSexReceiving : FetishInterest.Likes,
		Fetish.OralSexGiving : FetishInterest.Neutral,
		Fetish.Sadism : FetishInterest.ReallyDislikes,
		Fetish.Masochism : FetishInterest.Hates,
		Fetish.UnconsciousSex : FetishInterest.Loves,
		Fetish.BeingBred : FetishInterest.Dislikes,
		Fetish.Breeding : FetishInterest.Loves,
		Fetish.Bondage : FetishInterest.Likes,
		Fetish.Rigging : FetishInterest.Likes,
		Fetish.Condoms : FetishInterest.Dislikes,
		Fetish.DrugUse : FetishInterest.Likes,
		Fetish.Exhibitionism : FetishInterest.Loves,
		Fetish.Tribadism : FetishInterest.SlightlyDislikes,
		Fetish.StraponSexVaginal : FetishInterest.Dislikes,
		Fetish.StraponSexAnal : FetishInterest.SlightlyDislikes,
		Fetish.Choking : FetishInterest.SlightlyDislikes,
		Fetish.HypnosisSubject : FetishInterest.Loves,
	}
	npcLustInterests = {
		InterestTopic.TallyMarks: Interest.ReallyLikes,
		InterestTopic.Bodywritings: Interest.KindaLikes,
		InterestTopic.Gags: Interest.Loves,
		InterestTopic.Blindfolds: Interest.Loves,
		InterestTopic.BDSMRestraints: Interest.Loves,
		InterestTopic.ButtPlugs: Interest.Dislikes,
		InterestTopic.VaginalPlugs: Interest.Dislikes,
		InterestTopic.FeminineBody: Interest.KindaLikes,
		InterestTopic.AndroBody: Interest.Likes,
		InterestTopic.MasculineBody: Interest.ReallyLikes,
		InterestTopic.ThickBody: Interest.Dislikes,
		InterestTopic.SlimBody: Interest.Likes,
		InterestTopic.BigBreasts: Interest.Hates,
		InterestTopic.StuffedPussy: Interest.Likes,
		InterestTopic.StuffedPussyOrAss: Interest.KindaLikes,
		InterestTopic.Pregnant: Interest.ReallyLikes,
		InterestTopic.StuffedThroat: Interest.ReallyLikes,
		InterestTopic.CoveredInCum: Interest.ReallyLikes,
		InterestTopic.CoveredInLotsOfCum: Interest.Likes,
		InterestTopic.FullyNaked: Interest.Loves,
		InterestTopic.ExposedPussy: Interest.ReallyLikes,
		InterestTopic.ExposedAnus: Interest.ReallyLikes,
		InterestTopic.ExposedBreasts: Interest.Likes,
		InterestTopic.ExposedCock: Interest.ReallyLikes,
		InterestTopic.ExposedPanties: Interest.Hates,
		InterestTopic.ExposedBra: Interest.Hates,
		InterestTopic.LooseAnus: Interest.SlightlyDislikes,
		InterestTopic.LoosePussy: Interest.SlightlyDislikes,
		InterestTopic.TightAnus: Interest.Likes,
		InterestTopic.TightPussy: Interest.Likes,
		InterestTopic.BigCock: Interest.Hates,
	}

	
func interestVerbalReaction(interest):
	if(interest == InterestTopic.Pregnant):
		return "You are much better fit as a common breeder"
	if(interest == InterestTopic.Blindfolds):
		return "Overconfident much?"
	if(interest == InterestTopic.BigCock):
		return "Pretty big equipment you got there, have you tried using it?"
	if(interest == InterestTopic.SmallCock):
		return "Aww, so small. Don't worry, I think it's pretty cute, and as far as reproduction goes, it's pretty telling what your role in it is."
	if(interest == InterestTopic.HasVaginaAndCock):
		return "Oh wow, your biology blessed you with two? How versatile! Which one you prefer more? Breeder or a stud?"
	if(interest == InterestTopic.Bodywritings):
		return "I like it when sluts have advertisement all over themselves. Really encourages me to grab that marker."
	if(interest == InterestTopic.LactatingBreasts):
		return "You produce? Do you think I can have some of that milk for myself?"
	
func _getName():
	return "Issix"

func getGender():
	return Gender.Male

func _getAttacks():
	return ["IssixSlaveTease", "trygetupattack", "simplepunchattack","CuffPCHands", "ForceGagPC", "ForceMuzzlePC", "simplekickattack", "biteattack", "shoveattack", "PetCommandRoll", "PetCommandSit"]
	
func getSmallDescription() -> String:
	return "Wears a red block uniform with number P-533. He is an intimidating tall demon-dragon, has red fur."

func getInmateNumber() -> String:
	return "533"

func getSpecies():
	return [Species.Dragon, Species.Demon]

func getThickness() -> int:
	return 40

func getFemininity() -> int:
	return 0

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("dragonhead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("combedbackhair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("dragonears2"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("demonhorns3"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("buffarms"))
	var breasts = GlobalRegistry.createBodypart("malebreasts")
	breasts.size = 0
	giveBodypartUnlessSame(breasts)
	var penis = GlobalRegistry.createBodypart("dragonpenis")
	penis.lengthCM = 24
	penis.ballsScale = 1
	giveBodypartUnlessSame(penis)
	var tail = GlobalRegistry.createBodypart("demontail")
	tail.tailScale = 1
	giveBodypartUnlessSame(tail)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("hoofs"))
	skillsHolder.addPerk(Perk.BreedCumVolume)
	skillsHolder.addPerk(Perk.BreedCumVolumeV2)
	skillsHolder.addPerk(Perk.BreedCumProduction)
	skillsHolder.addPerk(Perk.BreedCumProductionV2)
	skillsHolder.addPerk(Perk.BreedCumProductionV3)
	skillsHolder.addPerk(Perk.BreedStud)
	skillsHolder.addPerk(Perk.BreedRapidConception)
	skillsHolder.addPerk(Perk.BreedCockSlap)
	skillsHolder.addPerk(Perk.BreedBreedersBliss)
	skillsHolder.addPerk(Perk.CombatBetterGetUp)
	skillsHolder.addPerk(Perk.CombatDoubleDown)
	skillsHolder.addPerk(Perk.CombatFullStaminaBonus)
	skillsHolder.addPerk(Perk.CombatScratching)
	skillsHolder.addPerk(Perk.CombatShove)

func getLootTable(_battleName):
	return InmateLoot.new()


func onGivingBirth(_impregnatedEggCells: Array, _newkids: Array):
	.onGivingBirth(_impregnatedEggCells, _newkids)

func getBirthWaitTime():
	return 60*60*24*10

func getDefaultEquipment():
	return ["inmatecollar", "inmateuniform"]
