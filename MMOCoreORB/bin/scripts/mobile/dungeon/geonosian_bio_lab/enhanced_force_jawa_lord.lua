enhanced_force_jawa_lord = Creature:new {
	objectName = "@mob/creature_names:enhanced_force_jawa_lord",
	customName = "Hig Jib",
	socialGroup = "geonosian_creature",
	pvpFaction = "",
	faction = "",
	level = 1200,
	chanceHit = 300,
	damageMin = 4645,
	damageMax = 6000,
	baseXp = 9296845,
	baseHAM = 2306000,
	baseHAMmax = 2652000,
	armor = 3,
	resists = {85,85,85,85,85,85,85,85,65},
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
	creatureBitmask = PACK + HERD + KILLER,
	optionsBitmask = 128,
	diet = HERBIVORE,

	templates = {"object/mobile/jawa_male.iff"},
	lootGroups = {
		
		{
	        	groups = 
			{
				{group = "geo_crafting_jewelry_modified", chance = 10000000},
			},
			lootChance = 5000000,
		},
		{
	        	groups = 
			{
				{group = "geo_jawa_cache", chance = 10000000},
			},
			lootChance = 5000000,
		},
		
		{
	        	groups = 
			{
				{group = "armor_attachments", chance = 10000000},
			},
			lootChance = 7500000,
		},
		{
	        	groups = 
			{
				{group = "armor_attachments", chance = 10000000},
			},
			lootChance = 7500000,
		},
		{
	        	groups = 
			{
				{group = "armor_attachments", chance = 10000000},
			},
			lootChance = 7500000,
		},
	   	{
			groups = {
				{group = "geonosian_epic", chance = 10000000},
			},
			lootChance = 7500000,
		},
		{
			groups = 
			{
				{group = "geonosian_epic", chance = 2500000},
				{group = "enhanced_geo_armor", chance = 1500000},
				{group = "enhanced_melee_geo_weapons", chance = 3000000},
				{group = "enhanced_ranged_geo_weapons", chance = 3000000},
			},
			lootChance = 7500000,
		},
		{
	        	groups = 
			{
				{group = "jedi_geocave_jewelry", chance = 7500000},
				{group = "mastery_geocave_jewelry", chance = 2500000},
			},
			lootChance = 7500000,
		},
		{
			groups = 
			{
				{group = "crystals_premium", chance = 10000000},
			},
			lootChance = 7500000,
		},
		{
			groups = 
			{
				{group = "crystals_premium", chance = 10000000},
			},
			lootChance = 7500000,
		},				
	},
	weapons = {"light_jedi_weapons"},
	conversationTemplate = "",
	attacks = merge(lightsabermaster,forcepowermaster)
}

CreatureTemplates:addCreatureTemplate(enhanced_force_jawa_lord, "enhanced_force_jawa_lord")
