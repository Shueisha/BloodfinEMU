hunter_sherruk = Creature:new {
	objectName = "",
	customName = "Sherruk the Hunter",
	socialGroup = "Dark Jedi",
	pvpFaction = "",
	faction = "",
	level = 280,
	chanceHit = 30,
	damageMin = 1645,
	damageMax = 1900,
	baseXp = 28549,
	baseHAM = 465000,
	baseHAMmax = 471000,
	armor = 3,
	resists = {60,70,30,50,90,70,70,20,65},
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


	templates = {"object/mobile/dressed_death_watch_gold.iff"},
	scale = 1.4,
	lootGroups = {
		{
			groups = {
				{group = "youngling_loot", chance = 12400000},
				{group = "dev", chance = 14500000},
				{group = "dev", chance = 10000000},
				{group = "dev", chance = 12000000},
				{group = "dev", chance = 13000000},
				{group = "dev", chance = 14000000},
			},
			lootChance = 911500000
		}
	},
	weapons = {"dark_jedi_weapons_gen4"},
	conversationTemplate = "",
	attacks = merge(lightsabermaster,tkamaster)
}

CreatureTemplates:addCreatureTemplate(hunter_sherruk, "hunter_sherruk")
