emperors_hand = Creature:new {
	objectName = "@mob/creature_names:emperors_hand",
	socialGroup = "imperial",
	pvpFaction = "imperial",
	faction = "imperial",
	level = 252,
	chanceHit = 235,
	damageMin = 1395,
	damageMax = 2500,
	baseXp = 24081,
	baseHAM = 261000,
	baseHAMmax = 320000,
	armor = 0,
	resists = {90,90,90,90,90,90,90,90,51},
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
	optionsBitmask = 128,
	diet = HERBIVORE,

	templates = {
		"object/mobile/dressed_emperors_hand_human_male_01.iff",
		"object/mobile/dressed_emperors_hand_human_female_01.iff",
		"object/mobile/dressed_emperors_hand_human_male_02.iff"},
	scale = 1.4,
	lootGroups = {
		{
			groups = {
				{group = "holocron_dark", chance = 600000},
				{group = "holocron_light", chance = 600000},
				{group = "clothing_attachments", chance = 600000},
				{group = "dev", chance = 1500000},
				{group = "dev", chance = 1500000},
				{group = "thanksgiving", chance = 1500000},
				{group = "armor_attachments", chance = 1100000},
				{group = "clothing_attachments", chance = 1100000}
			},
			lootChance = 91500000
		}	
	},
	weapons = {"dark_jedi_weapons_gen4"},
	conversationTemplate = "",
	attacks = merge(lightsabermaster,forcepowermaster)
}

CreatureTemplates:addCreatureTemplate(emperors_hand, "emperors_hand")
