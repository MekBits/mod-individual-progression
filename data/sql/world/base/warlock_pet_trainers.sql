/* 
    This file restores warlock demon trainers in the Eastern Kingdoms and Kalimdor
    In WotLK grimoires became absolete, new ranks and spells were now automatically learned on the respective levels.
*/

/*
    Demon trainers as grimoire vendors, the grimoires' learn spells and the demon trainer vendor lists.
    Kept in ipp_pet_* tables and written to creature_template/npc_vendor/item_template at startup only
    while IndividualProgression.WarlockDemonTrainers = 1; with 0 AzerothCore's values are restored
    (IndividualProgression.cpp, ApplyPetDatabaseSettings). Changing the key needs a restart.
*/
-- Whether the startup step has written the ipp_pet_* data to the core tables (rows written by C++ only).
CREATE TABLE IF NOT EXISTS `ipp_pet_state` (
    `feature` varchar(16) NOT NULL,
    `applied` tinyint unsigned NOT NULL DEFAULT 0,
    PRIMARY KEY (`feature`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE IF NOT EXISTS `ipp_pet_trainer_npcflag` (
    `entry` int unsigned NOT NULL,
    `npcflag` int unsigned NOT NULL,
    PRIMARY KEY (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE IF NOT EXISTS `ipp_pet_backup_trainer_npcflag` LIKE `ipp_pet_trainer_npcflag`;
CREATE TABLE IF NOT EXISTS `ipp_pet_npc_vendor` LIKE `npc_vendor`;
CREATE TABLE IF NOT EXISTS `ipp_pet_backup_npc_vendor` LIKE `npc_vendor`;
CREATE TABLE IF NOT EXISTS `ipp_pet_grimoire` (
    `entry` int unsigned NOT NULL,
    `spellid_1` int NOT NULL,
    `spellid_2` int NOT NULL,
    `spelltrigger_2` tinyint unsigned NOT NULL,
    `description` varchar(255) NOT NULL,
    PRIMARY KEY (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE IF NOT EXISTS `ipp_pet_backup_grimoire` LIKE `ipp_pet_grimoire`;

/* Label all vanilla warlock demon trainers as vendors  - npcflag was 2, set to 130 */
DELETE FROM `ipp_pet_trainer_npcflag`;
INSERT INTO `ipp_pet_trainer_npcflag` (`entry`, `npcflag`) SELECT `entry`, 130 FROM `creature_template` WHERE `entry` IN 
(5520, 5749, 5750, 5753, 5815, 6027, 6328, 6373, 6374, 6376, 6382, 12776, 12807, 15494, 16267, 16649, 23535);


/* Add warlock pet spells to warlock pet trainer vendor inventories */
/* Three versions, because demon trainers sell 20, 46 or 83 grimoires */

/* Demon Trainer with 20 items */
DELETE FROM `ipp_pet_npc_vendor` WHERE `entry` = 200001;
INSERT INTO `ipp_pet_npc_vendor` (`entry`, `item`, `VerifiedBuild`) VALUES
(200001, 16302 ,0), (200001, 16316 ,0), (200001, 16317 ,0), (200001, 16318 ,0), (200001, 16319 ,0),
(200001, 16320 ,0), (200001, 16321 ,0), (200001, 16322 ,0), (200001, 16323 ,0), (200001, 16324 ,0),
(200001, 16325 ,0), (200001, 16326 ,0), (200001, 16327 ,0), (200001, 16328 ,0), (200001, 16329 ,0),
(200001, 16330 ,0), (200001, 16331 ,0), (200001, 22179 ,0), (200001, 22180 ,0), (200001, 22181 ,0);

/* Demon Trainer with 46 items */
DELETE FROM `ipp_pet_npc_vendor` WHERE `entry` = 200002;
INSERT INTO `ipp_pet_npc_vendor` (`entry`, `item`, `VerifiedBuild`) VALUES 
(200002, 16346 ,0), (200002, 16347 ,0), (200002, 16348 ,0), (200002, 16349 ,0), (200002, 16350 ,0),
(200002, 16351 ,0), (200002, 16352 ,0), (200002, 16353 ,0), (200002, 16354 ,0), (200002, 16355 ,0),
(200002, 16356 ,0), (200002, 16357 ,0), (200002, 16358 ,0), (200002, 16359 ,0), (200002, 16360 ,0),
(200002, 16361 ,0), (200002, 16362 ,0), (200002, 16363 ,0), (200002, 16364 ,0), (200002, 16365 ,0),
(200002, 16366 ,0), (200002, 22182 ,0), (200002, 22183 ,0), (200002, 22184 ,0), (200002, 22185 ,0),
(200002, 28068 ,0);

/* Demon Trainer with 83 items for sale */
DELETE FROM `ipp_pet_npc_vendor` WHERE `entry` = 200003;
INSERT INTO `ipp_pet_npc_vendor` (`entry`, `item`, `VerifiedBuild`) VALUES
(200003, 16368 ,0), (200003, 16371 ,0), (200003, 16372 ,0), (200003, 16373 ,0), (200003, 16374 ,0),
(200003, 16375 ,0), (200003, 16376 ,0), (200003, 16377 ,0), (200003, 16378 ,0), (200003, 16379 ,0),
(200003, 16380 ,0), (200003, 16381 ,0), (200003, 16382 ,0), (200003, 16383 ,0), (200003, 16388 ,0),
-- (200003, 16384 ,0), (200003, 16385 ,0), (200003, 16386 ,0), (200003, 16387 ,0), (200003, 22190 ,0), -- Tainted Blood, doesn't exist in WotLK
(200003, 16389 ,0), (200003, 16390 ,0), (200003, 22186 ,0), (200003, 22187 ,0), (200003, 22188 ,0), 
(200003, 22189 ,0), (200003, 23711 ,0), (200003, 23730 ,0), (200003, 23731 ,0), (200003, 23734 ,0),
(200003, 23745 ,0), (200003, 23755 ,0), (200003, 25469 ,0), (200003, 25900 ,0), (200003, 28071 ,0),
(200003, 28072 ,0), (200003, 28073 ,0);

/* Add correct amount of grimoires to Demon Trainers */
DELETE FROM `ipp_pet_npc_vendor` WHERE `entry` IN (5520, 5749, 5750, 5753, 5815, 6027, 6328, 6373, 6374, 6376, 6382, 12776, 12807, 15494, 16267, 16649, 23535);
INSERT INTO `ipp_pet_npc_vendor` (`entry`, `item`, `VerifiedBuild`) VALUES 
 (5520, -200001 ,0), (5520, -200002 ,0), (5520, -200003 ,0),
 (5749, -200001 ,0),
 (5750, -200001 ,0), (5750, -200002 ,0),
 (5753, -200001 ,0), (5753, -200002 ,0), (5753, -200003 ,0),
 (5815, -200001 ,0), (5815, -200002 ,0), (5815, -200003 ,0),
 (6027, -200001 ,0), (6027, -200002 ,0),
 (6328, -200001 ,0), (6328, -200002 ,0),
 (6373, -200001 ,0),
 (6374, -200001 ,0), (6374, -200002 ,0),
 (6376, -200001 ,0),
 (6382, -200001 ,0), (6382, -200002 ,0), (6382, -200003 ,0),
(12776, -200001 ,0),
(12807, -200001 ,0), (12807, -200002 ,0), (12807, -200003 ,0),
(15494, -200001 ,0),
(16267, -200001 ,0), (16267, -200002 ,0), (16267, -200003 ,0),
(16649, -200001 ,0), (16649, -200002 ,0), (16649, -200003 ,0),
(23535, -200001 ,0), (23535, -200002 ,0), (23535, -200003 ,0);

-- learn dummy spells after using grimoires
DELETE FROM `ipp_pet_grimoire`;
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (16302, 483, 607799, 6, 'Teaches Imp Firebolt (Rank 2).');
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (16316, 483, 607800, 6, 'Teaches Imp Firebolt (Rank 3).');
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (16317, 483, 607801, 6, 'Teaches Imp Firebolt (Rank 4).');
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (16318, 483, 607802, 6, 'Teaches Imp Firebolt (Rank 5).');
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (16319, 483, 611762, 6, 'Teaches Imp Firebolt (Rank 6).');
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (16320, 483, 611763, 6, 'Teaches Imp Firebolt (Rank 7).');
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (22179, 483, 627267, 6, 'Teaches Imp Firebolt (Rank 8).');

REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (16321, 483, 606307, 6, 'Teaches Imp Blood Pact (Rank 1).');
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (16322, 483, 607804, 6, 'Teaches Imp Blood Pact (Rank 2).');
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (16323, 483, 607805, 6, 'Teaches Imp Blood Pact (Rank 3).');
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (16324, 483, 611766, 6, 'Teaches Imp Blood Pact (Rank 4).');
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (16325, 483, 611767, 6, 'Teaches Imp Blood Pact (Rank 5).');
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (22180, 483, 627268, 6, 'Teaches Imp Blood Pact (Rank 6).');

REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (16326, 483, 602947, 6, 'Teaches Imp Fire Shield (Rank 1).');
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (16327, 483, 608316, 6, 'Teaches Imp Fire Shield (Rank 2).');
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (16328, 483, 608317, 6, 'Teaches Imp Fire Shield (Rank 3).');
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (16329, 483, 611770, 6, 'Teaches Imp Fire Shield (Rank 4).');
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (16330, 483, 611771, 6, 'Teaches Imp Fire Shield (Rank 5).');
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (22181, 483, 627269, 6, 'Teaches Imp Fire Shield (Rank 6).');

REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (16331, 483, 604511, 6, 'Teaches Imp Phase Shift.');

REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (16346, 483, 607809, 6, 'Teaches Voidwalker Torment (Rank 2).');
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (16347, 483, 607810, 6, 'Teaches Voidwalker Torment (Rank 3).');
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (16348, 483, 607811, 6, 'Teaches Voidwalker Torment (Rank 4).');
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (16349, 483, 611774, 6, 'Teaches Voidwalker Torment (Rank 5).');
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (16350, 483, 611775, 6, 'Teaches Voidwalker Torment (Rank 6).');
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (22182, 483, 627270, 6, 'Teaches Voidwalker Torment (Rank 7).');

REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (16351, 483, 607812, 6, 'Teaches Voidwalker Sacrifice (Rank 1).');
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (16352, 483, 619438, 6, 'Teaches Voidwalker Sacrifice (Rank 2).');
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (16353, 483, 619440, 6, 'Teaches Voidwalker Sacrifice (Rank 3).');
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (16354, 483, 619441, 6, 'Teaches Voidwalker Sacrifice (Rank 4).');
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (16355, 483, 619442, 6, 'Teaches Voidwalker Sacrifice (Rank 5).');
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (16356, 483, 619443, 6, 'Teaches Voidwalker Sacrifice (Rank 6).');
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (22185, 483, 627273, 6, 'Teaches Voidwalker Sacrifice (Rank 7).');

REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (16357, 483, 617767, 6, 'Teaches Voidwalker Consume Shadows (Rank 1).');
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (16358, 483, 617850, 6, 'Teaches Voidwalker Consume Shadows (Rank 2).');
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (16359, 483, 617851, 6, 'Teaches Voidwalker Consume Shadows (Rank 3).');
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (16360, 483, 617852, 6, 'Teaches Voidwalker Consume Shadows (Rank 4).');
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (16361, 483, 617853, 6, 'Teaches Voidwalker Consume Shadows (Rank 5).');
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (16362, 483, 617854, 6, 'Teaches Voidwalker Consume Shadows (Rank 6).');
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (22184, 483, 627272, 6, 'Teaches Voidwalker Consume Shadows (Rank 7).');

REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (16363, 483, 617735, 6, 'Teaches Voidwalker Suffering (Rank 1).');
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (16364, 483, 617750, 6, 'Teaches Voidwalker Suffering (Rank 2).');
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (16365, 483, 617751, 6, 'Teaches Voidwalker Suffering (Rank 3).');
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (16366, 483, 617752, 6, 'Teaches Voidwalker Suffering (Rank 4).');
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (22183, 483, 627271, 6, 'Teaches Voidwalker Suffering (Rank 5).');
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (28068, 483, 633701, 6, 'Teaches Voidwalker Suffering (Rank 6).');

REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (16368, 483, 607815, 6, 'Teaches Succubus or Incubus Lash of Pain (Rank 2).');
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (16371, 483, 607816, 6, 'Teaches Succubus or Incubus Lash of Pain (Rank 3).');
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (16372, 483, 611778, 6, 'Teaches Succubus or Incubus Lash of Pain (Rank 4).');
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (16373, 483, 611779, 6, 'Teaches Succubus or Incubus Lash of Pain (Rank 5).');
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (16374, 483, 611780, 6, 'Teaches Succubus or Incubus Lash of Pain (Rank 6).');
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (22186, 483, 627274, 6, 'Teaches Succubus or Incubus Lash of Pain (Rank 7).');

REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (16375, 483, 606360, 6, 'Teaches Succubus or Incubus Soothing Kiss (Rank 1).');
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (16376, 483, 607813, 6, 'Teaches Succubus or Incubus Soothing Kiss (Rank 2).');
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (16377, 483, 611784, 6, 'Teaches Succubus or Incubus Soothing Kiss (Rank 3).');
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (16378, 483, 611785, 6, 'Teaches Succubus or Incubus Soothing Kiss (Rank 4).');
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (22187, 483, 627275, 6, 'Teaches Succubus or Incubus Soothing Kiss (Rank 5).');

REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (16381, 483, 619731, 6, 'Teaches Felhunter Devour Magic (Rank 2).');
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (16382, 483, 619734, 6, 'Teaches Felhunter Devour Magic (Rank 3).');
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (16383, 483, 619736, 6, 'Teaches Felhunter Devour Magic (Rank 4).');
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (22188, 483, 627276, 6, 'Teaches Felhunter Devour Magic (Rank 5).');
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (22189, 483, 627277, 6, 'Teaches Felhunter Devour Magic (Rank 6).');

REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (16384, 483, 620429, 6, 'Teaches Felhunter Tainted Blood (Rank 1).');
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (16385, 483, 620430, 6, 'Teaches Felhunter Tainted Blood (Rank 2).');
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (16386, 483, 620431, 6, 'Teaches Felhunter Tainted Blood (Rank 3).');
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (16387, 483, 620432, 6, 'Teaches Felhunter Tainted Blood (Rank 4).');
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (22190, 483, 627497, 6, 'Teaches Felhunter Tainted Blood (Rank 5).');

REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (16388, 483, 619244, 6, 'Teaches Felhunter Spell Lock (Rank 1).');
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (16389, 483, 619647, 6, 'Teaches Felhunter Spell Lock (Rank 2).');

REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (23711, 483, 630154, 6, 'Teaches Felguard Intercept (Rank 1).');
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (23730, 483, 630199, 6, 'Teaches Felguard Intercept (Rank 2).');
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (23731, 483, 630200, 6, 'Teaches Felguard Intercept (Rank 3).');

REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (23734, 483, 630214, 6, 'Teaches Felguard Cleave (Rank 1).');
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (23745, 483, 630222, 6, 'Teaches Felguard Cleave (Rank 2).');
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (23755, 483, 630224, 6, 'Teaches Felguard Cleave (Rank 3).');

REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (28071, 483, 633704, 6, 'Teaches Felguard Anguish (Rank 1).');
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (28072, 483, 633705, 6, 'Teaches Felguard Anguish (Rank 2).');
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (28073, 483, 633706, 6, 'Teaches Felguard Anguish (Rank 3).');

REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (16379, 483, 606358, 6, 'Teaches Succubus or Incubus Seduction.');
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (16380, 483, 607870, 6, 'Teaches Succubus or Incubus Lesser Invisibility.');
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (16390, 483, 619481, 6, 'Teaches Felhunter Paranoia.');
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (25469, 483, 632234, 6, 'Teaches Felguard Avoidance.');
REPLACE INTO `ipp_pet_grimoire` (`entry`, `spellid_1`, `spellid_2`, `spelltrigger_2`, `description`) VALUES (25900, 483, 632852, 6, 'Teaches Felguard Demonic Frenzy.');

DELETE FROM `spell_dbc` WHERE `ID` IN 
(602947, 604511, 606307, 606358, 606360, 607799, 607800, 607801, 607802, 607804, 607805, 607809, 607810, 607811, 607812, 607813, 607815, 607816, 607870, 608316, 608317, 
 611762, 611763, 611766, 611767, 611770, 611771, 611774, 611775, 611778, 611779, 611780, 611784, 611785, 617735, 617750, 617751, 617752, 617767, 617850, 617851, 617852, 
 617853, 617854, 619244, 619438, 619440, 619441, 619442, 619443, 619481, 619647, 619731, 619734, 619736, 620429, 620430, 620431, 620432, 627267, 627268, 627269, 627270, 
 627271, 627272, 627273, 627274, 627275, 627276, 627277, 627497, 630154, 630199, 630200, 630214, 630222, 630224, 632234, 632852, 633701, 633704, 633705, 633706);

INSERT INTO `spell_dbc` (`ID`, `Category`, `DispelType`, `Mechanic`, `Attributes`, `AttributesEx`, `AttributesEx2`, `AttributesEx3`, `AttributesEx4`, `AttributesEx5`, `AttributesEx6`, `AttributesEx7`, `ShapeshiftMask`, 
`unk_320_2`, `ShapeshiftExclude`, `unk_320_3`, `Targets`, `TargetCreatureType`, `RequiresSpellFocus`, `FacingCasterFlags`, `CasterAuraState`, `TargetAuraState`, `ExcludeCasterAuraState`, `ExcludeTargetAuraState`, 
`CasterAuraSpell`, `TargetAuraSpell`, `ExcludeCasterAuraSpell`, `ExcludeTargetAuraSpell`, `CastingTimeIndex`, `RecoveryTime`, `CategoryRecoveryTime`, `InterruptFlags`, `AuraInterruptFlags`, `ChannelInterruptFlags`, 
`ProcTypeMask`, `ProcChance`, `ProcCharges`, `MaxLevel`, `BaseLevel`, `SpellLevel`, `DurationIndex`, `PowerType`, `ManaCost`, `ManaCostPerLevel`, `ManaPerSecond`, `ManaPerSecondPerLevel`, `RangeIndex`, `Speed`, 
`ModalNextSpell`, `CumulativeAura`, `Totem_1`, `Totem_2`, `Reagent_1`, `Reagent_2`, `Reagent_3`, `Reagent_4`, `Reagent_5`, `Reagent_6`, `Reagent_7`, `Reagent_8`, `ReagentCount_1`, `ReagentCount_2`, `ReagentCount_3`,
`ReagentCount_4`, `ReagentCount_5`, `ReagentCount_6`, `ReagentCount_7`, `ReagentCount_8`, `EquippedItemClass`, `EquippedItemSubclass`, `EquippedItemInvTypes`, `Effect_1`, `Effect_2`, `Effect_3`, `EffectDieSides_1`, 
`EffectDieSides_2`, `EffectDieSides_3`, `EffectRealPointsPerLevel_1`, `EffectRealPointsPerLevel_2`, `EffectRealPointsPerLevel_3`, `EffectBasePoints_1`, `EffectBasePoints_2`, `EffectBasePoints_3`, `EffectMechanic_1`, 
`EffectMechanic_2`, `EffectMechanic_3`, `ImplicitTargetA_1`, `ImplicitTargetA_2`, `ImplicitTargetA_3`, `ImplicitTargetB_1`, `ImplicitTargetB_2`, `ImplicitTargetB_3`, `EffectRadiusIndex_1`, `EffectRadiusIndex_2`,
`EffectRadiusIndex_3`, `EffectAura_1`, `EffectAura_2`, `EffectAura_3`, `EffectAuraPeriod_1`, `EffectAuraPeriod_2`, `EffectAuraPeriod_3`, `EffectMultipleValue_1`, `EffectMultipleValue_2`, `EffectMultipleValue_3`, 
`EffectChainTargets_1`, `EffectChainTargets_2`, `EffectChainTargets_3`, `EffectItemType_1`, `EffectItemType_2`, `EffectItemType_3`, `EffectMiscValue_1`, `EffectMiscValue_2`, `EffectMiscValue_3`, `EffectMiscValueB_1`, 
`EffectMiscValueB_2`, `EffectMiscValueB_3`, `EffectTriggerSpell_1`, `EffectTriggerSpell_2`, `EffectTriggerSpell_3`, `EffectPointsPerCombo_1`, `EffectPointsPerCombo_2`, `EffectPointsPerCombo_3`, `EffectSpellClassMaskA_1`, 
`EffectSpellClassMaskA_2`, `EffectSpellClassMaskA_3`, `EffectSpellClassMaskB_1`, `EffectSpellClassMaskB_2`, `EffectSpellClassMaskB_3`, `EffectSpellClassMaskC_1`, `EffectSpellClassMaskC_2`, `EffectSpellClassMaskC_3`, 
`SpellVisualID_1`, `SpellVisualID_2`, `SpellIconID`, `ActiveIconID`, `SpellPriority`, `Name_Lang_enUS`, `Name_Lang_enGB`, `Name_Lang_koKR`, `Name_Lang_frFR`, `Name_Lang_deDE`, `Name_Lang_enCN`, `Name_Lang_zhCN`, 
`Name_Lang_enTW`, `Name_Lang_zhTW`, `Name_Lang_esES`, `Name_Lang_esMX`, `Name_Lang_ruRU`, `Name_Lang_ptPT`, `Name_Lang_ptBR`, `Name_Lang_itIT`, `Name_Lang_Unk`, `Name_Lang_Mask`, `NameSubtext_Lang_enUS`, 
`NameSubtext_Lang_enGB`, `NameSubtext_Lang_koKR`, `NameSubtext_Lang_frFR`, `NameSubtext_Lang_deDE`, `NameSubtext_Lang_enCN`, `NameSubtext_Lang_zhCN`, `NameSubtext_Lang_enTW`, `NameSubtext_Lang_zhTW`, 
`NameSubtext_Lang_esES`, `NameSubtext_Lang_esMX`, `NameSubtext_Lang_ruRU`, `NameSubtext_Lang_ptPT`, `NameSubtext_Lang_ptBR`, `NameSubtext_Lang_itIT`, `NameSubtext_Lang_Unk`, `NameSubtext_Lang_Mask`, 
`Description_Lang_enUS`, `Description_Lang_enGB`, `Description_Lang_koKR`, `Description_Lang_frFR`, `Description_Lang_deDE`, `Description_Lang_enCN`, `Description_Lang_zhCN`, `Description_Lang_enTW`, 
`Description_Lang_zhTW`, `Description_Lang_esES`, `Description_Lang_esMX`, `Description_Lang_ruRU`, `Description_Lang_ptPT`, `Description_Lang_ptBR`, `Description_Lang_itIT`, `Description_Lang_Unk`, 
`Description_Lang_Mask`, `AuraDescription_Lang_enUS`, `AuraDescription_Lang_enGB`, `AuraDescription_Lang_koKR`, `AuraDescription_Lang_frFR`, `AuraDescription_Lang_deDE`, `AuraDescription_Lang_enCN`, 
`AuraDescription_Lang_zhCN`, `AuraDescription_Lang_enTW`, `AuraDescription_Lang_zhTW`, `AuraDescription_Lang_esES`, `AuraDescription_Lang_esMX`, `AuraDescription_Lang_ruRU`, `AuraDescription_Lang_ptPT`, 
`AuraDescription_Lang_ptBR`, `AuraDescription_Lang_itIT`, `AuraDescription_Lang_Unk`, `AuraDescription_Lang_Mask`, `ManaCostPct`, `StartRecoveryCategory`, `StartRecoveryTime`, `MaxTargetLevel`, `SpellClassSet`, 
`SpellClassMask_1`, `SpellClassMask_2`, `SpellClassMask_3`, `MaxTargets`, `DefenseType`, `PreventionType`, `StanceBarOrder`, `EffectChainAmplitude_1`, `EffectChainAmplitude_2`, `EffectChainAmplitude_3`, `MinFactionID`, 
`MinReputation`, `RequiredAuraVision`, `RequiredTotemCategoryID_1`, `RequiredTotemCategoryID_2`, `RequiredAreasID`, `SchoolMask`, `RuneCostID`, `SpellMissileID`, `PowerDisplayID`, `EffectBonusMultiplier_1`, 
`EffectBonusMultiplier_2`, `EffectBonusMultiplier_3`, `SpellDescriptionVariableID`, `SpellDifficultyID`) VALUES
--
(607799,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Firebolt','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 2','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Imp Firebolt (Rank 2).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(607800,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Firebolt','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 3','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Imp Firebolt (Rank 3).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(607801,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Firebolt','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 4','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Imp Firebolt (Rank 4).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(607802,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Firebolt','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 5','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Imp Firebolt (Rank 5).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(611762,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Firebolt','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 6','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Imp Firebolt (Rank 6).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(611763,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Firebolt','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 7','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Imp Firebolt (Rank 7).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(627267,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Firebolt','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 8','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Imp Firebolt (Rank 8).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
--
(606307,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Blood Pact','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 1','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Imp Blood Pact (Rank 1).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(607804,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Blood Pact','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 2','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Imp Blood Pact (Rank 2).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(607805,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Blood Pact','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 3','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Imp Blood Pact (Rank 3).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(611766,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Blood Pact','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 4','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Imp Blood Pact (Rank 4).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(611767,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Blood Pact','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 5','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Imp Blood Pact (Rank 5).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(627268,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Blood Pact','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 6','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Imp Blood Pact (Rank 6).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
--
(602947,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Fire Shield','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 1','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Imp Fire Shield (Rank 1).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(608316,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Fire Shield','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 2','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Imp Fire Shield (Rank 2).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(608317,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Fire Shield','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 3','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Imp Fire Shield (Rank 3).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(611770,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Fire Shield','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 4','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Imp Fire Shield (Rank 4).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(611771,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Fire Shield','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 5','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Imp Fire Shield (Rank 5).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(627269,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Fire Shield','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 6','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Imp Fire Shield (Rank 6).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
--
(604511,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Phase Shift','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 1','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Imp Phase Shift.','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
--
(607809,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Torment','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 2','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Voidwalker Torment (Rank 2).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(607810,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Torment','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 3','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Voidwalker Torment (Rank 3).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(607811,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Torment','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 4','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Voidwalker Torment (Rank 4).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(611774,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Torment','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 5','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Voidwalker Torment (Rank 5).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(611775,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Torment','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 6','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Voidwalker Torment (Rank 6).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(627270,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Torment','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 7','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Voidwalker Torment (Rank 7).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
--
(607812,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Sacrifice','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 1','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Voidwalker Sacrifice (Rank 1).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(619438,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Sacrifice','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 2','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Voidwalker Sacrifice (Rank 2).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(619440,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Sacrifice','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 3','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Voidwalker Sacrifice (Rank 3).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(619441,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Sacrifice','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 4','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Voidwalker Sacrifice (Rank 4).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(619442,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Sacrifice','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 5','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Voidwalker Sacrifice (Rank 5).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(619443,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Sacrifice','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 6','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Voidwalker Sacrifice (Rank 6).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(627273,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Sacrifice','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 7','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Voidwalker Sacrifice (Rank 7).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
--
(617767,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Consume Shadows','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 1','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Voidwalker Consume Shadows (Rank 1).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(617850,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Consume Shadows','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 2','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Voidwalker Consume Shadows (Rank 2).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(617851,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Consume Shadows','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 3','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Voidwalker Consume Shadows (Rank 3).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(617852,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Consume Shadows','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 4','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Voidwalker Consume Shadows (Rank 4).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(617853,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Consume Shadows','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 5','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Voidwalker Consume Shadows (Rank 5).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(617854,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Consume Shadows','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 6','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Voidwalker Consume Shadows (Rank 6).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(627272,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Consume Shadows','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 7','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Voidwalker Consume Shadows (Rank 7).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
--
(617735,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Suffering','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 1','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Voidwalker Suffering (Rank 1).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(617750,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Suffering','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 2','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Voidwalker Suffering (Rank 2).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(617751,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Suffering','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 3','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Voidwalker Suffering (Rank 3).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(617752,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Suffering','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 4','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Voidwalker Suffering (Rank 4).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(627271,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Suffering','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 5','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Voidwalker Suffering (Rank 5).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(633701,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Suffering','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 6','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Voidwalker Suffering (Rank 6).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
--
(607815,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Lash of Pain','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 2','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Succubus or Incubus Lash of Pain (Rank 2).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(607816,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Lash of Pain','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 3','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Succubus or Incubus Lash of Pain (Rank 3).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(611778,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Lash of Pain','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 4','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Succubus or Incubus Lash of Pain (Rank 4).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(611779,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Lash of Pain','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 5','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Succubus or Incubus Lash of Pain (Rank 5).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(611780,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Lash of Pain','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 6','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Succubus or Incubus Lash of Pain (Rank 6).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(627274,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Lash of Pain','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 7','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Succubus or Incubus Lash of Pain (Rank 7).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
--
(606360,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Soothing Kiss','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 1','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Succubus or Incubus Soothing Kiss (Rank 1).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(607813,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Soothing Kiss','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 2','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Succubus or Incubus Soothing Kiss (Rank 2).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(611784,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Soothing Kiss','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 3','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Succubus or Incubus Soothing Kiss (Rank 3).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(611785,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Soothing Kiss','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 4','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Succubus or Incubus Soothing Kiss (Rank 4).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(627275,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Soothing Kiss','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 5','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Succubus or Incubus Soothing Kiss (Rank 5).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
--
(619731,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Devour Magic','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 2','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Felhunter Devour Magic (Rank 2).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(619734,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Devour Magic','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 3','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Felhunter Devour Magic (Rank 3).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(619736,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Devour Magic','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 4','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Felhunter Devour Magic (Rank 4).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(627276,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Devour Magic','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 5','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Felhunter Devour Magic (Rank 5).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(627277,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Devour Magic','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 6','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Felhunter Devour Magic (Rank 6).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
--
(620429,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Tainted Blood','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 1','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Felhunter Tainted Blood (Rank 1).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(620430,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Tainted Blood','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 2','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Felhunter Tainted Blood (Rank 2).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(620431,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Tainted Blood','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 3','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Felhunter Tainted Blood (Rank 3).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(620432,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Tainted Blood','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 4','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Felhunter Tainted Blood (Rank 4).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(627497,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Tainted Blood','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 5','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Felhunter Tainted Blood (Rank 5).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
--
(619244,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Spell Lock','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 1','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Felhunter Spell Lock (Rank 1).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(619647,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Spell Lock','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 2','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Felhunter Spell Lock (Rank 2).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
--
(630154,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Intercept','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 1','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Felguard Intercept (Rank 1).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(630199,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Intercept','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 2','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Felguard Intercept (Rank 2).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(630200,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Intercept','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 3','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Felguard Intercept (Rank 3).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
--
(630214,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Cleave','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 1','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Felguard Cleave (Rank 1).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(630222,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Cleave','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 2','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Felguard Cleave (Rank 2).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(630224,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Cleave','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 3','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Felguard Cleave (Rank 3).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
--
(633704,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Anguish','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 1','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Felguard Anguish (Rank 1).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(633705,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Anguish','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 2','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Felguard Anguish (Rank 2).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(633706,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Anguish','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 3','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Felguard Anguish (Rank 3).','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
--
(606358,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Seduction','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 1','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Succubus or Incubus Seduction.','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(607870,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Lesser Invisibility','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 1','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Succubus or Incubus Lesser Invisibility.','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(619481,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Paranoia','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 1','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Felhunter Paranoia.','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(632234,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Avoidance','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 1','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Felguard Avoidance.','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(632852,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
'Grimoire of Demonic Frenzy','','','','','','','','',0,0,0,0,0,0,0,0,'Rank 1','','','','','','','','',0,0,0,0,0,0,0,0,
'Teaches Felguard Demonic Frenzy.','','','','','','','','',0,0,0,0,0,0,0,0,'','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
