
bh_ring = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "Ring of Arla Fett",
	directObjectTemplate = "object/tangible/wearables/ring/ring_nightsister.iff",
	craftingValues = {
	},
	customizationStringNames = {},
	customizationValues = {},
	skillMods = {
		{"resistance_fire",25},
		{"pistol_accuracy",25},		
		{"knockdown_defense",25},
		{"heavy_flame_thrower_accuracy",25},
		{"heavy_rifle_acid_accuracy",25},		
		{"melee_defense",25},
		{"ranged_defense",25},
	}
}

addLootItemTemplate("bh_ring", bh_ring)
