extends Character

func _init():
	id = "lamia"
	npcHasMenstrualCycle = false
	npcCharacterType = CharacterType.Inmate
	
	pickedSkin="DappledSkin"
	pickedSkinRColor=Color("ffca6702")
	pickedSkinGColor=Color("ffbb3e03")
	pickedSkinBColor=Color("ff9b2226")
	npcSkinData={
	"hair": {"r": Color("ff274fb9"),"g": Color("ff243770"),"b": Color("ff3022ab"),},
	"horns": {"r": Color("ff000000"),"g": Color("ff000000"),},
	"penis": {"r": Color("ff2b2a2a"),"g": Color("ff373232"),"b": Color("ff8b0000"),},
	"tail": {"skin": "WildSkin",},
	}
	npcPersonality = {
		PersonalityStat.Brat: -0.9,
		PersonalityStat.Mean: 0.4,
		PersonalityStat.Subby: 1.0,
		PersonalityStat.Impatient: 0.9,
		PersonalityStat.Naive: -1.0,
		PersonalityStat.Coward: -0.4,
	}
	npcDefaultFetishInterest = FetishInterest.Neutral
	npcLevel = 20
	npcBasePain = 180
	npcBaseLust = 2000
	npcBaseStamina = 100
	npcFetishes = {
		Fetish.AnalSexReceiving : FetishInterest.ReallyDislikes,
		Fetish.AnalSexGiving : FetishInterest.Hates,
		Fetish.VaginalSexGiving : FetishInterest.Hates,
		Fetish.OralSexReceiving : FetishInterest.Dislikes,
		Fetish.OralSexGiving : FetishInterest.Dislikes,
		Fetish.Sadism : FetishInterest.Hates,
		Fetish.Masochism : FetishInterest.Hates,
		Fetish.UnconsciousSex : FetishInterest.Hates,
		Fetish.Breeding : FetishInterest.Hates,
		Fetish.Bondage : FetishInterest.Dislikes,
		Fetish.Rigging : FetishInterest.Dislikes,
		Fetish.Condoms : FetishInterest.Dislikes,
		Fetish.DrugUse : FetishInterest.Dislikes,
		Fetish.Exhibitionism : FetishInterest.Dislikes,
		Fetish.Tribadism : FetishInterest.SlightlyDislikes,
		Fetish.StraponSexVaginal : FetishInterest.Dislikes,
		Fetish.StraponSexAnal : FetishInterest.SlightlyDislikes,
		Fetish.Choking : FetishInterest.SlightlyDislikes,
		Fetish.HypnosisSubject : FetishInterest.Hates,
		Fetish.HypnosisHypnotist : FetishInterest.Hates,
	}
	npcLustInterests = {
		InterestTopic.TallyMarks: Interest.Dislikes,
		InterestTopic.Bodywritings: Interest.Dislikes,
		InterestTopic.Gags: Interest.Dislikes,
		InterestTopic.Blindfolds: Interest.Dislikes,
		InterestTopic.BDSMRestraints: Interest.Dislikes,
		InterestTopic.ButtPlugs: Interest.Dislikes,
		InterestTopic.VaginalPlugs: Interest.Dislikes,
		InterestTopic.FeminineBody: Interest.KindaLikes,
		InterestTopic.AndroBody: Interest.Likes,
		InterestTopic.MasculineBody: Interest.ReallyLikes,
		InterestTopic.ThickBody: Interest.Dislikes,
		InterestTopic.SlimBody: Interest.Dislikes,
		InterestTopic.BigBreasts: Interest.Hates,
		InterestTopic.StuffedPussy: Interest.Dislikes,
		InterestTopic.StuffedPussyOrAss: Interest.Dislikes,
		InterestTopic.Pregnant: Interest.Dislikes,
		InterestTopic.StuffedThroat: Interest.Dislikes,
		InterestTopic.CoveredInCum: Interest.Dislikes,
		InterestTopic.CoveredInLotsOfCum: Interest.Dislikes,
		InterestTopic.FullyNaked: Interest.Loves,
		InterestTopic.ExposedPussy: Interest.ReallyLikes,
		InterestTopic.ExposedAnus: Interest.ReallyLikes,
		InterestTopic.ExposedBreasts: Interest.ReallyLikes,
		InterestTopic.ExposedCock: Interest.ReallyLikes,
		InterestTopic.ExposedPanties: Interest.Hates,
		InterestTopic.ExposedBra: Interest.Hates,
		InterestTopic.LooseAnus: Interest.Dislikes,
		InterestTopic.LoosePussy: Interest.Dislikes,
		InterestTopic.TightAnus: Interest.Dislikes,
		InterestTopic.TightPussy: Interest.Dislikes,
		InterestTopic.BigCock: Interest.Hates,
	}
	
func interestVerbalReaction(interest):
	if(interest == InterestTopic.Pregnant):
		return "Oh, do you have litter in there? Cuuute, meoowwww!"
	if(interest == InterestTopic.Blindfolds):
		return "Purrr. How is your hearing? Can you hear me purring from over there?"
	
func _getName():
	return "Lamia"

func getGender():
	return Gender.Male
	
func getSmallDescription() -> String:
	return "Wears an orange uniform with number P-790."

func getSpecies():
	return [Species.Canine]  # if in the future foxes are introduced, the character is canonically a fox

func onGivingBirth(_impregnatedEggCells: Array, _newkids: Array):
	.onGivingBirth(_impregnatedEggCells, _newkids)

func getBirthWaitTime():
	return 60*60*24*2

func getDefaultEquipment():
	return ["inmatecollar", "inmateuniform"]

func getThickness() -> int:
	return 70

func getFemininity() -> int:
	return 20

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	var breasts = GlobalRegistry.createBodypart("malebreasts")
	breasts.size = 0
	giveBodypartUnlessSame(breasts)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("foxhead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("messyhair2"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("fennecears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("dragonhorns"))
	var penis = GlobalRegistry.createBodypart("felinepenis")
	penis.lengthCM = 15
	penis.ballsScale = 1
	giveBodypartUnlessSame(penis)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anuswomb"))
	var tail = GlobalRegistry.createBodypart("foxtail")
	tail.tailScale = 0.5
	giveBodypartUnlessSame(tail)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))
	skillsHolder.addPerk(Perk.StartInfertile)
