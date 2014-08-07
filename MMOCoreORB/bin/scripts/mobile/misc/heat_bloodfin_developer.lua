heat_bloodfin_developer = Creature:new {
	objectName = "",
	customName = "Heat Bloodfin Developer",
	socialGroup = "",
	pvpFaction = "Townsperson",
	faction = "Townsperson",
	level = 285,
	chanceHit = 72.5,
	damageMin = 200,
	damageMax = 310,
	baseXp = 7849,
	baseHAM = 810000,
	baseHAMmax = 892000,
	armor = 0,
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
	creatureBitmask = PACK,
	optionsBitmask = 128,
	diet = HERBIVORE,


	templates = {"object/mobile/dressed_swamp_trooper.iff"},
	scale = 1.4,
	lootGroups = {
		{
			groups = {
				{group = "test_loot_group", chance = 1500000},
				{group = "test_loot_group", chance = 1500000},
				{group = "dev", chance = 1500000},
				{group = "dev", chance = 1500000},
				{group = "dev", chance = 1500000},
				{group = "dev", chance = 1500000},
			},
			lootChance = 91500000
		}
	},
	weapons = {"dark_jedi_weapons_gen4"},
	conversationTemplate = "",
	attacks = merge(lightsabermaster,forcepowermaster)
}
CreatureTemplates:addCreatureTemplate(heat_bloodfin_developer,"heat_bloodfin_developer")
