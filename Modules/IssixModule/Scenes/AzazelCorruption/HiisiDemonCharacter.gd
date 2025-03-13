extends Character

# Hiisi is a relatively dominating character out of all three pets. He still has some HighSec energy in them

func _init():
	id = "hiisidemon"
	npcHasMenstrualCycle = false
	npcCharacterType = CharacterType.Inmate
	
	pickedSkin="ArconSkin"
	pickedSkinRColor=Color("ffc53232")
	pickedSkinGColor=Color("ff7b7877")
	pickedSkinBColor=Color("ffff0303")
	npcSkinData={
	"hair": {"r": Color("ffff2b00"),"g": Color("ffb05745"),"b": Color("ff2288ab"),},
	"penis": {"r": Color("ff000000"),"g": Color("ff000000"),"b": Color("ff991a1a"),},
	}
	npcPersonality = {
		PersonalityStat.Brat: 0.9,
		PersonalityStat.Mean: 0.4,
		PersonalityStat.Subby: 1.0,
		PersonalityStat.Impatient: 0.9,
		PersonalityStat.Naive: -1.0,
		PersonalityStat.Coward: -1.0,
	}
	npcLevel = 25
	npcBasePain = 250
	npcBaseLust = 250
	npcBaseStamina = 200
	npcDefaultFetishInterest = FetishInterest.Neutral
	npcFetishes = {
		Fetish.AnalSexReceiving : FetishInterest.ReallyDislikes,
		Fetish.AnalSexGiving : FetishInterest.Likes,
		Fetish.VaginalSexGiving : FetishInterest.Likes,
		Fetish.OralSexReceiving : FetishInterest.Likes,
		Fetish.OralSexGiving : FetishInterest.SlightlyDislikes,
		Fetish.Sadism : FetishInterest.Likes,
		Fetish.Masochism : FetishInterest.Hates,
		Fetish.UnconsciousSex : FetishInterest.Likes,
		Fetish.Bondage : FetishInterest.Likes,
		Fetish.Rigging : FetishInterest.Likes,
		Fetish.Breeding : FetishInterest.Dislikes,
		Fetish.Condoms : FetishInterest.Likes,
		Fetish.DrugUse : FetishInterest.SlightlyDislikes,
		Fetish.Tribadism : FetishInterest.Dislikes,
		Fetish.StraponSexVaginal : FetishInterest.Dislikes,
		Fetish.StraponSexAnal : FetishInterest.Dislikes,
		Fetish.Choking : FetishInterest.Likes,
		Fetish.HypnosisSubject : FetishInterest.Hates,
		Fetish.HypnosisHypnotist : FetishInterest.Loves
	}
	npcLustInterests = {
		InterestTopic.TallyMarks: Interest.ReallyLikes,
		InterestTopic.Bodywritings: Interest.KindaLikes,
		InterestTopic.Gags: Interest.Loves,
		InterestTopic.Blindfolds: Interest.Loves,
		InterestTopic.BDSMRestraints: Interest.Loves,
		InterestTopic.ButtPlugs: Interest.Dislikes,
		InterestTopic.VaginalPlugs: Interest.Dislikes,
		InterestTopic.FeminineBody: Interest.Likes,
		InterestTopic.AndroBody: Interest.Likes,
		InterestTopic.StuffedPussy: Interest.Likes,
		InterestTopic.StuffedPussyOrAss: Interest.KindaLikes,
		InterestTopic.StuffedThroat: Interest.Likes,
		InterestTopic.CoveredInCum: Interest.Dislikes,
		InterestTopic.CoveredInLotsOfCum: Interest.Dislikes,
		InterestTopic.FullyNaked: Interest.Likes,
		InterestTopic.ExposedPussy: Interest.ReallyLikes,
		InterestTopic.ExposedAnus: Interest.ReallyLikes,
		InterestTopic.ExposedBreasts: Interest.Likes,
		InterestTopic.ExposedCock: Interest.KindaLikes,
		InterestTopic.ExposedPanties: Interest.Likes,
		InterestTopic.ExposedBra: Interest.Likes,
		InterestTopic.TightAnus: Interest.Likes,
		InterestTopic.TightPussy: Interest.Likes,
		InterestTopic.BigCock: Interest.Hates,
	}

	
func _getName():
	return "Demonic Hiisi"

func getGender():
	return Gender.Male
	
func getSmallDescription() -> String:
	return "Wears an red uniform with number P-964."

func getSpecies():
	return [Species.Demon, Species.Canine]

func getThickness() -> int:
	return 23

func getFemininity() -> int:
	return 0

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	var breasts = GlobalRegistry.createBodypart("malebreasts")
	breasts.size = 0
	giveBodypartUnlessSame(breasts)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("caninehead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("simplehair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("canineears3"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("demonhorns"))
	var penis = GlobalRegistry.createBodypart("caninepenis")
	penis.lengthCM = 19
	penis.ballsScale = 1.2
	giveBodypartUnlessSame(penis)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	var tail = GlobalRegistry.createBodypart("demontail")
	tail.tailScale = 1.25
	giveBodypartUnlessSame(tail)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))
	skillsHolder.addPerk(Perk.CombatBetterGetUp)
	skillsHolder.addPerk(Perk.CombatDoubleDown)
	skillsHolder.addPerk(Perk.CombatShove)
	skillsHolder.addPerk(Perk.HypnosisFastAsleep)

func onGivingBirth(_impregnatedEggCells: Array, _newkids: Array):
	.onGivingBirth(_impregnatedEggCells, _newkids)

func getBirthWaitTime():
	return 60*60*24*2

func getDefaultEquipment():
	return ["oldcollar","LeatherJacket", "sportyBriefs"]
