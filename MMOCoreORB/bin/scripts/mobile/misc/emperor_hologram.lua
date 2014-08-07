emperor_hologram = Creature:new {
	objectName = "",
	customName = "Hologram of Emperor Palpatine",
	socialGroup = "townsperson",
	pvpFaction = "townsperson",
	faction = "townsperson",
	level = 30,
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
	pvpBitmask = NONE,
	creatureBitmask = PACK,
	optionsBitmask = 264,
	diet = HERBIVORE,

	templates = {"object/mobile/ep3/palpatine_hologram.iff"},
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

CreatureTemplates:addCreatureTemplate(emperor_hologram , "emperor_hologram")
