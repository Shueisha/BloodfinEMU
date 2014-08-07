/*
Copyright (C) 2007 <SWGEmu>

This File is part of Core3.

This program is free software; you can redistribute
it and/or modify it under the terms of the GNU Lesser
General Public License as published by the Free Software
Foundation; either version 2 of the License,
or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
See the GNU Lesser General Public License for
more details.

You should have received a copy of the GNU Lesser General
Public License along with this program; if not, write to
the Free Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA

Linking Engine3 statically or dynamically with other modules
is making a combined work based on Engine3.
Thus, the terms and conditions of the GNU Lesser General Public License
cover the whole combination.

In addition, as a special exception, the copyright holders of Engine3
give you permission to combine Engine3 program with free software
programs or libraries that are released under the GNU LGPL and with
code included in the standard release of Core3 under the GNU LGPL
license (or modified versions of such code, with unchanged license).
You may copy and distribute such a system following the terms of the
GNU LGPL for Engine3 and the licenses of the other code concerned,
provided that you include the source code of that other code when
and as the GNU LGPL requires distribution of source code.

Note that people who make modified versions of Engine3 are not obligated
to grant this special exception for their modified versions;
it is their choice whether to do so. The GNU Lesser General Public License
gives permission to release a modified version without this exception;
this exception also makes it possible to release a modified version
which carries forward this exception.
*/

#ifndef LAGCOMMAND_H_
#define LAGCOMMAND_H_

#include "server/zone/objects/creature/CreatureObject.h"


#include "server/zone/managers/object/ObjectManager.h"
#include "server/zone/managers/objectcontroller/ObjectController.h"
#include "server/zone/managers/skill/SkillModManager.h"
#include "server/zone/managers/skill/SkillManager.h"
#include "server/zone/managers/player/PlayerManager.h"
#include "server/zone/managers/mission/MissionManager.h"
#include "server/zone/managers/creature/PetManager.h"
#include "server/zone/ZoneClientSession.h"
#include "server/zone/packets/creature/CreatureObjectMessage1.h"
#include "server/zone/packets/creature/CreatureObjectMessage3.h"
#include "server/zone/packets/creature/CreatureObjectMessage4.h"
#include "server/zone/packets/creature/CreatureObjectMessage6.h"
#include "server/zone/packets/creature/CreatureObjectDeltaMessage1.h"
#include "server/zone/packets/creature/CreatureObjectDeltaMessage3.h"
#include "server/zone/packets/creature/CreatureObjectDeltaMessage4.h"
#include "server/zone/packets/creature/CreatureObjectDeltaMessage6.h"
#include "server/zone/packets/chat/ChatSystemMessage.h"
#include "server/zone/packets/object/PostureMessage.h"
#include "server/zone/packets/object/SitOnObject.h"
#include "server/zone/packets/object/CommandQueueRemove.h"
#include "server/zone/packets/object/CombatAction.h"
#include "server/zone/packets/player/PlayMusicMessage.h"
#include "server/zone/packets/player/NewbieTutorialRequest.h"
#include "server/zone/packets/ui/NewbieTutorialEnableHudElement.h"
#include "server/zone/packets/ui/OpenHolocronToPageMessage.h"
#include "server/zone/packets/object/PlayClientEffectObjectMessage.h"
#include "server/zone/packets/object/Animation.h"
#include "server/zone/objects/creature/CreaturePosture.h"
#include "server/zone/objects/creature/events/CommandQueueActionEvent.h"
#include "server/zone/Zone.h"
#include "server/zone/ZoneServer.h"
#include "server/chat/StringIdChatParameter.h"
#include "server/zone/objects/scene/variables/DeltaVectorMap.h"
#include "server/zone/objects/creature/variables/CommandQueueAction.h"
#include "server/zone/objects/creature/commands/QueueCommand.h"
#include "server/zone/objects/group/GroupObject.h"
#include "server/zone/packets/tangible/UpdatePVPStatusMessage.h"
#include "server/zone/objects/player/Races.h"
#include "server/zone/objects/player/FactionStatus.h"
#include "server/zone/objects/area/ActiveArea.h"
#include "server/zone/objects/mission/MissionObject.h"
#include "server/zone/objects/area/CampSiteActiveArea.h"
#include "server/zone/managers/templates/TemplateManager.h"
#include "server/zone/objects/tangible/wearables/WearableObject.h"
#include "server/zone/objects/tangible/weapon/WeaponObject.h"
#include "server/zone/objects/intangible/VehicleControlDevice.h"
#include "server/zone/objects/guild/GuildObject.h"
#include "server/zone/packets/ui/ExecuteConsoleCommand.h"
#include "server/zone/objects/creature/buffs/StateBuff.h"
#include "server/zone/objects/building/hospital/HospitalBuildingObject.h"

#include "server/zone/packets/object/SitOnObject.h"

#include "server/zone/managers/planet/PlanetManager.h"
#include "server/zone/managers/terrain/TerrainManager.h"
#include "server/zone/managers/resource/resourcespawner/SampleTask.h"

#include "server/zone/templates/tangible/SharedCreatureObjectTemplate.h"
#include "server/zone/objects/player/sessions/EntertainingSession.h"

#include "server/zone/packets/zone/unkByteFlag.h"
#include "server/zone/packets/zone/CmdStartScene.h"
#include "server/zone/packets/zone/CmdSceneReady.h"
#include "server/zone/packets/zone/ParametersMessage.h"

#include "server/zone/managers/guild/GuildManager.h"
#include "system/lang/ref/Reference.h"
#include "server/zone/objects/player/events/LogoutTask.h"
#include "server/zone/objects/player/events/StoreSpawnedChildrenTask.h"


#include "server/zone/objects/tangible/threat/ThreatMap.h"
#include "server/zone/packets/player/PlayMusicMessage.h"

class LagCommand : public QueueCommand {
public:

	LagCommand(const String& name, ZoneProcessServer* server)
		: QueueCommand(name, server) {

	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) {

		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;

			creature->playEffect("clienteffect/stormtrp_movealng.cef");

		return SUCCESS;
	}

};

#endif //LAGCOMMAND_H_
