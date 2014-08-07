mandalorian_o5 = Creature:new {
	objectName = "",
	customName = "Alor`itsad",
	socialGroup = "",
	pvpFaction = "",
	faction = "",
	level = 250,
	chanceHit = 85,
	damageMin = 895,
	damageMax = 1000,
	baseXp = 14314,
	baseHAM = 171000,
	baseHAMmax = 171000,
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
	lootGroups = {
		{
			groups = {
				{group = "death_watch_bunker_commoners",   chance = 2000000},
				{group = "death_watch_bunker_lieutenants", chance = 3000000},
				{group = "death_watch_epic_loot", chance = 1000000},
				{group = "death_watch_bunker_ingredient",  chance = 1000000},
				{group = "clothing_attachments",  chance = 1500000},
				{group = "armor_attachments",  chance = 1500000}
			},
			lootChance = 4000000
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

CreatureTemplates:addCreatureTemplate(mandalorian_o5, "mandalorian_o5")
