melee_mastery_ring = {
 -- Band
    minimumLevel = 0,
    maximumLevel = -1,
    customObjectName = "Hig Jib's Lost Ring of Melee Mastery",
    directObjectTemplate = "object/tangible/wearables/ring/ring_s01.iff",
    craftingValues = {},
    	skillMods = 
	{
		{"onehandmelee_accuracy",5},
		{"onehandmelee_speed",5},
		{"unarmed_accuracy",5},
		{"unarmed_speed",5},
		{"polearm_accuracy",5},
		{"polearm_speed",5},
	},
    customizationStringNames = {},
    customizationValues = {},
    junkDealerTypeNeeded = JUNKCLOTHESANDJEWELLERY,
    junkMinValue = 45000,
    junkMaxValue = 90000
}

addLootItemTemplate("melee_mastery_ring", melee_mastery_ring)
