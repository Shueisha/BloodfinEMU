crackdown_rebel_command_security_guard = Creature:new {
	objectName = "@mob/creature_names:crackdown_rebel_command_security_guard",
	socialGroup = "rebel",
	pvpFaction = "rebel",
	faction = "rebel",
	level = 213,
	chanceHit = 0.35,
	damageMin = 220,
	damageMax = 230,
	baseXp = 2006,
	baseHAM = 136300,
	baseHAMmax = 147700,
	armor = 0,
	resists = {25,25,20,20,10,25,10,25,-1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = ATTACKABLE,
	creatureBitmask = NONE,
	optionsBitmask = 128,
	diet = HERBIVORE,

	templates = {
		"object/mobile/dressed_rebel_crewman_human_male_04.iff",
		"object/mobile/dressed_rebel_crewman_human_female_01.iff",
		"object/mobile/dressed_rebel_crewman_human_female_02.iff",
		"object/mobile/dressed_rebel_crewman_human_male_03.iff"
	},
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
	weapons = {"rebel_weapons_heavy"},
	conversationTemplate = "",
	attacks = merge(riflemanmaster,pistoleermaster,carbineermaster,brawlermaster)
}

CreatureTemplates:addCreatureTemplate(crackdown_rebel_command_security_guard, "crackdown_rebel_command_security_guard")
