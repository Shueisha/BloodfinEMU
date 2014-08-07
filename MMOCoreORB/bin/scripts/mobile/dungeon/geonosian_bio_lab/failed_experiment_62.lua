failed_experiment_62 = Creature:new {
	objectName = "@mob/creature_names:failed_experiment_62",
	customName = "Failed Experiment #62",
	socialGroup = "geonosian_creature",
	pvpFaction = "",
	faction = "",
	level = 400,
	chanceHit = 35.5,
	damageMin = 3035,
	damageMax = 3580,
	baseXp = 49884,
	baseHAM = 551600,
	baseHAMmax = 648000,
	armor = 3,
	resists = {0,0,0,0,0,0,0,0,0},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 25,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER,
	optionsBitmask = 128,
	diet = CARNIVORE,

	templates = {"object/mobile/acklay_hue.iff"},
	scale = 0.5,
	lootGroups = {
		{
	        	groups = 
			{
				{group = "geo_crafting_jewelry_modified", chance = 5000000},
			},
			lootChance = 5500000,
		},
		{
	        	groups = 
			{
				{group = "armor_attachments", chance = 10000000},
			},
			lootChance = 5000000,
		},
		{
	        	groups = 
			{
				{group = "mastery_geocave_jewelry", chance = 10000000},
			},
			lootChance = 4500000,
		},
		{
			groups = 
			{
				{group = "geonosian_epic", chance = 2500000},
				{group = "enhanced_ranged_geo_weapons", chance = 7500000},
			},
			lootChance = 1500000,
		},
		{
			groups = 
			{
				{group = "acklay", chance = 10000000},
			},
			lootChance = 2500000,
		},
	},
	weapons = {},
	conversationTemplate = "",
	attacks = {
		{"creatureareacombo",""},
		{"posturedownattack","postureDownChance=75"}
	}
}

CreatureTemplates:addCreatureTemplate(failed_experiment_62, "failed_experiment_62")
