dwarf_gorax = Creature:new {
	objectName = "",
	customName = "Dwarf Gorax",	
	socialGroup = "gorax",
	pvpFaction = "",
	faction = "",
	level = 30,
	chanceHit = 30,
	damageMin = 15,
	damageMax = 30,
	baseXp = 28549,
	baseHAM = 38500,
	baseHAMmax = 47100,
	armor = 0,
	resists = {5,5,5,5,5,5,5,5,1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 20,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER,
	optionsBitmask = 128,
	diet = CARNIVORE,

	templates = {"object/mobile/gorax.iff"},
	scale = .15,	
	lootGroups = {
	 {
	        groups = {
				{group = "gorax_common", chance = 5000000},
				{group = "armor_attachments", chance = 2500000},
				{group = "clothing_attachments", chance = 2500000}
			},
			lootChance = 4000000
		}
	},
	weapons = {},
	conversationTemplate = "",
	attacks = {
		{"creatureareattack",""},
		{"creatureareaknockdown","knockdownChance=50"}
	}
}

CreatureTemplates:addCreatureTemplate(dwarf_gorax, "dwarf_gorax")
