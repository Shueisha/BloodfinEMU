fed_s_battle_droid = Creature:new {
	objectName = "",
	customName = "a Trade Federation Battle Droid",	
	socialGroup = "death_watch",
	pvpFaction = "death_watch",
	faction = "",
	level = 70,
	chanceHit = 18,
	damageMin = 200,
	damageMax = 300,
	baseXp = 19000,
	baseHAM = 230000,
	baseHAMmax = 230000,
	armor = 2,
	resists = {45,45,40,40,10,15,10,15,-1},--kinetic,energy,blast,heat,cold,electric,acid,stun,ls
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
	diet = NONE,

	templates = {
		"object/mobile/death_watch_s_battle_droid.iff",
		"object/mobile/death_watch_s_battle_droid_02.iff",
		"object/mobile/death_watch_s_battle_droid_03.iff"},
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
	defaultWeapon = "object/weapon/ranged/droid/droid_droideka_ranged.iff",
	defaultAttack = "creaturerangedattack"
}

CreatureTemplates:addCreatureTemplate(fed_s_battle_droid, "fed_s_battle_droid")
