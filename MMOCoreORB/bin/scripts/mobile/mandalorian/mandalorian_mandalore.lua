mandalorian_mandalore = Creature:new {
	objectName = "",
	customName = "Boba Fett (Mandalore)",
	socialGroup = "",
	pvpFaction = "",
	faction = "",
	level = 500,
	chanceHit = 350,
	damageMin = 1640,
	damageMax = 1990,
	baseXp = 19336,
	baseHAM = 180000,
	baseHAMmax = 190000,
	armor = 2,
	resists = {75,75,75,90,90,90,75,75,60},
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
	creatureBitmask = KILLER,
	diet = HERBIVORE,

	templates = {"object/mobile/boba_fett.iff"},
	lootGroups = {},
	weapons = {"stun_bat"},
	conversationTemplate = "",
	attacks = {
		{"defaultattack", ""},
		{"intimidationattack","intimidationChance=100"},
		{"knockdownattack","knockdownChance=100"}
	}
}

CreatureTemplates:addCreatureTemplate(mandalorian_mandalore, "mandalorian_mandalore")
