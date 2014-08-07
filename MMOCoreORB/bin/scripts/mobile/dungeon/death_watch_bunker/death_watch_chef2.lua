death_watch_chef2 = Creature:new {
	objectName = "",
	customName = "Death Watch Chef Fracaise",	
	socialGroup = "death_watch",
	pvpFaction = "death_watch",
	faction = "",
	level = 221,
	chanceHit = 40,
	damageMin = 745,
	damageMax = 1200,
	baseXp = 11390,
	baseHAM = 80000,
	baseHAMmax = 80000,
	armor = 0,
	resists = {0,0,0,0,0,0,0,0,-1},
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

	templates = {"object/mobile/dressed_sigrix_slix.iff"},
	lootGroups = {
		{
			groups = {
				{group = "death_watch_bunker_commoners", chance = 6000000},
				{group = "death_watch_bunker_lieutenants", chance = 4000000}
			},
			lootChance = 1000000
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

CreatureTemplates:addCreatureTemplate(death_watch_chef2, "death_watch_chef2")
