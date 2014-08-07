eg6_port = Creature:new {
	objectName = "",
	customName = "Travel to Mos Bloodfin",
	socialGroup = "Townsperson",
	pvpFaction = "Townsperson",
	faction = "",
	level = 45,
	chanceHit = 0.47,
	damageMin = 395,
	damageMax = 500,
	baseXp = 4461,
	baseHAM = 9700,
	baseHAMmax = 11900,
	armor = 0,
	resists = {30,30,30,0,30,-1,30,-1,-1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = NONE,
	creatureBitmask = PACK + HEALER,
	optionsBitmask = 264,
	diet = HERBIVORE,

	templates = {"object/mobile/eg6_power_droid.iff"},
	lootGroups = {},
	weapons = {},
	conversationTemplate = "",
	attacks = {
	}
}

CreatureTemplates:addCreatureTemplate(eg6_port, "eg6_port")
