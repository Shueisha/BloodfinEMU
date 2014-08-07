kurt_thunderheart_stangl = Creature:new {
  objectName = "@mob/creature_names:kurt_thunderheart_stangl",
	customName = "Kurt 'Thunderheart' Stangl",
	socialGroup = "Dark Jedi",
	pvpFaction = "",
	faction = "",
	level = 80,
	chanceHit = 300,
	damageMin = 245,
	damageMax = 300,
	baseXp = 28549,
	baseHAM = 165000,
	baseHAMmax = 171000,
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

	templates = {"object/mobile/dressed_emperors_hand_human_male_01.iff"},
	scale = 1.0,
	lootGroups = {
		{
			groups = {
				{group = "acklay", chance = 1500000},
				{group = "krayt_tissue_rare", chance = 1500000},
				{group = "krayt_tissue_rare", chance = 1500000},
				{group = "krayt_tissue_rare", chance = 1500000},
				{group = "krayt_tissue_rare", chance = 1500000},
				{group = "pearls_flawless", chance = 1500000},
			},
			lootChance = 91500000
		}
	},
	weapons = {"mixed_force_weapons"},
	conversationTemplate = "",
	attacks = merge(pikemanmaster,brawlermaster,fencermaster)
}

CreatureTemplates:addCreatureTemplate(kurt_thunderheart_stangl, "kurt_thunderheart_stangl")
