imperial_battle_droid = Creature:new {
	objectName = "",
	customName = "Imperial Battle Droid",
	socialGroup = "imperial",
	pvpFaction = "imperial",
	faction = "imperial",
	level = 78,
	chanceHit = 197.5,
	damageMin = 270,
	damageMax = 450,
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


	templates = {"object/mobile/death_watch_battle_droid_02.iff"},
	scale = 1.2,
	weapons = {"battle_droid_weapons"},
	conversationTemplate = "",
	attacks = merge(riflemanmaster,pistoleermaster,carbineermaster)
}

CreatureTemplates:addCreatureTemplate(imperial_battle_droid, "imperial_battle_droid")
