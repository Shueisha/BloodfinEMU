--[[
TODO:
-Make a quest that requires state = 1 to start and ends at 4
Trials
Kin dray
graul marauder
enraged kimo
tusken raider
]]


padawanTrialsThree = ScreenPlay:new { 
	numberOfActs = 1, 
	questString = "padawanTrialsThree",
	states = {
		quest = { hasShrine = 1, killedBoss = 2}
		
	}, 
	questdata = Object:new {
		
		activePlayerName = "initial",
	}
	
}

registerScreenPlay("padawanTrialsThree", true)

function padawanTrialsThree:start()
	if (isZoneEnabled("lok")) then
		self:spawnActiveAreas()
	end
end

function padawanTrialsThree:spawnActiveAreas()
	local pSpawnArea = spawnSceneObject("lok", "object/active_area.iff", 4588, 13, -1129, 0, 0, 0, 0, 0)
	
	if (pSpawnArea ~= nil) then
		local activeArea = LuaActiveArea(pSpawnArea)
		activeArea:setCellObjectID(0)
		activeArea:setRadius(5)
		createObserver(ENTEREDAREA, "padawanTrialsThree", "notifySpawnArea", pSpawnArea)
	end
end

function padawanTrialsThree:notifySpawnArea(pActiveArea, pMovingObject)
	local movingObject = LuaSceneObject(pMovingObject)
	local player = LuaCreatureObject(pMovingObject)
	local hasShrine = player:hasScreenPlayState(padawanTrialsThree.states.quest.hasShrine, padawanTrialsThree.questString)
	local killedBoss = player:hasScreenPlayState(padawanTrialsThree.states.quest.killedBoss, padawanTrialsThree.questString)
	
	if (movingObject:isCreatureObject() and readData("padawanTrialsThree:spawnBossThree") == 0 and hasShrine == 1 and killedBoss == 0) then
		local player = LuaCreatureObject(pMovingObject)
		local objectID = player:getObjectID()
		local activeArea = LuaSceneObject(pActiveArea)
		--player:sendSystemMessage("The Force has senses your presence!")
		writeData("padawanTrialsThree:spawnBossThree", 1)

		if readData("padawanTrialsThree:spawnBossThree") == 1 then
			--local pBoss = 
			local pBoss = spawnMobile("lok", "enraged_kimogila", 0, 4565, 13, -1171, 12, 0)
			createObserver(DEFENDERDROPPED, "padawanTrialsThree", "DefenderDropped", pBoss)
		end
	else
		--player:sendSystemMessage("The Force blocks your vision....")
		writeData("padawanTrialsThree:spawnBossThree", 0)
	end

end

function padawanTrialsThree:DefenderDropped(pBoss, pPlayer)
		
	local player = LuaCreatureObject(pPlayer)
	local hasShrine = player:hasScreenPlayState(padawanTrialsThree.states.quest.hasShrine, padawanTrialsThree.questString)
	local killedBoss = player:hasScreenPlayState(padawanTrialsThree.states.quest.killedBoss, padawanTrialsThree.questString)
	local boss = LuaCreatureObject(pBoss)
	if ( boss ~= nil ) then
		local bossHealth = boss:getHAM(0)
		local bossAction = boss:getHAM(3)
		local bossMind = boss:getHAM(6)

		if ( bossHealth <= 0 or bossAction <= 0 or bossMind <= 0 ) then
			local killedBoss = player:setScreenPlayState(padawanTrialsThree.states.quest.killedBoss, padawanTrialsThree.questString)
			if (player:hasScreenPlayState(padawanTrialsThree.states.quest.hasShrine, padawanTrialsThree.questString)) then
				player:setScreenPlayState(padawanTrialsThree.states.quest.killedBoss, padawanTrialsThree.questString)
			end
		end
			
	end
end




















