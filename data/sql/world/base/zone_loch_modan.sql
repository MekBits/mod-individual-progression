/* smart scripts */
UPDATE `creature_template` SET `AIName` = '' WHERE `entry` IN (1186, 1188, 1189, 1225);
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN
(1161, 1162, 1163, 1164, 1165, 1166, 1167, 1169, 1172, 1173, 1174, 1175, 1176, 1177, 1178, 1179, 1180, 1181, 1183, 1184, 1185, 1190, 1191, 1192, 1194, 1195, 1197, 
1202, 1205, 1206, 1207, 1210, 1393, 1398, 1399, 1425, 2476, 2477, 2478, 3291, 7170, 14267 );
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN 
(1161, 1162, 1163, 1164, 1165, 1166, 1167, 1169, 1172, 1173, 1174, 1175, 1176, 1177, 1178, 1179, 1180, 1181, 1183, 1184, 1185, 1186, 1188, 1189, 1190, 1191, 1192, 1194, 1195, 1197, 
1202, 1205, 1206, 1207, 1210, 1225, 1393, 1398, 1399, 1425, 2476, 2477, 2478, 3291, 7170, 14267 );

INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, 
`event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, 
`action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, 
`target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
--
(1161, 0, 0, 0, 4, 0, 10, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                         'Stonesplinter Trogg - On Aggro - Say Line 0'),
(1161, 0, 1, 0, 2, 0, 100, 1, 0, 15, 0, 0, 0, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,                      'Stonesplinter Trogg - Between 0-15% Health - Flee For Assist'),
(1162, 0, 0, 0, 4, 0, 10, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                         'Stonesplinter Scout - On Aggro - Say Line 0'),
(1162, 0, 1, 0, 9, 0, 100, 0, 0, 0, 4000, 4000, 30, 60, 21, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,               'Stonesplinter Scout - Outside 30 Range - Start Combat Movement'),
(1162, 0, 2, 0, 9, 0, 100, 0, 0, 0, 4000, 4000, 5, 30, 21, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                'Stonesplinter Scout - Within 5-30 Range - Stop Combat Movement'),
(1162, 0, 3, 0, 9, 0, 100, 0, 0, 0, 4000, 4000, 0, 5, 21, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                 'Stonesplinter Scout - Within 0-5 Range - Start Combat Movement'),
(1162, 0, 4, 0, 9, 0, 100, 0, 0, 0, 2000, 4000, 5, 30, 11, 10277, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0,            'Stonesplinter Scout - Within 5-30 Range - Cast Throw'),
(1162, 0, 5, 0, 2, 0, 100, 1, 0, 15, 0, 0, 0, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,                      'Stonesplinter Scout - Between 0-15% Health - Flee For Assist'),
(1163, 0, 0, 0, 4, 0, 10, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                         'Stonesplinter Skullthumper - On Aggro - Say Line 0'),
(1163, 0, 1, 0, 9, 0, 75, 0, 0, 0, 10000, 14000, 0, 5, 11, 1776, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0,             'Stonesplinter Skullthumper - Within 0-5 Range - Cast Gouge'),
(1163, 0, 2, 0, 2, 0, 100, 1, 0, 15, 0, 0, 0, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,                      'Stonesplinter Skullthumper - Between 0-15% Health - Flee For Assist (No Repeat)'),
(1164, 0, 0, 0, 4, 0, 10, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                         'Stonesplinter Bonesnapper - On Aggro - Say Line 0'),
(1164, 0, 1, 0, 9, 0, 80, 0, 0, 0, 12000, 20000, 0, 5, 11, 11976, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0,            'Stonesplinter Bonesnapper - Within 0-5 Range - Cast Strike'),
(1164, 0, 2, 0, 2, 0, 100, 1, 0, 15, 0, 0, 0, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,                      'Stonesplinter Bonesnapper - Between 0-15% Health - Flee For Assist (No Repeat)'),
(1165, 0, 0, 0, 4, 0, 10, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                         'Stonesplinter Geomancer - On Aggro - Say Line 0'),
(1165, 0, 1, 0, 0, 0, 100, 0, 0, 0, 15000, 15000, 0, 0, 11, 4979, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,            'Stonesplinter Geomancer - In Combat - Cast Quick Flame Ward'),
(1165, 0, 2, 0, 2, 0, 100, 1, 0, 15, 0, 0, 0, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,                      'Stonesplinter Geomancer - Between 0-15% Health - Flee For Assist (No Repeat)'),
(1166, 0, 0, 0, 4, 0, 10, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                         'Stonesplinter Seer - On Aggro - Say Line 0'),
(1166, 0, 1, 0, 0, 0, 100, 0, 0, 0, 2000, 2000, 0, 0, 11, 9532, 64, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0,             'Stonesplinter Seer - In Combat - Cast Lightning Bolt'),
(1166, 0, 2, 0, 2, 0, 100, 1, 0, 15, 0, 0, 0, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,                      'Stonesplinter Seer - Between 0-15% Health - Flee For Assist (No Repeat)'),
(1167, 0, 0, 0, 4, 0, 10, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                         'Stonesplinter Digger - On Aggro - Say Line 0'),
(1167, 0, 1, 0, 0, 0, 100, 0, 1000, 3000, 180000, 190000, 0, 0, 11, 7164, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,    'Stonesplinter Digger - In Combat - Cast Defensive Stance'),
(1167, 0, 2, 0, 9, 0, 100, 0, 0, 0, 5000, 9000, 0, 5, 11, 7386, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0,              'Stonesplinter Digger - Within 0-5 Range - Cast Sunder Armor'),
(1167, 0, 3, 0, 2, 0, 100, 1, 0, 15, 0, 0, 0, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,                      'Stonesplinter Digger - Between 0-15% Health - Flee For Assist (No Repeat)'),
--
(1169, 0, 0, 0, 4, 0, 10, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                         'Dark Iron Insurgent - On Aggro - Say Line 0'),
(1169, 0, 1, 0, 2, 0, 100, 1, 0, 80, 0, 0, 0, 0, 11, 7020, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                   'Dark Iron Insurgent - Between 0-80% Health - Cast Stoneform (No Repeat)'),
(1169, 0, 2, 0, 2, 0, 100, 1, 0, 40, 0, 0, 0, 0, 11, 7020, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                   'Dark Iron Insurgent - Between 0-40% Health - Cast Stoneform (No Repeat)'),
(1169, 0, 3, 0, 2, 0, 100, 1, 0, 15, 0, 0, 0, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,                      'Dark Iron Insurgent - Between 0-15% Health - Flee For Assist (No Repeat)'),
--
(1172, 0, 0, 0, 4, 0, 10, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                         'Tunnel Rat Vermin - On Aggro - Say Line 0'),
(1172, 0, 1, 0, 2, 0, 100, 1, 0, 15, 0, 0, 0, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,                      'Tunnel Rat Vermin - Between 0-15% Health - Flee For Assist (No Repeat)'),
(1173, 0, 0, 0, 4, 0, 10, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                         'Tunnel Rat Scout - On Aggro - Say Line 0'),
(1173, 0, 1, 0, 9, 0, 100, 0, 0, 0, 4000, 4000, 30, 60, 21, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,               'Tunnel Rat Scout - Outside 30 Range - Start Combat Movement'),
(1173, 0, 2, 0, 9, 0, 100, 0, 0, 0, 4000, 4000, 5, 30, 21, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                'Tunnel Rat Scout - Within 5-30 Range - Stop Combat Movement'),
(1173, 0, 3, 0, 9, 0, 100, 0, 0, 0, 4000, 4000, 0, 5, 21, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                 'Tunnel Rat Scout - Within 0-5 Range - Start Combat Movement'),
(1173, 0, 4, 0, 9, 0, 100, 0, 0, 0, 2000, 4000, 0, 0, 11, 6660, 512, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0,            'Tunnel Rat Scout - Within 5-30 Range - Cast Shoot'),
(1173, 0, 5, 0, 2, 0, 100, 1, 0, 15, 0, 0, 0, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,                      'Tunnel Rat Scout - Between 0-15% Health - Flee For Assist (No Repeat)'),
(1174, 0, 0, 0, 4, 0, 10, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                         'Tunnel Rat Geomancer - On Aggro - Say Line 0'),
(1174, 0, 1, 0, 0, 0, 100, 1, 500, 1500, 8800, 8800, 0, 0, 11, 4979, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,         'Tunnel Rat Geomancer - In Combat - Cast Quick Flame Ward'),
(1174, 0, 2, 0, 0, 0, 100, 0, 1000, 1000, 61000, 62000, 0, 0, 11, 134, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,       'Tunnel Rat Geomancer - In Combat - Cast Fire Shield'),
(1174, 0, 3, 0, 0, 0, 100, 0, 1000, 3000, 9000, 14000, 0, 0, 11, 2136, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0,       'Tunnel Rat Geomancer - In Combat - Cast Fire Blast'),
(1174, 0, 4, 0, 2, 0, 100, 1, 0, 15, 0, 0, 0, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,                      'Tunnel Rat Geomancer - Between 0-15% Health - Flee For Assist (No Repeat)'),
(1175, 0, 0, 0, 4, 0, 10, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                         'Tunnel Rat Digger - On Aggro - Say Line 0'),
(1175, 0, 1, 0, 0, 0, 100, 0, 1000, 3000, 180000, 184000, 0, 0, 11, 7164, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,    'Tunnel Rat Digger - In Combat - Cast Defensive Stance'),
(1175, 0, 2, 0, 9, 0, 100, 0, 0, 0, 5000, 9000, 0, 5, 11, 7386, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0,              'Tunnel Rat Digger - In Combat - Cast Sunder Armor'),
(1175, 0, 3, 0, 2, 0, 100, 1, 0, 15, 0, 0, 0, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,                      'Tunnel Rat Digger - Between 0-15% Health - Flee For Assist (No Repeat)'),
(1176, 0, 0, 0, 4, 0, 10, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                         'Tunnel Rat Forager - On Aggro - Say Line 0'),
(1176, 0, 1, 0, 0, 0, 100, 0, 3000, 5000, 49000, 60000, 0, 0, 11, 7365, 0, 0, 0, 0, 0, 21, 5, 0, 0, 0, 0, 0, 0, 0,     'Tunnel Rat Forager - Within 0-5 Range - Cast Bottle of Poison'),
(1176, 0, 2, 0, 2, 0, 100, 1, 0, 15, 0, 0, 0, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,                      'Tunnel Rat Forager - Between 0-15% Health - Flee For Assist (No Repeat)'),
(1177, 0, 0, 0, 4, 0, 10, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                         'Tunnel Rat Surveyor - On Aggro - Say Line 0'),
(1177, 0, 1, 0, 2, 0, 100, 1, 0, 15, 0, 0, 0, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,                      'Tunnel Rat Surveyor - Between 0-15% Health - Flee For Assist (No Repeat)'),
--
(1178, 0, 0, 0, 4, 0, 10, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                         'Mo\'grosh Ogre - On Aggro - Say Line 0'),
(1178, 0, 1, 0, 11, 0, 100, 0, 0, 0, 0, 0, 0, 0, 11, 7095, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                   'Mo\'grosh Ogre - On Respawn - Cast Knockdown Proc'),
(1179, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 21, 30, 0, 0, 0, 0, 0, 0, 0,                       'Mo\'grosh Enforcer - In Combat - Say Line 0'),
(1179, 0, 1, 2, 0, 0, 100, 0, 7400, 14500, 46600, 53700, 0, 0, 11, 13730, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,    'Mo\'grosh Enforcer - In Combat - Cast Demoralizing Shout'),
(1179, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 0, 5, 15, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                      'Mo\'grosh Enforcer - In Combat - Play Emote 15'),
(1179, 0, 3, 0, 0, 0, 100, 0, 3000, 18000, 15000, 30000, 0, 0, 11, 8198, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,     'Mo\'grosh Enforcer - In Combat - Cast Thunder Clap'),
(1179, 0, 4, 0, 11, 0, 100, 0, 0, 0, 0, 0, 0, 0, 11, 7165, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                   'Mo\'grosh Enforcer - On Respawn - Cast Battle Stance'),
(1180, 0, 0, 0, 4, 0, 10, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                         'Mo\'grosh Brute - On Aggro - Say Line 0'),
(1181, 0, 0, 0, 4, 0, 10, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                         'Mo\'grosh Shaman - On Aggro - Say Line 0'),
(1181, 0, 1, 0, 0, 0, 100, 0, 0, 0, 2000, 2000, 0, 0, 11, 9532, 64, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0,             'Mo\'grosh Shaman - In Combat - Cast Lightning Bolt'),
(1181, 0, 2, 0, 0, 0, 60, 0, 1000, 2000, 60000, 60000, 0, 0, 11, 3229, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,       'Mo\'grosh Shaman - In Combat - Cast Quick Bloodlust'),
(1183, 0, 0, 0, 4, 0, 15, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0,                         'Mo\'grosh Mystic - On Aggro - Say Line 0'),
(1183, 0, 1, 0, 0, 0, 100, 0, 0, 0, 2000, 2000, 0, 0, 11, 9532, 64, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0,             'Mo\'grosh Mystic - In Combat - Cast Lightning Bolt'),
(1183, 0, 2, 0, 74, 0, 100, 0, 0, 0, 60000, 60000, 50, 40, 11, 547, 65, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0,         'Mo\'grosh Mystic - Friendly Between 0-50% Health - Cast Healing Wave'),
--
(1184, 0, 0, 0, 11, 0, 100, 0, 0, 0, 0, 0, 0, 0, 11, 7276, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                   'Cliff Lurker - On Respawn - Cast Poison Proc'),
(1185, 0, 0, 0, 11, 0, 100, 0, 0, 0, 0, 0, 0, 0, 11, 7276, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                   'Wood Lurker - On Respawn - Cast Poison Proc'),
(1190, 0, 0, 0, 4, 0, 30, 0, 0, 0, 0, 0, 0, 0, 11, 6268, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                     'Mountain Boar - On Aggro - Cast Rushing Charge'),
(1191, 0, 0, 0, 4, 0, 30, 0, 0, 0, 0, 0, 0, 0, 11, 6268, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                     'Mangy Mountain Boar - On Aggro - Cast Rushing Charge'),
(1192, 0, 0, 0, 4, 0, 30, 0, 0, 0, 0, 0, 0, 0, 11, 6268, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                     'Elder Mountain Boar - On Aggro - Cast Rushing Charge'),
(1194, 0, 0, 0, 0, 0, 100, 0, 7000, 14400, 35000, 42000, 0, 0, 11, 8014, 32, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0,    'Mountain Buzzard - In Combat - Cast Tetanus'),
(1195, 0, 0, 0, 11, 0, 100, 0, 0, 0, 0, 0, 0, 0, 11, 7276, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                   'Forest Lurker - On Respawn - Cast Poison Proc'),
--
(1197, 0, 0, 0, 4, 0, 10, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                         'Stonesplinter Shaman - On Aggro - Say Line 0'),
(1197, 0, 1, 0, 74, 0, 100, 0, 0, 0, 7600, 35700, 50, 40, 11, 547, 1, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0,           'Stonesplinter Shaman - Friendly Between 0-50% Health - Cast Healing Wave'),
(1197, 0, 2, 0, 2, 0, 100, 1, 0, 15, 0, 0, 0, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,                      'Stonesplinter Shaman - Between 0-15% Health - Flee For Assist (No Repeat)'),
(1202, 0, 0, 0, 4, 0, 10, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                         'Tunnel Rat Kobold - On Aggro - Say Line 0'),
(1202, 0, 1, 0, 4, 0, 10, 0, 0, 0, 0, 0, 0, 0, 1, 2, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0,                         'Tunnel Rat Kobold - On Aggro - Say Line 2'),
(1202, 0, 2, 0, 11, 0, 100, 0, 0, 0, 0, 0, 0, 0, 11, 8876, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                   'Tunnel Rat Kobold - On Respawn - Cast Thrash Proc'),
(1202, 0, 3, 0, 2, 0, 100, 1, 0, 15, 0, 0, 0, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,                      'Tunnel Rat Kobold - Between 0-15% Health - Flee For Assist (No Repeat)'),
--
(1205, 0, 0, 0, 4, 0, 100, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 21, 40, 0, 0, 0, 0, 0, 0, 0,                      'Grawmug - On Aggro - Say Line 0'),
(1205, 0, 1, 0, 0, 0, 100, 0, 3000, 5000, 8000, 12000, 0, 0, 11, 3229, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,       'Grawmug - In Combat - Cast Quick Bloodlust'),
(1205, 0, 2, 0, 2, 0, 100, 1, 0, 15, 0, 0, 0, 0, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,                      'Grawmug - Between 0-15% Health - Flee For Assist (No Repeat)'),
(1205, 0, 3, 0, 11, 0, 100, 0, 0, 0, 0, 0, 0, 0, 11, 3417, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                   'Grawmug - On Respawn - Cast Thrash'),
(1206, 0, 1, 0, 9, 0, 100, 0, 0, 0, 8800, 8800, 0, 5, 11, 3393, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0,              'Gnasher - Within 0-5 Range - Cast Consume Flesh'),
(1206, 0, 2, 0, 2, 0, 100, 1, 0, 15, 0, 0, 0, 0, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,                      'Gnasher - Between 0-15% Health - Flee For Assist (No Repeat)'),
(1207, 0, 1, 0, 9, 0, 80, 0, 0, 0, 6000, 10800, 0, 5, 11, 6253, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0,              'Brawler - Within 0-5 Range - Cast Backhand'),
(1207, 0, 2, 0, 2, 0, 100, 1, 0, 15, 0, 0, 0, 0, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,                      'Brawler - Between 0-15% Health - Flee For Assist (No Repeat)'),
(1210, 0, 0, 0, 4, 0, 100, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 21, 40, 0, 0, 0, 0, 0, 0, 0,                      'Chok\'sul - On Aggro - Say Line 0'),
(1210, 0, 1, 0, 0, 0, 100, 0, 4000, 13000, 10000, 23000, 0, 0, 11, 18072, 0, 0, 0, 0, 0, 21, 10, 0, 0, 0, 0, 0, 0, 0,  'Chok\'sul - Within 0-10 Range - Cast Uppercut'),
--
(1393, 0, 0, 0, 4, 0, 10, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                         'Berserk Trogg - On Aggro - Say Line 0'),
(1393, 0, 1, 2, 2, 0, 100, 0, 0, 40, 0, 0, 0, 0, 11, 3019, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                   'Berserk Trogg - Between 0-40% Health - Cast Frenzy'),
(1393, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                       'Berserk Trogg - On Enrage - Say Line 1'),
(1393, 0, 3, 0, 2, 0, 100, 1, 0, 15, 0, 0, 0, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,                      'Berserk Trogg - Between 0-15% Health - Flee For Assist (No Repeat)'),
(1398, 0, 0, 0, 4, 0, 100, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                        'Boss Galgosh - On Aggro - Say Line 0'),
(1398, 0, 1, 2, 0, 0, 100, 0, 5600, 15500, 18400, 33800, 0, 0, 11, 3019, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,     'Boss Galgosh - In Combat - Cast Frenzy'),
(1398, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                       'Boss Galgosh - On Frenzy - Say Line 1'),
(1399, 0, 0, 0, 4, 0, 100, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                        'Magosh - On Aggro - Say Line 0'),
(1399, 0, 1, 0, 0, 0, 100, 0, 0, 0, 2000, 2000, 0, 0, 11, 9532, 64, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0,             'Magosh - In Combat - Cast Lightning Bolt'),
(1399, 0, 2, 0, 74, 0, 100, 0, 0, 0, 25000, 30000, 50, 40, 11, 913, 1, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0,          'Magosh - Friendly Between 0-50% Health - Cast Healing Wave'),
(1399, 0, 3, 0, 0, 0, 100, 0, 1000, 4000, 20000, 35000, 0, 0, 11, 2606, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0,      'Magosh - In Combat - Cast Shock'),
(1425, 0, 0, 0, 74, 0, 100, 0, 0, 0, 20100, 28100, 40, 40, 11, 6074, 1, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0,         'Grizlak - Friendly Between 0-40% Health - Cast Renew'),
(1425, 0, 1, 0, 2, 0, 100, 1, 0, 15, 0, 0, 0, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,                      'Grizlak - Between 0-15% Health - Flee For Assist (No Repeat)'),
(2476, 0, 0, 0, 0, 0, 85, 0, 4100, 13900, 32200, 46200, 0, 0, 11, 3427, 0, 0, 0, 0, 0, 21, 5, 0, 0, 0, 0, 0, 0, 0,     'Large Loch Crocolisk - Within 0-5 Range - Cast Infected Wound'),
--
(2477, 0, 0, 0, 4, 0, 100, 0, 0, 0, 0, 0, 0, 0, 11, 7165, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                    'Gradok - On Aggro - Cast Battle Stance'),
(2477, 0, 1, 0, 2, 0, 100, 1, 0, 15, 0, 0, 0, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,                      'Gradok - Between 0-15% Health - Flee For Assist (No Repeat)'),
(2478, 0, 0, 0, 4, 0, 100, 0, 0, 0, 0, 0, 0, 0, 11, 7164, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                    'Haren Swifthoof - On Aggro - Cast Defensive Stance'),
(2478, 0, 1, 0, 2, 0, 100, 1, 0, 15, 0, 0, 0, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,                      'Haren Swifthoof - Between 0-15% Health - Flee For Assist (No Repeat)'),
(3291, 0, 0, 0, 1, 0, 100, 0, 1000, 1000, 60000, 60000, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,          'Greishan Ironstove - Out of Combat - Say Random Line'),
(7170, 0, 0, 0, 4, 0, 100, 0, 0, 0, 0, 0, 0, 0, 11, 7165, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                    'Thragomm - On Aggro - Cast Battle Stance'),
(7170, 0, 1, 0, 2, 0, 100, 1, 0, 15, 0, 0, 0, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,                      'Thragomm - Between 0-15% Health - Flee For Assist (No Repeat)'),
--
(14267, 0, 0, 0, 4, 0, 80, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0,                        'Emogg the Crusher - On Aggro - Say Line 0');


-- Mountaineer Kalmir (1283) - correct orientation upon reaching the gate waypoint
UPDATE `waypoint_scripts` SET `o` = 5.8294 WHERE `id` = 1208;

-- Naarh, Tyraw, Morran, Janha and Bingles: waypoints
UPDATE `creature` SET `MovementType` = 2 WHERE `guid` IN (8197, 8237, 8251, 8252, 8264);

UPDATE `creature_addon` SET `path_id` = 81970 WHERE `guid` = 8197;
UPDATE `creature_addon` SET `path_id` = 82370 WHERE `guid` = 8237;
UPDATE `creature_addon` SET `path_id` = 82510 WHERE `guid` = 8251;
UPDATE `creature_addon` SET `path_id` = 82520 WHERE `guid` = 8252;
UPDATE `creature_addon` SET `path_id` = 82640 WHERE `guid` = 8264;

DELETE FROM `waypoint_data` WHERE `id` IN (81970, 82370, 82510, 82520, 82640);
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`) VALUES
--
(81970, 1, -5368.92, -3747.12, 304.661, 2.00713, 540000, 0, 0, 100),
(81970, 2, -5375.95, -3731.8, 300.288, NULL, 5000, 0, 1217, 100),
--
(82370, 1, -5305.82, -2970.57, 346.63, 3.66186, 60000, 0, 0, 100),
(82370, 2, -5292.37, -2966.7, 350.693, NULL, 0, 0, 0, 100),
--
(82510, 1, -5849.87, -2623.93, 322.967, 4.36332, 300000, 0, 0, 100),
(82510, 2, -5855.4, -2622.75, 322.966, NULL, 0, 0, 0, 100),
(82510, 3, -5858.91, -2624.26, 322.952, NULL, 0, 0, 0, 100),
(82510, 4, -5859.2, -2628.2, 322.888, NULL, 0, 0, 0, 100),
(82510, 5, -5853.35, -2636.76, 315.844, NULL, 0, 0, 0, 100),
(82510, 6, -5849.28, -2638.34, 315.844, NULL, 0, 0, 0, 100),
(82510, 7, -5843.21, -2634.61, 315.844, NULL, 0, 0, 0, 100),
(82510, 8, -5842.02, -2630.5, 315.844, NULL, 0, 0, 0, 100),
(82510, 9, -5843.46, -2627.66, 315.844, NULL, 0, 0, 0, 100),
(82510, 10, -5847.73, -2628.23, 315.767, NULL, 0, 0, 0, 100),
(82510, 11, -5858.69, -2636.54, 308.974, NULL, 0, 0, 0, 100),
(82510, 12, -5866.647, -2641.729, 308.94263, NULL, 0, 0, 0, 100),
(82510, 13, -5881, -2651.28, 309.039, NULL, 30000, 0, 0, 100),
(82510, 14, -5866.647, -2641.729, 308.94263, NULL, 0, 0, 0, 100),
(82510, 15, -5858.95, -2636.58, 308.972, NULL, 0, 0, 0, 100),
(82510, 16, -5847.68, -2628.36, 315.751, NULL, 0, 0, 0, 100),
(82510, 17, -5844.15, -2628, 315.842, NULL, 0, 0, 0, 100),
(82510, 18, -5841.93, -2631.17, 315.842, NULL, 0, 0, 0, 100),
(82510, 19, -5843.68, -2634.91, 315.842, NULL, 0, 0, 0, 100),
(82510, 20, -5848.84, -2638.41, 315.842, NULL, 0, 0, 0, 100),
(82510, 21, -5853.28, -2636.8, 315.844, NULL, 0, 0, 0, 100),
(82510, 22, -5859.25, -2628.26, 322.87, NULL, 0, 0, 0, 100),
(82510, 23, -5858.64, -2624.03, 322.952, NULL, 0, 0, 0, 100),
(82510, 24, -5854.85, -2622.61, 322.966, NULL, 0, 0, 0, 100),
--
(82520, 1, -5886.33, -2634.9, 310.668, 5.48033, 84000, 0, 0, 100),
(82520, 2, -5894.6, -2632.87, 311.247, NULL, 0, 0, 0, 100),
(82520, 3, -5906.15, -2623.32, 311.803, NULL, 0, 0, 0, 100),
(82520, 4, -5909.64, -2608.59, 312.357, NULL, 0, 0, 0, 100),
(82520, 5, -5905.22, -2599.39, 312.012, NULL, 0, 0, 0, 100),
(82520, 6, -5896.29, -2589.02, 309.246, NULL, 0, 0, 0, 100),
(82520, 7, -5886.89, -2578.14, 305.472, NULL, 0, 0, 0, 100),
(82520, 8, -5875.59, -2564.47, 306.491, NULL, 30000, 0, 0, 100),
(82520, 9, -5888.04, -2579.18, 305.856, NULL, 0, 0, 0, 100),
(82520, 10, -5895.6, -2588.05, 308.951, NULL, 0, 0, 0, 100),
(82520, 11, -5907.74, -2602.11, 312.46, NULL, 0, 0, 0, 100),
(82520, 12, -5909.78, -2612.69, 311.958, NULL, 0, 0, 0, 100),
(82520, 13, -5906.82, -2621.52, 311.709, NULL, 0, 0, 0, 100),
(82520, 14, -5894.56, -2634.76, 311.043, NULL, 0, 0, 0, 100),
--
(82640, 1, -4800.73, -2637.72, 328.456, NULL, 0, 0, 0, 100),
(82640, 2, -4797.1, -2641.64, 328.567, NULL, 0, 0, 0, 100),
(82640, 3, -4794.19, -2646.7, 328.426, NULL, 0, 0, 0, 100),
(82640, 4, -4789.69, -2656.12, 328.41, NULL, 0, 0, 0, 100),
(82640, 5, -4788.04, -2666.82, 328.714, NULL, 0, 0, 0, 100),
(82640, 6, -4789.59, -2677.43, 328.82, NULL, 0, 0, 0, 100),
(82640, 7, -4792.13, -2684.83, 328.507, NULL, 0, 0, 0, 100),
(82640, 8, -4795.88, -2691.25, 327.686, NULL, 0, 0, 0, 100),
(82640, 9, -4800.03, -2697.67, 326.962, NULL, 0, 0, 0, 100),
(82640, 10, -4803.19, -2703.06, 326.871, NULL, 30000, 0, 0, 100),
(82640, 11, -4800.03, -2697.67, 326.962, NULL, 0, 0, 0, 100),
(82640, 12, -4795.88, -2691.25, 327.686, NULL, 0, 0, 0, 100),
(82640, 13, -4792.57, -2685.6, 328.418, NULL, 0, 0, 0, 100),
(82640, 14, -4789.66, -2677.66, 328.833, NULL, 0, 0, 0, 100),
(82640, 15, -4788.12, -2667.33, 328.698, NULL, 0, 0, 0, 100),
(82640, 16, -4789.64, -2656.55, 328.42, NULL, 0, 0, 0, 100),
(82640, 17, -4793.76, -2647.35, 328.42, NULL, 0, 0, 0, 100),
(82640, 18, -4796.69, -2642.33, 328.556, NULL, 0, 0, 0, 100),
(82640, 19, -4800.07, -2638.19, 328.459, NULL, 0, 0, 0, 100),
(82640, 20, -4802.5, -2636.06, 328.968, NULL, 0, 0, 0, 100),
(82640, 21, -4805.56, -2635.79, 328.968, NULL, 0, 0, 0, 100),
(82640, 22, -4814.29, -2636.04, 327.144, NULL, 0, 0, 0, 100),
(82640, 23, -4816.38, -2641.85, 327.193, NULL, 0, 0, 0, 100),
(82640, 24, -4816.95, -2645.89, 327.099, NULL, 0, 0, 0, 100),
(82640, 25, -4817.51, -2655.67, 327.115, NULL, 0, 0, 0, 100),
(82640, 26, -4817.71, -2662.3, 327.128, NULL, 0, 0, 0, 100),
(82640, 27, -4817.95, -2668.35, 330.044, NULL, 0, 0, 0, 100),
(82640, 28, -4818.68, -2676.13, 333.946, NULL, 0, 0, 0, 100),
(82640, 29, -4818.69, -2676.78, 334, NULL, 0, 0, 0, 100),
(82640, 30, -4817.16, -2678.29, 334, NULL, 0, 0, 0, 100),
(82640, 31, -4814.01, -2677.88, 334, NULL, 0, 0, 0, 100),
(82640, 32, -4810.96, -2676.28, 334, NULL, 0, 0, 0, 100),
(82640, 33, -4809.19, -2674.27, 334, 0.64577, 270000, 0, 0, 100),
(82640, 34, -4810.91, -2676.19, 334, NULL, 0, 0, 0, 100),
(82640, 35, -4813.97, -2677.89, 334, NULL, 0, 0, 0, 100),
(82640, 36, -4816.8, -2678.54, 334, NULL, 0, 0, 0, 100),
(82640, 37, -4818.68, -2676.89, 334, NULL, 0, 0, 0, 100),
(82640, 38, -4818.44, -2671.39, 331.577, NULL, 0, 0, 0, 100),
(82640, 39, -4817.67, -2662.55, 327.13, NULL, 0, 0, 0, 100),
(82640, 40, -4817.38, -2655.74, 327.116, NULL, 0, 0, 0, 100),
(82640, 41, -4817, -2648.09, 327.099, NULL, 0, 0, 0, 100),
(82640, 42, -4817.36, -2639.97, 327.249, NULL, 0, 0, 0, 100),
(82640, 43, -4814.87, -2636.35, 327.169, NULL, 0, 0, 0, 100),
(82640, 44, -4811.22, -2635.59, 327.102, NULL, 0, 0, 0, 100),
(82640, 45, -4805.66, -2635.83, 328.969, NULL, 0, 0, 0, 100),
(82640, 46, -4803.05, -2635.99, 328.968, NULL, 0, 0, 0, 100);

-- Bingles' one line.
DELETE FROM `waypoint_scripts` WHERE `id` = 1217;
INSERT INTO `waypoint_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`, `guid`) VALUES
(1217, 0, 0, 0, 0, 2633, 0, 0, 0, 0, 1841902);

-- Sixteen Thelsamar, Dam and Mo'grosh spawns - wander their posts instead of standing still
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 2 WHERE `guid` = 9358; -- Chok'sul 1210
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5 WHERE `guid` = 8303; -- Mountaineer Bludd 2511
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5 WHERE `guid` = 8234; -- Mountaineer Cragg 2509
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5 WHERE `guid` = 8235; -- Mountaineer Dalk 1338
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5 WHERE `guid` = 8238; -- Mountaineer Fazgard 2515
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5 WHERE `guid` = 8239; -- Mountaineer Harn 2506
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 3 WHERE `guid` = 8736; -- Mountaineer Langarr 2517
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 3 WHERE `guid` = 8745; -- Mountaineer Ozmok 2510
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 7 WHERE `guid` = 8306; -- Mountaineer Roghan 2512
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5 WHERE `guid` = 8233; -- Mountaineer Swarth 2518
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5 WHERE `guid` = 8302; -- Mountaineer Uthan 2507
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5 WHERE `guid` = 8240; -- Mountaineer Wuar 2508
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5 WHERE `guid` = 8242; -- Mountaineer Angst 2527
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5 WHERE `guid` = 8243; -- Mountaineer Haggil 2528
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5 WHERE `guid` = 8241; -- Mountaineer Haggis 2524
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 2 WHERE `guid` = 8244; -- Mountaineer Morlic 2526

UPDATE `creature_template_addon` SET `auras` = '3417' WHERE `entry` = 1224; -- Young Threshadon (1224) - thrash on sight
UPDATE `creature_template_addon` SET `auras` = '3417' WHERE `entry` = 1693; -- Loch Crocolisk (1693) - thrash on sight
UPDATE `creature_template_addon` SET `auras` = '9941' WHERE `entry` = 4872; -- Obsidian Golem (4872) - reflects spells

-- Mountaineer Brokk (1276) - ambient route - announces his patrol before setting off
UPDATE `waypoint_data` SET `action` = 1218 WHERE `id` = 89000 AND `point` = 1;
DELETE FROM `waypoint_scripts` WHERE `id` = 1218;
INSERT INTO `waypoint_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`, `guid`) VALUES
(1218, 0, 0, 0, 0, 114, 0, 0, 0, 0, 1841903);

-- Miran (1379) quest 309 - escorts the shipment, warns of the ambush, and thanks you once both raiders are down
-- 2 of the lines he says were missing in AC and one was firing at the wrong time
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 1379;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`,
`event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`,
`action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`,
`target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
--
(1379, 0, 0, 1, 19, 0, 100, 512, 309, 0, 0, 0, 0, 0, 53, 1, 1379, 0, 309, 10000, 1, 7, 0, 0, 0, 0, 0, 0, 0, 0,         'Miran - On Quest 309 Accept - Start Escort'),
(1379, 0, 1, 0, 61, 0, 100, 512, 0, 0, 0, 0, 0, 0, 63, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                    'Miran - Linked - Zero Ambush Counter'),
(1379, 0, 2, 3, 40, 0, 100, 512, 12, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                    'Miran - On WP 12 Reached - Say Line 1'),
(1379, 0, 3, 4, 61, 0, 100, 512, 0, 0, 0, 0, 0, 0, 54, 10000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                'Miran - Linked - Pause Waypoints'),
(1379, 0, 4, 5, 61, 0, 100, 512, 0,0,0,0,0,0, 12, 2149, 4, 30000, 0, 1, 0, 8, 0,0,0,0, -5683.13, -3618.7, 312.98, 1.3, 'Miran - Linked - Summon Dark Iron Raider'),
(1379, 0, 5, 6, 61, 0, 100, 512, 0,0,0,0,0,0, 12, 2149, 4, 30000, 0, 1, 0, 8, 0,0,0,0, -5661.2, -3609.89, 312.5, 2.65, 'Miran - Linked - Summon Dark Iron Raider'),
(1379, 0, 6, 0, 61, 0, 100, 512, 0, 0, 0, 0, 0, 0, 1, 0, 6000, 0, 0, 0, 0, 19, 2149, 40, 0, 0, 0, 0, 0, 0,             'Miran - Linked - Raider Says Line 0'),
(1379, 0, 7, 0, 82, 0, 100, 512, 2149, 0, 0, 0, 0, 0, 63, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                 'Miran - On Summoned Raider Dies - Increment Counter'),
(1379, 0, 8, 9, 77, 0, 100, 512, 1, 2, 0, 0, 0, 0, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                     'Miran - On Both Raiders Dead - Say Line 2'),
(1379, 0, 9, 0, 61, 0, 100, 512, 0, 0, 0, 0, 0, 0, 65, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                    'Miran - Linked - Resume Escort'),
(1379, 0, 10, 0, 40, 0, 100, 0, 24, 0, 0, 0, 0, 0, 1, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                     'Miran - On WP 24 Reached - Say Line 3'),
(1379, 0, 11, 0, 4, 0, 100, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                       'Miran - On Aggro - Say Line 0'),
(1379, 0, 12, 0, 52, 0, 100, 0, 0, 2149, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                   'Miran - On Text Over - Say Line 0');
