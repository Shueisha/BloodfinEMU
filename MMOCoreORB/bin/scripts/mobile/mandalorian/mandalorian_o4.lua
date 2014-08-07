mandalorian_o4 = Creature:new {
	objectName = "",
	customName = "Alor`ad",
	socialGroup = "",
	pvpFaction = "",
	faction = "",
	level = 240,
	chanceHit = 85,
	damageMin = 895,
	damageMax = 1000,
	baseXp = 14314,
	baseHAM = 151000,
	baseHAMmax = 151000,
	armor = 2,
	resists = {65,65,70,60,35,35,100,50,-1},
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

	templates = {"object/mobile/dressed_death_watch_grey.iff"},
	lootGroups = {},
	weapons = {"pirate_weapons_heavy"},
	conversationTemplate = "",
	attacks = {
		{"defaultattack", ""},
		{"intimidationattack","intimidationChance=50"},
		{"knockdownattack","knockdownChance=50"}
	}
}

CreatureTemplates:addCreatureTemplate(mandalorian_o4, "mandalorian_o4")
