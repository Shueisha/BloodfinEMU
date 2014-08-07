tat_world_boss = Creature:new {
	objectName = "",
	customName = "Dal Perhi",
	socialGroup = "Dark Jedi",
	pvpFaction = "",
	faction = "",
	level = 300,
	chanceHit = 3.95,
	damageMin = 620,
	damageMax = 950,
	baseXp = 9150,
	baseHAM = 1620000,
	baseHAMmax = 1775000,
	armor = 3,
	resists = {45,45,0,0,30,30,20,65,15},
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

	templates = {"object/mobile/tatooine_npc/hedon_istee.iff"}, -- Need a naked human male template for clothing (see below.)
	outfit = "tat_boss_outfit",	
	scale = 1.5,
	lootGroups = {
         {
			groups = {
				{group = "world_boss_loot", chance = 10000000},
			},
			lootChance = 96500000
		}
	},
	weapons = {"rebel_weapons_heavy"},
	conversationTemplate = "",
	attacks = merge(commandomaster,carbineermaster,brawlermaster)
}

CreatureTemplates:addCreatureTemplate(tat_world_boss, "tat_world_boss")
