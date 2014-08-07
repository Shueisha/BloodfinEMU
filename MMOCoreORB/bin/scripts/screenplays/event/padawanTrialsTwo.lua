--[[
TODO:
-Make a quest that requires state = 1 to start and ends at 4
Trials
Kin dray
graul marauder
enraged kimo
tusken raider
]]


padawanTrialsTwo = ScreenPlay:new { 
	numberOfActs = 1, 
	questString = "padawanTrialsTwo",
	states = {
		quest = { hasShrine = 1, killedBoss = 2}
		
	}, 
	questdata = Object:new {
		
		activePlayerName = "initial",
	}
	
}

registerScreenPlay("padawanTrialsTwo", true)

function padawanTrialsTwo:start()
	if (isZoneEnabled("dantooine")) then
		self:spawnActiveAreas()
	end
end

function padawanTrialsTwo:spawnActiveAreas()
	local pSpawnArea = spawnSceneObject("dantooine", "object/active_area.iff", 1909, 1.8, -4799.3, 0, 0, 0, 0, 0)
	
	if (pSpawnArea ~= nil) then
		local activeArea = LuaActiveArea(pSpawnArea)
		activeArea:setCellObjectID(0)
		activeArea:setRadius(5)
		createObserver(ENTEREDAREA, "padawanTrialsTwo", "notifySpawnArea", pSpawnArea)
	end
end

function padawanTrialsTwo:notifySpawnArea(pActiveArea, pMovingObject)
	local movingObject = LuaSceneObject(pMovingObject)
	local player = LuaCreatureObject(pMovingObject)
	local hasShrine = player:hasScreenPlayState(padawanTrialsTwo.states.quest.hasShrine, padawanTrialsTwo.questString)
	local killedBoss = player:hasScreenPlayState(padawanTrialsTwo.states.quest.killedBoss, padawanTrialsTwo.questString)
	
	if (movingObject:isCreatureObject() and readData("padawanTrialsTwo:spawnBossTwo") == 0 and hasShrine == 1 and killedBoss == 0) then
		local player = LuaCreatureObject(pMovingObject)
		local objectID = player:getObjectID()
		local activeArea = LuaSceneObject(pActiveArea)
		--player:sendSystemMessage("The Force has senses your presence!")
		writeData("padawanTrialsTwo:spawnBossTwo", 1)

		if readData("padawanTrialsTwo:spawnBossTwo") == 1 then
			--local pBoss = 
			local pBoss = spawnMobile("dantooine", "graul_marauder", 0, 1908, 1.1, -4749, -179, 0)
			createObserver(DEFENDERDROPPED, "padawanTrialsTwo", "DefenderDropped", pBoss)
		end
	else
		--player:sendSystemMessage("The Force blocks your vision....")
		writeData("padawanTrialsTwo:spawnBossTwo", 0)
	end

end

function padawanTrialsTwo:DefenderDropped(pBoss, pPlayer)
		
	local player = LuaCreatureObject(pPlayer)
	local hasShrine = player:hasScreenPlayState(padawanTrialsTwo.states.quest.hasShrine, padawanTrialsTwo.questString)
	local killedBoss = player:hasScreenPlayState(padawanTrialsTwo.states.quest.killedBoss, padawanTrialsTwo.questString)
	local boss = LuaCreatureObject(pBoss)
	if ( boss ~= nil ) then
		local bossHealth = boss:getHAM(0)
		local bossAction = boss:getHAM(3)
		local bossMind = boss:getHAM(6)

		if ( bossHealth <= 0 or bossAction <= 0 or bossMind <= 0 ) then
			local killedBoss = player:setScreenPlayState(padawanTrialsTwo.states.quest.killedBoss, padawanTrialsTwo.questString)
			if (player:hasScreenPlayState(padawanTrialsTwo.states.quest.hasShrine, padawanTrialsTwo.questString)) then
				player:setScreenPlayState(padawanTrialsTwo.states.quest.killedBoss, padawanTrialsTwo.questString)
			end
		end
			
	end
end




















