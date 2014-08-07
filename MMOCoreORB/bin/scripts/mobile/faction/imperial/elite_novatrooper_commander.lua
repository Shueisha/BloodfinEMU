elite_novatrooper_commander = Creature:new {
	objectName = "@mob/creature_names:stormtrooper_novatrooper_elite_commander",
	socialGroup = "imperial",
	pvpFaction = "imperial",
	faction = "imperial",
	level = 81,
	chanceHit = 160,
	damageMin = 145,
	damageMax = 200,
	baseXp = 19104,
	baseHAM = 60000,
	baseHAMmax = 95000,
	armor = 3,
	resists = {25,25,20,20,10,25,10,25,-1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = AGGRESSIVE + ATTACKABLE,
	creatureBitmask = PACK + KILLER,
	optionsBitmask = 128,
	diet = HERBIVORE,

	templates = {"object/mobile/dressed_stormtrooper_commander_black_gold.iff"},
	lootGroups = {
		{
			groups = {
				{group = "holocron_dark", chance = 600000},
				{group = "holocron_light", chance = 600000},
				{group = "clothing_attachments", chance = 600000},
				{group = "armor_attachments", chance = 1100000},
				{group = "clothing_attachments", chance = 1100000}
			},
			lootChance = 91500000
		}	
	},
	weapons = {"stormtrooper_weapons"},
	conversationTemplate = "",
	attacks = merge(riflemanmaster,pistoleermaster,carbineermaster,brawlermaster)
}

CreatureTemplates:addCreatureTemplate(elite_novatrooper_commander, "elite_novatrooper_commander")
