rebel_warrant_officer_ii = Creature:new {
	objectName = "@mob/creature_names:rebel_warrant_officer_ii",
	socialGroup = "rebel",
	pvpFaction = "rebel",
	faction = "rebel",
	level = 16,
	chanceHit = 0.310000,
	damageMin = 170,
	damageMax = 180,
	baseXp = 960,
	baseHAM = 2900,
	baseHAMmax = 3500,
	armor = 0,
	resists = {0,0,0,0,0,0,0,-1,-1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0.000000,
	ferocity = 0,
	pvpBitmask = ATTACKABLE,
	creatureBitmask = PACK,
	optionsBitmask = 136,
	diet = HERBIVORE,

	templates = {
		"object/mobile/dressed_rebel_second_lieutenant_human_female_01.iff",
		"object/mobile/dressed_rebel_second_lieutenant_rodian_male_01.iff",
		"object/mobile/dressed_rebel_second_lieutenant_trandoshan_male_01.iff",
		"object/mobile/dressed_rebel_second_lieutenant_twk_female_01.iff",
		"object/mobile/dressed_rebel_second_lieutenant_twk_male_01.iff",
		"object/mobile/dressed_rebel_second_lieutenant_zabrak_female_01.iff"},
	lootGroups = {
		{
	        groups = {
				{group = "color_crystals", chance = 100000},
				{group = "junk", chance = 5700000},
				{group = "rifles", chance = 1000000},
				{group = "pistols", chance = 1000000},
                {group = "melee_weapons", chance = 1000000},
                {group = "carbines", chance = 1000000},
				{group = "clothing_attachments", chance = 100000},
				{group = "armor_attachments", chance = 100000}
			},
			lootChance = 3000000
		}	
	},
	weapons = {"rebel_weapons_medium"},
	conversationTemplate = "rebel_recruiter_convotemplate",
	attacks = merge(riflemanmaster,pistoleermaster,carbineermaster,brawlermaster)
}

CreatureTemplates:addCreatureTemplate(rebel_warrant_officer_ii, "rebel_warrant_officer_ii")
