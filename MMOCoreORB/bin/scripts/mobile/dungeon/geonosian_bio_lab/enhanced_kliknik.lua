enhanced_kliknik = Creature:new {
	objectName = "@mob/creature_names:geonosian_kliknik_force_strong",
	socialGroup = "geonosian_creature",
	pvpFaction = "",
	faction = "",
	level = 350,
	chanceHit = 29.0,
	damageMin = 675,
	damageMax = 1060,
	baseXp = 10360,
	baseHAM = 32000,
	baseHAMmax = 57000,
	armor = 2,
	resists = {40,40,25,95,35,40,25,25,15},
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

	templates = {"object/mobile/kliknik.iff"},
	scale = 1.4,
	lootGroups = {
		{
	        	groups = 
			{
				{group = "armor_attachments", chance = 10000000},
			},
			lootChance = 1500000,
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
		{"stunattack","stunChance=50"}
	}
}

CreatureTemplates:addCreatureTemplate(enhanced_kliknik, "enhanced_kliknik")
