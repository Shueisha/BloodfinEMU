thiel = Creature:new {
	objectName = "",
	customName = "Jedi Master Thiel",
	socialGroup = "self",
	pvpFaction = "self",
	faction = "",
	level = 301,
	chanceHit = 300,
	damageMin = 2645,
	damageMax = 5000,
	baseXp = 26845,
	baseHAM = 845000,
	baseHAMmax = 850000,
	armor = 3,
	resists = {95,95,95,95,95,95,95,95,35},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = AGGRESSIVE + ATTACKABLE,
	creatureBitmask = PACK + HERD + KILLER,
	optionsBitmask = 128,
	diet = HERBIVORE,

	templates = {
		"object/mobile/dressed_jedi_trainer_old_human_male_01.iff",
		"object/mobile/dressed_jedi_trainer_chiss_male_01.iff",
		"object/mobile/dressed_jedi_trainer_nikto_male_01.iff",
		"object/mobile/dressed_jedi_trainer_twilek_female_01.iff",
		"object/mobile/dressed_tiberus_anderlock.iff",
		"object/mobile/dressed_neja_bertolo.iff"},
	lootGroups = {
		{
			groups = {
				{group = "madness_robes", chance = 10000000},
			},
			lootChance = 10000000
		},
		
	},
	weapons = {"light_jedi_weapons"},
	conversationTemplate = "",
	attacks = merge(lightsabermaster,forcepowermaster)
}

CreatureTemplates:addCreatureTemplate(thiel, "thiel")
