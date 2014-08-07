/*
 * LightsaberObjectMenuComponent.cpp
 *
 *  Created on: 3/11/2012
 *      Author: kyle
 */

#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/objects/player/PlayerObject.h"
#include "server/zone/objects/player/sui/colorbox/SuiColorBox.h"
#include "GogglesObjectMenuComponent.h"
#include "server/zone/objects/scene/components/ObjectMenuComponent.h"
#include "server/zone/packets/object/ObjectMenuResponse.h"
#include "server/zone/managers/objectcontroller/ObjectController.h"
#include "server/zone/objects/player/sui/SuiCallback.h"
#include "server/zone/objects/player/sui/callbacks/ColorGogglesSuiCallback.h"
#include "server/zone/Zone.h"
#include "server/zone/ZoneServer.h"
#include "server/zone/templates/customization/AssetCustomizationManagerTemplate.h"

void GogglesObjectMenuComponent::fillObjectMenuResponse(SceneObject* sceneObject, ObjectMenuResponse* menuResponse, CreatureObject* player) {

	if (!sceneObject->isTangibleObject())
		return;

	TangibleObjectMenuComponent::fillObjectMenuResponse(sceneObject, menuResponse, player);

	// Coloring the goggles...
	menuResponse->addRadialMenuItem(80, 1, "Change Color");
	menuResponse->addRadialMenuItemToRadialID(80, 81, 3, "Primary");
	menuResponse->addRadialMenuItemToRadialID(80, 82, 3, "Secondary");
}

int GogglesObjectMenuComponent::handleObjectMenuSelect(SceneObject* sceneObject, CreatureObject* player, byte selectedID) {
	if (!sceneObject->isTangibleObject())
		return 0;

	if (!sceneObject->isASubChildOf(player))
		return 0;
		
	if (selectedID == 81 || selectedID == 82) {

		ManagedReference<SceneObject*> parent = sceneObject->getParent();
		if (parent != NULL && parent->isPlayerCreature()) {
			player->sendSystemMessage("@error_message:equipped_goggles");
			return 0;
		}

		// Handle color change.

		ZoneServer* server = player->getZoneServer();

		if (server != NULL) {

			int index = selectedID == 81 ? 0 : 1;

			// The color index.
			String appearanceFilename = sceneObject->getObjectTemplate()->getAppearanceFilename();
			VectorMap<String, Reference<CustomizationVariable*> > variables;
			AssetCustomizationManagerTemplate::instance()->getCustomizationVariables(appearanceFilename.hashCode(), variables, false);

			// The Sui Box.
			ManagedReference<SuiColorBox*> cbox = new SuiColorBox(player, SuiWindowType::COLOR_GOGGLES);
			cbox->setCallback(new ColorGogglesSuiCallback(server));
			cbox->setColorPalette(variables.elementAt(index).getKey()); // First one seems to be the frame of it? Skip to 2nd.
			cbox->setUsingObject(sceneObject);

			// Add to player.
			ManagedReference<PlayerObject*> ghost = player->getPlayerObject();
			ghost->addSuiBox(cbox);
			player->sendMessage(cbox->generateMessage());
		}

	}


	return TangibleObjectMenuComponent::handleObjectMenuSelect(sceneObject, player, selectedID);
}
