peep = Creature:new {
	objectName = "",
	customName = "a Blueberry Peep",	
	socialGroup = "rancor",
	pvpFaction = "",
	faction = "",
	level = 295,
	chanceHit = 0.6,
	damageMin = 5,
	damageMax = 20,
	baseXp = 16288,
	baseHAM = 16000,
	baseHAMmax = 29000,
	armor = 1,
	resists = {40,40,40,40,40,40,40,40,40},
	meatType = "meat_avian",
	meatAmount = 1000,
	hideType = "",
	hideAmount = 0,
	boneType = "bone_avian",
	boneAmount = 850,
	milk = 0,
	tamingChance = 0.0,
	ferocity = 11,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER,
	optionsBitmask = 128,
	diet = CARNIVORE,

	templates = {"object/mobile/flite_rasp_hue.iff"},
		lootGroups = {
		{
			groups = {
				{group = "pistols", chance = 600000},
				{group = "bounty_hunter_armor_looted", chance = 100000},
				{group = "crystals_premium", chance = 600000},
				{group = "bounty_hunter_armor_looted", chance = 500000},
				{group = "pistols", chance = 1100000},
				{group = "melee_weapons", chance = 500000},
				{group = "rifles", chance = 100000},
				{group = "clothing_attachments", chance = 100000},
				{group = "carbines", chance = 1100000}				
			},
			lootChance = 98500000
		}
	},
	weapons = {},
	conversationTemplate = "",
	attacks = {
		{"creatureareadisease",""},
		{"dizzyattack","dizzyChance=50"}
	}
}

CreatureTemplates:addCreatureTemplate(peep, "peep")
