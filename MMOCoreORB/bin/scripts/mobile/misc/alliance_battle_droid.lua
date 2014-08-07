alliance_battle_droid = Creature:new {
	objectName = "@mob/creature_names:alliance_battle_droid",
	customName = "Alliance Battle Droid",
	socialGroup = "rebel",
	pvpFaction = "rebel",
	faction = "rebel",
	level = 228,
	chanceHit = 197.5,
	damageMin = 270,
	damageMax = 850,
	baseXp = 21728,
	baseHAM = 98000,
	baseHAMmax = 99000,
	armor = 3,
	resists = {60,60,60,60,60,60,60,60,60},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = NONE,
	creatureBitmask = NONE,
	optionsBitmask = 128,
	diet = NONE,


	templates = {"object/mobile/battle_droid.iff"},
	scale = 1.2,
	lootGroups = {},	
	weapons = {"battle_droid_weapons"},
	conversationTemplate = "",
	attacks = merge(riflemanmaster,pistoleermaster,carbineermaster,brawlermaster)
}

CreatureTemplates:addCreatureTemplate(alliance_battle_droid, "alliance_battle_droid")
