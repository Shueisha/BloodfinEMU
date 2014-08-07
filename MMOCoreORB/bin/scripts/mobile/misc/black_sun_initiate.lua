black_sun_initiate = Creature:new {
	objectName = "",
	customName = "Black Sun Initiate",	
	socialGroup = "death_watch",
	pvpFaction = "death_watch",
	faction = "",
	level = 121,
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

	templates = {"object/mobile/dressed_dathomir_nightsister_slave.iff"},
	lootGroups = {
		{
			groups = {
				{group = "death_watch_bunker_commoners", chance = 6000000},
				{group = "death_watch_bunker_lootbox", chance = 8000000}
			},
			lootChance = 91000000
		}
	},
	weapons = {"pirate_weapons_heavy"},
	conversationTemplate = "",
	attacks = {
		{"defaultattack", ""},
		{"intimidationattack","intimidationChance=50"},
		{"knockdownattack","knockdownChance=50"}
	}
}

CreatureTemplates:addCreatureTemplate(black_sun_initiate, "black_sun_initiate")
