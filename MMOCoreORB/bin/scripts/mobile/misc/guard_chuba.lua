guard_chuba = Creature:new {
	objectName = "",
	customName = "Presidential Guard Chuba",	
	socialGroup = "rancor",
	pvpFaction = "",
	faction = "",
	level = 195,
	chanceHit = 0.6,
	damageMin = 5,
	damageMax = 20,
	baseXp = 16288,
	baseHAM = 114000,
	baseHAMmax = 124000,
	armor = 1,
	resists = {40,40,40,40,40,40,40,40,40},
	meatType = "meat_carnivore",
	meatAmount = 1000,
	hideType = "hide_leathery",
	hideAmount = 900,
	boneType = "bone_mammal",
	boneAmount = 850,
	milk = 0,
	tamingChance = 0.0,
	ferocity = 11,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER,
	optionsBitmask = 128,
	diet = CARNIVORE,

	templates = {"object/mobile/chuba_hue.iff"},
	controlDeviceTemplate = "object/intangible/pet/chuba_hue.iff",
	lootGroups = {},
	weapons = {"creature_spit_heavy_flame"},
	conversationTemplate = "",
	attacks = {
		{"creatureareadisease",""},
		{"dizzyattack","dizzyChance=50"}
	}
}

CreatureTemplates:addCreatureTemplate(guard_chuba, "guard_chuba")
