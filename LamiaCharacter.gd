extends Character

func _init():
	id = "lamia"
	npcHasMenstrualCycle = false
	npcCharacterType = CharacterType.Inmate
	
	pickedSkin="SoftSpikySkin" # TODO Check options
	pickedSkinRColor=Color("ffca3030")
	pickedSkinGColor=Color("ff720505")
	pickedSkinBColor=Color("ff000000")
	npcSkinData={
	   "hair": {"r": Color("ffb05745"),"g": Color("ffb05745"),"b": Color("ff2288ab"),},
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
	npcFetishes = {
		Fetish.AnalSexReceiving : FetishInterest.ReallyDislikes,
		Fetish.AnalSexGiving : FetishInterest.Hates,
		Fetish.VaginalSexGiving : FetishInterest.Hates,
		Fetish.VaginalSexReceiving : FetishInterest.Loves,
		Fetish.OralSexReceiving : FetishInterest.Likes,
		Fetish.OralSexGiving : FetishInterest.Likes,
		Fetish.Sadism : FetishInterest.ReallyDislikes,
		Fetish.Masochism : FetishInterest.Hates,
		Fetish.UnconsciousSex : FetishInterest.Loves,
		Fetish.BeingBred : FetishInterest.Dislikes,
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
		InterestTopic.ExposedBreasts: Interest.ReallyLikes,
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
		return "Oh, do you have litter in there? Cuuute, meoowwww!"
	if(interest == InterestTopic.Blindfolds):
		return "Purrr. How is your hearing? Can you hear me purring from over there?"
	
func _getName():
	return "Lamia"

func getGender():
	return Gender.Male
	
func getSmallDescription() -> String:
	return "Wears an orange uniform with number P-655. He is the embodiment of ”meek”."

func getSpecies():
	return [Species.Canine]  # if in the future foxes are introduced, the character is canonically a fox

func onGivingBirth(_impregnatedEggCells: Array, _newkids: Array):
	.onGivingBirth(_impregnatedEggCells, _newkids)

func getBirthWaitTime():
	return 60*60*24*2

func getDefaultEquipment():
	return ["inmatecollar", "inmateuniformGeneral"]

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
