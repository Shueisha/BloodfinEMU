enhanced_gaping_spider = Creature:new {
	objectName = "@mob/creature_names:geonosian_gaping_spider_fire",
	customName = "Fire Breathing Spider",
	socialGroup = "geonosian_creature",
	pvpFaction = "",
	faction = "",
	level = 115,
	chanceHit = 75.5,
	damageMin = 2515,
	damageMax = 2940,
	baseXp = 10267,
	baseHAM = 250000,
	baseHAMmax = 329000,
	armor = 2,
	resists = {50,35,25,95,45,35,25,45,15},
	meatType = "meat_insect",
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
	diet = CARNIVORE,

	templates = {"object/mobile/gaping_spider.iff"},
	scale = 3.0,
	lootGroups = {
		{
	        	groups = 
			{
				{group = "geo_crafting_jewelry_modified", chance = 5000000},
			},
			lootChance = 3500000,
		},
		{
			groups = 
			{
				{group = "fire_breathing_spider", chance = 7500000},
				{group = "geonosian_epic", chance = 2500000},
			},
			lootChance = 4500000,
		},
		{
	        	groups = 
			{
				{group = "armor_attachments", chance = 3500000},
				{group = "geonosian_relic", chance = 5500000},
				{group = "mastery_geocave_jewelry", chance = 1000000},
			},
			lootChance = 6500000,
		},	
	},
	weapons = {"creature_spit_small_toxicgreen"},
	conversationTemplate = "",
	attacks = {
		{"strongpoison",""},
		{"stunattack","stunChance=85"}
	}
}

CreatureTemplates:addCreatureTemplate(enhanced_gaping_spider, "enhanced_gaping_spider")
