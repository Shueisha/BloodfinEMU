leia_organa_pve = Creature:new {
	objectName = "",
	customName = "Leia Organa",
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

	templates = {"object/mobile/leia_organa.iff"},
	lootGroups = {
		{
			groups = {
				{group = "mando_loot", chance = 1240000},
				{group = "test_loot_group", chance = 1450000},
				{group = "test_loot_group", chance = 1000000},

			},
			lootChance = 91500000
		}
	},
	weapons = {"pirate_weapons_light"},
	conversationTemplate = "",
	attacks = merge(tkamaster,pistoleermaster)
}

CreatureTemplates:addCreatureTemplate(leia_organa_pve, "leia_organa_pve")
