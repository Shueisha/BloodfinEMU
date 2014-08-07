dw_acklay = Creature:new {
	objectName = "",
	customName = "a baby Acklay",
	socialGroup = "geonosian_creature",
	pvpFaction = "geonosian_creature",
	faction = "",
	level = 287,
	chanceHit = 92.5,
	damageMin = 1635,
	damageMax = 1980,
	baseXp = 0,
	baseHAM = 196000,
	baseHAMmax = 218000,
	armor = 2,
	resists = {40,45,55,55,45,45,40,40,-1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 25,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER,
	optionsBitmask = 128,
	diet = CARNIVORE,

	templates = {"object/mobile/acklay_hue.iff"},
	scale = .25,	
	lootGroups = {
		{
			groups = {
				{group = "death_watch_bunker_commoners", chance = 6000000},
				{group = "death_watch_bunker_lieutenants", chance = 4000000}
			},
			lootChance = 1000000
		}
	},
	weapons = {},
	conversationTemplate = "",
	attacks = {
		{"creatureareacombo",""},
		{"posturedownattack","postureDownChance=50"}
	}
}

CreatureTemplates:addCreatureTemplate(dw_acklay, "dw_acklay")
