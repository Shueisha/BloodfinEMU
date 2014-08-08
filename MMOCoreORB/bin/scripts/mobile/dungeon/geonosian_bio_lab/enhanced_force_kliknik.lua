enhanced_force_kliknik = Creature:new {
	objectName = "@mob/creature_names:enhanced_force_kliknik",
	customName = "Force Kliknik",
	socialGroup = "geonosian_creature",
	pvpFaction = "",
	faction = "",
	level = 425,
	chanceHit = 39.2,
	damageMin = 875,
	damageMax = 1160,
	baseXp = 20360,
	baseHAM = 47000,
	baseHAMmax = 63000,
	armor = 2,
	resists = {45,45,45,95,45,45,45,45,25},
	meatType = "meat_carnivore",
	meatAmount = 0,
	hideType = "hide_scaley",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 15,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER,
	optionsBitmask = 128,
	diet = CARNIVORE,

	templates = {"object/mobile/kliknik_hue.iff"},
	scale = 1.65,
	lootGroups = {
		{
	        	groups = 
			{
				{group = "armor_attachments", chance = 10000000},
			},
			lootChance = 4500000,
		},
		{
	        	groups = 
			{
				{group = "geo_crafting_jewelry_modified", chance = 10000000},
			},
			lootChance = 1500000,
		},
	 	{
	        	groups = 
			{
				
				{group = "geonosian_relic", chance = 3500000},
				{group = "geonosian_common", chance = 5000000},
				{group = "mastery_geocave_jewelry", chance = 1500000},
			},
			lootChance = 5000000,
		},
	},
	weapons = {"creature_spit_small_yellow"},
	conversationTemplate = "",
	attacks = {
		{"creatureareattack",""},
		{"stunattack","stunChance=70"}
	}
}

CreatureTemplates:addCreatureTemplate(enhanced_force_kliknik, "enhanced_force_kliknik")
