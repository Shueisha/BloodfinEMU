corvette_boss = Creature:new {
	objectName = "",
	customName = "General Grievous",
	socialGroup = "Dark Jedi",
	pvpFaction = "",
	faction = "",
	level = 300,
	chanceHit = 20.95,
	damageMin = 620,
	damageMax = 950,
	baseXp = 9150,
	baseHAM = 620000,
	baseHAMmax = 725000,
	armor = 3,
	resists = {65,65,60,60,60,60,60,65,35},
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
	creatureBitmask = PACK + KILLER,
	optionsBitmask = 128,
	diet = HERBIVORE,

	templates = {"object/mobile/ep3/general_grievous.iff"},
	scale = 1.6,
	lootGroups = {
		{
			groups = {
				{group = "gen_grv", chance = 10000000}
			},
			lootChance = 10000000
		}	
	},
	weapons = {"light_jedi_weapons"},
	conversationTemplate = "",
	attacks = merge(lightsabermaster,forcepowermaster)
}

CreatureTemplates:addCreatureTemplate(corvette_boss , "corvette_boss")
