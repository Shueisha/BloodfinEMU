--[[
TODO:
-Make a quest that requires state = 1 to start and ends at 4
Trials
Kin dray
graul marauder
enraged kimo
tusken raider
]]


padawanTrials = ScreenPlay:new { 
	numberOfActs = 1, 
	questString = "padawanTrialsOne",
	states = {
		quest = { hasShrine = 1, killedBoss = 2}
		
	}, 
	questdata = Object:new {
		
		activePlayerName = "initial",
	}
	
}

registerScreenPlay("padawanTrials", true)

function padawanTrials:start()
	if (isZoneEnabled("dathomir")) then
		self:spawnActiveAreas()
	end
end

function padawanTrials:spawnActiveAreas()
	local pSpawnArea = spawnSceneObject("dathomir", "object/active_area.iff", -1202.8, 123.7, 6267.5, 0, 0, 0, 0, 0)
	
	if (pSpawnArea ~= nil) then
		local activeArea = LuaActiveArea(pSpawnArea)
		activeArea:setCellObjectID(0)
		activeArea:setRadius(5)
		createObserver(ENTEREDAREA, "padawanTrials", "notifySpawnArea", pSpawnArea)
	end
end

function padawanTrials:notifySpawnArea(pActiveArea, pMovingObject)
	local movingObject = LuaSceneObject(pMovingObject)
	local player = LuaCreatureObject(pMovingObject)
	local hasShrine = player:hasScreenPlayState(padawanTrials.states.quest.hasShrine, padawanTrials.questString)
	local killedBoss = player:hasScreenPlayState(padawanTrials.states.quest.killedBoss, padawanTrials.questString)
	
	if (movingObject:isCreatureObject() and readData("padawanTrials:spawnBoss") == 0 and hasShrine == 1 and killedBoss == 0) then
		local player = LuaCreatureObject(pMovingObject)
		local objectID = player:getObjectID()
		local activeArea = LuaSceneObject(pActiveArea)
		--player:sendSystemMessage("The Force senses your presence!")
		writeData("padawanTrials:spawnBoss", 1)

		if readData("padawanTrials:spawnBoss") == 1 then
			--local pBoss = 
			local pBoss = spawnMobile("dathomir", "kiin_dray", 0, -90.9, -100.9, -98.9, 168, 3695712)
			createObserver(DEFENDERDROPPED, "padawanTrials", "DefenderDropped", pBoss)
		end

		
	else
		--player:sendSystemMessage("The Force blocks your vision....")
		writeData("padawanTrials:spawnBoss", 0)
	end

end

function padawanTrials:DefenderDropped(pBoss, pPlayer)
		
	local player = LuaCreatureObject(pPlayer)
	local hasShrine = player:hasScreenPlayState(padawanTrials.states.quest.hasShrine, padawanTrials.questString)
	local killedBoss = player:hasScreenPlayState(padawanTrials.states.quest.killedBoss, padawanTrials.questString)
	local boss = LuaCreatureObject(pBoss)
	if ( boss ~= nil ) then
		local bossHealth = boss:getHAM(0)
		local bossAction = boss:getHAM(3)
		local bossMind = boss:getHAM(6)

		if ( bossHealth <= 0 or bossAction <= 0 or bossMind <= 0 ) then
			local killedBoss = player:setScreenPlayState(padawanTrials.states.quest.killedBoss, padawanTrials.questString)
			if (player:hasScreenPlayState(padawanTrials.states.quest.hasShrine, padawanTrials.questString)) then
				player:setScreenPlayState(padawanTrials.states.quest.killedBoss, padawanTrials.questString)
			end
		end
			
	end
end




















