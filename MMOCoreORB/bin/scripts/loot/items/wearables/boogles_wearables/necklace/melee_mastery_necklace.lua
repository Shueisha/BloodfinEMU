melee_mastery_necklace = {
 -- Plated Necklace
    minimumLevel = 0,
    maximumLevel = -1,
    customObjectName = "Hig Jib's Lost Necklace of Melee Mastery",
    directObjectTemplate = "object/tangible/wearables/necklace/necklace_living_chains.iff",
    craftingValues = {},
    	skillMods = 
	{
		{"block",10},
		{"counterattack",10},
		{"dodge",10},	
		{"melee_defense",10},
		{"ranged_defense",10},
		{"twohandmelee_accuracy",10},
		{"twohandmelee_speed",10},
	},
    customizationStringNames = {},
    customizationValues = {},


    junkDealerTypeNeeded = JUNKCLOTHESANDJEWELLERY,
    junkMinValue = 35000,
    junkMaxValue = 70000
}

addLootItemTemplate("melee_mastery_necklace", melee_mastery_necklace)
