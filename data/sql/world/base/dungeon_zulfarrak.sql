/* smart scripts */
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN 
(5645, 5646, 5647, 5648, 5649, 5650, 7246, 7247, 7267, 7274, 7795, 7797, 10081, 10082);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN 
(5645, 5646, 5647, 5648, 5649, 5650, 7246, 7247, 7267, 7274, 7795, 7797, 10081, 10082);

INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, 
`event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, 
`action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, 
`target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
--
(5645, 0, 0, 0, 11, 0, 100, 0, 0, 0, 0, 0, 0, 0, 11, 3616, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                  'Sandfury Hideskinner - On Reset - Cast Poison Proc'),
(5645, 0, 1, 0, 67, 0, 100, 0, 3000, 6000, 6000, 10000, 0, 5, 11, 7159, 2, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0,     'Sandfury Hideskinner - In Combat - Cast Backstab'),
(5645, 0, 2, 0, 2, 0, 100, 1, 0, 15, 0, 0, 0, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,                     'Sandfury Hideskinner - Between 0-15% Health - Flee For Assist (No Repeat)'),
(5646, 0, 0, 0, 9, 0, 100, 0, 0, 0, 4000, 4000, 30, 60, 21, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,              'Sandfury Axe Thrower - Outside 30 Range - Start Combat Movement'),
(5646, 0, 1, 0, 9, 0, 100, 0, 0, 0, 4000, 4000, 5, 30, 21, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,               'Sandfury Axe Thrower - Within 5-30 Range - Stop Combat Movement'),
(5646, 0, 2, 0, 9, 0, 100, 0, 0, 0, 4000, 4000, 0, 5, 21, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                'Sandfury Axe Thrower - Within 0-5 Range - Start Combat Movement'),
(5646, 0, 3, 0, 9, 0, 100, 0, 0, 0, 2200, 3900, 5, 30, 11, 10277, 64, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0,          'Sandfury Axe Thrower - Within 5-30 Range - Cast Throw'),
(5646, 0, 4, 0, 2, 0, 100, 1, 0, 15, 0, 0, 0, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,                     'Sandfury Axe Thrower - Between 0-15% Health - Flee For Assist (No Repeat)'),
(5647, 0, 0, 0, 0, 0, 100, 0, 0, 0, 2400, 3800, 0, 0, 11, 14034, 64, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0,           'Sandfury Firecaller - In Combat - Cast Fireball'),
(5647, 0, 1, 0, 0, 0, 85, 0, 8000, 14000, 20000, 26000, 0, 0, 11, 11990, 0, 0, 0, 0, 0, 5, 30, 0, 0, 0, 0, 0, 0, 0,   'Sandfury Firecaller - Within 0-30 Range - Cast Rain of Fire'),
(5647, 0, 2, 0, 2, 0, 100, 1, 0, 15, 0, 0, 0, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,                     'Sandfury Firecaller - Between 0-15% Health - Flee For Assist (No Repeat)'),
(5648, 0, 0, 0, 1, 0, 100, 0, 1000, 1000, 90000, 90000, 0, 0, 11, 20798, 32, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,   'Sandfury Shadowcaster - Out of Combat - Cast Demon Skin'),
(5648, 0, 1, 0, 0, 0, 100, 0, 0, 1000, 3000, 4000, 0, 0, 11, 12471, 64, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0,        'Sandfury Shadowcaster - In Combat - Cast Shadow Bolt'),
(5648, 0, 2, 0, 0, 0, 100, 0, 5000, 10000, 20000, 30000, 0, 0, 11, 14032, 0, 0, 0, 0, 0, 5, 30, 0, 0, 0, 0, 0, 0, 0,  'Sandfury Shadowcaster - In Combat - Cast Shadow Word: Pain'),
(5648, 0, 3, 0, 2, 0, 100, 1, 0, 15, 0, 0, 0, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,                     'Sandfury Shadowcaster - Between 0-15% Health - Flee For Assist'),
(5649, 0, 0, 0, 0, 0, 100, 0, 8000, 18000, 7000, 22000, 0, 0, 11, 11898, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,    'Sandfury Blood Drinker - In Combat - Cast Blood Leech'),
(5649, 0, 1, 0, 2, 0, 100, 1, 0, 15, 0, 0, 0, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,                     'Sandfury Blood Drinker - Between 0-15% Health - Flee For Assist'),
(5650, 0, 0, 0, 0, 0, 100, 0, 7000, 26000, 31000, 36000, 0, 0, 11, 11899, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,   'Sandfury Witch Doctor - In Combat - Cast Healing Ward'),
(5650, 0, 1, 0, 0, 0, 100, 0, 10000, 15000, 30000, 30000, 0, 0, 11, 8264, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,   'Sandfury Witch Doctor - In Combat - Cast Lava Spout Totem'),
(5650, 0, 2, 0, 74, 0, 100, 0, 0, 0, 18000, 24000, 50, 40, 11, 17843, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0,       'Sandfury Witch Doctor - Friendly 50% Health - Cast Flash Heal'),
(5650, 0, 3, 0, 2, 0, 100, 1, 0, 15, 0, 0, 0, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,                     'Sandfury Witch Doctor - Between 0-15% Health - Flee For Assist'),
-- (7246, 0, 0, 0, 9, 0, 100, 0, 0, 0, 4000, 4000, 30, 60, 21, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,              'Sandfury Shadowhunter - Outside 30 Range - Start Combat Movement'),
-- (7246, 0, 1, 0, 9, 0, 100, 0, 0, 0, 4000, 4000, 5, 30, 21, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,               'Sandfury Shadowhunter - Within 5-30 Range - Stop Combat Movement'),
-- (7246, 0, 2, 0, 9, 0, 100, 0, 0, 0, 4000, 4000, 0, 5, 21, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                'Sandfury Shadowhunter - Within 0-5 Range - Start Combat Movement'),
(7246, 0, 3, 0, 9, 0, 100, 0, 0, 0, 2000, 4000, 5, 30, 11, 15547, 64, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0,          'Sandfury Shadowhunter - Within 5-30 Range - Cast Shoot'),
(7246, 0, 4, 0, 0, 0, 100, 0, 7000, 12000, 18000, 25000, 0, 0, 11, 11641, 0, 0, 0, 0, 0, 6, 20, 0, 0, 0, 0, 0, 0, 0,  'Sandfury Shadowhunter - In Combat - Cast Hex'),
(7246, 0, 5, 0, 0, 0, 100, 1, 1000, 1000, 0, 0, 0, 0, 11, 18396, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0,            'Sandfury Shadowhunter - On Aggro - Cast Dismounting Blast'),
(7246, 0, 6, 0, 2, 0, 100, 1, 0, 15, 0, 0, 0, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,                     'Sandfury Shadowhunter - Between 0-15% Health - Flee For Assist'),
(7247, 0, 0, 0, 0, 0, 100, 0, 8000, 20000, 18000, 37000, 0, 0, 11, 11016, 0, 0, 0, 0, 0, 5, 5, 0, 0, 0, 0, 0, 0, 0,   'Sandfury Soul Eater -  Within 0-5 Range - Cast Soul Bite'),
(7247, 0, 1, 0, 14, 0, 100, 0, 2100, 10, 10900, 15700, 0, 0, 11, 7154, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0,      'Sandfury Soul Eater - Friendly Missing Health - Cast Dark Offering'),
(7247, 0, 2, 0, 2, 0, 100, 1, 0, 15, 0, 0, 0, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,                     'Sandfury Soul Eater - Between 0-15% Health - Flee For Assist'),
(7267, 0, 0, 1, 4, 0, 100, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                       'Chief Ukorz Sandscalp - On Aggro - Say line 0'),
(7267, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 0, 11, 7366, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                  'Chief Ukorz Sandscalp - On Aggro - Cast Berserker Stance'),
(7267, 0, 2, 0, 0, 0, 100, 0, 6000, 20000, 8000, 19000, 0, 0, 11, 15496, 0, 0, 0, 0, 0, 21, 5, 0, 0, 0, 0, 0, 0, 0,   'Chief Ukorz Sandscalp - Within 0-5 Range - Cast Cleave'),
(7267, 0, 3, 0, 0, 0, 100, 0, 12000, 16000, 7000, 24000, 0, 0, 11, 11837, 0, 0, 0, 0, 0, 21, 5, 0, 0, 0, 0, 0, 0, 0,  'Chief Ukorz Sandscalp - Within 0-5 Range - Cast Wide Slash'),
(7267, 0, 4, 5, 2, 0, 100, 1, 0, 60, 0, 0, 0, 0, 11, 8269, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                  'Chief Ukorz Sandscalp - Between Health 0-60% - Cast Frenzy'),
(7267, 0, 5, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                      'Chief Ukorz Sandscalp - On Frenzy - Say Line 1'),
(7267, 0, 6, 7, 2, 0, 100, 1, 0, 30, 0, 0, 0, 0, 11, 8269, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                  'Chief Ukorz Sandscalp - Between Health 0-30% - Cast Frenzy'),
(7267, 0, 7, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 0, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                      'Chief Ukorz Sandscalp - On Frenzy - Say Line 2'),
(7267, 0, 8, 0, 5, 0, 100, 0, 5000, 5000, 0, 0, 0, 0, 1, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                 'Chief Ukorz Sandscalp - On Kill - Say line 3'),
(7274, 0, 0, 1, 4, 0, 100, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                       'Sandfury Executioner - On Aggro - Say line 0'),
(7274, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 0, 11, 7366, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                  'Sandfury Executioner - On Aggro - Cast Berserker Stance'),
(7274, 0, 2, 0, 0, 0, 100, 0, 7000, 13000, 7000, 23000, 0, 0, 11, 15496, 0, 0, 0, 0, 0, 21, 5, 0, 0, 0, 0, 0, 0, 0,   'Sandfury Executioner - In Combat - Cast Cleave'),
(7274, 0, 3, 0, 12, 0, 100, 0, 0, 20, 30000, 30000, 0, 0, 11, 7160, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0,         'Sandfury Executioner - In Combat - Cast Execute'),
(7274, 0, 4, 0, 5, 0, 100, 0, 5000, 5000, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                 'Sandfury Executioner - On Kill - Say line 1'),
(7795, 0, 0, 0, 0, 0, 100, 0, 0, 1000, 3000, 4000, 0, 0, 11, 10180, 64, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0,        'Hydromancer Velratha - In Combat - Cast Frostbolt'),
(7795, 0, 1, 0, 14, 0, 100, 0, 1000, 30, 9000, 22000, 0, 0, 11, 12491, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0,      'Hydromancer Velratha - Friendly Missing Health - Cast Healing Wave'),
(7797, 0, 0, 0, 4, 0, 100, 0, 0, 0, 0, 0, 0, 0, 11, 7366, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                   'Ruuzlu - On Aggro - Cast Berserker Stance'),
(7797, 0, 1, 0, 0, 0, 100, 0, 7000, 12000, 7000, 18000, 0, 0, 11, 15496, 0, 0, 0, 0, 0, 21, 5, 0, 0, 0, 0, 0, 0, 0,   'Ruuzlu - Within 0-5 Range - Cast Cleave'),
(7797, 0, 2, 0, 12, 0, 100, 0, 0, 20, 30000, 30000, 0, 0, 11, 7160, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0,         'Ruuzlu - Target Between Health 0-20% - Cast Execute'),
(10081, 0, 0, 0, 37, 0, 90, 512, 0, 0, 0, 0, 0, 0, 41, 500, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                 'Dustwraith - On Initialize - Despawn In 500 ms'),
(10081, 0, 1, 0, 11, 0, 100, 0, 0, 0, 0, 0, 0, 0, 11, 12254, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                'Dustwraith - In Combat - Cast Virulent Poison'),
(10081, 0, 2, 0, 9, 0, 100, 0, 0, 0, 3600, 7300, 0, 5, 11, 14873, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0,           'Dustwraith - Within 0-5 Range - Cast Sinister Strike'),
(10082, 0, 0, 0, 9, 0, 100, 0, 0, 0, 4000, 4000, 30, 60, 21, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,             'Zerillis - Outside 30 Range - Start Combat Movement'),
(10082, 0, 1, 0, 9, 0, 100, 0, 0, 0, 4000, 4000, 5, 30, 21, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,              'Zerillis - Within 5-30 Range - Stop Combat Movement'),
(10082, 0, 2, 0, 9, 0, 100, 0, 0, 0, 4000, 4000, 0, 5, 21, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,               'Zerillis - Within 0-5 Range - Start Combat Movement'),
(10082, 0, 3, 0, 9, 0, 100, 0, 0, 0, 2000, 4000, 5, 30, 11, 15547, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0,          'Zerillis - Within 5-30 Range - Cast Shoot'),
(10082, 0, 4, 0, 0, 0, 100, 0, 6000, 11000, 5000, 18000, 0, 0, 11, 12551, 0, 0, 0, 0, 0, 28, 30, 1, 1, 5, 0, 0, 0, 0, 'Zerillis - Within 5-30 Range - Cast Frost Shot'),
(10082, 0, 5, 0, 9, 0, 100, 0, 0, 0, 12000, 25000, 0, 20, 11, 6533, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0,         'Zerillis - Within 0-20 Range - Cast Net'),
(10082, 0, 6, 0, 2, 0, 100, 1, 0, 15, 0, 0, 0, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,                    'Zerillis - Between 0-15% Health - Flee For Assist (No Repeat)'),
(10082, 0, 7, 0, 37, 0, 90, 512, 0, 0, 0, 0, 0, 0, 41, 500, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                 'Zerillis - On Initialize - Despawn In 500 ms');

/* Restore Mallet requirement to Gong of Zul'Farrak */
UPDATE `gameobject_template` SET `data0` = 459 WHERE `entry` = 141832;

/* fix skinning loot from scarabs */
UPDATE `creature_template` SET `skinloot` = 100014 WHERE `entry` = 7269;

SET @CGUID  := 652000;
SET @WPID   := 6520000;

-- fix patrols
DELETE FROM `creature` WHERE `guid` IN (81482, 81601, @CGUID+101, @CGUID+102, @CGUID+103);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, 
`wander_distance`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `ScriptName`, `VerifiedBuild`, `CreateObject`, `Comment`) VALUES 
--
(81482, 5650, 209, 0, 0, 1, 1, 1, 1759.63, 730.254, 17.6822, 3.18886, 18000, 0, 1, 4278, 2966, 2, 0, 0, 0, '', 0, 0, NULL),

(81601, 5649, 209, 0, 0, 1, 1, 1, 1614.31, 1126.9, 9.00178, 0.655469, 86400, 5, 0, 5346, 0, 1, 0, 0, 0, '', 0, 0, NULL), -- no longer part of patrol
--
(@CGUID+101, 5649, 209, 0, 0, 1, 1, 1, 1404.97, 813.08, 8.88956, 2.99251, 18000, 0, 1, 5346, 0, 2, 0, 0, 0, '', 0, 0, NULL),
(@CGUID+102, 5649, 209, 0, 0, 1, 1, 1, 1408.02, 812.97, 8.88956, 2.98858, 18000, 0, 0, 5346, 0, 0, 0, 0, 0, '', 0, 0, NULL),
(@CGUID+103, 5649, 209, 0, 0, 1, 1, 1, 1793.49, 753.382, 14.3114, 1.67303, 18000, 0, 1, 5346, 0, 2, 0, 0, 0, '', 0, 0, NULL);

-- DELETE FROM `creature_formations` WHERE `leaderGUID` IN (81531, 81581, 81587, @CGUID+101);
DELETE FROM `creature_formations` WHERE `leaderGUID` IN (@CGUID+101);
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`) VALUES
(@CGUID+101, @CGUID+101, 0, 0, 515, 0, 0),    
(@CGUID+101, @CGUID+102, 3, 90, 515, 0, 0);

-- existing databases: undo what older versions of this file set on patrols now left to AC (AC 2026_09_21_07)
UPDATE `creature` SET `spawntimesecs` = 86400 WHERE `guid` IN (45710, 81505, 81581, 81582, 81583, 81587, 81588);
DELETE FROM `creature_formations` WHERE `memberGUID` = 81601;

DELETE FROM `creature_addon` WHERE `guid` IN (81482, @CGUID+101, @CGUID+103);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `visibilityDistanceType`, `auras`) VALUES 
(81482, 814820, 0, 0, 1, 0, 0, NULL),
(@CGUID+101, @WPID+1010, 0, 0, 1, 0, 0, NULL),
(@CGUID+103, @WPID+1030, 0, 0, 1, 0, 0, NULL);

DELETE FROM `waypoint_data` WHERE `id` IN (814820, @WPID+1010, @WPID+1030);
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES 
--
(814820, 1, 1759.63, 730.254, 17.6822, 3.18886, 0, 0, 0, 100, 0),
(814820, 2, 1791, 733.224, 16.1199, 0.094385, 0, 0, 0, 100, 0),
(814820, 3, 1834.9, 727.576, 17.819, 6.15766, 0, 0, 0, 100, 0),
(814820, 4, 1790.44, 733.571, 16.0522, 2.94538, 0, 0, 0, 100, 0),
--
(@WPID+1010, 1, 1405.13, 813.415, 8.88956, 2.99251, 0, 0, 0, 100, 0),
(@WPID+1010, 2, 1380.48, 814.88, 8.88956, 3.10246, 0, 0, 0, 100, 0),
(@WPID+1010, 3, 1345.46, 820.051, 8.89113, 3.00429, 0, 0, 0, 100, 0),
(@WPID+1010, 4, 1333.4, 824.975, 8.89113, 2.75689, 0, 0, 0, 100, 0),
(@WPID+1010, 5, 1324.76, 833.365, 8.89113, 2.37204, 0, 0, 0, 100, 0),
(@WPID+1010, 6, 1337.07, 822.634, 8.89113, 5.60395, 0, 0, 0, 100, 0),
(@WPID+1010, 7, 1380.57, 814.757, 8.89146, 6.11838, 0, 0, 0, 100, 0),
--
(@WPID+1030, 1, 1793.49, 753.382, 14.3114, 1.67303, 0, 0, 0, 100, 0),
(@WPID+1030, 2, 1792.28, 766.702, 14.0961, 1.66125, 0, 0, 0, 100, 0),
(@WPID+1030, 3, 1797.91, 792.692, 14.3871, 1.35102, 0, 0, 0, 100, 0),
(@WPID+1030, 4, 1805.68, 803.858, 13.3509, 0.970101, 0, 0, 0, 100, 0),
(@WPID+1030, 5, 1797.91, 792.355, 14.3955, 4.11955, 0, 0, 0, 100, 0);
