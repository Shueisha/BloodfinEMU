/*
 * FactionManager.cpp
 *
 *  Created on: Mar 17, 2011
 *      Author: crush
 */

#include "FactionManager.h"
#include "FactionMap.h"
#include "server/zone/objects/player/PlayerObject.h"
#include "server/zone/managers/templates/TemplateManager.h"

FactionManager::FactionManager() {
	setLoggingName("FactionManager");
	setGlobalLogging(false);
	setLogging(false);
}

void FactionManager::loadData() {
	loadLuaConfig();
	loadFactionRanks();
}

void FactionManager::loadFactionRanks() {
	IffStream* iffStream = TemplateManager::instance()->openIffFile("datatables/faction/rank.iff");

	if (iffStream == NULL) {
		warning("Faction ranks could not be found.");
		return;
	}

	DataTableIff dtiff;
	dtiff.readObject(iffStream);

	factionRanks.readObject(&dtiff);

	delete iffStream;

	info("loaded " + String::valueOf(factionRanks.getCount()) + " ranks", true);
}

void FactionManager::loadLuaConfig() {
	info("Loading config file.", true);

	Lua* lua = new Lua();
	lua->init();

	lua_register(lua->getLuaState(), "addFaction", addFaction);

	//Load the faction manager lua file.
	lua->runFile("scripts/managers/faction_manager.lua");

	delete lua;
	lua = NULL;

}

int FactionManager::addFaction(lua_State* L) {
	String allies = Lua::getStringParameter(L);
	String enemies = Lua::getStringParameter(L);
	String factionName = Lua::getStringParameter(L);

	FactionManager* factionManager = FactionManager::instance();

	FactionMap* factionMap = factionManager->getFactionMap();

	if (factionMap == NULL)
		return 1;

	Faction faction(factionName);
	faction.parseEnemiesFromList(enemies);
	faction.parseAlliesFromList(allies);

	factionMap->addFaction(faction);

	return 0;
}

FactionMap* FactionManager::getFactionMap() {
	return &factionMap;
}

void FactionManager::awardFactionStanding(CreatureObject* player, const String& factionName) {
	if (player == NULL)
		return;

	ManagedReference<PlayerObject*> ghost = player->getPlayerObject();

	if (!factionMap.contains(factionName))
		return;

	float lose = floor((float)75); //TODO: Find the equation for this.
	float gain = floor((float)lose / 2); //you gain half of what you lose

	Faction faction = factionMap.get(factionName);
	SortedVector<String>* enemies = faction.getEnemies();
	SortedVector<String>* allies = faction.getAllies();

	ghost->decreaseFactionStanding(factionName, lose);

	//Lose faction standing to allies of the creature.
	for (int i = 0; i < allies->size(); ++i) {
		String ally = allies->get(i);
		ghost->decreaseFactionStanding(ally, lose);
	}

	//Gain faction standing to enemies of the creature.
	for (int i = 0; i < enemies->size(); ++i) {
		String enemy = enemies->get(i);
		ghost->increaseFactionStanding(enemy, gain);
	}
}

void FactionManager::awardForceRankPoints(TangibleObject* killer, CreatureObject* destructedObject) {
	if (killer->isPlayerCreature() && destructedObject->isPlayerCreature() && destructedObject->hasSkill("force_title_jedi_rank_02")) {
		CreatureObject* killerCreature = cast<CreatureObject*>(killer);
		ManagedReference<PlayerObject*> ghost = killerCreature->getPlayerObject();

		ManagedReference<PlayerObject*> killedGhost = destructedObject->getPlayerObject();
		int rankModD = destructedObject->getSkillMod("force_manipulation_dark");
		int rankModL = destructedObject->getSkillMod("force_manipulation_light");
		int rankXp = killedGhost->getExperience("force_rank_xp");
		int rankMod = 1;

		if (rankModD > rankModL)
			rankMod = (rankModD * .25);
		if (rankModL > rankModD)
			rankMod = (rankModL * .25);
//BOOSTED FOR XP WEEK
			if (killerCreature->hasSkill("force_rank_light_novice")) {
				if (destructedObject->hasSkill("force_rank_dark_novice"))
					ghost->addExperience("force_rank_xp", (rankMod * 2000));
					killedGhost->addExperience("force_rank_xp", (rankMod * -2000), true);





				if (rankModD == 5 && rankXp < 0) {destructedObject->removeSkill("force_rank_dark_novice");}
				if (rankModD == 5 && rankXp < 0) {destructedObject->removeSkill("force_title_jedi_rank_03");}
				if (rankModD == 8 && rankXp <= 0) {destructedObject->removeSkill("force_rank_dark_rank_01");}
				if (rankModD == 12 && rankXp <= 0) {destructedObject->removeSkill("force_rank_dark_rank_02");}
				if (rankModD == 16 && rankXp <= 0) {destructedObject->removeSkill("force_rank_dark_rank_03");}
				if (rankModD == 20 && rankXp <= 0) {destructedObject->removeSkill("force_rank_dark_rank_04");}
				if (rankModD == 25 && rankXp <= 0) {destructedObject->removeSkill("force_rank_dark_rank_05");}
				if (rankModD == 30 && rankXp <= 0) {destructedObject->removeSkill("force_rank_dark_rank_06");}
				if (rankModD == 35 && rankXp <= 0) {destructedObject->removeSkill("force_rank_dark_rank_07");}
				if (rankModD == 45) {destructedObject->removeSkill("force_rank_dark_rank_08");}
				if (rankModD == 55) {destructedObject->removeSkill("force_rank_dark_rank_09");}
				if (rankModD == 65) {destructedObject->removeSkill("force_rank_dark_rank_10");}
				if (rankModD == 80) {destructedObject->removeSkill("force_rank_dark_master");}
				SkillModManager::instance()->verifySkillBoxSkillMods(destructedObject);


			}else {
				if (killerCreature->hasSkill("force_rank_dark_novice"))
					if (destructedObject->hasSkill("force_rank_light_novice"))
						ghost->addExperience("force_rank_xp", (rankMod * 2000));
						killedGhost->addExperience("force_rank_xp", (rankMod * -2000), true);


					if (rankModL == 5 && rankXp < 0) {destructedObject->removeSkill("force_rank_light_novice");}
					if (rankModL == 5 && rankXp < 0) {destructedObject->removeSkill("force_title_jedi_rank_03");}
					if (rankModL == 8 && rankXp <= 0) {destructedObject->removeSkill("force_rank_light_rank_01");}
					if (rankModL == 12 && rankXp <= 0) {destructedObject->removeSkill("force_rank_light_rank_02");}
					if (rankModL == 16 && rankXp <= 0) {destructedObject->removeSkill("force_rank_light_rank_03");}
					if (rankModL == 20 && rankXp <= 0) {destructedObject->removeSkill("force_rank_light_rank_04");}
					if (rankModL == 25 && rankXp <= 0) {destructedObject->removeSkill("force_rank_light_rank_05");}
					if (rankModL == 30 && rankXp <= 0) {destructedObject->removeSkill("force_rank_light_rank_06");}
					if (rankModL == 35 && rankXp <= 0) {destructedObject->removeSkill("force_rank_light_rank_07");}
					if (rankModL == 45) {destructedObject->removeSkill("force_rank_light_rank_08");}
					if (rankModL == 55) {destructedObject->removeSkill("force_rank_light_rank_09");}
					if (rankModL == 65) {destructedObject->removeSkill("force_rank_light_rank_10");}
					if (rankModL == 80) {destructedObject->removeSkill("force_rank_light_master");}
					SkillModManager::instance()->verifySkillBoxSkillMods(destructedObject);
			}



	}
}
void FactionManager::awardPvpFactionPoints(TangibleObject* killer, CreatureObject* destructedObject) {
	if (killer->isPlayerCreature() && destructedObject->isPlayerCreature()) {
		CreatureObject* killerCreature = cast<CreatureObject*>(killer);
		ManagedReference<PlayerObject*> ghost = killerCreature->getPlayerObject();

		ManagedReference<PlayerObject*> killedGhost = destructedObject->getPlayerObject();

		if (killer->isRebel() && destructedObject->isImperial()) {
			ghost->increaseFactionStanding("rebel", 75);
			ghost->decreaseFactionStanding("imperial", 75);

			killedGhost->decreaseFactionStanding("imperial", 75); //TODO: find formulas
		} else if (killer->isImperial() && destructedObject->isRebel()) {
			ghost->increaseFactionStanding("imperial", 75);
			ghost->decreaseFactionStanding("rebel", 75);

			killedGhost->decreaseFactionStanding("rebel", 75);
		}
	}
}

String FactionManager::getRankName(int idx) {
	if (idx >= factionRanks.getCount())
		return "";

	return factionRanks.getRank(idx).getName();
}

int FactionManager::getRankCost(int rank) {
	if (rank >= factionRanks.getCount())
		return -1;

	return factionRanks.getRank(rank).getCost();
}

int FactionManager::getRankDelegateRatioFrom(int rank) {
	if (rank >= factionRanks.getCount())
		return -1;

	return factionRanks.getRank(rank).getDelegateRatioFrom();
}

int FactionManager::getRankDelegateRatioTo(int rank) {
	if (rank >= factionRanks.getCount())
		return -1;

	return factionRanks.getRank(rank).getDelegateRatioTo();
}

int FactionManager::getFactionPointsCap(int rank) {
	if (rank >= factionRanks.getCount())
		return -1;

	return MAX(1000, getRankCost(rank) * 20);
}

bool FactionManager::isFaction(const String& faction) {
	if (factionMap.contains(faction))
		return true;

	return false;
}

bool FactionManager::isEnemy(const String& faction1, const String& faction2) {

	if (!factionMap.contains(faction1) || !factionMap.contains(faction2))
		return false;

	Faction* faction = factionMap.getFaction(faction1);

	return faction->getEnemies()->contains(faction2);
}

bool FactionManager::isAlly(const String& faction1, const String& faction2) {

	if (!factionMap.contains(faction1) || !factionMap.contains(faction2))
		return false;

	Faction* faction = factionMap.getFaction(faction1);

	return faction->getAllies()->contains(faction2);
}
