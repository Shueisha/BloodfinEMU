gcw_stormtrooper_colonel = Creature:new {
	objectName = "",
	customName = "Stormtrooper Colonel",
	socialGroup = "imperial",
	pvpFaction = "imperial",
	faction = "imperial",
	level = 160,
	chanceHit = 0.56,
	damageMin = 238,
	damageMax = 251,
	baseXp = 2822,
	baseHAM = 43530,
	baseHAMmax = 48000,
	armor = 1,
	resists = {75,90,40,60,50,50,50,20,-1},
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
	creatureBitmask = PACK + KILLER,
	optionsBitmask = 136,
	diet = HERBIVORE,

	templates = {"object/mobile/dressed_stormtrooper_groupleader_m.iff"},
	lootGroups = {
		{
			groups = {
				{group = "color_crystals", chance = 1000000},
				{group = "holocron_dark", chance = 6050000},
				{group = "rifles", chance = 550000},
				{group = "pistols", chance = 550000},
				{group = "melee_weapons", chance = 550000},
				{group = "carbines", chance = 550000},
				{group = "clothing_attachments", chance = 350000},
				{group = "armor_attachments", chance = 350000},
				{group = "imperial_officer_common", chance = 450000},
				{group = "stormtrooper_common", chance = 500000}
			},
			lootChance = 3500000
		}
	},
	weapons = {"stormtrooper_weapons"},
	conversationTemplate = "imperial_recruiter_convotemplate",
	attacks = merge(riflemanmaster,carbineermaster)
}

CreatureTemplates:addCreatureTemplate(gcw_stormtrooper_colonel, "gcw_stormtrooper_colonel")
