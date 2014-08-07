enhanced_rancor = Creature:new {
	objectName = "@mob/creature_names:enhanced_rancor",
	customName = "an Escaped Dangerous Project",
	socialGroup = "geonosian_creature",
	pvpFaction = "",
	faction = "",
	level = 600,
	chanceHit = 45.5,
	damageMin = 4000,
	damageMax = 4800,
	baseXp = 79336,
	baseHAM = 950000,
	baseHAMmax = 1000000,
	armor = 3,
	resists = {55,60,45,70,70,70,45,45,35},
	meatType = "meat_carnivore",
	meatAmount = 0,
	hideType = "hide_leathery",
	hideAmount = 0,
	boneType = "bone_mammal",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 15,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER,
	optionsBitmask = 128,
	diet = CARNIVORE,

	templates = {"object/mobile/bull_rancor.iff"},
	scale = 1.5,
	lootGroups = {	
		{
	        	groups = 
			{
				{group = "geo_crafting_jewelry_modified", chance = 5000000},
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
				{group = "geonosian_relic", chance = 6500000},
				{group = "mastery_geocave_jewelry", chance = 3500000},
			},
			lootChance = 6500000,
		},
		{
			groups = 
			{
				{group = "geonosian_epic", chance = 2500000},
				{group = "enhanced_geo_armor", chance = 1500000},
				{group = "enhanced_melee_geo_weapons", chance = 3000000},
				{group = "enhanced_ranged_geo_weapons", chance = 3000000},
			},
			lootChance = 6000000,
		},
		{
			groups = {
				{group = "geo_rancor", chance = 4500000},
				{group = "grenades_looted", chance = 5500000},
			},
			lootChance = 7500000,
		},
	},
	weapons = {},
	conversationTemplate = "",
	attacks = {
		{"creatureareattack",""},
		{"stunattack","stunChance=70"},
		{"creatureareableeding",""}
	}
}

CreatureTemplates:addCreatureTemplate(enhanced_rancor, "enhanced_rancor")
