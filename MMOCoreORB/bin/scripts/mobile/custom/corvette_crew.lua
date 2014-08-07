corvette_crew = Creature:new {
	objectName = "",
	customName = "Corvette Crewmen",
	socialGroup = "Dark Jedi",
	pvpFaction = "",
	faction = "",
	level = 226,
	chanceHit = 20.95,
	damageMin = 620,
	damageMax = 950,
	baseXp = 9150,
	baseHAM = 20000,
	baseHAMmax = 25000,
	armor = 0,
	resists = {45,45,0,0,30,30,80,65,-1},
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
		"object/mobile/dressed_rebel_corvette_commando_human_male_01.iff",
		"object/mobile/dressed_rebel_corvette_commando_human_female_01.iff",
		"object/mobile/dressed_rebel_corvette_commando_moncal_male_01.iff",
		"object/mobile/dressed_rebel_corvette_commando_twilek_female_01.iff",
		"object/mobile/dressed_rebel_corvette_commando_rodian_male_01.iff",
		"object/mobile/dressed_rebel_crewman_human_male_01.iff",
		"object/mobile/dressed_rebel_crewman_human_male_02.iff",
		"object/mobile/dressed_rebel_crewman_human_male_03.iff",
		"object/mobile/dressed_rebel_crewman_human_male_04.iff",
		"object/mobile/dressed_rebel_crewman_human_female_01.iff",
		"object/mobile/dressed_rebel_crewman_human_female_02.iff",		
		"object/mobile/dressed_rebel_corvette_commando_zabrak_female_01.iff"},
	lootGroups = {
         {
			groups = {
				{group = "color_crystals", chance = 6500000},
				{group = "pistols", chance = 750000},
				{group = "rifles", chance = 750000},
				{group = "carbines", chance = 750000},
				{group = "jetpack_parts", chance = 5000000},				
--				{group = "bounty_hunter_armor_looted", chance = 700000},
				{group = "jetpack_base", chance = 5000000},
			},
			lootChance = 3500000
		}	
	},
	weapons = {"rebel_weapons_medium"},
	conversationTemplate = "",
	attacks = merge(riflemanmaster,pistoleermaster,carbineermaster,brawlermaster)
}

CreatureTemplates:addCreatureTemplate(corvette_crew , "corvette_crew ")
