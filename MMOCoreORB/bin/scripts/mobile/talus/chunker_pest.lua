chunker_pest = Creature:new {
	objectName = "@mob/creature_names:chunker_pest",
	socialGroup = "chunker",
	pvpFaction = "thug",
	faction = "thug",
	level = 6,
	chanceHit = 0.250000,
	damageMin = 50,
	damageMax = 55,
	baseXp = 147,
	baseHAM = 180,
	baseHAMmax = 220,
	armor = 0,
	resists = {0,0,0,0,0,0,0,-1,-1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0.000000,
	ferocity = 0,
	pvpBitmask = ATTACKABLE,
	creatureBitmask = PACK + STALKER,
	diet = HERBIVORE,

	templates = {"object/mobile/dressed_mugger.iff", 
					"object/mobile/dressed_robber_human_male_01.iff", 
					"object/mobile/dressed_criminal_thug_zabrak_female_01.iff", 
					"object/mobile/dressed_criminal_thug_aqualish_female_02.iff",
					"object/mobile/dressed_criminal_thug_aqualish_male_02.iff",
					"object/mobile/dressed_desperado_bith_female_01.iff",
					"object/mobile/dressed_criminal_thug_human_female_01.iff",
					"object/mobile/dressed_goon_twk_female_01.iff",
					"object/mobile/dressed_criminal_thug_human_male_01.iff",
					"object/mobile/dressed_robber_twk_female_01.iff",
					"object/mobile/dressed_villain_trandoshan_male_01.iff",
					"object/mobile/dressed_desperado_bith_male_01.iff",
					"object/mobile/dressed_mugger.iff"},
	lootGroups = {
	    {
	        groups = {
				{group = "junk", chance = 1200000},
				{group = "rifles", chance = 700000},
				{group = "melee_knife", chance = 700000},
				{group = "pistols", chance = 700000},
				{group = "carbines", chance = 700000},
				{group = "chunker_common", chance = 6000000},
	    	},
			lootChance = 3500000
		}	
	},
	weapons = {"pirate_weapons_light"},
	attacks = merge(brawlermaster,marksmanmaster)
}

CreatureTemplates:addCreatureTemplate(chunker_pest, "chunker_pest")
