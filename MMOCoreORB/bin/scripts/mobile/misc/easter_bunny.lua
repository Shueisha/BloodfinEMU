easter_bunny = Creature:new {
	objectName = "",
	customName = "EB the Easter Bunny",
	socialGroup = "Dark Jedi",
	pvpFaction = "",
	faction = "",
	level = 80,
	chanceHit = 300,
	damageMin = 245,
	damageMax = 300,
	baseXp = 8549,
	baseHAM = 18000,
	baseHAMmax = 21000,
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

	templates = {"object/mobile/durni.iff"},
	scale = 3.2,	
		lootGroups = {
		{
			groups = {
				{group = "rifles", chance = 600000},
				{group = "forage_rare", chance = 600000},
				{group = "crystals_premium", chance = 600000},
				{group = "bounty_hunter_armor_looted", chance = 500000},
				{group = "pistols", chance = 100000},
				{group = "melee_weapons", chance = 1100000},
				{group = "rifles", chance = 100000},
				{group = "clothing_attachments", chance = 100000},
				{group = "carbines", chance = 500000}				
			},
			lootChance = 98500000
		}
	},
	weapons = {"creature_spit_small_red"},
	conversationTemplate = "",
	attacks = {
		{"knockdownattack","knockdownChance=50"}
	}
}

CreatureTemplates:addCreatureTemplate(easter_bunny, "easter_bunny")
