--[[NEUTRAL CORVETTE
Spawning scene objects which will include active areas, elevators
spawning mobiles to include droids, and possibly more
will work on getting a simple quest involed
also going to put a timer on the duration of which one will be in the vet

basic waypoint -20, 0, 0, 4336197]]

corvette_pveScreenPlay = ScreenPlay:new {
	numberOfActs = 1,

}

registerScreenPlay("corvette_pveScreenPlay", true)

function corvette_pveScreenPlay:start()
	if (isZoneEnabled("dungeon1")) then
		self:spawnMobiles()
		self:spawnSceneObjects() 
	end
end

--TODO: use a pointer on a mobile.

function corvette_pveScreenPlay:spawnSceneObjects()

--	local pCollector = spawnSceneObject("tatooine", "object/tangible/furniture/imperial/data_terminal_s1.iff", -1441, 0, -5657, 0, 0, 0, 1, 0)
--	local collector = LuaSceneObject(pCollector)
--	local col2creo = LuaCreatureObject(pCollector)
--	col2creo:setOptionsBitmask(264)
--	collector:setCustomObjectName("\\#FF0000Travel to General Grievous's Corvette!")
--	createObserver(OBJECTRADIALUSED, "corvette_pveScreenPlay", "teleportCor", pCollector)
end

--[[spawnMobile("MOBILENAME", SPAWNTIMER, FIRST SET OF COORDS, HEIGHT, 2ND SET OF COORDS, DIRECTION, CELL (0 IF NOT IN ONE)]]
function corvette_pveScreenPlay:spawnMobiles()

	local pCollector1 = spawnMobile("tatooine", "droidekaport", 120, -1434.6, -0.0, -5672.6, 7, 0)
	local collector1 = LuaCreatureObject(pCollector1)
	collector1:setOptionsBitmask(264)
	collector1:setCustomObjectName("\\#FF0000Travel to General Grievous's Corvette -after teleport remember to soft log")
	createObserver(OBJECTRADIALUSED, "corvette_pveScreenPlay", "teleportCor", pCollector1)
	if (pCollecter1~= nil) then 
		return
	end
--POINTER FOR MOBILE TO SPAWN OUT OF VET
	local pCollector3 = spawnMobile("dungeon1", "eg6_port", 120, -33.1, 0.0, -0.7, 90, 4336198)--Spawn him with a -> to pCollector (he is pCollector)
	local collector3 = LuaCreatureObject(pCollector3)--Setting him to collector (he is collector)
	collector3:setOptionsBitmask(264)--Set his options to be convo
	collector3:setCustomObjectName("\\#FF0000Transport off the Grievous Corvette")	
	createObserver(OBJECTRADIALUSED, "corvette_pveScreenPlay", "teleportOut", pCollector3)--creating an observer, type,which screenplay, stringToRead, pointer
	if (pCollecter3~= nil) then -- if he is false, then return  false`
		return
	end
	
--STARTING FLOOR
	--[[ENTRY ROOM CELL 4336197]]
	--spawnMobile("dungeon1","mandalorian_atiniir", 1, -40, 0, 2, -153, 4336197)


	--[[THURSTER CELL 4336220]]
	spawnMobile("dungeon1","corvette_crew", 120,    -6, 0, -38,  86, 4336220)
	spawnMobile("dungeon1","corvette_crew", 120, -0.1, 0, -37, 177, 4336220)
	spawnMobile("dungeon1","corvette_crew", 120,    6, 0, -38, -93, 4336220)
	spawnMobile("dungeon1","corvette_crew", 120,    4, 0, -41,  177, 4336220)
	spawnMobile("dungeon1","corvette_crew", 120,   -3, 0, -41, 179, 4336220)


	--[[DUNGEONHALL4 CELL 4336200]]
	spawnMobile("dungeon1","corvette_crew", 120,   -10, 0, 37,   0, 4336200)
	spawnMobile("dungeon1","corvette_crew", 120,   -10, 0, 26,  -2, 4336200)
	spawnMobile("dungeon1","corvette_crew", 120,   -12, 0, 18, -94, 4336200)
	spawnMobile("dungeon1","corvette_sbd", 120,    -4, 0, 17,  67, 4336200)
	spawnMobile("dungeon1","corvette_crew", 120,    -4, 0, 19, 104, 4336200)
	spawnMobile("dungeon1","corvette_crew", 120,    -9, 0, 14,   2, 4336200)
	spawnMobile("dungeon1","corvette_crew", 120,   -10, 0,  6, 179, 4336200)


	--[[BARACKS CELL 4336203]]
	spawnMobile("dungeon1","corvette_crew", 120,   -10, 0,  47,  175, 4336203)
	spawnMobile("dungeon1","corvette_crew", 120,    -7, 0,  46,   -1, 4336203)
	spawnMobile("dungeon1","corvette_sbd", 120,    -4, 0,  46,  179, 4336203)
	spawnMobile("dungeon1","corvette_crew", 120,   -10, 0,  60,    3, 4336203)
	spawnMobile("dungeon1","corvette_crew", 120,    -7, 0,  59,  177, 4336203)
	spawnMobile("dungeon1","corvette_crew", 120,    -4, 0,  60,   -4, 4336203)
	spawnMobile("dungeon1","corvette_crew", 120,     3, 0,  46,    0, 4336203)
	spawnMobile("dungeon1","corvette_crew", 120,     7, 0,  46,   -3, 4336203)
	spawnMobile("dungeon1","corvette_crew", 120,    11, 0,  46,   -1, 4336203)
	spawnMobile("dungeon1","corvette_sbd", 120,    10, 0,  53,  -91, 4336203)
	spawnMobile("dungeon1","corvette_crew", 120,    12, 0,  58,   75, 4336203)
	spawnMobile("dungeon1","corvette_crew", 120,     8, 0,  59,  177, 4336203)
	spawnMobile("dungeon1","corvette_crew", 120,     4, 0,  59, -178, 4336203)


	--[[BARRACKS CLOSET QUEST GIVER CELL 4336205]]	
	--spawnMobile("dungeon1","corvette_crew", 120,   , 0,  , , 4336203)


	--[[BARRACKS CLOSET NO USE YET CELL 4336204]]
	--spawnMobile("dungeon1","mandalorian_rogue", 120, , 0, , , 4336204)

	--[[ESCAPEPODS CELL 4336230]]
	spawnMobile("dungeon1","corvette_crew", 120, 18, -12,  28,  -90, 4336230)
	spawnMobile("dungeon1","corvette_crew", 120, 26, -12,  28,   92, 4336230)
	spawnMobile("dungeon1","corvette_crew", 120, 25, -12,  35,    0, 4336230)
	spawnMobile("dungeon1","corvette_sbd", 120, 25, -12,  16,    0, 4336230)
	spawnMobile("dungeon1","corvette_crew", 120, 25, -12,   2, -179, 4336230)
	spawnMobile("dungeon1","corvette_crew", 120, 25, -12, -12,  178, 4336230)
	spawnMobile("dungeon1","corvette_crew", 120, 25, -12, -19,  175, 4336230)
	spawnMobile("dungeon1","corvette_crew", 120, 22, -12, -16,  -92, 4336230)
	spawnMobile("dungeon1","corvette_crew", 120, 15, -12,  16,   93, 4336230)
	spawnMobile("dungeon1","corvette_crew", 120,  7, -12, -15, -108, 4336230)
	spawnMobile("dungeon1","corvette_crew", 120,  7, -12, -17,  -68, 4336230)


	--[[LOWER-THURSTER ROOM RIGHT CELL 4336220]]
	spawnMobile("dungeon1","corvette_crew", 120, -12, -12, -40, -50, 4336220)
	spawnMobile("dungeon1","corvette_crew", 120,  27, -12, -39,  -1, 4336220)
	spawnMobile("dungeon1","corvette_crew", 120,   8, -12, -54, -84, 4336220)
	spawnMobile("dungeon1","corvette_crew", 120, 23,  -12, -58,   5, 4336220)
	spawnMobile("dungeon1","corvette_crew", 120, 27,  -12, -59,  -6, 4336220)


	--[[THRUSTERROOM ENGINEERING CELL 4336224]]
	spawnMobile("dungeon1","corvette_crew", 120,    8, -14, -33,  -1, 4336224)
	spawnMobile("dungeon1","corvette_crew", 120, -0.4, -14, -33,  10, 4336224)
	spawnMobile("dungeon1","corvette_sbd", 120,    0, -14, -41, 178, 4336224)
	spawnMobile("dungeon1","corvette_crew", 120,   -3, -14, -36,  90, 4336224)


	--[[MESSHALL CELL 4336229]]
	spawnMobile("dungeon1","corvette_crew", 120, 6, -12, 0, 11, 4336229)--BARTENDER
	spawnMobile("dungeon1","corvette_crew", 120, 12, -12, 9, -94, 4336229)--BOUNCER
	spawnMobile("dungeon1","corvette_crew", 120, 4, -12, 2, 177, 4336229)--DRUNK
	spawnMobile("dungeon1","corvette_crew", 120, 7, -12, 11, 171, 4336229)--DRUNK

	--[[BRIDGE ARMORY CELL 4336250]]
	spawnMobile("dungeon1","corvette_crew", 120,   10, -12, 120.0,  -1, 4336250)
	spawnMobile("dungeon1","corvette_crew", 120,  8.4, -12, 120.0,  10, 4336250)
	spawnMobile("dungeon1","corvette_crew", 120,   6.8, -12, 120.0, 178, 4336250)
	spawnMobile("dungeon1","corvette_sbd", 120,   3.9, -12, 120.0,  90, 4336250)
	spawnMobile("dungeon1","corvette_crew", 120,   0, -12, 120.0,  -1, 4336250)
	spawnMobile("dungeon1","corvette_crew", 120, -2.4, -12, 120.0,  10, 4336250)
	spawnMobile("dungeon1","corvette_crew", 120,   -4.8, -12, 120.0, 178, 4336250)
	spawnMobile("dungeon1","corvette_crew", 120,   -6.9, -12, 120.0,  90, 4336250)	

	--[[BRIDGE OFFICE CELL 4336259]]
	spawnMobile("dungeon1","corvette_vynock", 820,   21, 0, 119,  -1, 4336259)
	spawnMobile("dungeon1","corvette_vynock", 820, 20.4, 0, 124.9,  10, 4336259)
	spawnMobile("dungeon1","corvette_vynock", 820,   14.8, 0, 123.8, 178, 4336259)
	spawnMobile("dungeon1","corvette_vynock", 820,   16.9, 0, 120.3,  90, 4336259)	


	--[[BRIDGE HALL CELL 4336258]]

	spawnMobile("dungeon1","corvette_sbd", 420,    0, 0, 128.0,  178, 4336258)

	--[[BRIDGE CELL 4336262]]	
	spawnMobile("dungeon1","corvette_boss", 900,    -0.1, 0.0, 148.7,  -1, 4336262)
	spawnMobile("dungeon1","corvette_crew", 120, -6.1, 0.0, 149.0,  -87, 4336262)
	spawnMobile("dungeon1","corvette_crew", 120, -4.6, 0, 145.5, -165, 4336262)
	spawnMobile("dungeon1","corvette_crew", 120,   6.1, 0, 149.3,  88, 4336262)

end

function corvette_pveScreenPlay:teleportCor(pCollector, pPlayer)--current
	local player = LuaSceneObject(pPlayer)
	player:switchZone("dungeon1", -20, 0, 0, 4336197)
end

function corvette_pveScreenPlay:teleportOut(pCollector, pPlayer)--current
	local player = LuaSceneObject(pPlayer)
	player:switchZone("tatooine", -1445, 0, -5663, 85)
end




