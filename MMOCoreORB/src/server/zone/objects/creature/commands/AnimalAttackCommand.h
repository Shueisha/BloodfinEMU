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

#ifndef ANIMALATTACKCOMMAND_H_
#define ANIMALATTACKCOMMAND_H_

#include "server/zone/objects/scene/SceneObject.h"

class AnimalAttackCommand : public CombatQueueCommand {
public:

	AnimalAttackCommand(const String& name, ZoneProcessServer* server)
		: CombatQueueCommand(name, server) {

	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) {

		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;
		// Fail if target is not a player...

		ManagedReference<SceneObject*> object = server->getZoneServer()->getObject(target);

		if (object == NULL || !object->isCreatureObject())
			return INVALIDTARGET;

		CreatureObject* creatureTarget = cast<CreatureObject*>( object.get());

		if (creatureTarget == NULL)
			return INVALIDTARGET;

		Locker clocker(creatureTarget, creature);

		ManagedReference<PlayerObject*> targetGhost = creatureTarget->getPlayerObject();
		ManagedReference<PlayerObject*> playerObject = creature->getPlayerObject();

		if (targetGhost == NULL || playerObject == NULL)
			return GENERALERROR;

		if (creature->getDistanceTo(object) > 32.f){
			creature->sendSystemMessage("You are out of range.");
			return GENERALERROR;}

		//Check for powers
		/*
		 * If you don't have Mpowers
		 * send error message
		 */
		if (!creature->hasSkill("force_discipline_powers_master"))
			return GENERALERROR;

	//	if (!creature->hasSkill("jedi_trainee_novice"))
		//	creature->sendSystemMessage("The Force blocks you from using this ability.");
		//	return 0;
		// Force cost of skill.
		int forceCost = 250;

		//Check for and deduct Force cost.

		//ManagedReference<PlayerObject*> playerObject = creature->getPlayerObject();


		if (playerObject->getForcePower() <= forceCost) {
			creature->sendSystemMessage("@jedi_spam:no_force_power"); //"You do not have enough Force Power to peform that action.

			return GENERALERROR;
		}
		int duration = 60;
		uint32 buffcrc = BuffCRC::FORCE_RANK_SUFFERING;
		if(creature->hasBuff(buffcrc)) {
			creature->sendSystemMessage("@jedi_spam:force_buff_present");
			return GENERALERROR;
		}
		//ManagedReference<SceneObject*> object = server->getZoneServer()->getObject(target);
		//CreatureObject* creatureTarget = cast<CreatureObject*>( object.get());
		if (object->isCreatureObject() && creatureTarget->isAttackableBy(creature)) {
		ManagedReference<Buff*> buff = new Buff(creature, buffcrc, duration, BuffType::JEDI);
			creatureTarget->setDizziedState(3);
			creatureTarget->playEffect("clienteffect/droid_effect_dry_ice.cef", "");
			creatureTarget->sendSystemMessage("An animal sized force wave hits your legs");
			creatureTarget->setPosture(CreaturePosture::KNOCKEDDOWN);
			creature->addBuff(buff);
			creature->playEffect("clienteffect/droid_effect_dry_ice.cef", "");
		}

		return doCombatAction(creature, target);
	}

};

#endif //ANIMALATTACKCOMMAND_H_
