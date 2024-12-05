extends Character

# Incredibly subby and kinky creature, mostly aligns with mod's author preferences.'

func _init():
	id = "azazel"
	npcHasMenstrualCycle = true
	npcCharacterType = CharacterType.Inmate
	
	pickedSkin="AzazelSkin"
	pickedSkinRColor=Color("ff464545")
	pickedSkinGColor=Color("ff656465")
	pickedSkinBColor=Color("ff72005d")
	npcSkinData={
	   "hair": {"r": Color("ff221310"),"g": Color("ff1f1514"),"b": Color("ff28000c"),},
	   "horns": {"r": Color("ffa9a9a9"),"b": Color("ff606060"),},
	}
	npcPersonality = {
		PersonalityStat.Brat: -0.9,
		PersonalityStat.Mean: -1.0,
		PersonalityStat.Subby: 1.0,
		PersonalityStat.Impatient: 0.1,
		PersonalityStat.Naive: 1.0,
		PersonalityStat.Coward: 0.7,
	}
	npcLevel = 8
	npcBasePain = 80
	npcBaseLust = 80
	npcBaseStamina = 80
	npcDefaultFetishInterest = FetishInterest.Neutral
	
	npcFetishes = {
		Fetish.AnalSexReceiving : FetishInterest.Loves,
		Fetish.AnalSexGiving : FetishInterest.Hates,
		Fetish.VaginalSexGiving : FetishInterest.Hates,
		Fetish.VaginalSexReceiving : FetishInterest.Loves,
		Fetish.OralSexReceiving : FetishInterest.Likes,
		Fetish.Sadism : FetishInterest.ReallyDislikes,
		Fetish.Masochism : FetishInterest.Likes,
		Fetish.UnconsciousSex : FetishInterest.Hates,
		Fetish.Breeding : FetishInterest.Hates,
		Fetish.BeingBred : FetishInterest.Loves,
		Fetish.Bondage : FetishInterest.Loves,
		Fetish.Rigging : FetishInterest.Likes,
		Fetish.Condoms : FetishInterest.Dislikes,
		Fetish.DrugUse : FetishInterest.Likes,
		Fetish.Exhibitionism : FetishInterest.Loves,
		Fetish.Tribadism : FetishInterest.Dislikes,
		Fetish.StraponSexVaginal : FetishInterest.Dislikes,
		Fetish.StraponSexAnal : FetishInterest.SlightlyDislikes,
		Fetish.Choking : FetishInterest.SlightlyDislikes,
		Fetish.HypnosisSubject : FetishInterest.Loves,
	}
	npcLustInterests = {
		InterestTopic.TallyMarks: Interest.ReallyLikes,
		InterestTopic.Bodywritings: Interest.ReallyLikes,
		InterestTopic.Gags: Interest.Neutral,
		InterestTopic.Blindfolds: Interest.KindaLikes,
		InterestTopic.BDSMRestraints: Interest.Loves,
		InterestTopic.ButtPlugs: Interest.Neutral,
		InterestTopic.VaginalPlugs: Interest.Neutral,
		InterestTopic.FeminineBody: Interest.KindaLikes,
		InterestTopic.AndroBody: Interest.Loves,
		InterestTopic.MasculineBody: Interest.ReallyLikes,
		InterestTopic.ThickBody: Interest.Dislikes,
		InterestTopic.SlimBody: Interest.Loves,
		InterestTopic.BigBreasts: Interest.Hates,
		InterestTopic.StuffedPussy: Interest.Likes,
		InterestTopic.StuffedPussyOrAss: Interest.KindaLikes,
		InterestTopic.Pregnant: Interest.Loves,
		InterestTopic.StuffedThroat: Interest.ReallyLikes,
		InterestTopic.CoveredInCum: Interest.ReallyLikes,
		InterestTopic.CoveredInLotsOfCum: Interest.Loves,
		InterestTopic.FullyNaked: Interest.Loves,
		InterestTopic.ExposedPussy: Interest.Dislikes,
		InterestTopic.ExposedAnus: Interest.ReallyLikes,
		InterestTopic.ExposedBreasts: Interest.Hates,
		InterestTopic.ExposedCock: Interest.ReallyLikes,
		InterestTopic.ExposedPanties: Interest.Neutral,
		InterestTopic.ExposedBra: Interest.Neutral,
		InterestTopic.LooseAnus: Interest.Neutral,
		InterestTopic.LoosePussy: Interest.Neutral,
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
	return "Azazel"

func getGender():
	return Gender.Male
	
func getSmallDescription() -> String:
	return "Wears an lilac uniform with number P-655. He is the embodiment of ”meek”."

func getSpecies():
	return [Species.Feline]

func getThickness() -> int:
	return 0

func getFemininity() -> int:
	return 67

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felinehead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("combedbackhair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("dragonhorns"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felineears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	var breasts = GlobalRegistry.createBodypart("malebreasts")
	breasts.size = 0
	giveBodypartUnlessSame(breasts)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("vagina"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anuswomb"))
	var tail = GlobalRegistry.createBodypart("felinetail")
	tail.tailScale = 1
	giveBodypartUnlessSame(tail)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("plantilegs"))
	skillsHolder.addPerk(Perk.FertilityBroodmother)


func onGivingBirth(_impregnatedEggCells: Array, _newkids: Array):
	.onGivingBirth(_impregnatedEggCells, _newkids)

func getBirthWaitTime():
	return 60*60*24*2

func getDefaultEquipment():
	return ["inmatecollar", "inmateuniformSexDeviant"]
