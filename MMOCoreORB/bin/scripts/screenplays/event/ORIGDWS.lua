DWS = ScreenPlay:new {
	numberOfActs = 1
}

--   Set to 1 for debug messages  -
TEST = 0

--------------------------------------------------------------
--   TODO List                                               -
--------------------------------------------------------------
--[[
* Set customization vars for armor so it's colored
* Fix Jetpack Z, spawn timer and auto-mount
* Make Voice Recognition Terminal work
* Make debris spawn again once the blastromech functionality works
* Make rebel sidequest's target npc send proper parameter message:
	code is there, but not sending for some reason
* Make Haldo auto-attack first and only conversible after some damage done:
	code is there, but neither forcePeace() nor updating the optionsBitmask to allow conversaton works
* Make DE10, Executioner's Hack and Mandalorian Wine Schematics work
* Add working lootable Data Storage Units:
	Using crafter name once it is changed to Origin Object (anyone else hat EA's Origin?)
* Add Ventilation Quest
* Make Advanced Rebreather, Industrial Battery (cleaned and uncleaned) and Alum Sickness Medicine No-Trade
* Make mobs in crafting rooms despawn after the crafting timer runs out
]]

-- Unused messages:
--[[
ventilation_repair	Alum Mine ventilation system is now operational.
repair_failed	Mission Failure: The droid was destroyed and the ventilation system is still off.
protect_tools	Protect the droid while it picks up tools needed to repair the ventilation system.
protect_fix	Protect the droid while it conducts repairs on the ventilation system.
entrance_denied	This door is locked. Perhaps you should seek the advice of someone knowledgeable about the Mandalorians on how to enter this base.
allum_warning	Environmental protection is required beyond this point due to high levels of alum gas.
]]

--------------------------------------------------------------
--   Spawn Map for conditionally spawned Creatures           -
--------------------------------------------------------------
specialSpawnMapDWS = {
	--[[according to a bug report these spawned at the other door pre-cu
	rageon_vart = {"rageon_vart", 0, -84.8, -20, -25.7, -114, 5996323},
	rageon_vart_assist1 = {"death_watch_bloodguard", 0, -84.8, -20, -25.7, -114, 5996323},
	rageon_vart_assist2 = {"death_watch_bloodguard", 0, -84.8, -20, -25.7, -114, 5996323},]]
--	rageon_vart = {"rageon_vart", 0, -114.3, -20, -25.7, 108, 5996323},
--	rageon_vart_assist1 = {"death_watch_bloodguard", 0, -114.3, -20, -25.7, 108, 5996323},
--	rageon_vart_assist2 = {"death_watch_bloodguard", 0, -114.3, -20, -25.7, 108, 5996323},
	--[[according to a bug report these spawned at the other door pre-cu
	klin_nif = {"klin_nif", 0, -44.9, -32, -99.4, 56, 5996331},
	klin_nif_assist1 = {"death_watch_bloodguard", 0, -44.9, -32, -99.4, 56, 5996331},
	klin_nif_assist2 = {"death_watch_bloodguard", 0, -44.9, -32, -99.4, 56, 5996331},]]
--	klin_nif = {"klin_nif", 0, -9.9, -32, -100.5, -47, 5996331},
--	klin_nif_assist1 = {"death_watch_bloodguard", 0, -9.9, -32, -100.5, -47, 5996331},
--	klin_nif_assist2 = {"death_watch_bloodguard", 0, -9.9, -32, -100.5, -47, 5996331},
--	fenri_dalso = {"fenri_dalso", 0, 25.8, -60, -172.1, -9, 5996346},
--	fenri_dalso_add1 = {"death_watch_wraith", 0, 26.0, -60, -171.1, 0, 5996346},
--	fenri_dalso_add2 = {"death_watch_s_battle_droid", 0, 24.9, -60, -174.0, -5, 5996346},
--	fenri_dalso_add3 = {"death_watch_s_battle_droid", 0, 27.3, -60, -173.7, -9, 5996346},
--	fenri_dalso_add4 = {"death_watch_wraith", 0, 25.8, -60, -173.7, 0, 5996346},
--	fenri_dalso_assist1 = {"death_watch_wraith", 0, 25.8, -60, -172.1, -9, 5996346},
--	fenri_dalso_assist2 = {"death_watch_wraith", 0, 25.8, -60, -172.1, -9, 5996346},
--	haldo1 = {"mand_bunker_crazed_miner", 0, -47.6,-59.8,-123.2,-26,5996362},
--	haldo2 = {"mand_bunker_crazed_miner", 0, -178.7,-60.1,-147.9,12,5996369},
--	haldo3 = {"mand_bunker_crazed_miner", 0, -185,-60.4,-250.5,-138,5996376},
	lootbox1mob1 = {"guard_chuba", 0, -119.1,-50, 30.1, -600, 3566259},
	lootbox2mob1 = {"death_watch_chef", 0, 1.9,-20, 113.8, -8, 3566245},
	lootbox2mob2 = {"death_watch_chef", 0, 1.8,-20, 116.9, 68, 3566245},
	lootbox2mob3 = {"death_watch_chef", 0, 7.0,-20, 118.5, -92, 3566245},
	lootbox3mob1 = 	{"death_watch_ch", 0, 20,-50, 74.8, -108, 3566257},
	lootbox3mob2 = {"dws_cat", 0, 13.9,-50, 78.9, 138, 3566257},
	lootbox3mob3 = {"dws_cat", 0, 21,-50, 76.8, -108, 3566257},
	lootbox3mob4 = {"dws_cat", 0, 8.6,-50, 66.9, 60, 3566257},
	lootbox3mob5 = {"dws_cat", 0, 16.6,-50, 66.0, 10, 3566257},
	lootbox3mob6 = {"dws_cat", 0, 22.8,-50, 68.6, -50, 3566257},	
	lootbox4mob1 = 	{"death_watch_ch", 0, 64,-20, 108, 64, 3566241},
	lootbox4mob2 = {"dws_cat", 0, 64,-20, 115.8, 144, 3566241},
	lootbox4mob3 = {"dws_cat", 0, 74,-20, 111.8, -98, 3566241},
	lootbox5mob1 = 	{"death_watch_ch", 0, 1.8,-12, 114.9, -81, 3566211},
	lootbox5mob2 = {"dws_cat", 0, 2.3,-12, 109.8, -33, 3566211},
	lootbox5mob3 = {"dws_cat", 0, 7.5,-12, 119.0, -123, 3566211},
	lootbox6mob1 = 	{"death_watch_ch", 0, 69.8,-20, 34.9, 165, 3566248},
	lootbox6mob2 = {"dws_cat", 0, 69.3,-20, 24.8, 0, 3566248},
	lootbox6mob3 = {"dws_cat", 0, 64.5,-20, 33.3, 107, 3566248},	
	jetpackdroid = {"r3", 1, -139.5,-50, 75.8, 101, 3566259},
	tailordroid = {"r3", 1, -139.5,-50, 65.8, 33, 3566259},
	armorsmithdroid = {"r3", 1, -139.5,-50, 45.8, -42, 3566259},
	droidengineerdroid = {"r3", 1, -139.5,-50, 55.8, 21, 3566259},
--	entrance1 = {"death_watch_battle_droid", 0, -31.9, -12.0, -3.7, 121, 5996315},
--	entrance2 = {"death_watch_battle_droid", 0, -32.5, -12.0, -8.1, 76, 5996315}, 
	tailorattack5 = {"death_watch_ch", 0,-134.5,-50, 67.8, 30, 3566259},
	tailorattack6 = {"dws_cat", 0, -133.5,-50, 62.8, -12, 3566259},
	tailorattack7 = {"dws_cat", 0,-138.5,-50, 61.0, 23, 3566259},
	tailorattack8 = {"dws_cat", 0,-136.5,-50, 69.8, 101, 3566259},
	armorattack5 = {"death_watch_ig88", 0,-125.5,-50, 44.8, 176, 3566259},
	armorattack6 = {"death_watch_battle_droid", 0, -131.5,-50, 38.8, -127, 3566259},
	armorattack7 = {"death_watch_battle_droid", 0,-130.5,-50, 60.8, 81, 3566259},
	armorattack8 = {"death_watch_battle_droid", 0,-123.5,-50, 50.8, -150, 3566259},
	jetpackattack5 = {"death_watch_battle_droid", 0,-125.5,-50, 44.8, -116, 3566259},
	jetpackattack6 = {"death_watch_wraith", 0, -131.5,-50, 38.8, -34, 3566259},
	jetpackattack7 = {"death_watch_ghost", 0,-130.5,-50, 60.8, -13, 3566259},
	jetpackattack8 = {"death_watch_battle_droid", 0,-123.5,-50, 50.8, -116, 3566259},
	droidengineerattack5 = {"death_watch_battle_droid", 0,-134.5,-50, 67.8, 84, 3566259},
	droidengineerattack6 = {"death_watch_wraith", 0, -133.5,-50, 62.8, 23, 3566259},
	droidengineerattack7 = {"death_watch_ghost", 0,-138.5,-50, 61.0, 114, 3566259},
	droidengineerattack8 = {"death_watch_battle_droid", 0,-136.5,-50, 69.8, -130, 3566259},
}

--------------------------------------------------------------
--   Spawn Map for respawning static Creatures               -
--------------------------------------------------------------
spawnMapDWS = 	{
	{"mand_bunker_foreman", 20, 69.8, -20.0, 105.8, 32, 3566241},
	{"death_watch_wraith", 600, 64.2, -20.0, 106.2, 44, 3566241},
	{"death_watch_wraith", 600, 67.0, -20.0, 116.5, -179, 3566241},
	{"death_watch_wraith", 600, 63.4, -20.0, 111.0, 90, 3566241},
	{"death_watch_wraith", 600, 90.9, -20.0, 116.6, -179, 3566240},
	{"death_watch_wraith", 600, 103.6, -20.0, 116.9, 38, 3566240},
	{"death_watch_wraith", 600, 105.9, -20.0, 110.8, 90, 3566240},
	{"death_watch_wraith", 600, 99.7, -20.0, 116.4, -175, 3566240},
	{"death_watch_wraith", 600, 101.6, -20.0, 109.9, -37, 3566240},
	{"death_watch_wraith", 600, 101.6, -20.0, 111.6, -146, 3566240},
	{"death_watch_wraith", 600, 83.6, -20.0, 115.1, 0, 3566237},
	{"death_watch_wraith", 600, 83.9, -20.0, 138.6, 0, 3566237},
	{"death_watch_wraith", 600, 63.1, -20.0, 134.6, 90, 3566242},
	{"death_watch_wraith", 600, 67.0, -20.0, 134.5, 90, 3566242},
	{"death_watch_wraith", 600, 71.6, -20.0, 134.5, 90, 3566242},
	{"death_watch_wraith", 600, 62.9, -20.0, 127.3, 90, 3566242},
	{"death_watch_wraith", 600, 67.8, -20.0, 127.3, 90, 3566242},
	{"death_watch_wraith", 600, 71.7, -20.0, 127.3, 90, 3566242},
	{"death_watch_wraith", 600, 97.2, -20.0, 134.8, 179, 3566239},
	{"death_watch_wraith", 600, 100.1, -20.0, 134.9, -129, 3566239},
	{"death_watch_wraith", 600, 103.4, -20.0, 133.4, -133, 3566239},
	{"death_watch_wraith", 600, 103.2, -20.0, 130.8, -90, 3566239},
	{"death_watch_wraith", 600, 103.6, -20.0, 128.2, -45, 3566239},
	{"death_watch_wraith", 600, 99.1, -20.0, 124.3, -2, 3566239},
	{"death_watch_wraith", 600, 97.2, -20.0, 130.5, -96, 3566239},
	{"death_watch_wraith", 600, 96.2, -20.0, 129.7, 1, 3566239},
	{"death_watch_wraith", 600, 102.5, -20.0, 157.2, -90, 3566238},
	{"death_watch_wraith", 600, 94.8, -20.0, 157.1, -90, 3566238},
	{"death_watch_wraith", 600, 102.2, -20.0, 145.2, -90, 3566238},
	{"death_watch_wraith", 600, 95.1, -20.0, 145.2, -90, 3566238},
	{"death_watch_wraith", 600, 99.3, -20.0, 146.1, 2, 3566238},
	{"death_watch_wraith", 600, 100.1, -20.0, 147.8, -129, 3566238},
	{"death_watch_wraith", 600, 97.9, -20.0, 147.4, 54, 3566238},
	{"death_watch_wraith", 600, 70.7, -20.0, 151.0, -90, 3566236},
	{"death_watch_wraith", 600, 44.4, -20.0, 150.0, -90, 3566235},
	{"death_watch_wraith", 600, 47.7, -20.0, 146.3, 179, 3566235},
	{"death_watch_wraith", 600, 50.3, -20.0, 157.2, 90, 3566235},
	{"death_watch_wraith", 600, 47.0, -20.0, 131.5, 0, 3566235},
	{"death_watch_wraith", 600, 48.9, -20.0, 133.3, -90, 3566235},
	{"death_watch_wraith", 600, 47.2, -20.0, 135.1, 179, 3566235},
	{"death_watch_wraith", 600, 45.3, -20.0, 133.3, 90, 3566235},
	{"death_watch_wraith", 600, 50.7, -20.0, 115.1, -134, 3566215},
	{"death_watch_wraith", 600, 42.2, -20.0, 114.9, 600, 3566215},
	{"death_watch_wraith", 600, 42.2, -20.0, 106.6, 50, 3566215},
	{"death_watch_wraith", 600, 51.0, -20.0, 106.5, -42, 3566215},
	{"death_watch_s_battle_droid", 600, 33.4, -20.0, 105.6, 179, 3566214},
	{"death_watch_ghost", 600,  8.7, -12.0, 73.7, -84, 3566206},
	{"death_watch_black_sun_assassin", 600, 3.6, -12.0, 79.4, 1718, 3566206},
	{"death_watch_black_sun_thug", 600, -1.1, -12.0, 74.2,  83, 3566206},
	{"death_watch_black_sun_henchman", 600, 3.8, -12.0, 69.3, 0, 3566206},
	{"death_watch_black_sun_guard", 600, 4.1, -12.0, 64.2, -4, 3566206},
	{"death_watch_bloodguard", 600, -1.5, -12.0, 52.8, 179, 3566206},
	{"death_watch_bloodguard", 600, 9.6, -12.0, 53.0, 90, 3566206},
	{"death_watch_s_battle_droid", 600, 8.0, -12.0, 29.3, -90, 3566201},
	{"death_watch_ghost", 600, 21.4, -12.0, 22.5, -179, 3566202},
	{"death_watch_ghost", 600, 24.6, -12.0, 28.7, 48, 3566202},
	{"death_watch_ghost", 600, 20.6, -12.0, 35.6, 35, 3566202},
	{"black_sun_initiate", 600, 57.2, -12.0, 64.4, 28, 3566205},
	{"black_sun_initiate", 600, 56.7, -12.0, 53.1, 132, 3566205},
	{"black_sun_initiate", 600, 40.8, -12.0, 65.2, -9, 3566205},
	{"death_watch_ghost", 600, 35.7, -12.0, 63.4, 179, 3566205},
	{"death_watch_ghost", 600, 36.3, -12.0, 54.9, -8, 3566205},
	{"death_watch_ghost", 600, 17.6, -12.0, 105.9, 49, 3566210},
	{"death_watch_ghost", 600, 18.0, -12.0, 91.9, -162, 3566210},
	{"death_watch_ghost", 600, 13.5, -12.0, 92.9, 32, 3566210},
	{"death_watch_ghost", 600, 19.8, -12.0, 96.8, -90, 3566210},
	{"death_watch_ghost", 600, 19.8, -12.0, 98.8, -90, 3566210},
	{"death_watch_ghost", 600, 19.8, -12.0, 100.8, -90, 3566210},
	{"death_watch_ghost", 600, 19.8, -12.0, 102.8, -90, 3566210},
	{"death_watch_ghost", 600, 19.8, -12.0, 104.8, -90, 3566210},
	{"death_watch_ghost", 600, 1.7, -12.0, 119.2, 0, 3566211},
	{"death_watch_ghost", 600, 6.6, -12.0, 117.0, -179, 3566211},
	{"death_watch_ghost", 600, 6.5, -12.0, 113.4, -179, 3566211},
	{"death_watch_ghost", 600, 6.4, -12.0, 110.2, -179, 3566211},
	{"death_watch_ghost", 600, 1.1, -12.0, 116.4, -179, 3566211},
	{"death_watch_ghost", 600, 1.2, -12.0, 113.1, -179, 3566211},
	{"death_watch_ghost", 600, 1.2, -12.0, 109.8, -179, 3566211},
	{"death_watch_ghost", 600, -7.1, -12.0, 95.6, 72, 3566212},
	{"death_watch_ghost", 600, -11.3, -12.0, 93.9, 0, 3566212},
	{"death_watch_ghost", 600, -11.8, -12.0, 94.9, 118, 3566212},
	{"death_watch_ghost", 600, -14.9, -12.0, 98.5, 51, 3566212},
	{"death_watch_ghost", 600, -12.7, -12.0, 102.8, 94, 3566212},
	{"death_watch_ghost", 600, -12.0, -12.0, 103.9, 153, 3566212},
	{"death_watch_ghost", 600, -7.5, -12.0, 102.3, 148, 3566212},
	{"death_watch_ghost", 600, -6.2, -12.0, 101.6, -64, 3566212},     
 
 -- 2Nd Floor NPC's

  {"death_watch_s_battle_droid", 600, 49.4, -20.0, 51.2, 0, 3566247},
  {"death_watch_s_battle_droid", 600, 25.1, -20.0, 59.3, 90, 3566243},
  {"death_watch_s_battle_droid", 600, 19.3, -20.0, 64.6, 0, 3566243},
  {"death_watch_s_battle_droid", 600, 13.9, -20.0, 59.0, -90, 3566243},
  {"death_watch_s_battle_droid", 600, 19.6, -20.0, 53.4, -179, 3566243},
  {"death_watch_battle_droid", 600, 65.7, -20.0, 51.7, 35, 3566249},
  {"death_watch_battle_droid", 600, 65.5, -20.0, 66.4, 141, 3566249},  
  {"black_sun_initiate", 600, 59.3, -20.0, 21.4, 90, 3566248},
  {"black_sun_initiate", 600, 61.3, -20.0, 21.4, 90, 3566248},
  {"black_sun_initiate", 600, 63.3, -20.0, 21.4, 90, 3566248},
  {"black_sun_initiate", 600, 65.3, -20.0, 21.4, 90, 3566248},
  {"black_sun_initiate", 600, 67.3, -20.0, 21.4, 90, 3566248},
  {"black_sun_initiate", 600, 59.3, -20.0, 23.4, 90, 3566248},
  {"black_sun_initiate", 600, 61.3, -20.0, 23.4, 90, 3566248},
  {"black_sun_initiate", 600, 63.3, -20.0, 23.4, 90, 3566248},
  {"black_sun_initiate", 600, 65.3, -20.0, 23.4, 90, 3566248},
  {"black_sun_initiate", 600, 67.3, -20.0, 23.4, 90, 3566248},
  {"black_sun_initiate", 600, 59.3, -20.0, 25.4, 90, 3566248},
  {"black_sun_initiate", 600, 61.3, -20.0, 25.4, 90, 3566248},
  {"black_sun_initiate", 600, 63.3, -20.0, 25.4, 90, 3566248},
  {"black_sun_initiate", 600, 65.3, -20.0, 25.4, 90, 3566248},
  {"black_sun_initiate", 600, 67.3, -20.0, 25.4, 90, 3566248},
  {"black_sun_initiate", 600, 59.3, -20.0, 27.4, 90, 3566248},
  {"black_sun_initiate", 600, 61.3, -20.0, 27.4, 90, 3566248},
  {"black_sun_initiate", 600, 63.3, -20.0, 27.4, 90, 3566248},
  {"black_sun_initiate", 600, 65.3, -20.0, 27.4, 90, 3566248},
  {"black_sun_initiate", 600, 67.3, -20.0, 27.4, 90, 3566248},
  {"black_sun_initiate", 600, 59.3, -20.0, 29.4, 90, 3566248},
  {"black_sun_initiate", 600, 61.3, -20.0, 29.4, 90, 3566248},
  {"black_sun_initiate", 600, 63.3, -20.0, 29.4, 90, 3566248},
  {"black_sun_initiate", 600, 65.3, -20.0, 29.4, 90, 3566248},
  {"black_sun_initiate", 600, 67.3, -20.0, 29.4, 90, 3566248},
  {"black_sun_initiate", 600, 59.3, -20.0, 31.4, 90, 3566248},
  {"black_sun_initiate", 600, 61.3, -20.0, 31.4, 90, 3566248},
  {"black_sun_initiate", 600, 63.3, -20.0, 31.4, 90, 3566248},
  {"black_sun_initiate", 600, 65.3, -20.0, 31.4, 90, 3566248},
  {"black_sun_initiate", 600, 67.3, -20.0, 31.4, 90, 3566248},

-- 3rd Floor NPC's

  {"death_watch_s_battle_droid", 600, -78.4, -50.0, 116.5, 90, 3566261},
  {"death_watch_s_battle_droid", 600, -86.1, -50.0, 109.7, 179, 3566261},
  {"death_watch_s_battle_droid", 600, 63.5, -50.0, 28.7, 0, 3566252},
  {"death_watch_battle_droid", 600, 36.0, -50.0, 19.5, 86, 3566255},
  {"death_watch_battle_droid", 600, 36.0, -50.0, 24.5, 86, 3566255},
  {"death_watch_battle_droid", 600, 36.0, -50.0, 29.5, 86, 3566255},
--  {"death_watch_battle_droid", 600, 36.0, -50.0, 19.5, 86, 3566255},
--  {"death_watch_battle_droid", 600, 36.0, -50.0, 19.5, 86, 3566255},  
  {"death_watch_s_battle_droid", 600, 25.4, -50.0, 24.5, 90, 3566255},
--  {"death_watch_s_battle_droid", 600, -78.4, -50.0, 116.5, 90, 3566261},  

-- Kitchen

  {"death_watch_chef", 600, -11.9, -20.0, 100.7, 176, 3566245},
  {"death_watch_chef", 600, -7.1, -20.0, 100.7, 176, 3566245},
  {"death_watch_chef", 600, 0.9, -20.0, 100.7, 176, 3566245},
  {"death_watch_chef", 600, 6.0, -20.0, 100.7, 176, 3566245},
  {"death_watch_chef", 600, 13.8, -20.0, 100.7, 176, 3566245},
  {"death_watch_chef", 600, 16.2, -20.0, 100.7, 176, 3566245},
  {"death_watch_chef", 600, -18.7, -20.0, 103.6, -85, 3566245},
  {"death_watch_chef", 600, -18.7, -20.0, 108.0, -85, 3566245},
  {"death_watch_chef", 600, -18.7, -20.0, 115.3, -85, 3566245},
  {"death_watch_chef2", 1200, -18.7, -20.0, 128.5, -42, 3566245},  
  {"death_watch_chef1", 1200, -18.7, -20.0, 126.2, -42, 3566245},
  {"death_watch_chef", 600, -18.7, -20.0, 121.0, -85, 3566245},  
  {"death_watch_battle_droid", 600, -88.9, -50.0, 91.2, 179, 3566259},
  {"death_watch_battle_droid", 600, -83.1, -50.0, 91.2, 179, 3566259},
--  {"death_watch_wraith", 600, 58.8, -50.0, 116.4, -90, 3566263},
  {"death_watch_wraith", 600, -62.5, -50.0, 116.8, -90, 3566263},  
  {"death_watch_wraith", 600, -62.5, -50.0, 110.4, -90, 3566263},
--  {"death_watch_wraith", 600, 65.8, -50.0, 120.4, -90, 3566263},
  {"death_watch_wraith", 600, -62.5, -50.0, 120.3, -90, 3566263},
--  {"death_watch_wraith", 600, 58.8, -50.0, 114.4, -90, 3566263},
--  {"death_watch_wraith", 600, 60.8, -50.0, 114.4, -90, 3566263},
--  {"death_watch_wraith", 600, 62.8, -50.0, 114.4, -90, 3566263},
--  {"death_watch_wraith", 600, 64.8, -50.0, 114.4, -90, 3566263},
--  {"death_watch_wraith", 600, 66.8, -50.0, 114.4, -90, 3566263},
--  {"death_watch_wraith", 600, 58.8, -50.0, 118.4, -90, 3566263},
--  {"death_watch_wraith", 600, 60.8, -50.0, 118.4, -90, 3566263},
--  {"death_watch_wraith", 600, 62.8, -50.0, 118.4, -90, 3566263},
--  {"death_watch_wraith", 600, 64.8, -50.0, 118.4, -90, 3566263},
  {"death_watch_ch", 600, -35.1, -50.0, 1.7, -87, 3566262},

-- Hangar

  {"dw_at", 1200, -114.7, -50.0, 56.9, 0, 3566259},
  {"dw_private", 600, -59.4, -50.0, 76.2, 90, 3566259},
  {"dw_private", 600, -61.4, -50.0, 76.2, 90, 3566259},
  {"dw_private", 600, -63.4, -50.0, 76.2, 90, 3566259},
  {"dw_private", 600, -65.4, -50.0, 76.2, 90, 3566259},
  {"dw_private", 600, -67.4, -50.0, 76.2, 90, 3566259},
  {"dw_private", 600, -69.4, -50.0, 76.2, 90, 3566259},
  {"dw_private", 600, -71.4, -50.0, 76.2, 90, 3566259},
  {"dw_private", 600, -59.4, -50.0, 73.2, 90, 3566259},
  {"dw_private", 600, -61.4, -50.0, 73.2, 90, 3566259},
  {"dw_private", 600, -63.4, -50.0, 73.2, 90, 3566259},
  {"dw_private", 600, -65.4, -50.0, 73.2, 90, 3566259},
  {"dw_private", 600, -67.4, -50.0, 73.2, 90, 3566259},
  {"dw_private", 600, -69.4, -50.0, 73.2, 90, 3566259},
  {"dw_private", 600, -71.4, -50.0, 73.2, 90, 3566259},
  {"dw_private", 600, -59.4, -50.0, 70.2, 90, 3566259},
  {"dw_private", 600, -61.4, -50.0, 70.2, 90, 3566259},
  {"dw_private", 600, -63.4, -50.0, 70.2, 90, 3566259},
  {"dw_private", 600, -65.4, -50.0, 70.2, 90, 3566259},
  {"dw_private", 600, -67.4, -50.0, 70.2, 90, 3566259},
  {"dw_private", 600, -69.4, -50.0, 70.2, 90, 3566259},
  {"dw_private", 600, -71.4, -50.0, 70.2, 90, 3566259},
  {"dw_private", 600, -59.4, -50.0, 67.2, 90, 3566259},
  {"dw_private", 600, -61.4, -50.0, 67.2, 90, 3566259},
  {"dw_private", 600, -63.4, -50.0, 67.2, 90, 3566259},
  {"dw_private", 600, -65.4, -50.0, 67.2, 90, 3566259},
  {"dw_private", 600, -67.4, -50.0, 67.2, 90, 3566259},
  {"dw_private", 600, -69.4, -50.0, 67.2, 90, 3566259},
  {"dw_private", 600, -71.4, -50.0, 67.2, 90, 3566259},  
  {"dw_private", 600, -59.4, -50.0, 64.2, 90, 3566259},
  {"dw_private", 600, -61.4, -50.0, 64.2, 90, 3566259},
  {"dw_private", 600, -63.4, -50.0, 64.2, 90, 3566259},
  {"dw_private", 600, -65.4, -50.0, 64.2, 90, 3566259},
  {"dw_private", 600, -67.4, -50.0, 64.2, 90, 3566259},
  {"dw_private", 600, -69.4, -50.0, 64.2, 90, 3566259},
  {"dw_private", 600, -71.4, -50.0, 64.2, 90, 3566259},
  {"death_watch_battle_droid", 600, -23.4, -50.0, 47.0, 0, 3566259},
  {"death_watch_battle_droid", 600, -25.4, -50.0, 47.0, 0, 3566259},
  {"death_watch_battle_droid", 600, -27.4, -50.0, 47.0, 0, 3566259},
  {"death_watch_battle_droid", 600, -29.4, -50.0, 47.0, 0, 3566259},
  {"death_watch_battle_droid", 600, -31.4, -50.0, 47.0, 0, 3566259},
  {"death_watch_battle_droid", 600, -33.4, -50.0, 47.0, 0, 3566259},
  {"death_watch_battle_droid", 600, -35.4, -50.0, 47.0, 0, 3566259},
  {"death_watch_battle_droid", 600, -23.4, -50.0, 44.0, 0, 3566259},
  {"death_watch_battle_droid", 600, -25.4, -50.0, 44.0, 0, 3566259},
  {"death_watch_battle_droid", 600, -27.4, -50.0, 44.0, 0, 3566259},
  {"death_watch_battle_droid", 600, -29.4, -50.0, 44.0, 0, 3566259},
  {"death_watch_battle_droid", 600, -31.4, -50.0, 44.0, 0, 3566259},
  {"death_watch_battle_droid", 600, -33.4, -50.0, 44.0, 0, 3566259},
  {"death_watch_battle_droid", 600, -35.4, -50.0, 44.0, 0, 3566259},
  {"death_watch_battle_droid", 600, -23.4, -50.0, 41.0, 0, 3566259},
  {"death_watch_battle_droid", 600, -25.4, -50.0, 41.0, 0, 3566259},
  {"death_watch_battle_droid", 600, -27.4, -50.0, 41.0, 0, 3566259},
  {"death_watch_battle_droid", 600, -29.4, -50.0, 41.0, 0, 3566259},
  {"death_watch_battle_droid", 600, -31.4, -50.0, 41.0, 0, 3566259},
  {"death_watch_battle_droid", 600, -33.4, -50.0, 41.0, 0, 3566259},
  {"death_watch_battle_droid", 600, -35.4, -50.0, 41.0, 0, 3566259},  
  {"death_watch_battle_droid", 600, -23.4, -50.0, 38.0, 0, 3566259},
  {"death_watch_battle_droid", 600, -25.4, -50.0, 38.0, 0, 3566259},
  {"death_watch_battle_droid", 600, -27.4, -50.0, 38.0, 0, 3566259},
  {"death_watch_battle_droid", 600, -29.4, -50.0, 38.0, 0, 3566259},
  {"death_watch_battle_droid", 600, -31.4, -50.0, 38.0, 0, 3566259},
  {"death_watch_battle_droid", 600, -33.4, -50.0, 38.0, 0, 3566259},
  {"death_watch_battle_droid", 600, -35.4, -50.0, 38.0, 0, 3566259},
  {"death_watch_battle_droid", 600, -23.4, -50.0, 35.0, 0, 3566259},
  {"death_watch_battle_droid", 600, -25.4, -50.0, 35.0, 0, 3566259},
  {"death_watch_battle_droid", 600, -27.4, -50.0, 35.0, 0, 3566259},
  {"death_watch_battle_droid", 600, -29.4, -50.0, 35.0, 0, 3566259},
  {"death_watch_battle_droid", 600, -31.4, -50.0, 35.0, 0, 3566259},
  {"death_watch_battle_droid", 600, -33.4, -50.0, 35.0, 0, 3566259},
  {"death_watch_battle_droid", 600, -35.4, -50.0, 35.0, 0, 3566259},  
 
-- Boss Npc's 
 
  {"manda", 1800, -40.4, -50.0, 116.4, -90, 3566263},
  {"shae_vizla", 1800, 71.4, -20.0, 26.9, -118, 3566248},   
  {"hunter_sherruk", 1800, -14.3, -50.0, 0.0, -90, 3566262},
  {"dw_acklay", 1800, -34.2, -50.0, 2.1, -90, 3566262},
--  {"darth_smedley", 600, 69.9, -20.0, 105.8, 36, 3566241},	
	}

--------------------------------------------------------------------------------
--   Constants used to reference items, cells, rooms and skills                -
--------------------------------------------------------------------------------



ALUMMINERAL = "object/tangible/loot/dungeon/death_watch_bunker/mining_drill_reward.iff"

ADVANCEDREBREATHER = "Advanced Rebreather"
MANDOHELMET = "object/tangible/wearables/armor/mandalorian/armor_mandalorian_helmet.iff"
MANDOREBREATHER = "object/tangible/wearables/goggles/rebreather.iff"
FILTER = "object/tangible/dungeon/death_watch_bunker/filter.iff"
ENHANCEDFILTER = "object/tangible/dungeon/death_watch_bunker/enhanced_filter.iff"
ALUMGEL = "object/tangible/dungeon/death_watch_bunker/gel_packet.iff"
MEDICINE = "object/tangible/dungeon/death_watch_bunker/crazed_miner_medicine.iff"
DRILLBATTERY = "object/tangible/dungeon/death_watch_bunker/drill_battery.iff"
DRILLBATTERYCLEAN = "object/tangible/dungeon/death_watch_bunker/drill_battery_clean.iff"
JETPACKBASE = "object/tangible/loot/dungeon/death_watch_bunker/jetpack_base.iff"
JETPACKSTABILIZER = "object/tangible/loot/dungeon/death_watch_bunker/jetpack_stabilizer.iff"
DUCTEDFAN = "object/tangible/loot/dungeon/death_watch_bunker/ducted_fan.iff"
INJECTORTANK = "object/tangible/loot/dungeon/death_watch_bunker/fuel_injector_tank.iff"
DISPERSIONUNIT = "object/tangible/loot/dungeon/death_watch_bunker/fuel_dispersion_unit.iff"
BINARYLIQUID = "object/tangible/loot/dungeon/death_watch_bunker/binary_liquid.iff"
PROTECTIVELIQUID = "object/tangible/loot/dungeon/death_watch_bunker/emulsion_protection.iff"

TARGETITEMS = {
		--Armorsmith Crafting Terminal
		{ "object/tangible/wearables/armor/mandalorian/armor_mandalorian_chest_plate.iff",
		  "object/tangible/wearables/armor/mandalorian/armor_mandalorian_shoes.iff",
		  "object/tangible/wearables/armor/mandalorian/armor_mandalorian_bicep_l.iff",
		  "object/tangible/wearables/armor/mandalorian/armor_mandalorian_bicep_r.iff" },
		
		--Droid Engineer Crafting Terminal
		{ "object/tangible/wearables/armor/mandalorian/armor_mandalorian_helmet.iff",
		  "object/tangible/wearables/armor/mandalorian/armor_mandalorian_bracer_l.iff",
		  "object/tangible/wearables/armor/mandalorian/armor_mandalorian_bracer_r.iff" },
		 
		--Tailor Crafting Terminal
		{ "object/tangible/wearables/armor/mandalorian/armor_mandalorian_leggings.iff",
		  "object/tangible/wearables/armor/mandalorian/armor_mandalorian_gloves.iff",
		  "object/tangible/wearables/armor/mandalorian/armor_mandalorian_belt.iff" },
		
		-- Jetpack Crafting Terminal
		{ "object/tangible/deed/vehicle_deed/jetpack_deed.iff" },
	}



TERMINALSKILLS = {
	"",
	"",
	"",
	"",
	"crafting_armorsmith_master",
	"crafting_droidengineer_master",
	"crafting_tailor_master",
	"crafting_artisan_master"}

TERMINALSKILLMESSAGE = {
	"@dungeon/death_watch:master_armorsmith_required",
	"@dungeon/death_watch:master_droidengineer_required",
	"@dungeon/death_watch:master_tailor_required",
	"@dungeon/death_watch:master_artisan_required"}

PARTSTRINGS = {
	"@dungeon/death_watch:armorsmith_items",
	"@dungeon/death_watch:droid_engineer_items",
	"@dungeon/death_watch:tailored_items"
	}

LOCKTIME = {10,10,10,10,6,6,6}

MISSINGSKILL = {
	"",
	"",
	"",
	"",
	"@dungeon/death_watch:not_enough_armorsmith_skill",
	"@dungeon/death_watch:not_enough_droidengineer_skill",
	"@dungeon/death_watch:not_enough_tailor_skill"}

--DOORTYPE = {1,2,2,2,3,3,3}

--DOORS = {
--	{ },
--	{ PASSKEYHALL },
--	{ PASSKEYSTORAGE },
--	{ PASSKEYMINE },

	--ARMORSMITHDOOR
--	{	"object/tangible/wearables/armor/bounty_hunter/armor_bounty_hunter_chest_plate.iff",
--		"object/tangible/wearables/armor/bounty_hunter/armor_bounty_hunter_boots.iff",
--		"object/tangible/wearables/armor/bounty_hunter/armor_bounty_hunter_bicep_l.iff",
--		"object/tangible/wearables/armor/bounty_hunter/armor_bounty_hunter_bicep_r.iff"
--	},

	--DROIDENGINEERDOOR
--	{	"object/tangible/wearables/armor/bounty_hunter/armor_bounty_hunter_helmet.iff",
--		"object/tangible/wearables/armor/bounty_hunter/armor_bounty_hunter_bracer_l.iff",
--		"object/tangible/wearables/armor/bounty_hunter/armor_bounty_hunter_bracer_r.iff"
--	},

	--TAILORDOOR
--	{	"object/tangible/wearables/armor/bounty_hunter/armor_bounty_hunter_leggings.iff",
--		"object/tangible/wearables/armor/bounty_hunter/armor_bounty_hunter_gloves.iff",
--		"object/tangible/wearables/armor/bounty_hunter/armor_bounty_hunter_belt.iff"} }

MINECELLS = {
	3566251,
	3566252,
	3566253,
	3566255,
	3566256,
	3566257,
	3566258,
--	5996360,
--	5996361,
--	5996362,
--	5996363,
--	5996364,
--	5996365,
--	5996366,
--	5996369,
--	5996372,
--	5996375,
--	5996376,
--	5996377,	
}
		
registerScreenPlay("DWS", true);

--------------------------------------------------------------
--   *** START SCREENPLAY ***                                -
--------------------------------------------------------------
function DWS:start(creatureObject)
	if (not isZoneEnabled("rori")) then	
		if TEST == 1 then
			printf("[Death Watch Stronghld] Zone not loaded.\n")
		end
		return 0
	end
		
	if TEST == 1 then
		printf("[Death Watch Stronghold] Initiating spawns and observers\n")
	end
	math.randomseed( os.time() )
	local bunker = getSceneObject(3566196)
	
	if bunker == nil then
		if TEST == 1 then
			printf("[Death Watch Stronghold] Could not initialize. Zone not loaded?\n")
		end
		return 0
	end

	zero = self:spawnObjects(bunker)
	zero = self:spawnMobiles(bunker)

	if TEST == 1 then
		zero = self:test(bunker)
	end

	local bunkerObject = LuaBuildingObject(bunker)

	createEvent(1000 * 30, "DWS", "poison", bunker) 	
	createObserver(ENTEREDBUILDING, "DWS", "onEnterDWS", bunker)
	createObserver(EXITEDBUILDING, "DWS", "onExitDWS", bunker)
	return 0
end

--------------------------------------------------------------
--   Spawning Logic                                          -
--------------------------------------------------------------

--   Spawns all static respawning mobiles  -
function DWS:spawnMobiles(sceneObject)
	for i,v in ipairs(spawnMapDWS) do
		spawnedPoint = spawnMobile("rori", v[1], v[2], v[3], v[4], v[5], v[6], v[7])
	end

	return 0
end

-- Spawns all static objects and assigns Observers -
function DWS:spawnObjects(creatureObject)
	local spawnedSceneObject = LuaSceneObject(nil)

-- Door Acces Terminal Outside
--	spawnedPointer = spawnSceneObject("rori", "object/tangible/dungeon/death_watch_bunker/door_control_terminal.iff", -18.016,-12,-8.55806, 5996315, 1, 0, 0, 0)
--	spawnedSceneObject:_setObject(spawnedPointer)
--	writeData(5996314 .. ":dwb:access1", spawnedSceneObject:getObjectID())
--	writeData(spawnedSceneObject:getObjectID() .. ":dwb:accessEnabled", 1)
--	writeData(spawnedSceneObject:getObjectID() .. ":dwb:terminal", 1)

	-- Door Access Terminal A
--	spawnedPointer = spawnSceneObject("rori", "object/tangible/dungeon/death_watch_bunker/door_control_terminal.iff", -84.4526,-20,-50.504,5996323,-0.707107,0,0.707107,0)
--	spawnedSceneObject:_setObject(spawnedPointer)
--	writeData(5996314 .. ":dwb:access2", spawnedSceneObject:getObjectID())
--	writeData(spawnedSceneObject:getObjectID() .. ":dwb:accessEnabled", 1)
--	writeData(spawnedSceneObject:getObjectID() .. ":dwb:terminal", 2)
	
	-- Door Access Terminal B
--	spawnedPointer = spawnSceneObject("rori", "object/tangible/dungeon/death_watch_bunker/door_control_terminal.iff", -8.3714,-32,-95.3985,5996331,-0.707107,0,0.707107,0)
--	spawnedSceneObject:_setObject(spawnedPointer)
--	writeData(5996314 .. ":dwb:access3", spawnedSceneObject:getObjectID())
--	writeData(spawnedSceneObject:getObjectID() .. ":dwb:accessEnabled", 1)
--	writeData(spawnedSceneObject:getObjectID() .. ":dwb:terminal", 3)
	
	-- Door Access Terminal Mines
--	spawnedPointer = spawnSceneObject("rori", "object/tangible/dungeon/death_watch_bunker/door_control_terminal.iff", 26.1493,-64,-95.4288,5996347,0,0,1,0)
--	spawnedSceneObject:_setObject(spawnedPointer)
--	writeData(5996314 .. ":dwb:access4", spawnedSceneObject:getObjectID())
--	writeData(spawnedSceneObject:getObjectID() .. ":dwb:accessEnabled", 1)
--	writeData(spawnedSceneObject:getObjectID() .. ":dwb:terminal", 4)
	
	-- Voice Recognition Terminal
--	spawnedPointer = spawnSceneObject("rori", "object/tangible/dungeon/terminal_free_s1.iff",74.7941,-54,-143.444,5996348,-0.707107,0,0.707107,0)
--	spawnedSceneObject:_setObject(spawnedPointer)
--	spawnedSceneObject:setCustomObjectName("Voice Control Terminal")
	
	-- Armorsmith Access Terminal
--	spawnedPointer = spawnSceneObject("rori", "object/tangible/dungeon/death_watch_bunker/door_control_terminal.iff", -232.11,-60,-219.996,5996373,0.707107,0,0.707107,0)
--	spawnedSceneObject:_setObject(spawnedPointer)
--	spawnedSceneObject:setCustomObjectName("Armorsmith Crafting Room Entry Terminal")
--	writeData(spawnedSceneObject:getObjectID() .. ":dwb:accessEnabled", 1)
--	writeData(spawnedSceneObject:getObjectID() .. ":dwb:terminal", 5)
	
	-- Droid Engineer Crafting Room Entry Terminal
--	spawnedPointer = spawnSceneObject("rori", "object/tangible/dungeon/death_watch_bunker/door_control_terminal.iff", -230.09,-60,-124.003,5996367,0.707107,0,0.707107,0)
--	spawnedSceneObject:_setObject(spawnedPointer)
--	spawnedSceneObject:setCustomObjectName("Droid Engineer Crafting Room Entry Terminal")
--	writeData(spawnedSceneObject:getObjectID() .. ":dwb:accessEnabled", 1)
--	writeData(spawnedSceneObject:getObjectID() .. ":dwb:terminal", 6)
	
	-- Master Armorsmith Crafting Droid
	spawn = specialSpawnMapDWS["armorsmithdroid"]
	if spawn ~= nil then
		spawnPointer = spawnMobile("rori", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
		spawnedSceneObject:_setObject(spawnPointer)
		spawnedSceneObject:setCustomObjectName("Crafting Droid")
		spawnedSceneObject:setContainerComponent("death_watch_bunker_crafting_droid")
		writeData(spawnedSceneObject:getObjectID() .. ":dwb:craftingterminal", 1)
		
		--not necessary, but kept for reference
		writeData(spawnedSceneObject:getObjectID() .. ":dwb:user", 0)
		writeData(spawnedSceneObject:getObjectID() .. ":dwb:targetitemindex", 0)
		writeData(spawnedSceneObject:getObjectID() .. ":dwb:currentlycrafting", 0)
		writeData(spawnedSceneObject:getObjectID() .. ":dwb:alummineral", 0)
		writeData(spawnedSceneObject:getObjectID() .. ":dwb:binary", 0)
		writeData(spawnedSceneObject:getObjectID() .. ":dwb:protective", 0)
		writeData(spawnedSceneObject:getObjectID() .. ":dwb:bharmorpart", 0)
		
		droid = spawnedSceneObject:getObjectID()
		
		-- Armorsmith Crafting Terminal (Biceps, Chest, Boots)
		spawnedPointer = spawnSceneObject("rori", "object/tangible/dungeon/terminal_free_s1.iff",-139.5,-50, 44.8,3566259,90,0,0,0)
		spawnedSceneObject:_setObject(spawnedPointer)
		spawnedSceneObject:setCustomObjectName("Mandalorian Armorsmith Engineering Unit")
		spawnedSceneObject:setObjectMenuComponent("death_watch_bunker_mandalorian_crafting_terminal")
		writeData(spawnedSceneObject:getObjectID() .. ":dwb:craftingterminal", 1)
		writeData(spawnedSceneObject:getObjectID() .. ":dwb:droid", droid)
	end
	
	
	-- Master Droid Engineer Crafting Droid
	spawn = specialSpawnMapDWS["droidengineerdroid"]
	if spawn ~= nil then
		spawnPointer = spawnMobile("rori", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
		spawnedSceneObject:_setObject(spawnPointer)
		spawnedSceneObject:setCustomObjectName("Crafting Droid")
		spawnedSceneObject:setContainerComponent("death_watch_bunker_crafting_droid")
		writeData(spawnedSceneObject:getObjectID() .. ":dwb:craftingterminal", 2)
		
		--not necessary, but kept for reference
		writeData(spawnedSceneObject:getObjectID() .. ":dwb:user", 0)
		writeData(spawnedSceneObject:getObjectID() .. ":dwb:targetitemindex", 0)
		writeData(spawnedSceneObject:getObjectID() .. ":dwb:currentlycrafting", 0)
		writeData(spawnedSceneObject:getObjectID() .. ":dwb:alummineral", 0)
		writeData(spawnedSceneObject:getObjectID() .. ":dwb:binary", 0)
		writeData(spawnedSceneObject:getObjectID() .. ":dwb:protective", 0)
		writeData(spawnedSceneObject:getObjectID() .. ":dwb:bharmorpart", 0)
		
		droid = spawnedSceneObject:getObjectID()
		
		-- Master Droid Engineer Crafting Terminal (Bracer, Helmet)
		spawnedPointer = spawnSceneObject("rori", "object/tangible/dungeon/terminal_free_s1.iff",-139.5,-50, 54.8,3566259,90,0,0,0)
		spawnedSceneObject:_setObject(spawnedPointer)
		spawnedSceneObject:setCustomObjectName("Mandalorian Droid Engineering Unit")
		spawnedSceneObject:setObjectMenuComponent("death_watch_bunker_mandalorian_crafting_terminal")
		writeData(spawnedSceneObject:getObjectID() .. ":dwb:craftingterminal", 2)
		writeData(spawnedSceneObject:getObjectID() .. ":dwb:droid", droid)
	end
	
	
	-- Master Tailor Crafting Droid
	spawn = specialSpawnMapDWS["tailordroid"]
	if spawn ~= nil then
		spawnPointer = spawnMobile("rori", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
		spawnedSceneObject:_setObject(spawnPointer)
		spawnedSceneObject:setCustomObjectName("Crafting Droid")
		spawnedSceneObject:setContainerComponent("death_watch_bunker_crafting_droid")
		writeData(spawnedSceneObject:getObjectID() .. ":dwb:craftingterminal", 3)
		
		--not necessary, but kept for reference
		writeData(spawnedSceneObject:getObjectID() .. ":dwb:user", 0)
		writeData(spawnedSceneObject:getObjectID() .. ":dwb:targetitemindex", 0)
		writeData(spawnedSceneObject:getObjectID() .. ":dwb:currentlycrafting", 0)
		writeData(spawnedSceneObject:getObjectID() .. ":dwb:alummineral", 0)
		writeData(spawnedSceneObject:getObjectID() .. ":dwb:binary", 0)
		writeData(spawnedSceneObject:getObjectID() .. ":dwb:protective", 0)
		writeData(spawnedSceneObject:getObjectID() .. ":dwb:bharmorpart", 0)
		
		droid = spawnedSceneObject:getObjectID()
		
		-- Tailor Crafting Terminal (Pants, Gloves, Belt)
		spawnedPointer = spawnSceneObject("rori", "object/tangible/dungeon/terminal_free_s1.iff",-139.5,-50, 64.8,3566259,90,0,0,0)
		spawnedSceneObject:_setObject(spawnedPointer)
		spawnedSceneObject:setCustomObjectName("Mandalorian Tailor Engineering Unit")
		spawnedSceneObject:setObjectMenuComponent("death_watch_bunker_mandalorian_crafting_terminal")
		writeData(spawnedSceneObject:getObjectID() .. ":dwb:craftingterminal", 3)
		writeData(spawnedSceneObject:getObjectID() .. ":dwb:droid", droid)
	end
	
	-- Jetpack Crafting Droid
	spawn = specialSpawnMapDWS["jetpackdroid"]
	if spawn ~= nil then
		spawnPointer = spawnMobile("rori", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
		spawnedSceneObject:_setObject(spawnPointer)
		spawnedSceneObject:setCustomObjectName("Jetpack Crafting Droid")
		spawnedSceneObject:setContainerComponent("death_watch_bunker_crafting_droid_jetpack")
		writeData(spawnedSceneObject:getObjectID() .. ":dwb:craftingterminal", 4)
	
		--This is not necessary, just for reference
		writeData(spawnedSceneObject:getObjectID() .. ":dwb:user", 0)
		writeData(spawnedSceneObject:getObjectID() .. ":dwb:targetitemindex", 0)
		writeData(spawnedSceneObject:getObjectID() .. ":dwb:currentlycrafting", 0)
		writeData(spawnedSceneObject:getObjectID() .. ":dwb:alummineral", 0)
		writeData(spawnedSceneObject:getObjectID() .. ":dwb:jetpackbase", 0)
		writeData(spawnedSceneObject:getObjectID() .. ":dwb:jetpackstabilizer", 0)
		writeData(spawnedSceneObject:getObjectID() .. ":dwb:ductedfan", 0)
		writeData(spawnedSceneObject:getObjectID() .. ":dwb:injectortank", 0)
		writeData(spawnedSceneObject:getObjectID() .. ":dwb:dispersionunit", 0)
	
		droid = spawnedSceneObject:getObjectID()
		
		-- Master Artisan Crafting Terminal (Jetpack)
		spawnedPointer = spawnSceneObject("rori", "object/tangible/dungeon/terminal_free_s1.iff",-139.5,-50, 74.8,3566259,1,0,0,0)
		spawnedSceneObject:_setObject(spawnedPointer)
		spawnedSceneObject:setCustomObjectName("Mandalorian Jetpack Engineering Unit")
		spawnedSceneObject:setObjectMenuComponent("death_watch_bunker_mandalorian_crafting_terminal")
		writeData(spawnedSceneObject:getObjectID() .. ":dwb:craftingterminal", 4)
		writeData(spawnedSceneObject:getObjectID() .. ":dwb:droid", droid)	
	end
	
	-- Tailor Access Terminal
--	spawnedPointer = spawnSceneObject("rori", "object/tangible/dungeon/death_watch_bunker/door_control_terminal.iff", -151.045,-60,-98.8703,5996365,0,0,1,0)
--	spawnedSceneObject:_setObject(spawnedPointer)
--	spawnedSceneObject:setCustomObjectName("Tailor Crafting Room Entry Terminal")
--	writeData(spawnedSceneObject:getObjectID() .. ":dwb:accessEnabled", 1)
--	writeData(spawnedSceneObject:getObjectID() .. ":dwb:terminal", 7)
	
	-- Debris
	--[[spawnedPointer = spawnSceneObject("rori", "object/tangible/dungeon/death_watch_bunker/invulnerable_debris.iff",66.8122,-64,-113.893,5996348,1,0,0,0)
	spawnedSceneObject:_setObject(spawnedPointer)
	writeData(5996314 .. ":dwb:debrisEntrance", spawnedSceneObject:getObjectID())
	spawnedPointer = spawnSceneObject("rori", "object/tangible/dungeon/death_watch_bunker/invulnerable_debris.iff",112.524,-64,-113.886,5996348,1,0,0,0)
	spawnedSceneObject:_setObject(spawnedPointer)
	writeData(5996314 .. ":dwb:debrisOverlord", spawnedSceneObject:getObjectID())
	spawnedPointer = spawnSceneObject("rori", "object/tangible/dungeon/death_watch_bunker/invulnerable_debris.iff",113.21,-64,-151.844,5996348,1,0,0,0)
	spawnedSceneObject:_setObject(spawnedPointer)
	writeData(5996314 .. ":dwb:debrisRescue", spawnedSceneObject:getObjectID())]]
	
	--Write Data for Foreman
--	writeData(5996314 .. ":dwb:haldo_busy", 0)
	--writeData(5996314 .. ":dwb:battery_busy", 0)
	--writeData(5996314 .. ":dwb:pumps_busy", 0)
	
	-- Spawn Haldo
--	halnum = math.random(1,3)
--	spawn = specialSpawnMapDWS["haldo" .. halnum]
--	if spawn ~= nil then
--		spawnPointer = spawnMobile("rori", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
--		spawnedSceneObject:_setObject(spawnPointer)
--		writeData(5996314 .. ":dwb:haldo", spawnedSceneObject:getObjectID())
--		createObserver(OBJECTDESTRUCTION, "DWS", "haldo_killed", spawnPointer)
		--createObserver(DAMAGERECEIVED, "DWS", "haldo_damage", spawnPointer)
--	end
	
	-- Water Pressure Valve Control A
--	spawnedPointer = spawnSceneObject("rori","object/tangible/terminal/terminal_water_pressure.iff",55.5855,-32,-92.8,5996340,1,0,0,0)
--	spawnedSceneObject:_setObject(spawnedPointer)
--	spawnedSceneObject:setObjectMenuComponent("death_watch_bunker_water_valve")
--	writeData(spawnedSceneObject:getObjectID() .. ":dwb:terminal", 1)
--	writeData(5996314 .. ":dwb:valve1", 0)
	
	-- Water Pressure Valve Control B
--	spawnedPointer = spawnSceneObject("rori","object/tangible/terminal/terminal_water_pressure.iff",42.2316,-32,-72.5555,5996340,-0.707107,0,-0.707107,0)
--	spawnedSceneObject:_setObject(spawnedPointer)
--	spawnedSceneObject:setObjectMenuComponent("death_watch_bunker_water_valve")
--	writeData(spawnedSceneObject:getObjectID() .. ":dwb:terminal", 2)
--	writeData(5996314 .. ":dwb:valve2", 0)
	
	-- Water Pressure Valve Control C
--	spawnedPointer = spawnSceneObject("rori","object/tangible/terminal/terminal_water_pressure.iff",73.7982,-32,-76.4291,5996340,0.707107,0,-0.707107,0)
--	spawnedSceneObject:_setObject(spawnedPointer)
--	spawnedSceneObject:setObjectMenuComponent("death_watch_bunker_water_valve")
--	writeData(spawnedSceneObject:getObjectID() .. ":dwb:terminal", 3)
--	writeData(5996314 .. ":dwb:valve3", 0)
	
	-- Water Pressure Valve Control D
--	spawnedPointer = spawnSceneObject("rori","object/tangible/terminal/terminal_water_pressure.iff",56.0941,-32,-61.251,5996340,0,0,-1,0)
--	spawnedSceneObject:_setObject(spawnedPointer)
--	spawnedSceneObject:setObjectMenuComponent("death_watch_bunker_water_valve")
--	writeData(spawnedSceneObject:getObjectID() .. ":dwb:terminal", 4)
--	writeData(5996314 .. ":dwb:valve4", 0)
	
	-- Rebreather Filter Dispenser
--	spawnedPointer = spawnSceneObject("rori", "object/tangible/dungeon/death_watch_bunker/filter_dispenser.iff",-12.8382,-52,-147.565,5996378,0,0,1,0)
	--createObserver(OBJECTRADIALUSED, "DWS", "dispenser", spawnedPointer)
	
	-- Rebreather Workbench
--	spawnedPointer = spawnSceneObject("rori", "object/tangible/dungeon/death_watch_bunker/workbench.iff",-16.2596,-52,-147.091,5996378,0,0,1,0)
	--createObserver(OBJECTRADIALUSED, "DWS", "workbench", spawnedPointer)
	
	-- Loot Boxes
	spawnedPointer = spawnSceneObject("rori", "object/tangible/container/loot/loot_crate.iff", -120,-50, 27.5,3566259,0,0,-1,0)
	spawnedSceneObject:_setObject(spawnedPointer)
	spawnedSceneObject:setCustomObjectName("Heats bin 'O' trix")
	writeData(spawnedSceneObject:getObjectID() .. ":dwb:lootbox", 1)
	createEvent(1000, "DWS", "refill", spawnedPointer)
	
	spawnedPointer = spawnSceneObject("rori", "object/tangible/container/loot/loot_crate.iff",1.7,-20,118.3,3566245,0,0,1,0)
	spawnedSceneObject:_setObject(spawnedPointer)
	spawnedSceneObject:setCustomObjectName("Iron Chefs Secret Pantry Box")	
	writeData(spawnedSceneObject:getObjectID() .. ":dwb:lootbox", 2)
	createEvent(1000, "DWS", "refill", spawnedPointer)
	
	spawnedPointer = spawnSceneObject("rori", "object/tangible/container/loot/loot_crate.iff", 18,-50, 72.8,3566257,0,0,1,0)
	spawnedSceneObject:_setObject(spawnedPointer)
	spawnedSceneObject:setCustomObjectName("Alum Rare Storage")	
	writeData(spawnedSceneObject:getObjectID() .. ":dwb:lootbox", 3)
	createEvent(1000, "DWS", "refill", spawnedPointer)

	spawnedPointer = spawnSceneObject("rori", "object/tangible/container/loot/loot_crate.iff", 67.6,-20, 110.9, 3566241,0,0,1,0)
	spawnedSceneObject:_setObject(spawnedPointer)
	spawnedSceneObject:setCustomObjectName("Rare Storage 4")	
	writeData(spawnedSceneObject:getObjectID() .. ":dwb:lootbox", 4)
	createEvent(1000, "DWS", "refill", spawnedPointer)

	spawnedPointer = spawnSceneObject("rori", "object/tangible/container/loot/loot_crate.iff", -3.1,-12, 114.9, 3566211,0,0,1,0)
	spawnedSceneObject:_setObject(spawnedPointer)
	spawnedSceneObject:setCustomObjectName("Rare Storage 5")	
	writeData(spawnedSceneObject:getObjectID() .. ":dwb:lootbox", 5)
	createEvent(1000, "DWS", "refill", spawnedPointer)

	spawnedPointer = spawnSceneObject("rori", "object/tangible/container/loot/loot_crate.iff", 71.9,-20, 30.2, 3566248,0,0,1,0)
	spawnedSceneObject:_setObject(spawnedPointer)
	spawnedSceneObject:setCustomObjectName("Rare Storage 6")	
	writeData(spawnedSceneObject:getObjectID() .. ":dwb:lootbox", 6)
	createEvent(1000, "DWS", "refill", spawnedPointer)	

	return 1
end


--------------------------------------------------------------
--   Observer Callbacks                                      -
--------------------------------------------------------------
--function DWS:onEnterDWS(sceneObject, creatureObject)
--	local creature = LuaCreatureObject(creatureObject)
--	
--	if (creature:isAiAgent() == true) then
--		return 0
--	end
--	
--	state = creature:hasScreenPlayState(2, "DWS")
--	
--	if state == 0 then
--		local targetCellObject = LuaSceneObject(creature:getParent())
--		local buildingObject = LuaSceneObject(targetCellObject:getParent())
--		if TEST == 1 then
--			printf("locking from " .. targetCellObject:getObjectID() .. " in " .. buildingObject:getObjectID() .. "\n")
--		end
--		self:lockAll(creatureObject)
--	else
--		if TEST == 1 then
--			printf("already has access\n")
--		end
--		
--		createEvent(10 * 1000, "DWS", "lockCellsOnly", creatureObject)
--	end
--	
--	return 0
--end

--function DWS:onExitDWS(sceneObject, creatureObject, long)
--	local creature = LuaCreatureObject(creatureObject)
--	
--	if (creature:isAiAgent() == true) then
--		return 0
--	end	
--	
--	if long == OUTSIDE or long == 0 then
--		creature:sendSystemMessage("@dungeon/death_watch:relock")
--	
--		if TEST == 1 then
--			printf("removing permissions\n")
--		end
--	
--		creature:removeScreenPlayState(2, "DWS")
--		creature:removeScreenPlayState(4, "DWS")
--		creature:removeScreenPlayState(8, "DWS")
--		creature:removeScreenPlayState(16, "DWS")
--		creature:removeScreenPlayState(32, "DWS")
--		creature:removeScreenPlayState(64, "DWS")
--		creature:removeScreenPlayState(128, "DWS")
--	
--		self:lockAll(creatureObject)
--	end
--	
--	return 0
--end

function DWS:lootBox(sceneObject, creatureObject, selectedID)
	if selectedID ~= 16 then
		return 0
	end
	
	if TEST == 1 then
		printf("opening box\n")
	end
	
	local creature = LuaCreatureObject(creatureObject)
	local container = LuaSceneObject(sceneObject)

   	state = readData(container:getObjectID() .. ":dwb:spawned")
   	
   	if state == 1 then
    	return 0
	else
		box = readData(container:getObjectID() .. ":dwb:lootbox")
    	writeData(container:getObjectID() .. ":dwb:spawned", 1)
     	
     	--spawn enemies
		if box == 1 then
			local spawn = specialSpawnMapDWS["lootbox1mob1"]
			spawnPointer = spawnMobile("rori", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7]) 
		elseif box == 2 then
			local spawn = specialSpawnMapDWS["lootbox2mob1"]
			spawnPointer = spawnMobile("rori", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
			local spawn = specialSpawnMapDWS["lootbox2mob2"]
			spawnPointer = spawnMobile("rori", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
			local spawn = specialSpawnMapDWS["lootbox2mob3"]
			spawnPointer = spawnMobile("rori", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])			
		elseif box == 3 then
			local spawn = specialSpawnMapDWS["lootbox3mob1"]
			spawnPointer = spawnMobile("rori", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
			local spawn = specialSpawnMapDWS["lootbox3mob2"]
			spawnPointer = spawnMobile("rori", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
			local spawn = specialSpawnMapDWS["lootbox3mob3"]
			spawnPointer = spawnMobile("rori", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
			local spawn = specialSpawnMapDWS["lootbox3mob4"]
			spawnPointer = spawnMobile("rori", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
			local spawn = specialSpawnMapDWS["lootbox3mob5"]
			spawnPointer = spawnMobile("rori", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
			local spawn = specialSpawnMapDWS["lootbox3mob6"]
			spawnPointer = spawnMobile("rori", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])			
		elseif box == 4 then
			local spawn = specialSpawnMapDWS["lootbox4mob1"]
			spawnPointer = spawnMobile("rori", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
			local spawn = specialSpawnMapDWS["lootbox4mob2"]
			spawnPointer = spawnMobile("rori", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
			local spawn = specialSpawnMapDWS["lootbox4mob3"]
			spawnPointer = spawnMobile("rori", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
		elseif box == 5 then
			local spawn = specialSpawnMapDWS["lootbox5mob1"]
			spawnPointer = spawnMobile("rori", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
			local spawn = specialSpawnMapDWS["lootbox5mob2"]
			spawnPointer = spawnMobile("rori", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
			local spawn = specialSpawnMapDWS["lootbox5mob3"]
			spawnPointer = spawnMobile("rori", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
		elseif box == 6 then
			local spawn = specialSpawnMapDWS["lootbox6mob1"]
			spawnPointer = spawnMobile("rori", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
			local spawn = specialSpawnMapDWS["lootbox6mob2"]
			spawnPointer = spawnMobile("rori", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
			local spawn = specialSpawnMapDWS["lootbox6mob3"]
			spawnPointer = spawnMobile("rori", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])			
		end
		
     	createEvent(240 * 1000, "DWS", "refill", sceneObject)
     	return 1
   	end
end

--function DWS:haldo_killed(creatureObject, playerObject)
--	createEvent(1000 * 240, "DWS", "respawn_haldo", playerObject)
--	num = math.random(1, 100)
--	if num < 30 then
--		creoid = readData(5996314 .. ":dwb:haldo_player")
--		local creo = getSceneObject(creoid)
--		if creo ~= nil then
--			local creature = LuaCreatureObject(creo)
--			creature:sendSystemMessage("@dungeon/death_watch:recovered_battery")
--			
--			creature:setScreenPlayState(2, "death_watch_foreman_stage_failed")
--			
--			local scno = LuaSceneObject(creo)
--			inventory = scno:getSlottedObject("inventory")
			
--			giveItem(inventory, "object/tangible/dungeon/death_watch_bunker/drill_battery.iff", -1)
--		end
--	end
--end

--function DWS:haldo_damage(creatureObject, playerObject, damage)
--	if creatureObject == nil or playerObject == nil then
--		return 0
--	end
--	
--	local player = LuaCreatureObject(playerObject)
--	local creature = LuaCreatureObject(creatureObject)
--	
--	health = creature:getHAM(0)
--	action = creature:getHAM(3)
--	mind = creature:getHAM(6)
	
--	maxHealth = creature:getMaxHAM(0)
--	maxAction = creature:getMaxHAM(3)
--	maxMind = creature:getMaxHAM(6)
	
	--printf("Health: " .. health .. " Action: " .. action .. " Mind: " .. mind .. "\n")
	
	
--	if ((health <= (maxHealth * 0.9)) or (action <= (maxAction * 0.9)) or (mind <= (maxMind * 0.9))) then		
--		spatialChat(creatureObject, "@dungeon/death_watch:help_me")
		
		
--		creature:setPvpStatusBitmask(0)
--		forcePeace(creatureObject)
--		creature:setOptionsBitmask(264)
--		local creo = LuaSceneObject(creatureObject)
--		creo:sendTo(playerObject)
		
		
							
--		return 1		
--	end
	
--	return 0
--end


function DWS:diedWhileCrafting(creatureObject, attacker, long)
	if creatureObject == nil then
		return 1
	end
	
	local creature = LuaCreatureObject(creatureObject)
	
	iscrafting = readData(creature:getObjectID() .. ":dwb:currentlycrafting")
	
	if iscrafting == 0 then
		return 1
	else
		id = readData(creature:getObjectID() .. ":dwb:terminal")
		if id ~= 0 then
			term = getSceneObject(id)
			if term ~= nil then
				creature:sendSystemMessage("@dungeon/death_watch:died_during_crafting")
				DWS:stopCraftingProcess(creatureObject, term, false, false)
			end
		end
	end
	
	return 1
end
--------------------------------------------------------------
--   General Events                                          -
--------------------------------------------------------------
--function DWS:enableAccess(sceneObject)
--	local terminal = LuaSceneObject(sceneObject)
--	writeData(terminal:getObjectID() .. ":dwb:accessEnabled", 1)
--end

--function DWS:respawn_haldo(creatureObject)
--	halnum = math.random(1,3)
--	spawn = specialSpawnMapDWS["haldo" .. halnum]
--	if spawn ~= nil then
--		spawnPointer = spawnMobile("rori", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
--		local spawnedSceneObject = LuaSceneObject(spawnPointer)
--		writeData(5996314 .. ":dwb:haldo", spawnedSceneObject:getObjectID())
--		createObserver(OBJECTDESTRUCTION, "DWS", "haldo_killed", spawnPointer)
		--createObserver(DAMAGERECEIVED, "DWS", "haldo_damage", spawnPointer)
--	end
--end

--function DWS:lockCellsOnly(creatureObject)
--	if creatureObject == nil then
--		return
--	end
	
--	local creature = LuaCreatureObject(creatureObject)
--	
--	if TEST == 1 then
--		printf("lock on reentry\n")
--	end
	
--	state = creature:hasScreenPlayState(2, "death_watch_bunker")
	
--	if state == 0 then
--		updateCellPermission(getSceneObject(ENTRANCE), 0, creatureObject)
--	end
	
--	state = creature:hasScreenPlayState(4, "death_watch_bunker")
	
--	if state == 0 then
--		updateCellPermission(getSceneObject(AREAA), 0, creatureObject)
--	end

	
--	state = creature:hasScreenPlayState(8, "death_watch_bunker")
	
--	if state == 0 then
--		updateCellPermission(getSceneObject(AREAB), 0, creatureObject)
--	end		
	
--	state = creature:hasScreenPlayState(16, "death_watch_bunker")
--	
--	if state == 0 then
--		updateCellPermission(getSceneObject(MINES), 0, creatureObject)
--	end
	
--	state = creature:hasScreenPlayState(32, "death_watch_bunker")
--	
--	if state == 0 then
--		updateCellPermission(getSceneObject(ARMOR), 0, creatureObject)
--	end
	
--	state = creature:hasScreenPlayState(64, "death_watch_bunker")
--	
--	if state == 0 then
--		updateCellPermission(getSceneObject(DROIDENGINEER), 0, creatureObject)
--	end
	
--	state = creature:hasScreenPlayState(128, "death_watch_bunker")
--	
--	if state == 0 then
--		updateCellPermission(getSceneObject(TAILOR), 0, creatureObject)
--	end
--end

function DWS:refill(sceneObject)
	if (sceneObject == nil) then
		return
	end
	
	createObserver(OBJECTRADIALUSED, "DWS", "lootBox", sceneObject)
	
	local container = LuaSceneObject(sceneObject)
		
	writeData(container:getObjectID() .. ":dwb:spawned", 0)
	
	if (container:getContainerObjectsSize() == 0) then
		
		if TEST == 1 then
			printf("refilling\n")
		end
		
		-- add items
		chance = math.random(100)
		createLoot(sceneObject, "death_watch_bunker_lootbox", 1, false) 
	
		-- second item
		if chance > 95 then
   			createLoot(sceneObject, "death_watch_bunker_lootbox", 1, false)
 		end
	else
		if TEST == 1 then
			printf("refilling\n")
		end
	end
end

function DWS:poison(sceneObject)
	if TEST == 1 then
		printf("Poison Trigger\n")
	end

	for i,v in ipairs(MINECELLS) do
		local pCell = getSceneObject(v)
		if pCell ~= nil then
			local cell = LuaSceneObject(pCell)
			size = cell:getContainerObjectsSize()
			
			for j=0, size - 1, 1 do
				local pointer = cell:getContainerObject(j)
				
				if pointer ~= nil then
									
					local sco = LuaSceneObject(pointer)
						
					if (sco:isCreatureObject()) then
						local creo = LuaCreatureObject(pointer)
						
						if (not creo:isAiAgent()) then
									
							if (self:hasRebreather(pointer) == 1) then
								if TEST == 1 then
									printf("Poison averted\n")
								end
							else
								self:doPoison(pointer)
							end 

						end
					end
				end
			end
		end		
	end
	createEvent(1000 * (2 + math.random(0,7)) , "DWB", "poison", sceneObject)
end

--function DWS:timeWarning(creatureObject)
--	if creatureObject ~= nil then
--		local creature = LuaCreatureObject(creatureObject)
--		creature:sendGroupMessage("@dungeon/death_watch:thirty_seconds")
--	end
--end

--function DWS:removeFromDWS(creatureObject)
--	if (creatureObject == nil) then
--		return
--	end
--	
--	local creature = LuaCreatureObject(creatureObject)
--	
--	if (creature:isGrouped()) then
--		size = creature:getGroupSize()
--		
--		for i = 0, size - 1, 1 do
--			pMember = creature:getGroupMember(i)
--			if pMember ~= nil then
--				local groupMember = LuaCreatureObject(pMember)
--				if groupMember:getParentID() > 5996313 and groupMember:getParentID() < 5996380 then
--					createEvent(500, "DWS", "teleportPlayer", pMember)
--				end
--			end
--		end 
--	else
--		createEvent(500, "DWS", "teleportPlayer", creatureObject)
--	end
	
--end

--function DWS:teleportPlayer(creatureObject)
--	if (creatureObject == nil) then
--		return
--	end
--	
--	local creature = LuaCreatureObject(creatureObject)
--	creature:teleport(-4657, 14.4, 4322.3, 0)
--	
--	self:lockAll(creatureObject)
--end

--function DWS:haldo_timer(creatureObject)
--	writeData(5996314 .. ":dwb:haldo_busy", 0)
--	if (creatureObject == nil) then
--		return
--	end
	
--	local creature = LuaCreatureObject(creatureObject)
--	
--	finished_time = creature:hasScreenPlayState(4, "death_watch_foreman_stage")
--	
--	if finished_time == 0 then
--		creature:removeScreenPlayState(1, "death_watch_foreman_stage")
--		creature:removeScreenPlayState(2, "death_watch_foreman_stage")
--		creature:removeScreenPlayState(4, "death_watch_foreman_stage")
--		creature:sendSystemMessage("@dungeon/death_watch:haldo_failed")
--		creature:setScreenPlayState(1, "death_watch_foreman_stage_failed")
--		createEvent(1000 * 60 * 20, "DWS", "unlock_haldo", creatureObject)
--	end
--end

--function DWS:pump_timer(creatureObject)
--	if (creatureObject == nil) then
--		return
--	end
	
--	local creature = LuaCreatureObject(creatureObject)
--	
--	finished_time = creature:hasScreenPlayState(64, "death_watch_foreman_stage")
	
--	if finished_time == 0 then
--		creature:removeScreenPlayState(32, "death_watch_foreman_stage")
--		creature:setScreenPlayState(3, "death_watch_foreman_stage_failed")
--		creature:sendSystemMessage("@dungeon/death_watch:water_pressure_failed")
--	end
--end

--function DWS:unlock_haldo(creatureObject)
--	if (creatureObject == nil) then
--		return
--	end
	
--	local creature = LuaCreatureObject(creatureObjcet)
--	creature:removeScreenPlayState(1, "death_watch_foreman_stage_failed")
--end

function DWS:destroyIngredient(ingredient)
	if ingredient ~= nil then
		local object = LuaSceneObject(ingredient)
		object:destroyObjectFromWorld()
	end
end

--------------------------------------------------------------
--   Key Spawn Events                                        -
--------------------------------------------------------------

--------------------------------------------------------------
--   Helper Functions                                        -
--------------------------------------------------------------

--   Checks whether a creature has sufficient skill to access a particular crafting room  -
function DWS:hasRequiredSkill(room, creatureObject)
	if (creatureObject == nil) then
		if TEST == 1 then
			printf("creature nil\n")
		end
		return false
	end
	
	if (room < 1 or room > 8) then
		if TEST == 1 then
			printf("room invalid\n")
		end
		return false
	end
	
	local creature = LuaCreatureObject(creatureObject)
	
	if creature:hasSkill(TERMINALSKILLS[room]) then
		return true
	end
	
	return false
end

--   Checks whether a creature has an Alum Mineral  -
function DWS:hasAlumMineral(creatureObject)
	if creatureObject == nil then
		return false
	end
	
	local creature = LuaSceneObject(creatureObject)
	inventory = creature:getSlottedObject("inventory")
	
	if (getContainerObjectByTemplate(inventory, ALUMMINERAL, true) == nil) then
		if TEST == 1 then
			printf("no alum\n")
		end
		return false
	end

	return true
end

--   Checks whether a creature has all necessary items to access a particular crafting room  -
function DWS:findRequiredItem(room, creatureObject)
	if (creatureObject == nil) then
		if TEST == 1 then
			printf("creature nil\n")
		end
		return nil
	end
	
	if (room < 1 or room > 7) then
		if TEST == 1 then
			printf("room invalid\n")
		end
		return nil
	end
	
	local creature = LuaSceneObject(creatureObject)
	inventory = creature:getSlottedObject("inventory")
	
	local table = DOORS[room]
	
	for i,v in ipairs(table) do
		obj = getContainerObjectByTemplate(inventory, v, true) 
		if (obj ~= nil) then
			return obj
		end
	end
	if TEST == 1 then
		printf("required item not found\n")
	end
	return nil
end

--   Checks whether a creature has sufficient protection against alum mine poison  --
--function DWS:hasRebreather(sceneObject)
	--TODO: Change this to be a skill mod check for private_poison_rebreather
--	local scno = LuaSceneObject(sceneObject)
--	local pRebreather = scno:getSlottedObject("eyes")
--	
--	if (pRebreather ~= nil) then
--		local rebreather = LuaSceneObject(pRebreather)
--		headSlot = rebreather:getTemplateObjectPath()
--		
--		if TEST == 1 then
--			printf("hat: " .. headSlot .. "\n")
--		end
--		
--		if (headSlot == MANDOREBREATHER) then
--			if (rebreather:getCustomObjectName() == ADVANCEDREBREATHER) then
--				return 1
--			else
--				return 0
--			end
--		elseif (headSlot == MANDOHELMET) then
--			return 1
--		end
--	end
--	
--	return 0
--end

--   Inflict poison damage on a creature  -
--function DWS:doPoison(creatureObject)
--	if creatureObject == nil then
--		return
--	end
	
--	local creature = LuaCreatureObject(creatureObject)
	
--	if TEST == 1 then
--		printf("poisoned\n")
--	end
	
--	creature:inflictDamage(creatureObject, 0, 100, 0)
--	creature:sendSystemMessage("@dungeon/death_watch:bad_air")
--end

--   Lock all restricted cells to a creature  -
-- NOTE: Once proper permissions are in, might have to revisit and set all cells of a restricted area 
-- rather than just the first accessible one
--function DWS:lockAll(creatureObject)
--	if creatureObject == nil then
--		if TEST == 1 then
--			printf("creature is nil\n")
--		end
--		return
--	end
	
	--first terminal
--	updateCellPermission(getSceneObject(ENTRANCE), 0, creatureObject)
	
--	--terminal a
--	updateCellPermission(getSceneObject(AREAA), 0, creatureObject)
	
	--terminal b
--	updateCellPermission(getSceneObject(AREAB), 0, creatureObject)

	--mines
--	updateCellPermission(getSceneObject(MINES), 0, creatureObject)
	
	--Armorsmith Crafting Room
--	updateCellPermission(getSceneObject(ARMOR), 0, creatureObject)
	
	--Tailor Crafting Room
--	updateCellPermission(getSceneObject(TAILOR), 0, creatureObject)
	
	--Droid Engineer Crafting Room
--	updateCellPermission(getSceneObject(DROIDENGINEER), 0, creatureObject)
--end



function DWS:storeTime(creatureObject)
	if creatureObject ~= nil then
		time = os.time()
		writeScreenPlayData(creatureObject, "DWS", "time", time)
	end
end

function DWS:checkTime(creatureObject)
	if creatureObject == nil then
		return false
	end
	
	currenttime = os.time()
	receivedtime = readScreenPlayData(creatureObject, "DWS", "time")
	
	if receivedtime == "" then
		return false
	end
	
	seconds = os.difftime(currenttime, receivedtime)
	
	if (seconds > 216000) then--more then 60 hours passed
		return true
	end
	
	return false
end

function DWS:cancelCrafting(term)
	if term == nil then
		return
	end
	
	local terminal = LuaSceneObject(term)
	isCrafting = readData(terminal:getObjectID() .. ":dwb:currentlycrafting")
	
	if isCrafting > 0 and isCrafting < 4 then
		id = readData(terminal:getObjectID() .. ":dwb:user")
		if id ~= 0 then
			creatureObject = getSceneObject(id)
			if creatureObject ~= nil then
				local creature = LuaCreatureObject(creatureObject)
				creature:sendSystemMessage("@dungeon/death_watch:took_too_long")
				DWS:stopCraftingProcess(creatureObject, term, false, true)
			end
		end
	end
end

function DWS:stopCraftingProcess(creatureObject, droid, successful, teleport)
	if creatureObject == nil or droid == nil then
		return
	end
	
	local creature = LuaCreatureObject(creatureObject)
	local terminal = LuaSceneObject(droid)
	number = readData(terminal:getObjectID() .. ":dwb:craftingterminal")  
	target = readData(terminal:getObjectID() .. ":dwb:targetitemindex")
	
	writeData(creature:getObjectID() .. ":dwb:currentlycrafting", 0)
	writeData(terminal:getObjectID() .. ":dwb:currentlycrafting", 0)
	
	if successful == true then
		local creo = LuaSceneObject(creatureObject)
		inventory = creo:getSlottedObject("inventory")
		local targetitems = TARGETITEMS[number]
		local reward = giveItem(inventory, targetitems[target], -1)
		
		if (reward == nil) then
			return 0
		end
		--local rewardObject = LuaTangibleObject(pcure)
		--tcure:setCustomizationVariable("index_color_1", 51)
	end
	
	writeData(creature:getObjectID() .. ":dwb:terminal", 0)
	writeData(terminal:getObjectID() .. ":dwb:user", 0)
	writeData(terminal:getObjectID() .. ":dwb:targetitemindex", 0)
	
	
	if number == 4 then
		writeData(terminal:getObjectID() .. ":dwb:alummineral", 0)
		writeData(terminal:getObjectID() .. ":dwb:jetpackbase", 0)
		writeData(terminal:getObjectID() .. ":dwb:jetpackstabilizer", 0)
		writeData(terminal:getObjectID() .. ":dwb:ductedfan", 0)
		writeData(terminal:getObjectID() .. ":dwb:injectortank", 0)
		writeData(terminal:getObjectID() .. ":dwb:dispersionunit", 0)
	else
		writeData(terminal:getObjectID() .. ":dwb:alummineral", 0)
		writeData(terminal:getObjectID() .. ":dwb:binary", 0)
		writeData(terminal:getObjectID() .. ":dwb:protective", 0)
		writeData(terminal:getObjectID() .. ":dwb:bharmorpart", 0)
	end
	
--	if teleport == true then
--		createEvent(5000, "DWB", "teleportPlayer", creatureObject)
--	end
end

function DWS:sendUseTerminalMessage(creatureObject)
	if creatureObject ~= nil then
		local creature = LuaCreatureObject(creatureObject)
		creature:sendSystemMessage("@dungeon/death_watch:use_terminal")
	end
end

function DWS:startCraftingProcess(creatureObject, terminal)
	if creatureObject == nil or terminal == nil then
		return
	end

	local creature = LuaCreatureObject(creatureObject)
	createEvent(1000 * 30, "DWS", "cancelCrafting", terminal)
	createEvent(1000, "DWS", "sendUseTerminalMessage", creatureObject)
	writeData(creature:getObjectID() .. ":dwb:currentlycrafting", 1)
	createObserver(OBJECTDESTRUCTION, "DWS", "diedWhileCrafting", creatureObject)  
end

function DWS:nextCraftingStep(droid)
	if droid == nil then
		return
	end
	
	local terminal = LuaSceneObject(droid)
	writeData(terminal:getObjectID() .. ":dwb:currentlycrafting", 3)
	creoid = readData(terminal:getObjectID() .. ":dwb:user")
	if creoid ~= 0 then
		creo = getSceneObject(creoid)
		if creo ~= nil then
			local creature = LuaCreatureObject(creo)
			creature:sendSystemMessage("@dungeon/death_watch:use_terminal")
		end
	end
end

function DWS:finishCraftingStep(droid)
	if droid == nil then
		return
	end
	
	local terminal = LuaSceneObject(droid)
	creoid = readData(terminal:getObjectID() .. ":dwb:user")
	if creoid ~= 0 then
		creo = getSceneObject(creoid)
		if creo ~= nil then
			local creature = LuaCreatureObject(creo)
			creature:sendSystemMessage("@dungeon/death_watch:crafting_finished")
			DWS:stopCraftingProcess(creo, droid, true, true)
		end
	end
end

--------------------------------------------------------------
--   Lua Components                                       -
--------------------------------------------------------------



function death_watch_bunker_mandalorian_crafting_terminal:handleObjectMenuSelect(sceneObject, player, selectedID)
	if (player == nil or sceneObject == nil) then
		return 0
	end
	
	if (selectedID ~= 20) then
		if TEST == 1 then
			printf("Wrong selectedID " .. selectedID .. "\n")
		end
		return 0
	end
	
	local creature = LuaCreatureObject(player)
	local factory = LuaSceneObject(sceneObject)
	term = getSceneObject(readData(factory:getObjectID() .. ":dwb:droid"))
	
	if term == nil then
		return 0
	end
	
	local terminal = LuaSceneObject(term)
	isCrafting = readData(terminal:getObjectID() .. ":dwb:currentlycrafting")
	userid = readData(terminal:getObjectID() .. ":dwb:user")
	
	if isCrafting < 1 then
		return 0
	end
	
	if creature:getObjectID() ~= userid then
		creature:sendSystemMessage("@dungeon/death_watch:same_user_only")
		return 0
	end
	
	if isCrafting == 2 or isCrafting == 4 then
		creature:sendSystemMessage("@dungeon/death_watch:crafting_not_yet")
		return 0
	end
	
	if isCrafting == 1 then
		local suiManager = LuaSuiManager()
		suiManager:sendConfirmSui(term, player, "DWS", "craftingConfirmCallback", "@dungeon/death_watch:continue_manufacturing", "@dungeon/death_watch:continue_button")
	elseif isCrafting == 3 then
		local suiManager = LuaSuiManager()
		suiManager:sendConfirmSui(term, player, "DWS", "craftingConfirmCallback", "@dungeon/death_watch:finish_manufacturing", "@dungeon/death_watch:finish_button")
	end
			
	return 0
end

death_watch_bunker_crafting_droid_jetpack = { }

function death_watch_bunker_crafting_droid_jetpack:canAddObject(droid, ingredient, slot)
	if ingredient == nil then
		return false
	end
	
	if slot ~= -1 then
		return false
	end
	
	local object = LuaSceneObject(ingredient)
	pParent = object:getParent()
	
	if pParent == nil then
		return false
	end
	
	local parent = LuaSceneObject(pParent)
	pParent = parent:getParent()
	
	if pParent == nil then
		return false
	end
	
	local parent = LuaSceneObject(pParent)
	if parent:isCreatureObject() == false then
		return false
	end
	
	local creature = LuaCreatureObject(pParent) 
	
	local terminal = LuaSceneObject(droid)
	template = object:getTemplateObjectPath()
	
	userid = readData(terminal:getObjectID() .. ":dwb:user")
	
	if userid ~= 0 and userid ~= creature:getObjectID() then
		creature:sendSystemMessage("@dungeon/death_watch:same_user_only")
		return false
	end	
	
	if creature:hasSkill(TERMINALSKILLS[8]) == false then
		creature:sendSystemMessage(TERMINALSKILLMESSAGE[4])
		return false
	end
	
	hasMineral = readData(terminal:getObjectID() .. ":dwb:alummineral")
	hasJetpackBase = readData(terminal:getObjectID() .. ":dwb:jetpackbase")
	hasJetpackStabilizer = readData(terminal:getObjectID() .. ":dwb:jetpackstabilizer")
	hasDuctedFan = readData(terminal:getObjectID() .. ":dwb:ductedfan")
	hasInjectorTank = readData(terminal:getObjectID() .. ":dwb:injectortank")
	hasDispersionUnit = readData(terminal:getObjectID() .. ":dwb:dispersionunit")
	
	if template == JETPACKBASE then
		if hasJetpackBase == 0 then
			return true
		else
			creature:sendSystemMessage("@dungeon/death_watch:already_has_component")
		end
	elseif template == JETPACKSTABILIZER then
		if hasJetpackStabilizer == 0 then
			return true
		else
			creature:sendSystemMessage("@dungeon/death_watch:already_has_component")
		end
	elseif template == DUCTEDFAN then
		if hasDuctedFan == 0 then
			return true
		else
			creature:sendSystemMessage("@dungeon/death_watch:already_has_component")
		end
	elseif template == INJECTORTANK then
		if hasInjectorTank == 0 then
			return true
		else
			creature:sendSystemMessage("@dungeon/death_watch:already_has_component")
		end
	elseif template == DISPERSIONUNIT then
		if hasDispersionUnit == 0 then
			return true
		else
			creature:sendSystemMessage("@dungeon/death_watch:already_has_component")
		end 
	elseif template == ALUMMINERAL then
		if hasMineral == 0 then
			return true
		else
			creature:sendSystemMessage("@dungeon/death_watch:already_has_component")
		end
	end
		
	return false
end

function death_watch_bunker_crafting_droid_jetpack:transferObject(droid, ingredient, slot)
	if (ingredient == nil) then
		return 0
	end

	if slot == -1 then
		local object = LuaSceneObject(ingredient)
		
		pParent = object:getParent()
	
		if pParent == nil then
			return 0
		end
		
		local parent = LuaSceneObject(pParent)
		pParent = parent:getParent()
		
		if pParent == nil then
			return 0
		end
		
		local parent = LuaSceneObject(pParent)
		if parent:isCreatureObject() == false then
			return 0
		end
		
		local creature = LuaCreatureObject(pParent)
		
		local terminal = LuaSceneObject(droid)
		template = object:getTemplateObjectPath()
		
		if template == JETPACKBASE then
			writeData(terminal:getObjectID() .. ":dwb:jetpackbase", 1)
		elseif template == JETPACKSTABILIZER then
			writeData(terminal:getObjectID() .. ":dwb:jetpackstabilizer", 1)
		elseif template == DUCTEDFAN then
			writeData(terminal:getObjectID() .. ":dwb:ductedfan", 1)
		elseif template == INJECTORTANK then
			writeData(terminal:getObjectID() .. ":dwb:injectortank", 1)
		elseif template == DISPERSIONUNIT then
			writeData(terminal:getObjectID() .. ":dwb:dispersionunit", 1)
		elseif template == ALUMMINERAL then
			writeData(terminal:getObjectID() .. ":dwb:alummineral", 1)
		end
		
		-- avoid Locker issues
		createEvent(500, "DWS", "destroyIngredient", ingredient)
		
		hasMineral = readData(terminal:getObjectID() .. ":dwb:alummineral")
		hasJetpackBase = readData(terminal:getObjectID() .. ":dwb:jetpackbase")
		hasJetpackStabilizer = readData(terminal:getObjectID() .. ":dwb:jetpackstabilizer")
		hasDuctedFan = readData(terminal:getObjectID() .. ":dwb:ductedfan")
		hasInjectorTank = readData(terminal:getObjectID() .. ":dwb:injectortank")
		hasDispersionUnit = readData(terminal:getObjectID() .. ":dwb:dispersionunit")
		
		userid = readData(terminal:getObjectID() .. ":dwb:user")
		if userid == 0 then
			writeData(terminal:getObjectID() .. ":dwb:user", creature:getObjectID())
			writeData(creature:getObjectID() .. ":dwb:terminal", terminal:getObjectID())
		end
		
		if (hasMineral == 1 and hasJetpackBase == 1 and hasJetpackStabilizer == 1 and hasDuctedFan == 1 and hasInjectorTank == 1 and hasDispersionUnit == 1) then
			creature:sendSystemMessage("@dungeon/death_watch:starting_to_craft")
			writeData(terminal:getObjectID() .. ":dwb:currentlycrafting", 1)
			writeData(terminal:getObjectID() .. ":dwb:targetitemindex", 1)
			
			local spawn = specialSpawnMapDWS["jetpackattack1"]
			spawnPointer = spawnMobile("rori", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
			local spawn = specialSpawnMapDWS["jetpackattack2"]
			spawnPointer = spawnMobile("rori", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
			local spawn = specialSpawnMapDWS["jetpackattack3"]
			spawnPointer = spawnMobile("rori", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
			local spawn = specialSpawnMapDWS["jetpackattack4"]
			spawnPointer = spawnMobile("rori", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
			
			local spawn = specialSpawnMapDWS["droidengineerattack1"]
			spawnPointer = spawnMobile("rori", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
			local spawn = specialSpawnMapDWS["droidengineerattack2"]
			spawnPointer = spawnMobile("rori", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
			local spawn = specialSpawnMapDWS["droidengineerattack3"]
			spawnPointer = spawnMobile("rori", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
			local spawn = specialSpawnMapDWS["droidengineerattack4"]
			spawnPointer = spawnMobile("rori", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
			
			DWS:startCraftingProcess(pParent, droid)
		else
			creature:sendSystemMessage("@dungeon/death_watch:items_still_needed")
			if hasJetpackBase == 0 then
				creature:sendSystemMessage("@dungeon/death_watch:jetpack_base")	
			end
			
			if hasJetpackStabilizer == 0 then
				creature:sendSystemMessage("@dungeon/death_watch:stabilizer")
			end
			
			if hasDuctedFan == 0 then
				creature:sendSystemMessage("@dungeon/death_watch:ducted_fan")
			end
			
			if hasInjectorTank == 0 then
				creature:sendSystemMessage("@dungeon/death_watch:fuel_injector")
			end
			
			if hasDispersionUnit == 0 then
				creature:sendSystemMessage("@dungeon/death_watch:dispersion")
			end 
			
			if hasMineral == 0 then
				creature:sendSystemMessage("@dungeon/death_watch:alum_mineral")
			end
		end
	end

	return 0
end

function death_watch_bunker_crafting_droid_jetpack:removeObject(droid, ingredient, slot)
	return false
end

death_watch_bunker_crafting_droid = { }

function death_watch_bunker_crafting_droid:canAddObject(droid, ingredient, slot)
	if ingredient == nil then
		return false
	end
	
	if slot ~= -1 then
		return false
	end
	
	local object = LuaSceneObject(ingredient)
	pParent = object:getParent()
	
	if pParent == nil then
		return false
	end
	
	local parent = LuaSceneObject(pParent)
	pParent = parent:getParent()
	
	if pParent == nil then
		return false
	end
	
	local parent = LuaSceneObject(pParent)
	if parent:isCreatureObject() == false then
		return false
	end
	
	local creature = LuaCreatureObject(pParent) 
	
	local terminal = LuaSceneObject(droid)
	number = readData(terminal:getObjectID() .. ":dwb:craftingterminal")
	template = object:getTemplateObjectPath()
	
	userid = readData(terminal:getObjectID() .. ":dwb:user")
	
	if userid ~= 0 and userid ~= creature:getObjectID() then
		creature:sendSystemMessage("@dungeon/death_watch:same_user_only")
		return false
	end	
	
	if creature:hasSkill(TERMINALSKILLS[number + 4]) == false then
		creature:sendSystemMessage(TERMINALSKILLMESSAGE[number])
		return false
	end
	
	hasMineral = readData(terminal:getObjectID() .. ":dwb:alummineral")
	hasBL = readData(terminal:getObjectID() .. ":dwb:binary")
	hasPLC = readData(terminal:getObjectID() .. ":dwb:protective")
	hasArmorPart = readData(terminal:getObjectID() .. ":dwb:bharmorpart")
	
	if template == BINARYLIQUID then
		if hasBL == 0 then
			return true
		else
			creature:sendSystemMessage("@dungeon/death_watch:already_has_component")
		end
	elseif template == PROTECTIVELIQUID then
		if hasPLC == 0 then
			return true
		else
			creature:sendSystemMessage("@dungeon/death_watch:already_has_component")
		end
	elseif template == ALUMMINERAL then
		if hasMineral == 0 then
			return true
		else
			creature:sendSystemMessage("@dungeon/death_watch:already_has_component")
		end
	else
		local table = DOORS[number + 4]
		for i,v in ipairs(table) do
			if template == v then
				if hasArmorPart == 0 then
					return true
				else
					creature:sendSystemMessage("@dungeon/death_watch:making_something_else")
				end
			end
		end
	end
		
	return false
end

function death_watch_bunker_crafting_droid:transferObject(droid, ingredient, slot)
	if (ingredient == nil) then
		return 0
	end

	if slot == -1 then
		local object = LuaSceneObject(ingredient)
		
		pParent = object:getParent()
	
		if pParent == nil then
			return 0
		end
		
		local parent = LuaSceneObject(pParent)
		pParent = parent:getParent()
		
		if pParent == nil then
			return 0
		end
		
		local parent = LuaSceneObject(pParent)
		if parent:isCreatureObject() == false then
			return 0
		end
		
		local creature = LuaCreatureObject(pParent)
		
		local terminal = LuaSceneObject(droid)
		number = readData(terminal:getObjectID() .. ":dwb:craftingterminal")
		template = object:getTemplateObjectPath()
		
		if template == BINARYLIQUID then
			writeData(terminal:getObjectID() .. ":dwb:binary", 1)
			-- avoid Locker issues
			createEvent(500, "DWS", "destroyIngredient", ingredient)
		elseif template == PROTECTIVELIQUID then
			writeData(terminal:getObjectID() .. ":dwb:protective", 1)
			-- avoid Locker issues
			createEvent(500, "DWS", "destroyIngredient", ingredient)
		elseif template == ALUMMINERAL then
			writeData(terminal:getObjectID() .. ":dwb:alummineral", 1)
			-- avoid Locker issues
			createEvent(500, "DWS", "destroyIngredient", ingredient)
		else
			local table = DOORS[number + 4]
			for i,v in ipairs(table) do
				if template == v then
					writeData(terminal:getObjectID() .. ":dwb:bharmorpart", 1)
					writeData(terminal:getObjectID() .. ":dwb:targetitemindex", i)
				end
			end
			if (readData(terminal:getObjectID() .. ":dwb:bharmorpart") == 1) then
				-- avoid Locker issues
				createEvent(500, "DWS", "destroyIngredient", ingredient)
			else
				return 0
			end
		end
		
		hasMineral = readData(terminal:getObjectID() .. ":dwb:alummineral")
		hasBL = readData(terminal:getObjectID() .. ":dwb:binary")
		hasPLC = readData(terminal:getObjectID() .. ":dwb:protective")
		hasArmorPart = readData(terminal:getObjectID() .. ":dwb:bharmorpart")
		
		userid = readData(terminal:getObjectID() .. ":dwb:user")
		if userid == 0 then
			writeData(terminal:getObjectID() .. ":dwb:user", creature:getObjectID())
			writeData(creature:getObjectID() .. ":dwb:terminal", terminal:getObjectID())
		end
		
		if (hasMineral == 1 and hasBL == 1 and hasPLC == 1 and hasArmorPart == 1) then
			creature:sendSystemMessage("@dungeon/death_watch:starting_to_craft")
			writeData(terminal:getObjectID() .. ":dwb:currentlycrafting", 1)
			if number == 1 then
				local spawn = specialSpawnMapDWS["armorattack5"]
				spawnPointer = spawnMobile("rori", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
				local spawn = specialSpawnMapDWS["armorattack6"]
				spawnPointer = spawnMobile("rori", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
				local spawn = specialSpawnMapDWS["armorattack7"]
				spawnPointer = spawnMobile("rori", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
				local spawn = specialSpawnMapDWS["armorattack8"]
				spawnPointer = spawnMobile("rori", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
				
			elseif number == 2 then
				local spawn = specialSpawnMapDWS["jetpackattack1"]
				spawnPointer = spawnMobile("rori", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
				local spawn = specialSpawnMapDWS["jetpackattack2"]
				spawnPointer = spawnMobile("rori", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
				local spawn = specialSpawnMapDWS["jetpackattack3"]
				spawnPointer = spawnMobile("rori", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
				local spawn = specialSpawnMapDWS["jetpackattack4"]
				spawnPointer = spawnMobile("rori", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
				
				local spawn = specialSpawnMapDWS["droidengineerattack1"]
				spawnPointer = spawnMobile("rori", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
				local spawn = specialSpawnMapDWS["droidengineerattack2"]
				spawnPointer = spawnMobile("rori", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
				local spawn = specialSpawnMapDWS["droidengineerattack3"]
				spawnPointer = spawnMobile("rori", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
				local spawn = specialSpawnMapDWS["droidengineerattack4"]
				spawnPointer = spawnMobile("rori", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
			elseif number == 3 then
				local spawn = specialSpawnMapDWS["tailorattack1"]
				spawnPointer = spawnMobile("rori", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
				local spawn = specialSpawnMapDWS["tailorattack2"]
				spawnPointer = spawnMobile("rori", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
				local spawn = specialSpawnMapDWS["tailorattack3"]
				spawnPointer = spawnMobile("rori", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
				local spawn = specialSpawnMapDWS["tailorattack4"]
				spawnPointer = spawnMobile("rori", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
			end
			
			DWS:startCraftingProcess(pParent, droid)
		else
			creature:sendSystemMessage("@dungeon/death_watch:items_still_needed")
			if hasBL == 0 then
				creature:sendSystemMessage("@dungeon/death_watch:binary_liquid")	
			end
			
			if hasPLC == 0 then
				creature:sendSystemMessage("@dungeon/death_watch:emulsifier")
			end
			
			if hasArmorPart == 0 then
				creature:sendSystemMessage(PARTSTRINGS[number])
			end 
			
			if hasMineral == 0 then
				creature:sendSystemMessage("@dungeon/death_watch:alum_mineral")
			end
		end
	end

	return 0
end

function death_watch_bunker_crafting_droid:removeObject(droid, ingredient, slot)
	return false
end

--------------------------------------------------------------
--   Sui Callbacks                                           -
--------------------------------------------------------------

function DWS:craftingConfirmCallback(pCreature, pSui, cancelPressed)
	local creature = LuaCreatureObject(pCreature)
	local suiBox = LuaSuiBox(pSui)
	local pUsingObject = suiBox:getUsingObject()
	
	if (pUsingObject == nil) then
		return 0
	end
	
	local terminal = LuaSceneObject(pUsingObject)
	
	step = readData(terminal:getObjectID() .. ":dwb:currentlycrafting")
	
	if step == 1 then
		writeData(terminal:getObjectID() .. ":dwb:currentlycrafting", 2)
		creature:sendSystemMessage("@dungeon/death_watch:alum_process_begun")
		createEvent(5 * 1000, "DWS", "nextCraftingStep", pUsingObject)
	elseif step == 3 then
		writeData(terminal:getObjectID() .. ":dwb:currentlycrafting", 4)
		creature:sendSystemMessage("@dungeon/death_watch:aeration_process_begun")
		createEvent(5 * 1000, "DWS", "finishCraftingStep", pUsingObject)
	end
	
	return 0
end

--------------------------------------------------------------
--   Provide Testing Assistance to Players                   -
--------------------------------------------------------------
function DWS:testSpatial(pDroid, pPlayer)
	local droid = LuaSceneObject(pDroid)
	local player = LuaCreatureObject(pPlayer)
	distance = droid:getDistanceTo(pPlayer)
	
	if distance == 0 then
		return 0
	elseif distance < 20 then
		spatialChat(pDroid, "Welcome to the Death Watch Bunker! To ease with testing, these guys behind me can give you Quests.")
		createEvent(15 * 1000, "DWS", "testSecond", pDroid)
		createEvent(200 * 1000, "DWS", "testRepeat", pDroid) 
		return 1
	else
		return 0
	end
end

function DWS:testSecond(pDroid)
	spatialChat(pDroid, "Missing Features: Ventilation Quest and Blastromech Control. Known Bugs: Wrong animations for Battle Droids. Looted Schematics not working.")
	createEvent(15 * 1000, "DWS", "testThird", pDroid)
end

function DWS:testThird(pDroid)
	spatialChat(pDroid, "DWS Info: Finish Boba Fett's conversation to gain entry. Use the passkeys dropped from named NPCs to get past the three doors. They are spawned by using the Door Control Terminals.")
end 

function DWS:testRepeat(pDroid)
	createObserver(OBJECTINRANGEMOVED, "DWS", "testSpatial", pDroid)
end

function DWS:testSpatial2(pDroid, pPlayer)
	local droid = LuaSceneObject(pDroid)
	local player = LuaCreatureObject(pPlayer)
	distance = droid:getDistanceTo(pPlayer)
	
	if distance == 0 then
		return 0
	elseif distance < 20 then
		spatialChat(pDroid, "Welcome to the Death Watch Bunker! Feel free to gather around these flags if you are looking for a group.")
		createEvent(120 * 1000, "DWS", "testRepeat2", pDroid) 
		return 1
	else
		return 0
	end
end

function DWS:testRepeat2(pDroid)
	createObserver(OBJECTINRANGEMOVED, "DWS", "testSpatial2", pDroid)
end

function DWS:test(sceneObject)
	spawnedPointer = spawnMobile("rori", "death_watch_herald_rebel", 1, -4659, 14.4, 4326.3, 80, 0)
	spawnedPointer = spawnMobile("rori", "boba_fett", 1, -4659, 14.4, 4324.3, 80, 0)
	spawnedPointer = spawnMobile("rori", "death_watch_herald_imperial", 1, -4659, 14.4, 4322.3, 80, 0)
	spawnedPointer = spawnMobile("rori", "r3", 1, -4656.7, 14.4, 4324.2, 93, 0)
	
	createObserver(OBJECTINRANGEMOVED, "DWS", "testSpatial", spawnedPointer)
	
	spawnedPointer = spawnSceneObject("rori", "object/tangible/event_perk/lambda_shuttle.iff", -4668,12.9,4291.4,0,0,0,1,0)
	
	spawnedPointer = spawnSceneObject("rori", "object/tangible/terminal/terminal_character_builder.iff", -4655,12.5,4293.1,0,0,0,1,0)
	--doesnt work spawnedPointer = spawnSceneObject("rori", "object/tangible/terminal/terminal_cloning.iff", -4663,14.4,4324.3,0,0,0,1,0)
	
	spawnedPointer = spawnSceneObject("rori", "object/tangible/terminal/terminal_character_builder.iff", 27.1,-61.3,-295.5,5996355,0,0,1,0)
	
	spawnedPointer = spawnMobile("rori", "imperial_recruiter", 1, -4655.8, 14.4, 4328.3, 179, 0)
	spawnedPointer = spawnMobile("rori", "rebel_recruiter", 1, -4653.8, 14.4, 4328.3, 179, 0)
	
	--Plattform:
	spawnedPointer = spawnSceneObject("rori", "object/static/structure/tatooine/palette_tatooine_style_01.iff", -4651,12.4,4294.0,0,0,0,1,0)
	--spawnedPointer = spawnSceneObject("rori", "object/tangible/event_perk/camp_pavilion_s2.iff", -4651,12.4,4294.0,0,0,0,1,0)

	spawnedPointer = spawnMobile("rori", "r3", 1, -4650.3, 12.5, 4293.1, 127, 0)
	createObserver(OBJECTINRANGEMOVED, "DWS", "testSpatial2", spawnedPointer)

	
	--Looking for DWS Group: Healer
	spawnedPointer = spawnSceneObject("rori", "object/tangible/event_perk/banner_generic_s01.iff", -4642.0,12.0,4294.1,0,0,0,1,0)
	local scene = LuaSceneObject(spawnedPointer)
	scene:setCustomObjectName("LFG: Healer")
	
	--Looking for DWS Group: Combat Profession
	spawnedPointer = spawnSceneObject("rori", "object/tangible/event_perk/banner_rebel_style_01.iff", -4649.6,12.1,4302.7,0,0,0,1,0)
	local scene = LuaSceneObject(spawnedPointer)
	scene:setCustomObjectName("LFG: Melee Combat")
	
	--Looking for DWS Group: Combat Profession
	spawnedPointer = spawnSceneObject("rori", "object/tangible/event_perk/banner_imperial_style_01.iff", -4649.5,12.6,4285.6,0,0,0,1,0)
	local scene = LuaSceneObject(spawnedPointer)
	scene:setCustomObjectName("LFG: Ranged Combat")
	

	--Looking for DWS Group: Crafter
	spawnedPointer = spawnSceneObject("rori", "object/tangible/event_perk/banner_generic_s02.iff", -4656.0,12.6,4294.0,0,0,0,1,0)
	local scene = LuaSceneObject(spawnedPointer)
	scene:setCustomObjectName("LFG: Crafter")
	
	--spawnedPointer = spawnSceneObject("rori", "object/tangible/event_perk/lambda_shuttle.iff", -4668,12.9,4291.4,0,0,0,1,0)
	--spawnedPointer = spawnSceneObject("rori", "object/tangible/event_perk/lambda_shuttle.iff", -4668,12.9,4291.4,0,0,0,1,0)
	--spawnedPointer = spawnSceneObject("rori", "object/tangible/event_perk/lambda_shuttle.iff", -4668,12.9,4291.4,0,0,0,1,0)
	--spawnedPointer = spawnSceneObject("rori", "object/tangible/event_perk/lambda_shuttle.iff", -4668,12.9,4291.4,0,0,0,1,0)
	
	if TEST == 1 then
		printf("Testing Environment Set Up - Players can now take DWS Quests directly on Endor\n")
	end
	
	return 1
end
