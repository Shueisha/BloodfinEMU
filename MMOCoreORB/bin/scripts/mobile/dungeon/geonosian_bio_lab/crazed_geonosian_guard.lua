crazed_geonosian_guard = Creature:new {
	objectName = "@mob/creature_names:geonosian_crazed_guard",
	socialGroup = "geonosian",
	pvpFaction = "",
	faction = "",
	level = 250,
	chanceHit = 22.64,
	damageMin = 580,
	damageMax = 770,
	baseXp = 22288,
	baseHAM = 41000,
	baseHAMmax = 55000,
	armor = 1,
	resists = {25,35,25,65,30,25,15,25,10},
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
	creatureBitmask = PACK + KILLER,
	optionsBitmask = 128,
	diet = HERBIVORE,

	templates = {
		"object/mobile/dressed_geonosian_warrior_01.iff",
		"object/mobile/dressed_geonosian_warrior_02.iff",
		"object/mobile/dressed_geonosian_warrior_03.iff"},
	lootGroups = {
	 	{
			{
	        	groups = 
			{
				{group = "armor_attachments", chance = 10000000},
			},
			lootChance = 1500000,
		},
	        	groups = 
			{
				{group = "geonosian_relic", chance = 3500000},
				{group = "geonosian_common", chance = 6500000},
			},
			lootChance = 3500000,
		},
	},
	weapons = {"geonosian_weapons"},
	conversationTemplate = "",
	attacks = merge(brawlermaster,marksmanmaster,pistoleermaster,riflemanmaster)
}

CreatureTemplates:addCreatureTemplate(crazed_geonosian_guard, "crazed_geonosian_guard")
