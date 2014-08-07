YounglingsBloodfinScreenPlay = ScreenPlay:new {
	numberOfActs = 1,

	screenplayName = "YounglingsBloodfinScreenPlay"
}

registerScreenPlay("YounglingsBloodfinScreenPlay",  true)

function YounglingsBloodfinScreenPlay:start()
	if (isZoneEnabled("tatooine")) then
		self:spawnMobiles()
	end
end

function YounglingsBloodfinScreenPlay:spawnMobiles()

	--Creatures
--	spawnMobile("tatooine", "dulios", 2400,math.random(410) + -1808.2, 0,math.random(410) + -4857.7, math.random(360), 0)
--	spawnMobile("lok", "minor_gorax", 2400,math.random(410) + -315.2, 14.2,math.random(10) + -3233.7, math.random(360), 0)
	spawnMobile("tatooine", "eker", 24, -1426.2, 0, -5656.7, -143, 0)
	spawnMobile("tatooine", "akal_colzet", 24, -1424.2, 0, -5657.7, -143, 0)
	spawnMobile("tatooine", "dravis", 24, -1422.2, 0, -5659.7, -112, 0)
	spawnMobile("tatooine", "rebel_recruiter",60,-1439.8,-0.0,-5657.2,-178, 0)

	spawnMobile("tatooine", "imperial_recruiter",60,-1443.2,-0.0,-5657.2,-178, 0)
	spawnMobile("tatooine", "trainer_defender",60,-1440.3,-0.0,-5652.5, -178, 0)
	spawnMobile("tatooine", "trainer_lightsaber",60,-1437.8,-0.0,-5652.5, -178, 0)
	spawnMobile("tatooine", "trainer_enhancer",60,-1435.7,-0.0,-5652.5, -178, 0)
	spawnMobile("tatooine", "trainer_powers",60,-1433.7,-0.0,-5652.5, -178, 0)
	spawnMobile("tatooine", "trainer_healer",60,-1431.6,-0.0,-5652.5, -178, 0)

	spawnMobile("tatooine", "informant_npc_lvl_3",60, -1435.8, 0.0, -5657.2, -178, 0)
--	spawnMobile("tatooine", "imperial_probe_drone", 24,math.random(10) + -1416.5, 0,math.random(10) + -5765.5, math.random(360), 0)
--	spawnMobile("tatooine", "imperial_probe_drone", 24,math.random(10) + -1416.5, 0,math.random(10) + -5765.5, math.random(360), 0)
--	spawnMobile("tatooine", "imperial_probe_drone", 24,math.random(10) + -1416.5, 0,math.random(10) + -5765.5, math.random(360), 0)
--	spawnMobile("tatooine", "imperial_probe_drone", 24,math.random(10) + -1416.5, 0,math.random(10) + -5765.5, math.random(360), 0)
--	spawnMobile("tatooine", "imperial_probe_drone", 24,math.random(10) + -1416.5, 0,math.random(10) + -5765.5, math.random(360), 0)
	spawnSceneObject("tatooine","object/static/space/ship/cargo_freighter.iff", -1475.4, 70.0, -5693.8, 0, 0, 0, 0, 0)
--	spawnSceneObject("tatooine","object/static/space/asteroid/asteroid_molten_small_01.iff", 2000.2, 242.2, 2000.8, 0, 0, 0, 0, 0)	
	spawnSceneObject("tatooine","object/static/particle/particle_distant_ships_dogfight_tb_vs_bw_3.iff", -1366.5, 0.0, -5719.5, 0, 0, 0, 0, 0)
	spawnSceneObject("tatooine","object/static/particle/particle_distant_ships_dogfight_t_vs_x_3.iff", -1458.2, 0.0, -5703.7, 0, 0, 0, 0, 0)
	spawnSceneObject("tatooine","object/static/particle/particle_distant_ships_dogfight_ti_vs_aw_3.iff", -1418.5, 0.0, -5762.5, 0, 0, 0, 0, 0)
	spawnSceneObject("tatooine","object/static/particle/particle_distant_ships_imperial.iff", -1356.5, 0.0, -5712.5, 0, 0, 0, 0, 0)
	spawnSceneObject("tatooine","object/static/particle/particle_distant_ships_imperial.iff", -1361.5, 0.0, -5700.5, 0, 0, 0, 0, 0)	
	spawnSceneObject("tatooine","object/static/particle/particle_distant_ships_rebel.iff", -1351.5, 0.0, -5720.5, 0, 0, 0, 0, 0)	
	spawnSceneObject("naboo","object/static/particle/particle_distant_ships_dogfight_ti_vs_aw_3.iff", -5030.5, -106.9, 6082.5, 0, 0, 0, 0, 0)
	spawnSceneObject("naboo","object/static/particle/particle_distant_ships_imperial.iff", -5031.5, -106.9, 6081.5, 0, 0, 0, 0, 0)	
	spawnSceneObject("naboo","object/static/particle/particle_distant_ships_imperial.iff", -4892.5, 6.9, 4143.5, 0, 0, 0, 0, 0)	
	spawnSceneObject("naboo","object/static/particle/particle_distant_ships_imperial.iff", -4891.5, 6.9, 4142.5, 0, 0, 0, 0, 0)	
	spawnSceneObject("naboo","object/static/particle/particle_distant_ships_imperial.iff", -5058.5, 6.9, 4241.5, 0, 0, 0, 0, 0)	
	spawnSceneObject("naboo","object/static/particle/particle_distant_ships_dogfight_t_vs_x_3.iff", -5113.5, 6.9, 4279.5, 0, 0, 0, 0, 0)	
	spawnSceneObject("naboo","object/static/space/ship/corellian_corvette.iff", -4892.4, 78.0, 4109.8, 0, 0, 0, 0, 0)	
--	spawnSceneObject("tatooine","object/soundobject/soundobject_figrin_dan_band.iff", -0.0, -0.2, -7.9, 0, 0, 0, 0, 281475001573038)
--	spawnSceneObject("tatooine","object/soundobject/soundobject_starport_announcer.iff", 0.0, 1.8, 9.9, 0, 0, 0, 0, 281475001573037)	
	


end
