addon_starports = ScreenPlay:new {
	numberOfActs = 1,
}

registerScreenPlay("addon_starports", true)

--------------------------------------
--   Initialize screenplay           -
--------------------------------------
function addon_starports:start()
	if (not isZoneEnabled("corellia")) or (not isZoneEnabled("yavin4")) or (not isZoneEnabled("endor")) then
		return 0
	end
	
	self:spawnSceneObjects()
	self:spawnMobiles()
end

function addon_starports:spawnMobiles()
	local pShuttle = spawnMobile("dantooine", "lambda_shuttle", 1, -372.2, 3.0, -3072.5, 48, 0)
	local shuttle = LuaCreatureObject(pShuttle)
	shuttle:setOptionsBitmask(256)
	shuttle:setPosture(PRONE)
	
--	local pShuttle2 = spawnMobile("tatooine", "lambda_shuttle", 1, -1493.4, 1, -5657.9, 90, 0)
--	local shuttle2 = LuaCreatureObject(pShuttle2)
--	shuttle2:setOptionsBitmask(256)
--	shuttle2:setPosture(PRONE)
	
--	local pShuttle3 = spawnMobile("tatooine", "lambda_shuttle", 1, -1382.6, 1, -5686.9, -92, 0)
--	local shuttle3 = LuaCreatureObject(pShuttle3)
--	shuttle3:setOptionsBitmask(256)
--	shuttle3:setPosture(PRONE)
	
--	local pShuttle4 = spawnMobile("tatooine", "lambda_shuttle", 1, -1382.6, 1, -5706.9, -92, 0)
--	local shuttle4 = LuaCreatureObject(pShuttle4)
--	shuttle4:setOptionsBitmask(256)
--	shuttle4:setPosture(PRONE)

--	local pShuttle5 = spawnMobile("tatooine", "lambda_shuttle", 1, -1382.6, 1, -5726.9, -92, 0)
--	local shuttle5 = LuaCreatureObject(pShuttle5)
--	shuttle5:setOptionsBitmask(256)
--	shuttle5:setPosture(PRONE)
	
--	local pShuttle6 = spawnMobile("tatooine", "lambda_shuttle", 1, -1382.6, 1, -5746.9, -92, 0)
--	local shuttle6 = LuaCreatureObject(pShuttle6)
--	shuttle6:setOptionsBitmask(256)
--	shuttle6:setPosture(PRONE)
	
--	local pShuttle7 = spawnMobile("tatooine", "lambda_shuttle", 1, -1382.6, 1, -5766.9, -92, 0)
--	local shuttle7 = LuaCreatureObject(pShuttle7)
--	shuttle7:setOptionsBitmask(256)
--	shuttle7:setPosture(PRONE)

--	local pShuttle8 = spawnMobile("tatooine", "lambda_shuttle", 1, -1382.6, 1, -5786.9, -92, 0)
--	local shuttle8 = LuaCreatureObject(pShuttle8)
--	shuttle8:setOptionsBitmask(256)
--	shuttle8:setPosture(PRONE)
	
--	local pShuttle9 = spawnMobile("tatooine", "lambda_shuttle", 1, -1401.3, 1, -5798.3, -2, 0)
--	local shuttle9 = LuaCreatureObject(pShuttle9)
--	shuttle9:setOptionsBitmask(256)
--	shuttle9:setPosture(PRONE)
	
--	local pShuttle10 = spawnMobile("tatooine", "lambda_shuttle", 1, -1421.3, 1, -5798.3, -2, 0)
--	local shuttle10 = LuaCreatureObject(pShuttle10)
--	shuttle10:setOptionsBitmask(256)
--	shuttle10:setPosture(PRONE)
	
--	local pBarker = spawnMobile("tatooine", "stresstest_shuttleloc_barker", 1, -1290.2, 12.0, -3589.6, 133, 0)
--	local barker = LuaCreatureObject(pBarker)
--	barker:setOptionsBitmask(256)
--	self:barkShuttleLocation(pBarker)

--	local pBarker2 = spawnMobile("corellia", "stresstest_shuttleloc_barker", 1, -148.3, 28, -4723.3, 85, 0)
--	local barker2 = LuaCreatureObject(pBarker2)
--	barker2:setOptionsBitmask(256)
--	self:barkShuttleLocation(pBarker2)

--	local pBarker3 = spawnMobile("naboo", "stresstest_shuttleloc_barker", 1, -4880.4, 6.1, 4146.2, 40, 0)
--	local barker3 = LuaCreatureObject(pBarker3)
--	barker2:setOptionsBitmask(256)
--	self:barkShuttleLocation(pBarker3)
	

end

function addon_starports:spawnSceneObjects()
	local pCollector = spawnSceneObject("dantooine", "object/tangible/furniture/all/frn_all_command_console.iff", -371.4, 0.3, -3066.9, 85, 95, 0, 0, 0)
	local collector = LuaSceneObject(pCollector)
	local col2creo = LuaCreatureObject(pCollector)
	col2creo:setOptionsBitmask(264)
	collector:setCustomObjectName("\\#ee3377Travel to Mos Bloodfin Starport")
	createObserver(OBJECTRADIALUSED, "addon_starports", "teleportMB", pCollector)
	
	local pCollector2 = spawnSceneObject("naboo", "object/tangible/furniture/all/frn_all_command_console.iff", -1925.9, -194.5, 5089.1, 0, 0, 0, 0, 0)
	local collector2 = LuaSceneObject(pCollector2)
	local col2creo = LuaCreatureObject(pCollector2)
	col2creo:setOptionsBitmask(264)
	collector2:setCustomObjectName("\\#33ee77Travel to Mos Bloodfin Starport")
	createObserver(OBJECTRADIALUSED, "addon_starports", "teleportMB", pCollector2)
	
	--Return from DWB
	local pCollector3 = spawnSceneObject("lok", "object/tangible/furniture/all/frn_all_command_console.iff", 156.8, 11.9, -1159.1, 0, 0, 0, 1, 0)
	local collector3 = LuaSceneObject(pCollector3)
	local col3creo = LuaCreatureObject(pCollector3)
	col3creo:setOptionsBitmask(264)
	collector3:setCustomObjectName("\\#ee3377Travel to Mos Bloodfin Starport")
	createObserver(OBJECTRADIALUSED, "addon_starports", "teleportMB", pCollector3)
	
	--DWB BLUEFROG
--	spawnSceneObject("dantooine", "object/tangible/terminal/terminal_character_builder.iff", -353.0, 6.7, -3048.3, 0, 0, 0, 1, 0)
	
	--GEO BLUEFROG
--	spawnSceneObject("umbra", "object/tangible/terminal/terminal_character_builder.iff", 166.5, 25.0, 147.7, 0, 0, 0, 1, 0)
	
	--Return from GEO
	local pCollector4 = spawnSceneObject("tatooine", "object/tangible/furniture/imperial/data_terminal_s1.iff", -1447.8, 0.0, -5671.7, 0, 0, 0, 1, 0)
	local collector4 = LuaSceneObject(pCollector4)
	local col4creo = LuaCreatureObject(pCollector4)
	col4creo:setOptionsBitmask(264)
	collector4:setCustomObjectName("\\#0000FFTravel to Secksville Dantooine")
	createObserver(OBJECTRADIALUSED, "addon_starports", "teleportDR", pCollector4)
		--Return to starport
	local pCollector5 = spawnSceneObject("tatooine", "object/tangible/furniture/imperial/data_terminal_s1.iff",  -1446.8, 0.0, -5650.2, 0, 0, 0, 1, 0)
	local collector5 = LuaSceneObject(pCollector5)
	local col5creo = LuaCreatureObject(pCollector5)
	col5creo:setOptionsBitmask(264)
	collector5:setCustomObjectName("\\#33ee77 Travel to Yavin 4")
	createObserver(OBJECTRADIALUSED, "addon_starports", "teleportYavin4", pCollector5)

	
	local pCollector6 = spawnSceneObject("tatooine", "object/tangible/furniture/imperial/data_terminal_s1.iff", -1445.3, 0.0, -5650.2, 0, 0, 0, 1, 0)
	local collector6 = LuaSceneObject(pCollector6)
	local col6creo = LuaCreatureObject(pCollector6)
	col6creo:setOptionsBitmask(264)
	collector6:setCustomObjectName("\\#ee3377Travel to Dark Templar Lok")
	createObserver(OBJECTRADIALUSED, "addon_starports", "teleportTT", pCollector6)

	local pCollector7 = spawnSceneObject("tatooine", "object/tangible/furniture/imperial/data_terminal_s1.iff", -1447.1, 0.0, -5669.5, 88, 0, 0, 1, 0)
	local collector7 = LuaSceneObject(pCollector7)
	local col7creo = LuaCreatureObject(pCollector7)
	col7creo:setOptionsBitmask(264)
	collector7:setCustomObjectName("\\#ee3377Travel to Bartertown Tatooine")
	createObserver(OBJECTRADIALUSED, "addon_starports", "teleportTS", pCollector7)

	local pCollector8 = spawnSceneObject("tatooine", "object/tangible/furniture/all/frn_all_command_console.iff", 2515.2, 60.0, 5232.3, 0, 0, 0, 1, 0)
	local collector8 = LuaSceneObject(pCollector8)
	local col8creo = LuaCreatureObject(pCollector8)
	col8creo:setOptionsBitmask(264)
	collector8:setCustomObjectName("\\#ee3377Travel to Mos Bloodfin")
	createObserver(OBJECTRADIALUSED, "addon_starports", "teleportMB", pCollector8)

	local pCollector9 = spawnSceneObject("tatooine", "object/tangible/furniture/imperial/data_terminal_s1.iff", -1449.7, 0.1, -5667.3, 0, 0, 0, 1, 0)
	local collector9 = LuaSceneObject(pCollector9)
	local col9creo = LuaCreatureObject(pCollector9)
	col9creo:setOptionsBitmask(264)
	collector9:setCustomObjectName("\\#ee3377Travel to Core 3 Estates")
	createObserver(OBJECTRADIALUSED, "addon_starports", "teleportLK", pCollector9)

	local pCollector10 = spawnSceneObject("naboo", "object/tangible/furniture/all/frn_all_command_console.iff", -6021.6, 19.5, 3017.5, 0, 0, 0, 1, 0)
	local collector10 = LuaSceneObject(pCollector10)
	local col10creo = LuaCreatureObject(pCollector10)
	col10creo:setOptionsBitmask(264)
	collector10:setCustomObjectName("\\#ee3377Travel to Mos Bloodfin")
	createObserver(OBJECTRADIALUSED, "addon_starports", "teleportMB", pCollector10)

	local pCollector11 = spawnSceneObject("tatooine", "object/tangible/furniture/imperial/data_terminal_s1.iff", -1449.7, 0.1, -5673.2, 0, 0, 0, 1, 0)
	local collector11 = LuaSceneObject(pCollector11)
	local col11creo = LuaCreatureObject(pCollector11)
	col11creo:setOptionsBitmask(264)
	collector11:setCustomObjectName("\\#ee3377Travel to New Hesperia")
	createObserver(OBJECTRADIALUSED, "addon_starports", "teleportDT", pCollector11)

	local pCollector12 = spawnSceneObject("talus", "object/tangible/furniture/all/frn_all_command_console.iff", -3435.0, 55.3, 3370.0, 0, 0, 0, 1, 0)
	local collector12 = LuaSceneObject(pCollector12)
	local col12creo = LuaCreatureObject(pCollector12)
	col12creo:setOptionsBitmask(264)
	collector12:setCustomObjectName("\\#ee3377Travel to Mos Bloodfin")
	createObserver(OBJECTRADIALUSED, "addon_starports", "teleportMB", pCollector12)

	local pCollector13 = spawnSceneObject("tatooine", "object/tangible/furniture/imperial/data_terminal_s1.iff", -1447.9, 0.0, -5668.2, 0, 0, 0, 1, 0)
	local collector13 = LuaSceneObject(pCollector13)
	local col13creo = LuaCreatureObject(pCollector13)
	col13creo:setOptionsBitmask(264)
	collector13:setCustomObjectName("\\#ee3377Travel to Red Dragon Dantooine")
	createObserver(OBJECTRADIALUSED, "addon_starports", "teleportYV", pCollector13)

	local pCollector14 = spawnSceneObject("dantooine", "object/tangible/furniture/all/frn_all_command_console.iff", -7135.2, 0.3, -6084.7, 0, 0, 0, 1, 0)
	local collector14 = LuaSceneObject(pCollector14)
	local col14creo = LuaCreatureObject(pCollector14)
	col14creo:setOptionsBitmask(264)
	collector14:setCustomObjectName("\\#ee3377Travel to Mos Bloodfin")
	createObserver(OBJECTRADIALUSED, "addon_starports", "teleportMB", pCollector14)

	local pCollector15 = spawnSceneObject("tatooine", "object/tangible/furniture/imperial/data_terminal_s1.iff", -1447.1, 0.0, -5670.7, 0, 0, 0, 1, 0)
	local collector15 = LuaSceneObject(pCollector15)
	local col15creo = LuaCreatureObject(pCollector15)
	col15creo:setOptionsBitmask(264)
	collector15:setCustomObjectName("\\#ee3377Travel to Petersberg Corellia")
	createObserver(OBJECTRADIALUSED, "addon_starports", "teleportCP", pCollector15)

	local pCollector16 = spawnSceneObject("corellia", "object/tangible/furniture/all/frn_all_command_console.iff", -464.9, 22.2, -1678.8, 0, 0, 0, 1, 0)
	local collector16 = LuaSceneObject(pCollector16)
	local col16creo = LuaCreatureObject(pCollector16)
	col16creo:setOptionsBitmask(264)
	collector16:setCustomObjectName("\\#ee3377Travel to Mos Bloodfin")
	createObserver(OBJECTRADIALUSED, "addon_starports", "teleportMB", pCollector16)

	local pCollector17 = spawnSceneObject("tatooine", "object/tangible/furniture/imperial/data_terminal_s1.iff", -1449.6, 0.0, -5671.7, 0, 0, 0, 1, 0)
	local collector17 = LuaSceneObject(pCollector17)
	local col17creo = LuaCreatureObject(pCollector17)
	col17creo:setOptionsBitmask(264)
	collector17:setCustomObjectName("\\#ee3377Travel to MASC Empire")
	createObserver(OBJECTRADIALUSED, "addon_starports", "teleportmasc", pCollector17)	


end

function addon_starports:barkShuttleLocation(pBarker)
	if (pBarker ~= nil) then
		spatialChat(pBarker, "\\#FF0000Mos Bloodfin insta transit Starport open for travellers, Mos Bloodfin Tatooine. Click the terminal here for instant transport.\nEnjoy your flight, and thank you for flying Mos Bloodfin.")
		createEvent(55000, "addon_starports", "barkShuttleLocation", pBarker)
	end
end

function addon_starports:barkShuttleLocation(pBarker2)
	if (pBarker2 ~= nil) then
		spatialChat(pBarker2, "\\#FF0000Mos Bloodfin insta transit Starport open for travellers, Mos Bloodfin Tatooine. Click the terminal here for instant transport.\nEnjoy your flight, and thank you for flying Mos Bloodfin.")
		createEvent(55000, "addon_starports", "barkShuttleLocation", pBarker2)
	end
end

function addon_starports:barkShuttleLocation(pBarker3)
	if (pBarker3 ~= nil) then
		spatialChat(pBarker3, "\\#FF0000Mos Bloodfin insta transit Starport open for travellers, Mos Bloodfin Tatooine. Click the terminal here for instant transport.\nEnjoy your flight, and thank you for flying Mos Bloodfin.")
		createEvent(85000, "addon_starports", "barkShuttleLocation", pBarker3)
	end
end

function addon_starports:teleportMB(pCollector, pPlayer)
	local player = LuaSceneObject(pPlayer)
	player:switchZone("tatooine", -1445, 0, -5663, 85)
end

function addon_starports:teleportNB(pCollector, pPlayer)
	local player = LuaSceneObject(pPlayer)
	player:switchZone("naboo", -4876, 6.1, 4147, 0)
end

function addon_starports:teleportYavin4(pCollector, pPlayer)
	local player = LuaSceneObject(pPlayer)
	player:switchZone("yavin4", -272.5, 35.0, 4882.0, 175)
end

function addon_starports:teleportTT(pCollector, pPlayer)
	local player = LuaSceneObject(pPlayer)
	player:switchZone("lok", 158.8, 11.9, -1157.1, 175)
end

function addon_starports:teleportRR(pCollector, pPlayer)
	local player = LuaSceneObject(pPlayer)
	player:switchZone("rori", 5364.9, 80, 5664.1, -178)
end

function addon_starports:teleportTS(pCollector, pPlayer)
	local player = LuaSceneObject(pPlayer)
	player:switchZone("tatooine", 2515.9, 60.0, 5227.2, 40)
end

function addon_starports:teleportLK(pCollector, pPlayer)
	local player = LuaSceneObject(pPlayer)
	player:switchZone("naboo", -6021.6, 19.5, 3021.5, 40)
end

function addon_starports:teleportCP(pCollector, pPlayer)
	local player = LuaSceneObject(pPlayer)
	player:switchZone("corellia", -464.9, 22.3, -1673.8, -16)
end

function addon_starports:teleportDT(pCollector, pPlayer)
	local player = LuaSceneObject(pPlayer)
	player:switchZone("talus", -3435.0, 55.3, 3375.0, 38)
end

function addon_starports:teleportDR(pCollector, pPlayer)
	local player = LuaSceneObject(pPlayer)
	player:switchZone("dantooine", -371.0, 0.6, -3063.9, -61)
end

function addon_starports:teleportYV(pCollector, pPlayer)
	local player = LuaSceneObject(pPlayer)
	player:switchZone("dantooine", -7149.8, 0.1, -6074.8, -127)
end

function addon_starports:teleportmasc(pCollector, pPlayer)
	local player = LuaSceneObject(pPlayer)
	player:switchZone("naboo", -1924.9, -194.5, 5089.1, -127)
end



