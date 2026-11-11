/*
    Tables for the profession data of this module (trainers and their recipe lists, profession vendors and
    books, the "Train me." skill conditions, profession NPC subnames/npcflag/type_flags, Cooking/First Aid/
    Fishing rewards and items). The base files write that data to the ipp_prof_* tables below, never to the
    core tables. The startup step writes it to the core tables, before they are loaded, only while
    IndividualProgression.VanillaProfessions = 1; with 0 AzerothCore's values are restored
    (IndividualProgression.cpp, BuildProfessionFeature). Changing the key needs a restart.

    This file sorts before every file that writes to them. Tables are only ever created here, never dropped:
    a base file that did not change does not run again.

    Per core table <t> with its own rows (trainer, trainer_spell, creature_default_trainer, conditions,
    npc_vendor, item_template_locale):
        ipp_prof_<t>          the rows the module wants; the base files write it
        ipp_prof_applied_<t>  the rows the startup step wrote last (written by C++ only)
        ipp_prof_backup_<t>   the core rows it replaced (written by C++ only)
        ipp_prof_<t>_remove   where the module deletes AzerothCore's rows: one row per match (0 / '' = any)
    Per core table whose columns the module sets (creature_template, quest_template, item_template):
        ipp_prof_<t> holds the key and the owned columns, NULL = the module does not set that column;
        ipp_prof_applied_<t> and ipp_prof_backup_<t> as above.

    One writer per owned row, and for the tables with columns per key and column: when two base files write
    the same one, the file last in name order keeps the statement and the earlier file's is removed, because a
    changed file is run in full and a later file that did not change is not run again.
*/

-- Whether the startup step has written the ipp_prof_* data to the core tables (rows written by C++ only).
CREATE TABLE IF NOT EXISTS `ipp_prof_state` (
    `feature` varchar(16) NOT NULL,
    `applied` tinyint unsigned NOT NULL DEFAULT 0,
    `commit_token` int unsigned NOT NULL DEFAULT 0,
    PRIMARY KEY (`feature`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tables with their own rows (collations come with LIKE)
CREATE TABLE IF NOT EXISTS `ipp_prof_trainer` LIKE `trainer`;
CREATE TABLE IF NOT EXISTS `ipp_prof_applied_trainer` LIKE `trainer`;
CREATE TABLE IF NOT EXISTS `ipp_prof_backup_trainer` LIKE `trainer`;
CREATE TABLE IF NOT EXISTS `ipp_prof_trainer_spell` LIKE `trainer_spell`;
CREATE TABLE IF NOT EXISTS `ipp_prof_applied_trainer_spell` LIKE `trainer_spell`;
CREATE TABLE IF NOT EXISTS `ipp_prof_backup_trainer_spell` LIKE `trainer_spell`;
CREATE TABLE IF NOT EXISTS `ipp_prof_creature_default_trainer` LIKE `creature_default_trainer`;
CREATE TABLE IF NOT EXISTS `ipp_prof_applied_creature_default_trainer` LIKE `creature_default_trainer`;
CREATE TABLE IF NOT EXISTS `ipp_prof_backup_creature_default_trainer` LIKE `creature_default_trainer`;
CREATE TABLE IF NOT EXISTS `ipp_prof_conditions` LIKE `conditions`;
CREATE TABLE IF NOT EXISTS `ipp_prof_applied_conditions` LIKE `conditions`;
CREATE TABLE IF NOT EXISTS `ipp_prof_backup_conditions` LIKE `conditions`;
CREATE TABLE IF NOT EXISTS `ipp_prof_npc_vendor` LIKE `npc_vendor`;
CREATE TABLE IF NOT EXISTS `ipp_prof_applied_npc_vendor` LIKE `npc_vendor`;
CREATE TABLE IF NOT EXISTS `ipp_prof_backup_npc_vendor` LIKE `npc_vendor`;
CREATE TABLE IF NOT EXISTS `ipp_prof_item_template_locale` LIKE `item_template_locale`;
CREATE TABLE IF NOT EXISTS `ipp_prof_applied_item_template_locale` LIKE `item_template_locale`;
CREATE TABLE IF NOT EXISTS `ipp_prof_backup_item_template_locale` LIKE `item_template_locale`;

-- Where the module deletes AzerothCore's rows
-- trainer_spell: SpellId from the trainer TrainerId (0 = from every trainer)
CREATE TABLE IF NOT EXISTS `ipp_prof_trainer_spell_remove` (
    `TrainerId` int unsigned NOT NULL DEFAULT 0,
    `SpellId` int unsigned NOT NULL,
    PRIMARY KEY (`TrainerId`, `SpellId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
-- npc_vendor: item from the vendor entry (0 = from every vendor)
CREATE TABLE IF NOT EXISTS `ipp_prof_npc_vendor_remove` (
    `entry` int unsigned NOT NULL DEFAULT 0,
    `item` int NOT NULL,
    PRIMARY KEY (`entry`, `item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
-- item_template_locale: the rows of item ID in locale ('' = every locale)
CREATE TABLE IF NOT EXISTS `ipp_prof_item_template_locale_remove` (
    `ID` int unsigned NOT NULL,
    `locale` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
    PRIMARY KEY (`ID`, `locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
-- creature_default_trainer: the row of creature CreatureId
CREATE TABLE IF NOT EXISTS `ipp_prof_creature_default_trainer_remove` (
    `CreatureId` int unsigned NOT NULL,
    PRIMARY KEY (`CreatureId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
-- conditions: the "Train me." rows (type 15, SourceEntry 0, condition type 7) of gossip menu SourceGroup
CREATE TABLE IF NOT EXISTS `ipp_prof_conditions_remove` (
    `SourceGroup` int unsigned NOT NULL,
    PRIMARY KEY (`SourceGroup`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tables with columns: the key and the owned columns, NULL = not set by the module
CREATE TABLE IF NOT EXISTS `ipp_prof_creature_template` (
    `entry` int unsigned NOT NULL,
    `subname` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
    `npcflag` int unsigned NULL,
    `type_flags` int unsigned NULL,
    PRIMARY KEY (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE IF NOT EXISTS `ipp_prof_applied_creature_template` LIKE `ipp_prof_creature_template`;
CREATE TABLE IF NOT EXISTS `ipp_prof_backup_creature_template` LIKE `ipp_prof_creature_template`;

CREATE TABLE IF NOT EXISTS `ipp_prof_quest_template` (
    `ID` int unsigned NOT NULL,
    `RewardItem1` int unsigned NULL,
    `RewardItem2` int unsigned NULL,
    `RewardItem3` int unsigned NULL,
    `RewardItem4` int unsigned NULL,
    `RewardAmount1` smallint unsigned NULL,
    `RewardAmount2` smallint unsigned NULL,
    `RewardAmount3` smallint unsigned NULL,
    `RewardAmount4` smallint unsigned NULL,
    PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE IF NOT EXISTS `ipp_prof_applied_quest_template` LIKE `ipp_prof_quest_template`;
CREATE TABLE IF NOT EXISTS `ipp_prof_backup_quest_template` LIKE `ipp_prof_quest_template`;

CREATE TABLE IF NOT EXISTS `ipp_prof_item_template` (
    `entry` int unsigned NOT NULL,
    `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
    `spellid_1` int NULL,
    `spellcharges_1` smallint NULL,
    `spellppmRate_1` float NULL,
    `RequiredLevel` tinyint unsigned NULL,
    `SellPrice` int unsigned NULL,
    PRIMARY KEY (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE IF NOT EXISTS `ipp_prof_applied_item_template` LIKE `ipp_prof_item_template`;
CREATE TABLE IF NOT EXISTS `ipp_prof_backup_item_template` LIKE `ipp_prof_item_template`;
