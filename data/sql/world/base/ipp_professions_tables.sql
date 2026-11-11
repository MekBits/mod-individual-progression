/*
    The base files write the profession data here, never to the core tables. The startup step writes it to the core
    tables only while IndividualProgression.VanillaProfessions = 1 (IndividualProgression.cpp,
    BuildProfessionFeature; README). This file sorts before every file that writes to these tables, and tables are
    created here, never dropped. Never edit a CREATE (CREATE TABLE IF NOT EXISTS does not change an existing table):
    add a column with a new file holding one ALTER TABLE, sorted after this file and before professions.sql, together
    with the column list in the cpp. One writer per owned row, and no key shared with a pet option (README).
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
