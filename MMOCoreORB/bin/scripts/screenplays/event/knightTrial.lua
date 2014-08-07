
knightTrial = ScreenPlay:new {
	numberOfActs = 1,
	questString = "knightTrial",
	states = {
		quest = { start = 1, complete = 2}
		
	}, 
}
registerScreenPlay("knightTrial", true)

function knightTrial:start()
	if (isZoneEnabled("tatooine")) then
		self:spawnMobiles()
		self:initializeLootContainers()		
	end
end

function knightTrial:spawnMobiles()				
	local pPadawan = spawnMobile("tatooine", "thiel_follow", 3600, -492.8, 0.0, 3652.1, 129, 0)
        createObserver(OBJECTDESTRUCTION, "knightTrial", "notifyPadawanDead", pPadawan)

end

function knightTrial:notifyPadawanDead(pPadawan, pKiller)
	local player = LuaCreatureObject(pKiller)

     if (readData("knightTrialThiel:thiel") == 0 and player:hasScreenPlayState(knightTrial.states.quest.start, knightTrial.questString)) then
          local pBoss = spawnMobile("tatooine", "thiel", 0, -492.8, 0.0, 3652.1, 129, 0)
          createObserver(DAMAGERECEIVED,"knightTrial","boss_damage", pBoss)
          writeData("knightTrialThiel:thiel",1)
     end
     
     return 0
end

function knightTrial:boss_damage(pBoss, pPlayer)
		
	local player = LuaCreatureObject(pPlayer)

	local hasShrine = player:hasScreenPlayState(knightTrial.states.quest.start, knightTrial.questString)
	local killedBoss = player:hasScreenPlayState(knightTrial.states.quest.complete, knightTrial.questString)
	local boss = LuaCreatureObject(pBoss)
	if ( boss ~= nil ) then
		local bossHealth = boss:getHAM(0)
		local bossAction = boss:getHAM(3)
		local bossMind = boss:getHAM(6)
		local bossMaxHealth = boss:getMaxHAM(0)
		local bossMaxAction = boss:getMaxHAM(3)
		local bossMaxMind = boss:getMaxHAM(6)
		

		if (((bossHealth <= (bossMaxHealth *0.9)) or (bossAction <= (bossMaxAction * 0.9)) or (bossMind <= (bossMaxMind *0.9))) and readData("knightTrial:spawnAdd") == 0) then
			spatialChat(pBoss, "You think you killed my padawan? Think again!!! JOS COME BACK TO ME!")
			writeData("knightTrial:spawnAdd", 1)
			if (readData("knightTrial:spawnAdd") == 1) then
				local pJos = spawnMobile("tatooine", "thiel_follow", 0, -492.8, 0.0, 3652.1, 129, 0)
				local firstTime = LuaCreatureObject(pJos)
				spatialChat(pJos, "I am back to strike down your enemies!")
				firstTime:engageCombat(pPlayer)
			end

		end
		if (((bossHealth <= (bossMaxHealth * 0.5)) or (bossAction <= (bossMaxAction * 0.5)) or (bossMind <= (bossMaxMind * 0.5))) and readData("knightTrial:spawnAddOne") == 0) then
			spatialChat(pBoss,"Jos Ranger... I am summoning you! Show them fear Jos!")
			writeData("knightTrial:spawnAddOne", 1)
			if (readData("knightTrial:spawnAddOne") == 1) then
				local pJosTwo = spawnMobile("tatooine", "thiel_follow", 0, -492.8, 0.0, 3652.1, 129, 0)
				local secondTime = LuaCreatureObject(pJosTwo)
				spatialChat(pJosTwo, "They will fear my power!")
				secondTime:engageCombat(pPlayer)
			end

		end
		if (((bossHealth <= (bossMaxHealth * 0.02)) or (bossAction <= (bossMaxAction * 0.02)) or (bossMind <= (bossMaxMind * 0.02))) and readData("knightTrial:spawnAddTwo") == 0) then
			spatialChat(pBoss, "Jos.... I failed..... I failed... you....!")
			writeData("knightTrial:spawnAddTwo", 1)
		end

		if (bossHealth <= 0 or bossAction <= 0 or bossMind <= 0) then
			local killedBoss = player:setScreenPlayState(knightTrial.states.quest.killedBoss, knightTrial.questString)
			if (player:hasScreenPlayState(knightTrial.states.quest.start, knightTrial.questString)) then
				player:setScreenPlayState(knightTrial.states.quest.complete, knightTrial.questString)
			end
		end
			
	end
end
