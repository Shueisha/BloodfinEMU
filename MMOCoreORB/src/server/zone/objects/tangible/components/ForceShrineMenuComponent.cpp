/*
 * ForceShrinenMenuComponent.cpp
 *
 *  Created on: 04/20/2014
 *      Author: Skyyyr Death
 */

#include "ForceShrineMenuComponent.h"

#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/objects/scene/SceneObject.h"
#include "server/zone/objects/player/PlayerObject.h"
#include "server/zone/packets/object/ObjectMenuResponse.h"
#include "server/zone/objects/player/sui/messagebox/SuiMessageBox.h"
#include "server/zone/managers/skill/SkillManager.h"
#include "server/zone/packets/player/PlayMusicMessage.h"
#include "server/zone/managers/creature/CreatureManager.h"
#include "server/chat/ChatManager.h"

#include "server/zone/ZoneServer.h"

void ForceShrineMenuComponent::fillObjectMenuResponse(SceneObject* sceneObject, ObjectMenuResponse* menuResponse, CreatureObject* player){
	TangibleObjectMenuComponent::fillObjectMenuResponse(sceneObject, menuResponse, player);
	ManagedReference<PlayerObject*> ghost = player->getPlayerObject();

	//Testing your connection as a non jedi
	if (!ghost->getJediState() > 0)
		menuResponse->addRadialMenuItem(212, 3, "Test your connection to the Force!");

	//If you have a Jedi state and you are not initiate
	if (ghost->getJediState() > 0 && !player->hasSkill("force_title_jedi_rank_01"))
		menuResponse->addRadialMenuItem(213, 3, "@jedi_trials:meditate");
		SkillModManager::instance()->verifySkillBoxSkillMods(player);

	//If you have at least jedi state 1 and you have initiate TODO:check for padawan so option goes away
	if (ghost->getJediState() > 0 && player->hasSkill("force_title_jedi_rank_01") && !player->hasSkill("force_title_jedi_rank_02")) {
		menuResponse->addRadialMenuItem(216, 3, "Padawan Trials");
		SkillModManager::instance()->verifySkillBoxSkillMods(player);
	}

	//if you have a jedi state greater than 0 OR you have at least FS in your force progression
	if (ghost->getJediState() > 0 || player->hasSkill("force_title_jedi_novice")) {
		menuResponse->addRadialMenuItem(214,3,"Purge me.");
		SkillModManager::instance()->verifySkillBoxSkillMods(player);
	}
}

int ForceShrineMenuComponent::handleObjectMenuSelect(SceneObject* sceneObject, CreatureObject* creature, byte selectedID) {

	//Check for kneeling
	if (creature->getPosture() != CreaturePosture::CROUCHED){
		creature->sendSystemMessage("@jedi_trials:show_respect");
		return 0;
	}

	ManagedReference<PlayerObject*> ghost = creature->getPlayerObject();
	PlayerObject* player;

	if (ghost == NULL)
		return 0;

	int jSkill = 0;
	int fSkill = 0;
	int rSkill = 0;
	int rankSkill = 0;

	//Jedi Skills
	if (creature->hasSkill("force_discipline_light_saber_novice"))
		jSkill += 1;
	if (creature->hasSkill("force_discipline_defender_novice"))
		jSkill += 1;
	if (creature->hasSkill("force_discipline_powers_novice"))
		jSkill += 1;
	if (creature->hasSkill("force_discipline_healing_novice"))
		jSkill += 1;
	if (creature->hasSkill("force_discipline_enhancements_novice"))
		jSkill += 1;
	//Fs Skills
	if (creature->hasSkill("force_sensitive_enhanced_reflexes_novice"))
		fSkill += 1;
	if (creature->hasSkill("force_sensitive_heightened_senses_novice"))
		fSkill += 1;
	if (creature->hasSkill("force_sensitive_crafting_mastery_novice"))
		fSkill += 1;
	if (creature->hasSkill("force_sensitive_combat_prowess_novice"))
		fSkill += 1;
	//Regular skills
	if (creature->hasSkill("combat_brawler_novice"))
		rSkill += 1;
	if (creature->hasSkill("combat_marksman_novice"))
		rSkill += 1;
	if (creature->hasSkill("social_entertainer_novice"))
		rSkill += 1;
	if (creature->hasSkill("crafting_artisan_novice"))
		rSkill += 1;
	if (creature->hasSkill("science_medic_novice"))
		rSkill += 1;
	if (creature->hasSkill("outdoors_scout_novice"))
		rSkill += 1;
	//Rank
	if (creature->hasSkill("force_rank_dark_novice"))
		rankSkill += 1;
	if (creature->hasSkill("force_rank_light_novice"))
		rankSkill += 1;


	if (selectedID == 212) {
		int unlockStatus = 0;
		int profStatus = 0;
		int themeStatus = 0;
		int randProf = 0;
		int unlocked = 0;

		/*
		 //check for gaining initiate if so grant it.
			if (creature->hasSkill("force_title_jedi_novice") && unlockable >= 1){
				ManagedReference<SuiMessageBox*> box = new SuiMessageBox(creature, SuiWindowType::NONE);
				box->setPromptTitle("@jedi_trials:padawan_trials_title");
				box->setPromptText("Congratulations on becoming Initiate, Come back to the shrine when you are ready for the Padawan Trials!");
				ghost->addSuiBox(box);
				creature->sendMessage(box->generateMessage());
				SkillManager::instance()->awardSkill("force_title_jedi_rank_01", creature, true, true, true);
				creature->playEffect("clienteffect/entertainer_dazzle_level_1.cef", "");
				PlayMusicMessage* pmm = new PlayMusicMessage("sound/skill_up.snd");
				creature->sendMessage(pmm);
				creature->setScreenPlayState("unlockable", 1);
			}

		 */
		//Unlock Style 0
		if (creature->getScreenPlayState("unlock0") > 0) {
			//Masteries
			if (ghost->hasBadge(Badge::COMBAT_UNARMED_MASTER) && ghost->hasBadge(Badge::COMBAT_BRAWLER_MASTER) && !ghost->hasBadge(Badge::EXP_DAT_MISTY_FALLS_1))
				profStatus += 1;

			if (ghost->hasBadge(Badge::COMBAT_PISTOL_MASTER) && ghost->hasBadge(Badge::COMBAT_MARKSMAN_MASTER) && !ghost->hasBadge(Badge::EXP_DAT_MISTY_FALLS_2))
				profStatus += 1;

			//IF they did both and have badges, give credit
			if (ghost->hasBadge(Badge::COMBAT_MARKSMAN_MASTER) && ghost->hasBadge(Badge::COMBAT_BRAWLER_MASTER) && ghost->hasBadge(Badge::COMBAT_UNARMED_MASTER) && ghost->hasBadge(Badge::COMBAT_PISTOL_MASTER) && ghost->hasBadge(Badge::EXP_DAT_MISTY_FALLS_1) && ghost->hasBadge(Badge::EXP_DAT_MISTY_FALLS_2))
				profStatus += 1;

			//Themeparks
			if (ghost->hasBadge(Badge::BDG_THM_PARK_JABBA_BADGE) && !ghost->hasBadge(Badge::EXP_DAN_JEDI_TEMPLE))
				themeStatus += 1;

			if (ghost->hasBadge(Badge::BDG_THM_PARK_IMPERIAL_BADGE) && !ghost->hasBadge(Badge::EXP_DAT_ESCAPE_POD))
				themeStatus += 1;

			if (ghost->hasBadge(Badge::BDG_THM_PARK_REBEL_BADGE) && !ghost->hasBadge(Badge::EXP_TAT_KRAYT_GRAVEYARD))
				themeStatus += 1;

			//If they did all 3 and have badges, give them credit.
			if (ghost->hasBadge(Badge::BDG_THM_PARK_IMPERIAL_BADGE) || ghost->hasBadge(Badge::BDG_THM_PARK_JABBA_BADGE) || ghost->hasBadge(Badge::BDG_THM_PARK_REBEL_BADGE))
				if (ghost->hasBadge(Badge::EXP_TAT_KRAYT_GRAVEYARD) && ghost->hasBadge(Badge::EXP_DAT_ESCAPE_POD) && ghost->hasBadge(Badge::EXP_DAN_JEDI_TEMPLE))
					themeStatus += 1;

			//Random Profession required
			if (ghost->hasBadge(Badge::CRAFTING_TAILOR_MASTER))
				randProf += 1;
		}

		//Unlock Style 1
		if (creature->getScreenPlayState("unlock1") > 0) {
			//Masteries
			if (ghost->hasBadge(Badge::COMBAT_1HSWORD_MASTER) && ghost->hasBadge(Badge::COMBAT_BRAWLER_MASTER) && !ghost->hasBadge(Badge::EXP_DAT_SARLACC))
				profStatus += 1;

			if (ghost->hasBadge(Badge::COMBAT_RIFLEMAN_MASTER) && ghost->hasBadge(Badge::COMBAT_MARKSMAN_MASTER) && !ghost->hasBadge(Badge::EXP_TAT_KRAYT_SKELETON))
				profStatus += 1;

			//IF they did both and have badges, give credit
			if (ghost->hasBadge(Badge::COMBAT_MARKSMAN_MASTER) && ghost->hasBadge(Badge::COMBAT_BRAWLER_MASTER) && ghost->hasBadge(Badge::COMBAT_1HSWORD_MASTER) && ghost->hasBadge(Badge::COMBAT_RIFLEMAN_MASTER) && ghost->hasBadge(Badge::EXP_DAT_SARLACC) && ghost->hasBadge(Badge::EXP_TAT_KRAYT_SKELETON))
				profStatus += 1;

			//Themeparks
			if (ghost->hasBadge(Badge::BDG_THM_PARK_JABBA_BADGE) && !ghost->hasBadge(Badge::EXP_DAN_REBEL_BASE))
				themeStatus += 1;

			if (ghost->hasBadge(Badge::BDG_THM_PARK_IMPERIAL_BADGE) && !ghost->hasBadge(Badge::EXP_DAT_ESCAPE_POD))
				themeStatus += 1;

			if (ghost->hasBadge(Badge::BDG_THM_PARK_REBEL_BADGE) && !ghost->hasBadge(Badge::EXP_YAV_TEMPLE_EXAR_KUN))
				themeStatus += 1;

			//If they did all 3 and have badges, give them credit.
			if (ghost->hasBadge(Badge::BDG_THM_PARK_IMPERIAL_BADGE) || ghost->hasBadge(Badge::BDG_THM_PARK_JABBA_BADGE) || ghost->hasBadge(Badge::BDG_THM_PARK_REBEL_BADGE))
				if (ghost->hasBadge(Badge::EXP_DAN_REBEL_BASE) && ghost->hasBadge(Badge::EXP_DAT_ESCAPE_POD) && ghost->hasBadge(Badge::EXP_YAV_TEMPLE_EXAR_KUN))
					themeStatus += 1;

			//Random Profession required
			if (ghost->hasBadge(Badge::CRAFTING_CHEF_MASTER))
				randProf += 1;
		}

		//Unlock Style 2
		if (creature->getScreenPlayState("unlock2") > 0) {
			//Masteries
			if (ghost->hasBadge(Badge::COMBAT_2HSWORD_MASTER) && ghost->hasBadge(Badge::COMBAT_BRAWLER_MASTER) && !ghost->hasBadge(Badge::EXP_DAN_JEDI_TEMPLE))
				profStatus += 1;

			if (ghost->hasBadge(Badge::COMBAT_CARBINE_MASTER) && ghost->hasBadge(Badge::COMBAT_MARKSMAN_MASTER) && !ghost->hasBadge(Badge::EXP_DAT_MISTY_FALLS_2))
				profStatus += 1;

			//IF they did both and have badges, give credit
			if (ghost->hasBadge(Badge::COMBAT_MARKSMAN_MASTER) && ghost->hasBadge(Badge::COMBAT_BRAWLER_MASTER) && ghost->hasBadge(Badge::COMBAT_2HSWORD_MASTER) && ghost->hasBadge(Badge::COMBAT_CARBINE_MASTER) && ghost->hasBadge(Badge::EXP_DAN_JEDI_TEMPLE) && ghost->hasBadge(Badge::EXP_DAT_MISTY_FALLS_2))
				profStatus += 1;

			//Themeparks
			if (ghost->hasBadge(Badge::BDG_THM_PARK_JABBA_BADGE) && !ghost->hasBadge(Badge::EXP_LOK_VOLCANO))
				themeStatus += 1;

			if (ghost->hasBadge(Badge::BDG_THM_PARK_IMPERIAL_BADGE) && !ghost->hasBadge(Badge::EXP_DAT_ESCAPE_POD))
				themeStatus += 1;

			if (ghost->hasBadge(Badge::BDG_THM_PARK_REBEL_BADGE) && !ghost->hasBadge(Badge::EXP_TAT_KRAYT_SKELETON))
				themeStatus += 1;

			//If they did all 3 and have badges, give them credit.
			if (ghost->hasBadge(Badge::BDG_THM_PARK_IMPERIAL_BADGE) || ghost->hasBadge(Badge::BDG_THM_PARK_JABBA_BADGE) || ghost->hasBadge(Badge::BDG_THM_PARK_REBEL_BADGE))
				if (ghost->hasBadge(Badge::EXP_TAT_KRAYT_SKELETON) && ghost->hasBadge(Badge::EXP_DAT_ESCAPE_POD) && ghost->hasBadge(Badge::EXP_LOK_VOLCANO))
					themeStatus += 1;

			//Random Profession required
			if (ghost->hasBadge(Badge::CRAFTING_ARCHITECT_MASTER))
				randProf += 1;
		}

		//Unlock Style 3
		if (creature->getScreenPlayState("unlock3") > 0) {
			//Masteries
			if (ghost->hasBadge(Badge::COMBAT_POLEARM_MASTER) && ghost->hasBadge(Badge::COMBAT_BRAWLER_MASTER) && !ghost->hasBadge(Badge::EXP_DAT_MISTY_FALLS_1))
				profStatus += 1;

			if (ghost->hasBadge(Badge::COMBAT_COMMANDO_MASTER) && ghost->hasBadge(Badge::COMBAT_MARKSMAN_MASTER) && !ghost->hasBadge(Badge::EXP_DAT_MISTY_FALLS_2))
				profStatus += 1;

			//IF they did both and have badges, give credit
			if (ghost->hasBadge(Badge::COMBAT_MARKSMAN_MASTER) && ghost->hasBadge(Badge::COMBAT_BRAWLER_MASTER) && ghost->hasBadge(Badge::COMBAT_POLEARM_MASTER) && ghost->hasBadge(Badge::COMBAT_COMMANDO_MASTER) && ghost->hasBadge(Badge::EXP_DAT_MISTY_FALLS_1) && ghost->hasBadge(Badge::EXP_DAT_MISTY_FALLS_2))
				profStatus += 1;

			//Themeparks
			if (ghost->hasBadge(Badge::BDG_THM_PARK_JABBA_BADGE) && !ghost->hasBadge(Badge::EXP_DAN_JEDI_TEMPLE))
				themeStatus += 1;

			if (ghost->hasBadge(Badge::BDG_THM_PARK_IMPERIAL_BADGE) && !ghost->hasBadge(Badge::EXP_DAT_ESCAPE_POD))
				themeStatus += 1;

			if (ghost->hasBadge(Badge::BDG_THM_PARK_REBEL_BADGE) && !ghost->hasBadge(Badge::EXP_TAT_KRAYT_GRAVEYARD))
				themeStatus += 1;

			//If they did all 3 and have badges, give them credit.
			if (ghost->hasBadge(Badge::BDG_THM_PARK_IMPERIAL_BADGE) || ghost->hasBadge(Badge::BDG_THM_PARK_JABBA_BADGE) || ghost->hasBadge(Badge::BDG_THM_PARK_REBEL_BADGE))
				if (ghost->hasBadge(Badge::EXP_TAT_KRAYT_GRAVEYARD) && ghost->hasBadge(Badge::EXP_DAT_ESCAPE_POD) && ghost->hasBadge(Badge::EXP_DAN_JEDI_TEMPLE))
					themeStatus += 1;

			//Random Profession required
			if (ghost->hasBadge(Badge::OUTDOORS_RANGER_MASTER))
				randProf += 1;
		}

		//Unlock Style 4
		if (creature->getScreenPlayState("unlock4") > 0) {
			//Masteries
			if (ghost->hasBadge(Badge::SCIENCE_DOCTOR_MASTER) && ghost->hasBadge(Badge::SCIENCE_MEDIC_MASTER) && !ghost->hasBadge(Badge::BDG_EXP_30_BADGES))
				profStatus += 1;

			if (ghost->hasBadge(Badge::SOCIAL_DANCER_MASTER) && ghost->hasBadge(Badge::SOCIAL_ENTERTAINER_MASTER) && !ghost->hasBadge(Badge::BDG_EXP_NAB_THEED_FALLS_BOTTOM))
				profStatus += 1;

			//IF they did both and have badges, give credit
			if (ghost->hasBadge(Badge::SCIENCE_DOCTOR_MASTER) && ghost->hasBadge(Badge::SCIENCE_MEDIC_MASTER) && ghost->hasBadge(Badge::SOCIAL_DANCER_MASTER) && ghost->hasBadge(Badge::SOCIAL_ENTERTAINER_MASTER) && ghost->hasBadge(Badge::BDG_EXP_30_BADGES) && ghost->hasBadge(Badge::BDG_EXP_NAB_THEED_FALLS_BOTTOM))
				profStatus += 1;

			//Themeparks
			if (ghost->hasBadge(Badge::BDG_THM_PARK_JABBA_BADGE) && !ghost->hasBadge(Badge::EXP_DAN_JEDI_TEMPLE))
				themeStatus += 1;

			if (ghost->hasBadge(Badge::BDG_THM_PARK_IMPERIAL_BADGE) && !ghost->hasBadge(Badge::EXP_TAT_ESCAPE_POD))
				themeStatus += 1;

			if (ghost->hasBadge(Badge::BDG_THM_PARK_REBEL_BADGE) && !ghost->hasBadge(Badge::EXP_TAT_KRAYT_GRAVEYARD))
				themeStatus += 1;

			//If they did all 3 and have badges, give them credit.
			if (ghost->hasBadge(Badge::BDG_THM_PARK_IMPERIAL_BADGE) || ghost->hasBadge(Badge::BDG_THM_PARK_JABBA_BADGE) || ghost->hasBadge(Badge::BDG_THM_PARK_REBEL_BADGE))
				if (ghost->hasBadge(Badge::EXP_TAT_KRAYT_GRAVEYARD) && ghost->hasBadge(Badge::EXP_TAT_ESCAPE_POD) && ghost->hasBadge(Badge::EXP_DAN_JEDI_TEMPLE))
					themeStatus += 1;

			//Random Profession required
			if (ghost->hasBadge(Badge::COMBAT_UNARMED_MASTER))
				randProf += 1;
		}

		//Unlock Style X
		if (!creature->getScreenPlayState("unlock0") > 0 && !creature->getScreenPlayState("unlock1") > 0 && !creature->getScreenPlayState("unlock2") > 0 && !creature->getScreenPlayState("unlock3") > 0 && !creature->getScreenPlayState("unlock4") > 0) {
			//Masteries
			if (ghost->hasBadge(Badge::CRAFTING_MERCHANT_MASTER) && ghost->hasBadge(Badge::CRAFTING_ARTISAN_MASTER) && !ghost->hasBadge(Badge::BDG_EXP_30_BADGES))
				profStatus += 1;

			if (ghost->hasBadge(Badge::SOCIAL_MUSICIAN_MASTER) && ghost->hasBadge(Badge::SOCIAL_ENTERTAINER_MASTER) && !ghost->hasBadge(Badge::BDG_EXP_NAB_THEED_FALLS_BOTTOM))
				profStatus += 1;

			//IF they did both and have badges, give credit
			if (ghost->hasBadge(Badge::SCIENCE_DOCTOR_MASTER) && ghost->hasBadge(Badge::SCIENCE_MEDIC_MASTER) && ghost->hasBadge(Badge::SOCIAL_DANCER_MASTER) && ghost->hasBadge(Badge::SOCIAL_ENTERTAINER_MASTER) && ghost->hasBadge(Badge::BDG_EXP_30_BADGES) && ghost->hasBadge(Badge::BDG_EXP_NAB_THEED_FALLS_BOTTOM))
				profStatus += 1;

			//Themeparks
			if (ghost->hasBadge(Badge::BDG_THM_PARK_JABBA_BADGE) && !ghost->hasBadge(Badge::EXP_DAN_JEDI_TEMPLE))
				themeStatus += 1;

			if (ghost->hasBadge(Badge::BDG_THM_PARK_IMPERIAL_BADGE) && !ghost->hasBadge(Badge::EXP_TAT_ESCAPE_POD))
				themeStatus += 1;

			if (ghost->hasBadge(Badge::BDG_THM_PARK_REBEL_BADGE) && !ghost->hasBadge(Badge::EXP_TAT_KRAYT_GRAVEYARD))
				themeStatus += 1;

			//If they did all 3 and have badges, give them credit.
			if (ghost->hasBadge(Badge::BDG_THM_PARK_IMPERIAL_BADGE) || ghost->hasBadge(Badge::BDG_THM_PARK_JABBA_BADGE) || ghost->hasBadge(Badge::BDG_THM_PARK_REBEL_BADGE))
				if (ghost->hasBadge(Badge::EXP_TAT_KRAYT_GRAVEYARD) && ghost->hasBadge(Badge::EXP_TAT_ESCAPE_POD) && ghost->hasBadge(Badge::EXP_DAN_JEDI_TEMPLE))
					themeStatus += 1;

			//Random Profession required
			if (ghost->hasBadge(Badge::COMBAT_BOUNTYHUNTER_MASTER))
				randProf += 1;
		}




		//Status Updating

		//Dont want to offer to many points.
		if (profStatus > 1)
			profStatus = 1;
		if (themeStatus > 1)
			themeStatus = 1;

		if (profStatus == 1)
			unlockStatus += 1;

		if (themeStatus == 1)
			unlockStatus += 1;

		if (randProf == 1)
			unlockStatus += 1;


		if (unlockStatus == 0) {
			ManagedReference<SuiMessageBox*> box = new SuiMessageBox(creature, SuiWindowType::NONE);
			box->setPromptTitle("...............");
			box->setPromptText("As you reach out to the Force, you realize that it yearns for something from yourself. As you wonder what it actually is..."
					"You feel a strange urge to learn more, and become more involved with your surroundings.");
			ghost->addSuiBox(box);
			creature->sendMessage(box->generateMessage());
		}

		if (unlockStatus == 1) {
			ManagedReference<SuiMessageBox*> box = new SuiMessageBox(creature, SuiWindowType::NONE);
			box->setPromptTitle("....................");
			box->setPromptText("As you reach out to the Force, you feel a the Force in the faint distance...");
			ghost->addSuiBox(box);
			creature->sendMessage(box->generateMessage());
		}

		if (unlockStatus == 2) {
			ManagedReference<SuiMessageBox*> box = new SuiMessageBox(creature, SuiWindowType::NONE);
			box->setPromptTitle("....................");
			box->setPromptText("As you reach out to the Force, you feel your connection with it begin to become stronger.");
			ghost->addSuiBox(box);
			creature->sendMessage(box->generateMessage());
		}

		if (unlockStatus == 3) {
			ManagedReference<SuiMessageBox*> box = new SuiMessageBox(creature, SuiWindowType::NONE);
			box->setPromptTitle("Connected to the Force.");
			box->setPromptText("As you are about to attempt to reach out to the Force you feel a strong sense of the Force feed into your body, you feel the Force flowing through you."
					"Meditate at the shrine to continue on your journey.");
			ghost->addSuiBox(box);
			creature->sendMessage(box->generateMessage());
			PlayMusicMessage* pmm = new PlayMusicMessage("sound/intro.snd");
			creature->sendMessage(pmm);
			ghost->setJediState(1);
			SkillManager::instance()->awardSkill("force_title_jedi_rank_02", creature, true, true, true);

		}

	}//END 212



	if (selectedID == 214) {
		if (rankSkill > 0 || ghost->getJediState() >= 0)
			creature->sendSystemMessage("The Force has renewed you.");
				//Dark Ranks
				if (creature->hasSkill("force_rank_dark_novice"))
					creature->removeSkill("force_rank_dark_novice");
					SkillModManager::instance()->verifySkillBoxSkillMods(creature);
				if (creature->hasSkill("force_rank_dark_rank_01"))
					creature->removeSkill("force_rank_dark_rank_01");
					SkillModManager::instance()->verifySkillBoxSkillMods(creature);
				if (creature->hasSkill("force_rank_dark_rank_02"))
					creature->removeSkill("force_rank_dark_rank_02");
					SkillModManager::instance()->verifySkillBoxSkillMods(creature);
				if (creature->hasSkill("force_rank_dark_rank_03"))
					creature->removeSkill("force_rank_dark_rank_03");
					SkillModManager::instance()->verifySkillBoxSkillMods(creature);
				if (creature->hasSkill("force_rank_dark_rank_04"))
					creature->removeSkill("force_rank_dark_rank_04");
					SkillModManager::instance()->verifySkillBoxSkillMods(creature);
				if (creature->hasSkill("force_rank_dark_rank_05"))
					creature->removeSkill("force_rank_dark_rank_05");
					SkillModManager::instance()->verifySkillBoxSkillMods(creature);
				if (creature->hasSkill("force_rank_dark_rank_06"))
					creature->removeSkill("force_rank_dark_rank_06");
					SkillModManager::instance()->verifySkillBoxSkillMods(creature);
				if (creature->hasSkill("force_rank_dark_rank_07"))
					creature->removeSkill("force_rank_dark_rank_07");
					SkillModManager::instance()->verifySkillBoxSkillMods(creature);
				if (creature->hasSkill("force_rank_dark_rank_08"))
					creature->removeSkill("force_rank_dark_rank_08");
					SkillModManager::instance()->verifySkillBoxSkillMods(creature);
				if (creature->hasSkill("force_rank_dark_rank_09"))
					creature->removeSkill("force_rank_dark_rank_09");
					SkillModManager::instance()->verifySkillBoxSkillMods(creature);
				if (creature->hasSkill("force_rank_dark_rank_10"))
					creature->removeSkill("force_rank_dark_rank_10");
					SkillModManager::instance()->verifySkillBoxSkillMods(creature);
				if (creature->hasSkill("force_rank_dark_master"))
					creature->removeSkill("force_rank_dark_master");
					SkillModManager::instance()->verifySkillBoxSkillMods(creature);
				//Light Ranks
				if (creature->hasSkill("force_rank_light_novice"))
					creature->removeSkill("force_rank_light_novice");
					SkillModManager::instance()->verifySkillBoxSkillMods(creature);
				if (creature->hasSkill("force_rank_light_rank_01"))
					creature->removeSkill("force_rank_light_rank_01");
					SkillModManager::instance()->verifySkillBoxSkillMods(creature);
				if (creature->hasSkill("force_rank_light_rank_02"))
					creature->removeSkill("force_rank_light_rank_02");
					SkillModManager::instance()->verifySkillBoxSkillMods(creature);
				if (creature->hasSkill("force_rank_light_rank_03"))
					creature->removeSkill("force_rank_light_rank_03");
					SkillModManager::instance()->verifySkillBoxSkillMods(creature);
				if (creature->hasSkill("force_rank_light_rank_04"))
					creature->removeSkill("force_rank_light_rank_04");
					SkillModManager::instance()->verifySkillBoxSkillMods(creature);
				if (creature->hasSkill("force_rank_light_rank_05"))
					creature->removeSkill("force_rank_light_rank_05");
					SkillModManager::instance()->verifySkillBoxSkillMods(creature);
				if (creature->hasSkill("force_rank_light_rank_06"))
					creature->removeSkill("force_rank_light_rank_06");
					SkillModManager::instance()->verifySkillBoxSkillMods(creature);
				if (creature->hasSkill("force_rank_light_rank_07"))
					creature->removeSkill("force_rank_light_rank_07");
					SkillModManager::instance()->verifySkillBoxSkillMods(creature);
				if (creature->hasSkill("force_rank_light_rank_08"))
					creature->removeSkill("force_rank_light_rank_08");
					SkillModManager::instance()->verifySkillBoxSkillMods(creature);
				if (creature->hasSkill("force_rank_light_rank_09"))
					creature->removeSkill("force_rank_light_rank_09");
					SkillModManager::instance()->verifySkillBoxSkillMods(creature);
				if (creature->hasSkill("force_rank_light_rank_10"))
					creature->removeSkill("force_rank_light_rank_10");
					SkillModManager::instance()->verifySkillBoxSkillMods(creature);
				if (creature->hasSkill("force_rank_light_master"))
					creature->removeSkill("force_rank_light_master");
					SkillModManager::instance()->verifySkillBoxSkillMods(creature);
				ghost->setJediState(2);
				ghost->setFactionStatus(0);
				SkillModManager::instance()->verifySkillBoxSkillMods(creature);


	}

	//this is for NON JEDI
	if (selectedID == 213) {
		//Force Knowledge
		int rand = System::random(14) + 1;
		StringBuffer sysmsg;
		sysmsg << "@jedi_trials:force_shrine_wisdom_" << rand;
		creature->sendSystemMessage(sysmsg.toString());
		creature->sendSystemMessage("To progress to Initiate you must do 4 of the following: Master Force Sensitive skills (each master counts as one), themepark badges (each one counts as one), and the 45 explorer badge.");

		//For those trying to unlock
		int fsbox = 0;
		int unlockable = 0;//TESTING

		if (creature->hasSkill("force_sensitive_enhanced_reflexes_master"))
			fsbox += 1;
		if (creature->hasSkill("force_sensitive_heightened_senses_master"))
			fsbox += 1;
		if (creature->hasSkill("force_sensitive_crafting_mastery_master"))
			fsbox += 1;
		if (creature->hasSkill("force_sensitive_combat_prowess_master"))
			fsbox += 1;
		if (ghost->hasBadge(Badge::BDG_THM_PARK_IMPERIAL_BADGE))
			fsbox += 1;
		if (ghost->hasBadge(Badge::BDG_THM_PARK_JABBA_BADGE))
			fsbox += 1;
		if (ghost->hasBadge(Badge::BDG_THM_PARK_REBEL_BADGE))
			fsbox += 1;
		if (ghost->hasBadge(Badge::BDG_EXP_45_BADGES))
			fsbox += 1;

		if (fsbox >= 4)
			unlockable += 1;

		if (unlockable == 0){
			return 0;
		}

			//check for gaining initiate if so grant it.
			if (unlockable >= 1) {//creature->hasSkill("force_title_jedi_novice") && unlockable >= 1){
				ManagedReference<SuiMessageBox*> box = new SuiMessageBox(creature, SuiWindowType::NONE);
				box->setPromptTitle("@jedi_trials:padawan_trials_title");
				box->setPromptText("Congratulations on becoming Initiate, Come back to the shrine when you are ready for the Padawan Trials!");
				ghost->addSuiBox(box);
				creature->sendMessage(box->generateMessage());
				SkillManager::instance()->awardSkill("force_title_jedi_rank_01", creature, true, true, true);
				creature->playEffect("clienteffect/entertainer_dazzle_level_1.cef", "");
				PlayMusicMessage* pmm = new PlayMusicMessage("sound/skill_up.snd");
				creature->sendMessage(pmm);
				creature->setScreenPlayState("unlockable", 1);
			}
	}

	if (selectedID == 216) {


		//Trial One
		if (creature->getScreenPlayState("unlockable") >= 1 && creature->getScreenPlayState("padawanTrialsOne") <= 1 && !creature->getScreenPlayState("padawanTrialsThree") >= 1 && !creature->getScreenPlayState("padawanTrialsFour") >= 1 && !creature->getScreenPlayState("padawanTrialsTwo") >= 1) {
			ManagedReference<SuiMessageBox*> box = new SuiMessageBox(creature, SuiWindowType::NONE);
			box->setPromptTitle("Jedi Padawan Trials");
			box->setPromptText("@jedi_trials:kiin_dray");
			ghost->addSuiBox(box);
			creature->sendMessage(box->generateMessage());
			creature->setScreenPlayState("padawanTrialsOne", 1);
		}
		//Trial Two
		if (creature->getScreenPlayState("padawanTrialsTwo") <= 1 && creature->getScreenPlayState("padawanTrialsOne") >= 2 && !creature->getScreenPlayState("padawanTrialsThree") >= 1 && !creature->getScreenPlayState("padawanTrialsFour") >= 1) {
			ManagedReference<SuiMessageBox*> box = new SuiMessageBox(creature, SuiWindowType::NONE);
			box->setPromptTitle("Jedi Padawan Trials");
			box->setPromptText("Go to Dantooine and find the trouble-some grauler located near 1900 -4700. Meditating at any shrine will repeat this message.");
			ghost->addSuiBox(box);
			creature->sendMessage(box->generateMessage());
			creature->setScreenPlayState("padawanTrialsTwo", 1);
		}
		//Trial Three
		if (creature->getScreenPlayState("padawanTrialsThree") <= 1 && creature->getScreenPlayState("padawanTrialsOne") >= 2 && creature->getScreenPlayState("padawanTrialsTwo") >= 2 && !creature->getScreenPlayState("padawanTrialsFour") >= 1) {
			ManagedReference<SuiMessageBox*> box = new SuiMessageBox(creature, SuiWindowType::NONE);
			box->setPromptTitle("Jedi Padawan Trials");
			box->setPromptText("Go to Lok and find the enraged Kimogila near 4560 -1170 and defeat him, meditating at any shrine will repeat this message.");
			ghost->addSuiBox(box);
			creature->sendMessage(box->generateMessage());
			creature->setScreenPlayState("padawanTrialsThree", 1);
		}
		//Trial Four
		if (creature->getScreenPlayState("padawanTrialsFour") <= 1 && creature->getScreenPlayState("padawanTrialsOne") >= 2 && creature->getScreenPlayState("padawanTrialsTwo") >= 2 && creature->getScreenPlayState("padawanTrialsThree") >= 2 ) {
			ManagedReference<SuiMessageBox*> box = new SuiMessageBox(creature, SuiWindowType::NONE);
			box->setPromptTitle("Jedi Padawan Trials");
			box->setPromptText("Go to Dathomir and find the ancient bull Rancor around 7150 3220 and defeat him, meditating at any shrine will repeat this message.");
			ghost->addSuiBox(box);
			creature->sendMessage(box->generateMessage());
			creature->setScreenPlayState("padawanTrialsFour", 1);
		}
		//Completed all trials and NOT a padawan YET, so give it to them.
		//CHANGED SCREENPLAYSTATE FOR TESTING
		if (!creature->hasSkill("force_title_jedi_rank_02") && creature->getScreenPlayState("padawanTrialsFour") >= 2) {
			ManagedReference<SuiMessageBox*> box = new SuiMessageBox(creature, SuiWindowType::NONE);
			box->setPromptTitle("Jedi Padawan Trials");
			box->setPromptText("@jedi_trials:padawan_trials_completed");
			ghost->addSuiBox(box);
			ghost->setJediState(2);
			creature->sendMessage(box->generateMessage());
			SkillManager::instance()->awardSkill("force_title_jedi_rank_02", creature, true, true, true);
			creature->playEffect("clienteffect/entertainer_dazzle_level_3.cef", "");
			PlayMusicMessage* pmm = new PlayMusicMessage("sound/intro.snd");
			creature->sendMessage(pmm);
			ManagedReference<SceneObject*> inventory = creature->getSlottedObject("inventory");

				//Check if inventory is full.
			if (inventory->hasFullContainerObjects()) {
				creature->sendSystemMessage("@jedi_spam:inventory_full_jedi_robe"); //	You have too many items in your inventory. In order to get your Padawan Robe you must clear out at least one free slot.
				return 0;
			}

				ZoneServer* zserv = creature->getZoneServer();

				String PadawanRobe = "object/tangible/wearables/robe/robe_jedi_padawan.iff";
				ManagedReference<SceneObject*> padawanRobe = zserv->createObject(PadawanRobe.hashCode(), 1);
				padawanRobe->sendTo(creature, true);
				inventory->transferObject(padawanRobe, -1);
		}

	}
	return 0;
}





































































/*
	int jSkill = 0;

	if (creature->hasSkill("force_discipline_light_saber_master"))
		jSkill += 1;
	if (creature->hasSkill("force_discipline_light_saber_novice"))
		jSkill += 1;
	if (creature->hasSkill("force_discipline_healing_novice"))
		jSkill += 1;
	if (creature->hasSkill("force_discipline_healing_master"))
		jSkill += 1;
	if (creature->hasSkill("force_discipline_defender_novice"))
		jSkill += 1;
	if (creature->hasSkill("force_discipline_defender_master"))
		jSkill += 1;
	if (creature->hasSkill("force_discipline_powers_novice"))
		jSkill += 1;
	if (creature->hasSkill("force_discipline_powers_master"))
		jSkill += 1;
	if (creature->hasSkill("force_discipline_enhancements_novice"))
		jSkill += 1;
	if (creature->hasSkill("force_discipline_enhancements_master"))
		jSkill += 1;
	*/
/*
	else if (!creature->hasSkill("force_title_jedi_novice")){

		int rand = System::random(14) + 1;

		StringBuffer sysmsg;

		sysmsg << "@jedi_trials:force_shrine_wisdom_" << rand;
		creature->sendSystemMessage(sysmsg.toString());

	}

	else if (creature->hasSkill("force_title_jedi_rank_02")){

		ManagedReference<SceneObject*> inventory = creature->getSlottedObject("inventory");

		//Check if inventory is full.
		if (inventory->hasFullContainerObjects()) {
			creature->sendSystemMessage("@jedi_spam:inventory_full_jedi_robe"); //	You have too many items in your inventory. In order to get your Padawan Robe you must clear out at least one free slot.
			return 0;
		}

		ZoneServer* zserv = creature->getZoneServer();
		creature->sendSystemMessage("A replacement robe has been placed in your bag, relog.");
		String PadawanRobe = "object/tangible/wearables/robe/robe_jedi_padawan.iff";
		ManagedReference<SceneObject*> padawanRobe = zserv->createObject(PadawanRobe.hashCode(), 1);
		padawanRobe->sendTo(creature, true);
		inventory->transferObject(padawanRobe, -1);

	}

	if (selectedID == 216) {
			int xp = ghost->getExperience("jedi_general");
			int fsbox = 0;
			int unlockable = 0;

			if (creature->hasSkill("force_sensitive_enhanced_reflexes_master"))
				fsbox += 1;
			if (creature->hasSkill("force_sensitive_heightened_senses_master"))
				fsbox += 1;
			if (creature->hasSkill("force_sensitive_crafting_mastery_master"))
				fsbox += 1;
			if (creature->hasSkill("force_sensitive_combat_prowess_master"))
				fsbox += 1;
			int melquest = 0;
			if (creature->getScreenPlayState("MyScreenplay") >= 30) {
				melquest += 1;
			}

			if (xp >= 90000 && fsbox >= 3 && (creature->getScreenPlayState("samplequest") >= 25))
				unlockable = 1;

			if (unlockable == 0){
				return 0;
			}

			if (creature->hasSkill("force_title_jedi_rank_01") && unlockable >= 1){
				ManagedReference<SuiMessageBox*> box = new SuiMessageBox(creature, SuiWindowType::NONE);
				box->setPromptTitle("@jedi_trials:padawan_trials_title"); // Jedi Trials
				box->setPromptText("@jedi_trials:padawan_trials_completed");

				ghost->addSuiBox(box);
				creature->sendMessage(box->generateMessage());
				SkillManager::instance()->awardSkill("force_title_jedi_rank_02", creature, true, true, true);
				creature->playEffect("clienteffect/entertainer_dazzle_level_3.cef", ""); // Not sure if it's the right one for this.

				PlayMusicMessage* pmm = new PlayMusicMessage("sound/intro.snd");
				creature->sendMessage(pmm);

				ghost->setJediState(2);

					// Trainer number. Pick a random trainer, there are at least 600 in the galaxy.

				ZoneServer* zoneServer = ghost->getZoneServer();
				int randomZone = System::random(zoneServer->getZoneCount() - 1);

				ManagedReference<Zone*> zone = zoneServer->getZone(randomZone);
				Vector3 randomTrainer = zone->getCreatureManager()->getRandomJediTrainer();

				if ((randomTrainer.getX() == 0) && (randomTrainer.getY() == 0)) { // No trainers on the zone.
					ManagedReference<Zone*> zone = zoneServer->getZone(0);
					Vector3 randomTrainer = zone->getCreatureManager()->getRandomJediTrainer();
				}

				Vector3 trainerPositionFinal(randomTrainer.getX(), randomTrainer.getY(), 0);

				String zoneName = zone->getZoneName();

				ghost->setTrainerCoordinates(trainerPositionFinal);
				ghost->setTrainerZoneName(zoneName); // For the Waypoint.


				ManagedReference<SceneObject*> inventory = creature->getSlottedObject("inventory");

					//Check if inventory is full.
				if (inventory->hasFullContainerObjects()) {
					creature->sendSystemMessage("@jedi_spam:inventory_full_jedi_robe"); //	You have too many items in your inventory. In order to get your Padawan Robe you must clear out at least one free slot.
					return 0;
				}

					ZoneServer* zserv = creature->getZoneServer();

					String PadawanRobe = "object/tangible/wearables/robe/robe_jedi_padawan.iff";
					ManagedReference<SceneObject*> padawanRobe = zserv->createObject(PadawanRobe.hashCode(), 1);
					padawanRobe->sendTo(creature, true);
					inventory->transferObject(padawanRobe, -1);
			}
	}
	if (selectedID == 214) {

		int jediSkill = 0;

		if (creature->hasSkill("force_discipline_powers_master"))
			jediSkill += 1;
		if (creature->hasSkill("force_discipline_light_saber_master"))
			jediSkill += 1;
		if (creature->hasSkill("force_discipline_healing_master"))
			jediSkill += 1;
		if (creature->hasSkill("force_discipline_defender_master"))
			jediSkill += 1;
		if (creature->hasSkill("force_discipline_enhancements_master"))
			jediSkill += 1;

		if (jediSkill == 0){
			return 0;
		}

		int knightComplete = 0;
		int brawler = 1;

		if (creature->getScreenPlayState("knightOne") >= 30)
			knightComplete += 1;

		if (!creature->hasSkill("combat_brawler_novice"))
			knightComplete += 1;

		ManagedReference<SceneObject*> inventory = creature->getSlottedObject("inventory");
				//Check if inventory is full.
		if (inventory->hasFullContainerObjects()) {
			creature->sendSystemMessage("@jedi_spam:inventory_full_jedi_robe"); //	You have too many items in your inventory. In order to get your Padawan Robe you must clear out at least one free slot.
			return 0;
		}

		ZoneServer* zserv = creature->getZoneServer();
		PlayerObject* jedi = creature->getPlayerObject();

		if (!creature->isRebel())
			creature->sendSystemMessage("You are not fit for the Light Order");
		else if (creature->isRebel() && knightComplete == 0 && brawler == 1)
				(creature->setScreenPlayState("knightOne", 1));
				(creature->setScreenPlayState("knightTwo", 1));
				ManagedReference<SuiMessageBox*> box4 = new SuiMessageBox(creature, SuiWindowType::NONE);
					box4->setPromptTitle("@jedi_trials:knight_trials_title"); // Jedi Trials
					box4->setPromptText("Greetings young Jedi, you have proven yourself in both combat and survival, The newly found Light Jedi Council is interested in recruiting you, But first you must pass the trials of the ancient Order. Seek out Dretos on Lok to begin your Journey.");
					ghost->addSuiBox(box4);
					creature->sendMessage(box4->generateMessage());
			//return 0;
			if (creature->isRebel() && knightComplete == 1)
			{
				if (creature->hasSkill("force_title_jedi_rank_02") && jediSkill >= 1)
					SkillManager::instance()->awardSkill("force_title_jedi_rank_03", creature, true, true, true);
					SkillManager::instance()->awardSkill("force_rank_light_novice", creature, true, true, true);
					String KnightRobe = "object/tangible/wearables/robe/robe_jedi_light_s01.iff";
					ManagedReference<SceneObject*> knightRobe = zserv->createObject(KnightRobe.hashCode(), 1);
					knightRobe->sendTo(creature, true);
					inventory->transferObject(knightRobe, -1);
					creature->playEffect("clienteffect/entertainer_dazzle_level_2.cef", ""); // Not sure if it's the right one for this.
					ghost->setJediState(4);
					jedi->setFactionStatus(2); */
					//box2->setPromptTitle("@jedi_trials:knight_trials_title"); // Jedi Trials
					//box2->setPromptText("@jedi_trials:knight_trials_completed");


		//}
	//}

/*
	if (selectedID == 215) {

			int jediSkill = 0;

			if (creature->hasSkill("force_discipline_powers_master"))
				jediSkill += 1;
			if (creature->hasSkill("force_discipline_light_saber_master"))
				jediSkill += 1;
			if (creature->hasSkill("force_discipline_healing_master"))
				jediSkill += 1;
			if (creature->hasSkill("force_discipline_defender_master"))
				jediSkill += 1;
			if (creature->hasSkill("force_discipline_enhancements_master"))
				jediSkill += 1;

			if (jediSkill == 0){
				return 0;
			}

			int knightComplete = 0;

			int brawler = 0;

			if (creature->getScreenPlayState("knightOne") >= 30)
				knightComplete += 1;

			if (!creature->hasSkill("combat_brawler_novice"))
				brawler += 1;

			ManagedReference<SceneObject*> inventory = creature->getSlottedObject("inventory");
			PlayerObject* jedi = creature->getPlayerObject();
					//Check if inventory is full.
			if (inventory->hasFullContainerObjects()) {
				creature->sendSystemMessage("@jedi_spam:inventory_full_jedi_robe"); //	You have too many items in your inventory. In order to get your Padawan Robe you must clear out at least one free slot.
				return 0;
			}

			ZoneServer* zserv = creature->getZoneServer();
		if (!creature->isImperial())
					creature->sendSystemMessage("You are not fit for the Dark Order");
		else if (creature->isImperial() && knightComplete == 0 && brawler == 1)
						(creature->setScreenPlayState("knightOne", 1));
						(creature->setScreenPlayState("knightTwo", 1));
						ManagedReference<SuiMessageBox*> box = new SuiMessageBox(creature, SuiWindowType::NONE);
							box->setPromptTitle("@jedi_trials:knight_trials_title"); // Jedi Trials
							box->setPromptText("Greetings young Jedi, you have proven yourself in both combat and survival, The newly found Dark Jedi Council is interested in you, But first you most prove yourself loyal, Although you are weak we admire your passion.. Prove yourself, Seek out Dretos on Lok to begin your Journey.");
							ghost->addSuiBox(box);
							creature->sendMessage(box->generateMessage());
			if (creature->isImperial() && knightComplete == 1)
			{

				if (creature->hasSkill("force_title_jedi_rank_02") && jediSkill >= 1)
				SkillManager::instance()->awardSkill("force_title_jedi_rank_03", creature, true, true, true);
				SkillManager::instance()->awardSkill("force_rank_dark_novice", creature, true, true, true);
				String KnightdarkRobe = "object/tangible/wearables/robe/robe_jedi_dark_s01.iff";
				ManagedReference<SceneObject*> knightdarkRobe = zserv->createObject(KnightdarkRobe.hashCode(), 1);
				knightdarkRobe->sendTo(creature, true);
				inventory->transferObject(knightdarkRobe, -1);
				creature->playEffect("clienteffect/entertainer_dazzle_level_2.cef", ""); // Not sure if it's the right one for this.
				ghost->setJediState(8);
				jedi->setFactionStatus(2);

		//}
	}

	if (selectedID == 230) {
				ZoneServer* zserv = creature->getZoneServer();
				PlayerObject* jedi = creature->getPlayerObject();
						ManagedReference<SceneObject*> inventory = creature->getSlottedObject("inventory");
						SkillManager::instance()->awardSkill("force_title_jedi_rank_03", creature, true, true, true);
						SkillManager::instance()->awardSkill("force_rank_light_novice", creature, true, true, true);
						ManagedReference<SuiMessageBox*> box2 = new SuiMessageBox(creature, SuiWindowType::NONE);
						String KnightRobe = "object/tangible/wearables/robe/robe_jedi_light_s01.iff";
						ManagedReference<SceneObject*> knightRobe = zserv->createObject(KnightRobe.hashCode(), 1);
						knightRobe->sendTo(creature, true);
						inventory->transferObject(knightRobe, -1);
						creature->playEffect("clienteffect/entertainer_dazzle_level_2.cef", ""); // Not sure if it's the right one for this.
						ghost->setJediState(4);
						jedi->setFactionStatus(2);
						box2->setPromptTitle("@jedi_trials:knight_trials_title"); // Jedi Trials
						box2->setPromptText("@jedi_trials:knight_trials_completed_light");
						ghost->addSuiBox(box2);
						creature->sendMessage(box2->generateMessage());
					}


			if (selectedID == 221) {
						ZoneServer* zserv = creature->getZoneServer();
						ManagedReference<SceneObject*> inventory = creature->getSlottedObject("inventory");
						PlayerObject* jedi = creature->getPlayerObject();
						SkillManager::instance()->awardSkill("force_title_jedi_rank_03", creature, true, true, true);
						SkillManager::instance()->awardSkill("force_rank_dark_novice", creature, true, true, true);
						String KnightdarkRobe = "object/tangible/wearables/robe/robe_jedi_dark_s01.iff";
						ManagedReference<SceneObject*> knightdarkRobe = zserv->createObject(KnightdarkRobe.hashCode(), 1);
						ManagedReference<SuiMessageBox*> box = new SuiMessageBox(creature, SuiWindowType::NONE);
						knightdarkRobe->sendTo(creature, true);
						inventory->transferObject(knightdarkRobe, -1);
						creature->playEffect("clienteffect/entertainer_dazzle_level_2.cef", ""); // Not sure if it's the right one for this.
						ghost->setJediState(8);
						jedi->setFactionStatus(2);
						box->setPromptTitle("@jedi_trials:knight_trials_title"); // Jedi Trials
						box->setPromptText("@jedi_trials:knight_trials_completed_dark");
						ghost->addSuiBox(box);
						creature->sendMessage(box->generateMessage());
					}
	return 0;

}
*/

