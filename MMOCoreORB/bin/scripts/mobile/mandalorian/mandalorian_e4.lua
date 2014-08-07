mandalorian_e4 = Creature:new {
	objectName = "",
	customName = "Alor`uus",
	socialGroup = "",
	pvpFaction = "",
	faction = "",
	level = 140,
	chanceHit = 40,
	damageMin = 745,
	damageMax = 1200,
	baseXp = 11390,
	baseHAM = 50000,
	baseHAMmax = 50000,
	armor = 2,
	resists = {55,55,70,60,30,30,100,40,-1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = KILLER,
	optionsBitmask = 128,
	diet = HERBIVORE,

	templates = {"object/mobile/dressed_death_watch_red.iff"},
	lootGroups = {},
	weapons = {"pirate_weapons_heavy"},
	conversationTemplate = "",
	attacks = {
		{"defaultattack", ""},
		{"intimidationattack","intimidationChance=50"},
		{"knockdownattack","knockdownChance=50"}
	}
}

CreatureTemplates:addCreatureTemplate(mandalorian_e4, "mandalorian_e4")
