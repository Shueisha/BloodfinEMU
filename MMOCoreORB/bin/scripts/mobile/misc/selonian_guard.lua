selonian_guard = Creature:new {
	objectName = "",
	customName = "Jedi Master Zonder",
	socialGroup = "Dark Jedi",
	pvpFaction = "",
	faction = "",
	level = 80,
	chanceHit = 300,
	damageMin = 245,
	damageMax = 300,
	baseXp = 28549,
	baseHAM = 165000,
	baseHAMmax = 171000,
	armor = 2,
	resists = {20,20,20,20,20,20,20,20,1},
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
	creatureBitmask = KILLER + STALKER,
	optionsBitmask = 128,
	diet = HERBIVORE,


	templates = {"object/mobile/junk_malik.iff"},
	scale = 1.5,
	lootGroups = {
		{
			groups = {
				{group = "bounty_hunter_armor_looted", chance = 1240000},
				{group = "bounty_hunter_armor_looted", chance = 1450000},
				{group = "goggles", chance = 1000000},
				{group = "goggles", chance = 1200000},
				{group = "jetpack_base", chance = 1300000},
				{group = "jetpack_parts", chance = 1400000},
			},
			lootChance = 91500000
		}
	},
	weapons = {"boba_fett_weapons"},
	conversationTemplate = "",
	attacks = merge(tkamaster,pistoleermaster,carbineermaster,forcepowermaster)
}

CreatureTemplates:addCreatureTemplate(selonian_guard, "selonian_guard")
