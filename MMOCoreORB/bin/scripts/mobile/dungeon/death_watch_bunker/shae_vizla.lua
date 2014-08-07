shae_vizla = Creature:new {
	objectName = "",
	customName = "Shae Vizla",	
	socialGroup = "death_watch",
	pvpFaction = "death_watch",
	faction = "",
	level = 302,
	chanceHit = 300,
	damageMin = 1645,
	damageMax = 3000,
	baseXp = 28549,
	baseHAM = 385000,
	baseHAMmax = 471000,
	armor = 3,
	resists = {10,35,35,100,100,100,100,10,45},
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
	creatureBitmask = PACK + KILLER + HEALER,
	optionsBitmask = 128,
	diet = HERBIVORE,

	templates = {"object/mobile/dressed_fs_village_enemy_kylaena.iff"},
	lootGroups = {
		{
			groups = {
				{group = "dws_house_loot", chance = 540000},
				{group = "youngling_loot", chance = 550000}
			},
			lootChance = 98000000
		},
		{
			groups = {
				{group = "dws_house_loot", chance = 10000000},
			},
			lootChance = 96500000
		}
	},
	weapons = {"mixed_force_weapons"},
	conversationTemplate = "",
	attacks = merge(tkamaster,forcepowermaster)
}

CreatureTemplates:addCreatureTemplate(shae_vizla, "shae_vizla")
