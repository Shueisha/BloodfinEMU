mandalorian_c2 = Creature:new {
	objectName = "",
	customName = "Al`verde",
	socialGroup = "",
	pvpFaction = "",
	faction = "",
	level = 315,
	chanceHit = 122.5,
	damageMin = 1020,
	damageMax = 1150,
	baseXp = 16794,
	baseHAM = 212000,
	baseHAMmax = 212000,
	armor = 2,
	resists = {75,75,90,80,45,45,100,70,-1},
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

	templates = {"object/mobile/dressed_death_watch_silver.iff"},
	lootGroups = {},
	weapons = {"pirate_weapons_heavy"},
	conversationTemplate = "",
	attacks = {
		{"defaultattack", ""},
		{"intimidationattack","intimidationChance=50"},
		{"knockdownattack","knockdownChance=50"}
	}
}

CreatureTemplates:addCreatureTemplate(mandalorian_c2, "mandalorian_c2")
