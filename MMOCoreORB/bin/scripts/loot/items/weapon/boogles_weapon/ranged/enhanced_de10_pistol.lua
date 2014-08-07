--Automatically generated by SWGEmu Spawn Tool v0.12 loot editor.

enhanced_de10_pistol = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "an Experimental DE-10 Pistol",
	directObjectTemplate = "object/weapon/ranged/pistol/pistol_de_10.iff",
	craftingValues = {
		{"mindamage",200,199,0},
		{"maxdamage",650,649,0},
		{"attackspeed",5.3,5.0,1},
		{"woundchance",10,20,0},
		{"hitpoints",983,750,0},
		{"attackhealthcost",17,8,0},
		{"attackactioncost",44,27,0},
		{"attackmindcost",25,14,0},
		{"roundsused",15,60,0},
		{"zerorangemod",42,47,0},
		{"maxrangemod",10,15,0},
		{"midrange",16,16,0},
		{"midrangemod",47,79,0},
	},
	customizationStringNames = {},
	customizationValues = {},

	-- randomDotChance: The chance of this weapon object dropping with a random dot on it. Higher number means less chance. Set to 0 to always have a random dot.
	randomDotChance = -1,
	junkDealerTypeNeeded = JUNKWEAPONS,
	junkMinValue = 25,
	junkMaxValue = 45

}

addLootItemTemplate("enhanced_de10_pistol", enhanced_de10_pistol)
