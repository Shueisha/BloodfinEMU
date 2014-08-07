corvette_vynock = Creature:new {
	objectName = "",
	customName = "invading Vynock",
	socialGroup = "Dark Jedi",
	pvpFaction = "",
	faction = "",
	level = 219,
	chanceHit = 0.27,
	damageMin = 80,
	damageMax = 90,
	baseXp = 235,
	baseHAM = 88657,
	baseHAMmax = 89825,
	armor = 0,
	resists = {0,0,0,0,0,0,0,0,0},
	meatType = "meat_herbivore",
	meatAmount = 8050,
	hideType = "hide_leathery",
	hideAmount = 8070,
	boneType = "bone_mammal",
	boneAmount = 8020,
	milk = 0,
	tamingChance = 0.25,
	ferocity = 0,
	pvpBitmask = ATTACKABLE,
	creatureBitmask = NONE,
	optionsBitmask = 0,
	diet = CARNIVORE,

	templates = {"object/mobile/vynock.iff"},
	
	controlDeviceTemplate = "object/intangible/pet/vynock_hue.iff",
	lootGroups = {
		{
			groups = {
				{group = "death_watch_bunker_lootbox", chance = 10000000}
			},
			lootChance = 99500000
		}
	},
	weapons = {},
	conversationTemplate = "",
	attacks = {
		{"stunattack","stunChance=50"}
	}
}

CreatureTemplates:addCreatureTemplate(corvette_vynock, "corvette_vynock")
