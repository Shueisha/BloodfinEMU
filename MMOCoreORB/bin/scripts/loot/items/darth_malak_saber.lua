--Automatically generated by SWGEmu Spawn Tool v0.12 loot editor. 

darth_malak_saber = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "Darth Malak's Lightsaber",
	directObjectTemplate = "object/weapon/melee/sword/crafted_saber/sword_lightsaber_one_handed_s4_gen4.iff",
	craftingValues = {
		{"mindamage",215,225,0},
		{"maxdamage",335,345,0},
		{"attackspeed",1.3,1.7,1},
		{"woundchance",19,35,0},
		{"hitpoints",750,750,0},
		{"zerorangemod",20,10,0},
		{"maxrangemod",20,10,0},
		{"midrange",3,3,0},
		{"midrangemod",20,10,0},
		{"maxrange",9,9,0},
		{"attackhealthcost",49,27,0},
		{"attackactioncost",46,25,0},
		{"attackmindcost",26,14,0},
		{"forceCost",11,14,0},
	},
				skillMods = {
				    {"onehandlightsaber_accuracy", 5}
				},	
	customizationStringNames = {},
	customizationValues = {},

	-- randomDotChance: The chance of this weapon object dropping with a random dot on it. Higher number means less chance. Set to 0 to always have a random dot.
	randomDotChance = 90,
	junkDealerTypeNeeded = JUNKWEAPONS,
	junkMinValue = 2,
	junkMaxValue = 22

}

addLootItemTemplate("darth_malak_saber", darth_malak_saber)
