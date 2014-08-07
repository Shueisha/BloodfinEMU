zombie = Creature:new {
	objectName = "",
	customName = "a bloodthirsty Zombie",	
	socialGroup = "rancor",
	pvpFaction = "",
	faction = "",
	level = 295,
	chanceHit = 0.6,
	damageMin = 5,
	damageMax = 20,
	baseXp = 16288,
	baseHAM = 14000,
	baseHAMmax = 24000,
	armor = 1,
	resists = {40,40,40,40,40,40,40,40,40},
	meatType = "meat_carnivore",
	meatAmount = 1000,
	hideType = "hide_leathery",
	hideAmount = 900,
	boneType = "bone_mammal",
	boneAmount = 850,
	milk = 0,
	tamingChance = 0.0,
	ferocity = 11,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER,
	optionsBitmask = 128,
	diet = CARNIVORE,

	templates = {"object/mobile/dressed_commoner_tatooine_nikto_male_02.iff",
					"object/mobile/dressed_commoner_tatooine_aqualish_female_01.iff",
					"object/mobile/dressed_commoner_naboo_twilek_female_01.iff",
					"object/mobile/dressed_commoner_naboo_human_female_03.iff",
					"object/mobile/dressed_commoner_tatooine_devaronian_male_01.iff"
					},
		lootGroups = {
		{
			groups = {
				{group = "rifles", chance = 600000},
				{group = "holocron_light", chance = 600000},
				{group = "crystals_premium", chance = 600000},
				{group = "rifles", chance = 500000},
				{group = "pistols", chance = 500000},
				{group = "melee_weapons", chance = 500000},
				{group = "armor_attachments", chance = 1100000},
				{group = "clothing_attachments", chance = 1100000},
				{group = "carbines", chance = 500000}				
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

CreatureTemplates:addCreatureTemplate(zombie, "zombie")
