extends Character

# Hiisi is a relatively dominating character out of all three pets. He still has some HighSec energy in them

func _init():
	id = "hiisi"
	npcHasMenstrualCycle = false
	npcCharacterType = CharacterType.Inmate
	
	pickedSkin="ArconSkin"
	pickedSkinRColor=Color("ffc8c2c2")
	pickedSkinGColor=Color("ff423c51")
	pickedSkinBColor=Color("ff767676")
	npcSkinData={
	"hair": {"r": Color("ffb05745"),"g": Color("ffb05745"),"b": Color("ff2288ab"),},
	"penis": {"r": Color("ff4e2626"),"g": Color("ff9d2121"),"b": Color("ff991a1a"),},
	}
	npcPersonality = {
		PersonalityStat.Brat: 0.1,
		PersonalityStat.Mean: 0.4,
		PersonalityStat.Subby: 1.0,
		PersonalityStat.Impatient: 0.9,
		PersonalityStat.Naive: -1.0,
		PersonalityStat.Coward: -0.4,
	}
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
	
func interestVerbalReaction(interest):
	if(interest == InterestTopic.Pregnant):
		return "Oh, do you have litter in there? Cuuute, meoowwww!"
	if(interest == InterestTopic.Blindfolds):
		return "Purrr. How is your hearing? Can you hear me purring from over there?"
	
func _getName():
	return "Hiisi"

func getGender():
	return Gender.Male
	
func getSmallDescription() -> String:
	return "Wears an red uniform with number P-964."

func getSpecies():
	return [Species.Canine]

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
	var penis = GlobalRegistry.createBodypart("caninepenis")
	penis.lengthCM = 10
	penis.ballsScale = 1.2
	giveBodypartUnlessSame(penis)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	var tail = GlobalRegistry.createBodypart("huskytail")
	tail.tailScale = 1
	giveBodypartUnlessSame(tail)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))


func onGivingBirth(_impregnatedEggCells: Array, _newkids: Array):
	.onGivingBirth(_impregnatedEggCells, _newkids)

func getBirthWaitTime():
	return 60*60*24*2

func getDefaultEquipment():
	return ["inmatecollar", "inmateuniformHighSec"]
