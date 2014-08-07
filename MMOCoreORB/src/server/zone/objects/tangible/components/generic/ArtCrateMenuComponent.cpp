/*
 * PartyCrateMenuComponent.cpp
 *
 *  Created on: 05/02/2014
 *      Author: Heat
 */

#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/objects/creature/CreatureAttribute.h"
#include "server/zone/objects/player/PlayerObject.h"
#include "ArtCrateMenuComponent.h"
#include "server/zone/objects/scene/components/ObjectMenuComponent.h"
#include "server/zone/objects/scene/SceneObject.h"
#include "server/zone/objects/scene/SceneObjectType.h"
#include "server/zone/objects/tangible/TangibleObject.h"
#include "server/zone/managers/loot/LootManager.h"
#include "server/zone/Zone.h"
#include "server/zone/ZoneServer.h"
#include "server/zone/packets/player/PlayMusicMessage.h"

void ArtCrateMenuComponent::fillObjectMenuResponse(SceneObject* sceneObject, ObjectMenuResponse* menuResponse, CreatureObject* player) {
	TangibleObjectMenuComponent::fillObjectMenuResponse(sceneObject, menuResponse, player);

}

int ArtCrateMenuComponent::handleObjectMenuSelect(SceneObject* sceneObject, CreatureObject* player, byte selectedID) {
	if (!sceneObject->isTangibleObject())
		return 0;

	if (!player->isPlayerCreature())
		return 0;

	if (!sceneObject->isASubChildOf(player))
		return 0;


	if (selectedID == 20) {
		ManagedReference<LootManager*> lootManager = sceneObject->getZone()->getZoneServer()->getLootManager();

		if (lootManager == NULL)
			return 0;

		ManagedReference<SceneObject*> inventory = player->getSlottedObject("inventory");

		int rand = System::random(100);
		if (rand >= 25) {
			sceneObject->destroyObjectFromWorld(true);
			player->sendSystemMessage("ITS A BLOODFIN PARTY! YOU RECIEVED A GIFT TOO!");
			player->playEffect("clienteffect/droid_effect_dry_ice.cef");
			player->playEffect("clienteffect/droid_effect_jawa_dance.cef");
			player->playEffect("clienteffect/droid_effect_confetti.cef");
			player->playEffect("clienteffect/droid_effect_electric_fog.cef");
			player->playEffect("clienteffect/droid_effect_mind_bloom.cef");
			player->playEffect("clienteffect/droid_effect_doves.cef");
			player->playEffect("clienteffect/droid_effect_bubbles.cef");
			lootManager->createLoot(inventory, "party_crate", 1);
			PlayMusicMessage* pmm = new PlayMusicMessage("sound/music_celebration_a_loop.snd");
			player->sendMessage(pmm);


		}else {
			sceneObject->destroyObjectFromWorld(false);
			player->sendSystemMessage("You have sprung a trap! Activating Hyperspace Implosion Device");
			player->playEffect("clienteffect/cbt_msl_impact_concussion.cef");
			PlayMusicMessage* pmm = new PlayMusicMessage("sound/ship_hyperspace_begin.snd");
			player->sendMessage(pmm);
			int health = player->getHAM(CreatureAttribute::HEALTH);
			player->inflictDamage(player, CreatureAttribute::HEALTH, 9000, true);

			return 0;
		}
	}


return TangibleObjectMenuComponent::handleObjectMenuSelect(sceneObject, player, selectedID);
}
