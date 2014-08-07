telport = Creature:new {
	objectName = "",
	customName = "\\#FF0000Travel to the Death Watch Stronghold",
	socialGroup = "",
	pvpFaction = "",
	faction = "",
	level = 26,
	chanceHit = 20.95,
	damageMin = 20,
	damageMax = 50,
	baseXp = 9150,
	baseHAM = 1000,
	baseHAMmax = 2000,
	armor = 0,
	resists = {5,5,0,0,0,0,0,5,-1},
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
	creatureBitmask = PACK + KILLER,
	optionsBitmask = 264,
	diet = HERBIVORE,

	templates = {"object/mobile/tatooine_npc/hedon_istee.iff"},
	outfit = "port_outfit",	
	scale = 1.1,
	lootGroups = {
         {
			groups = {
				{group = "mando_loot", chance = 5000000},
				{group = "dev", chance = 5000000},
			},
			lootChance = 93500000
		}	
	},
	weapons = {"rebel_weapons_medium"},
	conversationTemplate = "",
	attacks = merge(riflemanmaster,pistoleermaster,carbineermaster,brawlermaster)
}

CreatureTemplates:addCreatureTemplate(telport , "telport")
