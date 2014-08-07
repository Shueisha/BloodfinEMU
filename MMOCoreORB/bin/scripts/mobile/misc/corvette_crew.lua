corvette_crew = Creature:new {
	objectName = "",
	customName = "Droideka Sentry",
	socialGroup = "Dark Jedi",
	pvpFaction = "",
	faction = "",
	level = 126,
	chanceHit = 20.95,
	damageMin = 620,
	damageMax = 950,
	baseXp = 9150,
	baseHAM = 40000,
	baseHAMmax = 55000,
	armor = 0,
	resists = {45,45,0,0,30,30,80,65,-1},
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

	templates = {"object/mobile/droideka.iff"},
	lootGroups = {
         {
			groups = {
				{group = "holocron_dark", chance = 600000},
				{group = "holocron_light", chance = 600000},
				{group = "clothing_attachments", chance = 600000},	
				{group = "cor_crew", chance = 10000000}
			},
			lootChance = 10000000
	    }	
	},
	defaultAttack = "creaturerangedattack",
	defaultWeapon = "object/weapon/ranged/droid/droid_droideka_ranged.iff",
}

CreatureTemplates:addCreatureTemplate(corvette_crew , "corvette_crew")
