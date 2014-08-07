fed_battle_droid = Creature:new {
	objectName = "",
	customName = "a Trade Federation Battle Droid",	
	socialGroup = "death_watch",
	pvpFaction = "death_watch",
	faction = "",
	level = 34,
	chanceHit = 5.5,
	damageMin = 95,
	damageMax = 100,
	baseXp = 2612,
	baseHAM = 35000,
	baseHAMmax = 36000,
	armor = 2,
	resists = {27,25,10,20,10,25,40,25,-1},
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
	optionsBitmask = 128,
	diet = HERBIVORE,

	templates = {
		"object/mobile/death_watch_battle_droid.iff",
		"object/mobile/death_watch_battle_droid_02.iff",
		"object/mobile/death_watch_battle_droid_03.iff"},
	lootGroups = {
		{
			groups = {
				{group = "death_watch_bunker_ingredient_protective",   chance = 6500000},
				{group = "death_watch_bunker_ingredient_binary", chance = 6300000},
				{group = "color_crystals",  chance = 7500000},
				{group = "color_crystals",  chance = 6400000}
			},
			lootChance = 93500000
		}
	},
	weapons = {"battle_droid_weapons"},
	conversationTemplate = "",
	attacks = merge(riflemanmaster,pistoleermaster,carbineermaster,brawlermaster)
}

CreatureTemplates:addCreatureTemplate(fed_battle_droid, "fed_battle_droid")
