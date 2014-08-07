rebel_surface_marshall = Creature:new {
	objectName = "@mob/creature_names:rebel_surface_marshal",
	socialGroup = "rebel",
	pvpFaction = "rebel",
	faction = "rebel",
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

	templates = {
		"object/mobile/dressed_rebel_surface_marshal_moncal_female_01.iff",
		"object/mobile/dressed_rebel_surface_marshal_rodian_male_01.iff",
		"object/mobile/dressed_rebel_surface_marshal_human_male_01.iff",
		"object/mobile/dressed_rebel_surface_marshal_rodian_female_01.iff",
		"object/mobile/dressed_rebel_surface_marshal_twk_male_fat_01.iff",
		"object/mobile/dressed_rebel_surface_marshal_zabrak_male_01.iff"},
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
	weapons = {"rebel_weapons_heavy"},
	conversationTemplate = "",
	attacks = merge(riflemanmaster,pistoleermaster,carbineermaster,brawlermaster)
}

CreatureTemplates:addCreatureTemplate(rebel_surface_marshall, "rebel_surface_marshall")
