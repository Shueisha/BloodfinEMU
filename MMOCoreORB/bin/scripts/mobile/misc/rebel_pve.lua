rebel_pve = Creature:new {
	objectName = "",
	customName = "Rebel Alliance Officer",
	socialGroup = "Dark Jedi",
	pvpFaction = "",
	faction = "",
	level = 20,
	chanceHit = 300,
	damageMin = 145,
	damageMax = 300,
	baseXp = 28549,
	baseHAM = 25000,
	baseHAMmax = 37000,
	armor = 2,
	resists = {30,40,30,50,20,75,60,70,41},
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
	creatureBitmask = KILLER + STALKER,
	optionsBitmask = 128,
	diet = HERBIVORE,

	templates = {
		"object/mobile/dressed_rebel_first_lieutenant_bothan_male_01.iff",
		"object/mobile/dressed_rebel_first_lieutenant_human_female_01.iff",
		"object/mobile/dressed_rebel_first_lieutenant_human_male_01.iff",
		"object/mobile/dressed_rebel_first_lieutenant_moncal_female_01.iff",
		"object/mobile/dressed_rebel_first_lieutenant_moncal_female_02.iff",
		"object/mobile/dressed_rebel_first_lieutenant_sullustan_male_01.iff"},
	scale = 1.0,
		lootGroups = {
		{
			groups = {
				{group = "color_crystals", chance = 600000},
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
	weapons = {"stormtrooper_weapons"},
	conversationTemplate = "",
	attacks = merge(riflemanmaster,carbineermaster)
}

CreatureTemplates:addCreatureTemplate(rebel_pve, "rebel_pve")
