--[[
TODO:
-Make a quest that requires state = 1 to start and ends at 4
Trials
Kin dray
graul marauder
enraged kimo
ancient rancor
]]


padawanTrialsFour = ScreenPlay:new { 
	numberOfActs = 1, 
	questString = "padawanTrialsFour",
	states = {
		quest = { hasShrine = 1, killedBoss = 2}
		
	}, 
	questdata = Object:new {
		
		activePlayerName = "initial",
	}
	
}

registerScreenPlay("padawanTrialsFour", true)

function padawanTrialsFour:start()
	if (isZoneEnabled("dathomir")) then
		self:spawnActiveAreas()
	end
end

function padawanTrialsFour:spawnActiveAreas()
	local pSpawnArea = spawnSceneObject("dathomir", "object/active_area.iff", 7185, 491, 3226, 0, 0, 0, 0, 0)
	
	if (pSpawnArea ~= nil) then
		local activeArea = LuaActiveArea(pSpawnArea)
		activeArea:setCellObjectID(0)
		activeArea:setRadius(3)
		createObserver(ENTEREDAREA, "padawanTrialsFour", "notifySpawnArea", pSpawnArea)
	end
end

function padawanTrialsFour:notifySpawnArea(pActiveArea, pMovingObject)
	local movingObject = LuaSceneObject(pMovingObject)
	local player = LuaCreatureObject(pMovingObject)
	local hasShrine = player:hasScreenPlayState(padawanTrialsFour.states.quest.hasShrine, padawanTrialsFour.questString)
	local killedBoss = player:hasScreenPlayState(padawanTrialsFour.states.quest.killedBoss, padawanTrialsFour.questString)
	
	if (movingObject:isCreatureObject() and readData("padawanTrialsFour:spawnBossFour") == 0 and hasShrine == 1 and killedBoss == 0) then
		local player = LuaCreatureObject(pMovingObject)
		local objectID = player:getObjectID()
		local activeArea = LuaSceneObject(pActiveArea)
		--player:sendSystemMessage("The Force has senses your presence!")
		writeData("padawanTrialsFour:spawnBossFour", 1)

		if readData("padawanTrialsFour:spawnBossFour") == 1 then
			--local pBoss = 
			local pBoss = spawnMobile("dathomir", "ancient_bull_rancor", 0, 7156, 508.9, 3225, 81, 0)
			createObserver(DEFENDERDROPPED, "padawanTrialsFour", "DefenderDropped", pBoss)
		end
	else
		--player:sendSystemMessage("The Force blocks your vision....")
		writeData("padawanTrialsFour:spawnBossFour", 0)
	end

end

function padawanTrialsFour:DefenderDropped(pBoss, pPlayer)
		
	local player = LuaCreatureObject(pPlayer)
	local hasShrine = player:hasScreenPlayState(padawanTrialsFour.states.quest.hasShrine, padawanTrialsFour.questString)
	local killedBoss = player:hasScreenPlayState(padawanTrialsFour.states.quest.killedBoss, padawanTrialsFour.questString)
	local boss = LuaCreatureObject(pBoss)
	if ( boss ~= nil ) then
		local bossHealth = boss:getHAM(0)
		local bossAction = boss:getHAM(3)
		local bossMind = boss:getHAM(6)

		if ( bossHealth <= 0 or bossAction <= 0 or bossMind <= 0 ) then
			local killedBoss = player:setScreenPlayState(padawanTrialsFour.states.quest.killedBoss, padawanTrialsFour.questString)
			if (player:hasScreenPlayState(padawanTrialsFour.states.quest.hasShrine, padawanTrialsFour.questString)) then
				player:setScreenPlayState(padawanTrialsFour.states.quest.killedBoss, padawanTrialsFour.questString)
			end
		end
			
	end
end




















