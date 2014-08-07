bloodfin_cantinaScreenPlay = ScreenPlay:new {
        numberOfActs = 1,

        screenplayName = "bloodfin_cantinaScreenPlay",
}

registerScreenPlay("bloodfin_cantinaScreenPlay", true)

function bloodfin_cantinaScreenPlay:start()
	if (isZoneEnabled("tatooine")) then
		self:spawnMobiles()
		self:initializeLootContainers()
	end
end

function bloodfin_cantinaScreenPlay:spawnMobiles()

	local pCollector1 = spawnMobile("tatooine", "port", 120, -1421.6, -0.0, -5672.6, 7, 0)
	local collector1 = LuaCreatureObject(pCollector1)
	collector1:setOptionsBitmask(264)
	collector1:setCustomObjectName("\\#FF0000Travel to the Iconic Dungeon")
	createObserver(OBJECTRADIALUSED, "bloodfin_cantinaScreenPlay", "teleportIconic", pCollector1)
	if (pCollecter1~= nil) then 
		return
	end

	local pCollector2 = spawnMobile("tatooine", "telport", 120, -1428.6, -0.0, -5672.6, 7, 0)
	local collector2 = LuaCreatureObject(pCollector1)
	collector2:setOptionsBitmask(264)
	createObserver(OBJECTRADIALUSED, "bloodfin_cantinaScreenPlay", "teleportDWS", pCollector2)
	if (pCollecter2~= nil) then 
		return
	end


--Cantina

	spawnMobile("tatooine", "ig_88", 1, 12.4, 1.0, -13.6, -32, 281474997631913)
	spawnMobile("tatooine", "bossk", 1, 13.0, 1.0, -12.2, 118, 281474997631913)
--	spawnMobile("tatooine", "bounty_hunter_thug", 30, 12.8, 1.0, -10.1, 87, 281474997631913)
	spawnMobile("tatooine", "entertainer",1, 3.9, 0.5, -16.4, 0, 281474997631913)
	spawnMobile("tatooine", "entertainer",1, -5.6, 0.5, -15.6, 0, 281474997631913)
--	spawnMobile("tatooine", "max_rebo",1, -0.9, 0.5, -15.7, 0, 281474997631913)
--	spawnMobile("tatooine", "droopy_mccool",1, 0.4, 0.5, -13.1, 0, 281474997631913)
--	spawnMobile("tatooine", "sy_snootles", 1, -0.8, 0.5, -11.6, 0, 281474997631913)
--	spawnMobile("tatooine", "roughneck",	5, -11.5, 1.0, -1.7, -176, 281474997631913)
--	spawnMobile("tatooine", "assassin", 	5, -11.6, 1.0, -3.6, -25, 281474997631913)
	spawnMobile("tatooine", "bartender", 	1, -2.1, 0.8, 5.1, -161, 281474997631913)
	spawnMobile("tatooine", "bartender", 	1, 1.5, 0.8, 4.7, 139, 281474997631913)
	spawnMobile("tatooine", "jabba_the_hutt",1, -12.4, 1.0, -12.0, 85, 281474997631913)
--	spawnMobile("tatooine", "jabba_enforcer",1, -10.4, 0.8, -14.0, 56, 281474997631913)
--	spawnMobile("tatooine", "jabba_enforcer",1, -10.5, 0.8, -9.8, 19, 281474997631913)
	spawnMobile("tatooine", "gamorrean_guard",1, -9.6, 0.8, -17, 0, 281474997631913)
	spawnMobile("tatooine", "twilek_slave", 1,-12.5, 1, -9.9, 72, 281474997631913)
	spawnMobile("tatooine", "salacious_crumb",1,-10.8, 0.9, -10.8, 64, 281474997631913)
--	spawnMobile("tatooine", "weequay_zealot", 1,-3.0, 0.7, 3.3, 17, 281474997631913)
--	spawnMobile("tatooine", "gunrunner",  1, -0.5, 0.7, 2.4, -5, 281474997631913)
--	spawnMobile("tatooine", "rodian_gladiator",  1, 2.4, 0.7, 3.1, -51, 281474997631913)
	spawnMobile("tatooine", "commoner_fat", 1, 4.0, -0.2, -12.6, 173, 281474997631913)

		


end

function bloodfin_cantinaScreenPlay:teleportIconic(pCollector, pPlayer)
	local player = LuaSceneObject(pPlayer)
	player:switchZone("naboo", -6488.1, 39.8, -3240.7, -161)
end

function bloodfin_cantinaScreenPlay:teleportDWS(pCollector, pPlayer)
	local player = LuaSceneObject(pPlayer)
	player:switchZone("rori", 4835.1, 76.3, -1090.9, 57)
end
