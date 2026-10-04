/*
 * This file is part of the AzerothCore Project. See AUTHORS file for Copyright information
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#include "CreatureScript.h"
#include "Player.h"
#include "ScriptedCreature.h"
#include "ScriptedGossip.h"
#include "SpellScript.h"
#include "SpellScriptLoader.h"
#include "TaskScheduler.h"

enum Say
{
    SAY_TELEPORT = 0,
    SAY_AGGRO    = 1,
    SAY_KILL     = 2
};

enum Spells
{
    SPELL_MARK_OF_FROST       = 23182,
    SPELL_MARK_OF_FROST_AURA  = 23184,
    SPELL_AURA_OF_FROST       = 23186,
    SPELL_MANA_STORM          = 21097,
    SPELL_CHILL               = 21098,
    SPELL_FROST_BREATH        = 21099,
    SPELL_REFLECT             = 22067,
    SPELL_CLEAVE              = 19983,
    SPELL_ARCANE_VACUUM       = 21147,
    SPELL_ARCANE_VACUUM_TP    = 21150
};

enum Events
{
    EVENT_SPELL_CLEAVE        = 1,
    EVENT_SPELL_MANA_STORM    = 2,
    EVENT_SPELL_CHILL         = 3,
    EVENT_SPELL_FROST_BREATH  = 4,
    EVENT_SPELL_ARCANE_VACUUM = 5,
    EVENT_SPELL_REFLECT       = 6
};

class boss_azuregos_ipp : public CreatureScript
{
public:

    boss_azuregos_ipp() : CreatureScript("boss_azuregos_ipp") {}

    struct boss_azuregosAI : public ScriptedAI
    {
        boss_azuregosAI(Creature* creature) : ScriptedAI(creature) {}

        void Reset() override
        {
            scheduler.CancelAll();
            me->SetNpcFlag(UNIT_NPC_FLAG_GOSSIP);
            me->RestoreFaction();
            me->GetMap()->DoForAllPlayers([&](Player* p)
                {
                    if (p->GetZoneId() == me->GetZoneId())
                    {
                        p->RemoveAurasDueToSpell(SPELL_CHILL);
                        p->RemoveAurasDueToSpell(SPELL_FROST_BREATH);
                    }
                });
        }

        void KilledUnit(Unit* victim) override
        {
            if (victim && victim->IsPlayer())
            {
                Talk(SAY_KILL);
                victim->CastSpell(victim, SPELL_MARK_OF_FROST, true);
            }
        }

        void JustEngagedWith(Unit* /*who*/) override
        {
            DoCastSelf(SPELL_MARK_OF_FROST_AURA);
            Talk(SAY_AGGRO);

            events.ScheduleEvent(EVENT_SPELL_CLEAVE, 7s);
            events.ScheduleEvent(EVENT_SPELL_MANA_STORM, 5s, 17s);
            events.ScheduleEvent(EVENT_SPELL_CHILL, 10s, 30s);
            events.ScheduleEvent(EVENT_SPELL_FROST_BREATH, 2s, 8s);
            events.ScheduleEvent(EVENT_SPELL_ARCANE_VACUUM, 30s);
            events.ScheduleEvent(EVENT_SPELL_REFLECT, 15s, 30s);
        }

        void JustDied(Unit* /*killer*/) override
        {
            me->RemoveAurasDueToSpell(SPELL_MARK_OF_FROST);
            me->GetMap()->DoForAllPlayers([&](Player* p)
                {
                    if (p->GetZoneId() == me->GetZoneId())
                    {
                        p->RemoveAurasDueToSpell(SPELL_MARK_OF_FROST);
                        p->RemoveAurasDueToSpell(SPELL_AURA_OF_FROST);
                        p->RemoveAurasDueToSpell(SPELL_CHILL);
                        p->RemoveAurasDueToSpell(SPELL_FROST_BREATH);
                    }
                });

            me->SetRespawnTime(urand(2 * DAY, 3 * DAY));
            me->SaveRespawnTime();
        }

        void UpdateAI(uint32 diff) override
        {
            if (!UpdateVictim())
                return;

            events.Update(diff);

            if (me->HasUnitState(UNIT_STATE_CASTING))
                return;

            switch (events.ExecuteEvent())
            {
            case EVENT_SPELL_CLEAVE:
            {
                DoCastVictim(SPELL_CLEAVE);
                events.Repeat(7s);
                break;
            }
            case EVENT_SPELL_MANA_STORM:
            {
                DoCastRandomTarget(SPELL_MANA_STORM);
                events.Repeat(7s, 13s);
                break;
            }
            case EVENT_SPELL_CHILL:
            {
                DoCastVictim(SPELL_CHILL);
                events.Repeat(13s, 25s);
                break;
            }
            case EVENT_SPELL_FROST_BREATH:
            {
                DoCastVictim(SPELL_FROST_BREATH);
                events.Repeat(10s, 15s);
                break;
            }
            case EVENT_SPELL_ARCANE_VACUUM:
            {
                Talk(SAY_TELEPORT);
                DoCastAOE(SPELL_ARCANE_VACUUM);
                events.Repeat(30s);
                break;
            }
            case EVENT_SPELL_REFLECT:
            {
                DoCastSelf(SPELL_REFLECT);
                events.Repeat(20s, 35s);
                break;
            }
            default:
                break;
            }

            DoMeleeAttackIfReady();
        }
    };

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 /*action*/) override
    {
        CloseGossipMenuFor(player);
        creature->SetFaction(FACTION_ENEMY);
        creature->AI()->AttackStart(player);
        return true;
    }

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new boss_azuregosAI(creature);
    }
};

void AddSC_boss_azuregos_ipp()
{
    new boss_azuregos_ipp();
}
