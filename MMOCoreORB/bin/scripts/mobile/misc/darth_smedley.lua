darth_smedley = Creature:new {
	objectName = "",
	customName = "Darth Smedley",
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


	templates = {"object/mobile/dressed_fs_village_oldman.iff"},
	scale = 1.4,
	lootGroups = {
		{
			groups = {
				{group = "test_loot_group", chance = 1240000},
				{group = "test_loot_group", chance = 1450000},
				{group = "test_loot_group", chance = 1000000},
				{group = "test_loot_group", chance = 1200000},
				{group = "test_loot_group", chance = 1300000},
				{group = "test_loot_group", chance = 1400000},
			},
			lootChance = 91500000
		}
	},
	weapons = {"dark_jedi_weapons_gen4"},
	conversationTemplate = "",
	attacks = merge(lightsabermaster,forcepowermaster)
}

CreatureTemplates:addCreatureTemplate(darth_smedley, "darth_smedley")
