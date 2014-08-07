/*
 * FsVillageAreaImplementation.cpp
 *
 *  Created on: 01/04/2012
 *      Author: victor
 */

#include "server/zone/objects/area/FsVillageArea.h"
#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/Zone.h"
#include "server/zone/objects/player/PlayerObject.h"

void FsVillageAreaImplementation::notifyEnter(SceneObject* player) {
	if (!player->isPlayerCreature()) {
		return;
	}


	CreatureObject* playerCreature = cast<CreatureObject*>(player);
	PlayerObject* ghost = playerCreature->getPlayerObject();

	if (ghost == NULL)
		return;



}
