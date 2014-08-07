corvette_sbd = Creature:new {
	objectName = "",
	customName = "Corvette Super Battledroid",
	socialGroup = "Dark Jedi",
	pvpFaction = "death_watch",
	faction = "",
	level = 200,
	chanceHit = 18,
	damageMin = 200,
	damageMax = 500,
	baseXp = 19000,
	baseHAM = 130000,
	baseHAMmax = 140000,
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
				{group = "death_watch_bunker_lootbox", chance = 10000000}
			},
			lootChance = 99500000
		}
	},
	conversationTemplate = "",
	defaultWeapon = "object/weapon/ranged/droid/droid_droideka_ranged.iff",
	defaultAttack = "creaturerangedattack"
}

CreatureTemplates:addCreatureTemplate(corvette_sbd, "corvette_sbd")
