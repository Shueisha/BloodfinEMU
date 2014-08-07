crafting_mod_necklace_humanoid = {
    --This is necklace is to add Artisan Exp/Assembly for all humanoid races other than itho and wook.
    --It was done this way because if those whom have robes had access to necklace_01 then it'd be too OP.
    minimumLevel = 0,
    maximumLevel = -1,
    customObjectName = "Humanoid Artisan Research Pendant (+)",
    directObjectTemplate = "object/tangible/wearables/necklace/boogles/modified_geo_custom_necklace_02.iff",
    craftingValues = {},

    customizationStringNames = {},
    customizationValues = {},


    junkDealerTypeNeeded = JUNKCLOTHESANDJEWELLERY,
    junkMinValue = 95000,
    junkMaxValue = 99000
}

addLootItemTemplate("crafting_mod_necklace_humanoid", crafting_mod_necklace_humanoid)
