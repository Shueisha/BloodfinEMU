crackdown_elite_dark_trooper = Creature:new {
	objectName = "",
	customName = "Crackdown Elite Dark Trooper",	
	socialGroup = "imperial",
	pvpFaction = "imperial",
	faction = "imperial",
	level = 220,
	chanceHit = 0.64,
	damageMin = 765,
	damageMax = 840,
	baseXp = 6545,
	baseHAM = 81000,
	baseHAMmax = 94000,
	armor = 2,
	resists = {70,70,70,60,80,60,70,70,70},
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
	creatureBitmask = PACK + KILLER + STALKER,
	optionsBitmask = 128,
	diet = HERBIVORE,

	templates = {"object/mobile/dark_trooper.iff"},
	lootGroups = {
		{
			groups = {
				{group = "color_crystals", chance = 100000},
				{group = "junk", chance = 7650000},
				{group = "rifles", chance = 550000},
				{group = "pistols", chance = 550000},
                {group = "melee_weapons", chance = 550000},
                {group = "carbines", chance = 550000},
				{group = "clothing_attachments", chance = 25000},
				{group = "armor_attachments", chance = 25000}
			},
			lootChance = 2800000
		}						
	},
	weapons = {"dark_trooper_weapons"},
	conversationTemplate = "",
	attacks = merge(riflemanmaster,carbineermaster,fencermaster)
}

CreatureTemplates:addCreatureTemplate(crackdown_elite_dark_trooper, "crackdown_elite_dark_trooper")
