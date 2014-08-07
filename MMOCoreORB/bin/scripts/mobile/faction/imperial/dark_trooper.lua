dark_trooper = Creature:new {
	objectName = "@mob/creature_names:dark_trooper",
	socialGroup = "imperial",
	pvpFaction = "imperial",
	faction = "imperial",
	level = 200,
	chanceHit = 0.4,
	damageMin = 205,
	damageMax = 320,
	baseXp = 3465,
	baseHAM = 19000,
	baseHAMmax = 20000,
	armor = 0,
	resists = {20,20,10,20,10,10,10,11,-1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = ATTACKABLE + OVERT,
	creatureBitmask = PACK + KILLER,
	optionsBitmask = 128,
	diet = HERBIVORE,

	templates = {"object/mobile/dark_trooper.iff"},
	lootGroups = {
		{
			groups = {
				{group = "color_crystals", chance = 300000},
				{group = "junk", chance = 7300000},
				{group = "rifles", chance = 600000},
				{group = "holocron_dark", chance = 150000},
				{group = "holocron_light", chance = 150000},
				{group = "carbines", chance = 600000},
				{group = "pistols", chance = 600000},
				{group = "clothing_attachments", chance = 150000},
				{group = "armor_attachments", chance = 150000}
			},
			lootChance = 3500000
		}
	},
	weapons = {"dark_trooper_weapons"},
	conversationTemplate = "",
	attacks = merge(riflemanmaster,carbineermaster,fencermaster)
}

CreatureTemplates:addCreatureTemplate(dark_trooper, "dark_trooper")
