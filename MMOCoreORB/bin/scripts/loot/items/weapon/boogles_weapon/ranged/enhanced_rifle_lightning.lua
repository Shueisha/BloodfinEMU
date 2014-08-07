enhanced_rifle_lightning = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "an Experimental LLC",
	directObjectTemplate = "object/weapon/ranged/rifle/rifle_lightning.iff",
	craftingValues = {
		{"mindamage",700,699,0},
		{"maxdamage",1000,999,0},
		{"attackspeed",5.3,4.0,1},
		{"woundchance",16,32,0},
		{"hitpoints",850,1000,0},
		{"zerorangemod",55,75,0},
		{"maxrangemod",95,175,0},
		{"midrange",30,30,0},
		{"midrangemod",82,201,0},
		{"maxrange",64,64,0},
		{"attackhealthcost",43,28,0},
		{"attackactioncost",62,38,0},
		{"attackmindcost",36,24,0},
	},
	skillMods = 
	{
		{"heavy_rifle_lightning_accuracy", 15},
		{"heavy_rifle_lightning_speed", 15},
	},
	customizationStringNames = {},
	customizationValues = {},

	-- randomDotChance: The chance of this weapon object dropping with a random dot on it. Higher number means less chance. Set to 0 to always have a random dot.
	randomDotChance = -1,
	junkDealerTypeNeeded = JUNKWEAPONS,
	junkMinValue = 20,
	junkMaxValue = 60

}

addLootItemTemplate("enhanced_rifle_lightning", enhanced_rifle_lightning)
