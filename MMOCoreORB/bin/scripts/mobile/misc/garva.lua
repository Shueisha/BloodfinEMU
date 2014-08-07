garva= Creature:new {
  objectName = "@mob/creature_names:garva",
	customName = "GarVa the Poem Hater",
	socialGroup = "Dark Jedi",
	pvpFaction = "",
	faction = "",
	level = 105,
	chanceHit = 72.5,
	damageMin = 200,
	damageMax = 310,
	baseXp = 7849,
	baseHAM = 80000,
	baseHAMmax = 92000,
	armor = 0,
	resists = {0,0,60,20,60,30,60,60,0},
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


	templates = {"object/mobile/lady_valarian.iff"},
	scale = 1.5,
	lootGroups = {
		{
			groups = {
				{group = "color_crystals", chance = 100000},
				{group = "junk", chance = 7550000},
				{group = "rifles", chance = 550000},
				{group = "pistols", chance = 550000},
                {group = "melee_weapons", chance = 550000},
                {group = "carbines", chance = 550000},
				{group = "clothing_attachments", chance = 25000},
				{group = "armor_attachments", chance = 25000},
				{group = "stormtrooper_common", chance = 100000}
			},
			lootChance = 2800000
		}						
	},
	weapons = {"dark_jedi_weapons_gen4"},
	conversationTemplate = "",
	attacks = merge(lightsabermaster,forcepowermaster)
}

CreatureTemplates:addCreatureTemplate(garva, "garva")
