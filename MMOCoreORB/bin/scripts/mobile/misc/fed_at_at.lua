fed_at_at = Creature:new {
	objectName = "",
	customName = "a Trade Federation AT-AT",	
	socialGroup = "Dark Jedi",
	pvpFaction = "",
	faction = "",
	level = 70,
	chanceHit = 7.5,
	damageMin = 170,
	damageMax = 250,
	baseXp = 21728,
	baseHAM = 158000,
	baseHAMmax = 164000,
	armor = 1,
	resists = {30,30,10,30,30,30,30,30,30},
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
	diet = NONE,

	templates = {"object/mobile/atat.iff"},
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
	conversationTemplate = "",
	defaultAttack = "defaultdroidattack",
	defaultWeapon = "object/weapon/ranged/vehicle/vehicle_atst_ranged.iff",
}

CreatureTemplates:addCreatureTemplate(fed_at_at, "fed_at_at")
