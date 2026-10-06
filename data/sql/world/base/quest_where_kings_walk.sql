-- Where Kings Walk, the last quest of the Alliance Death Knight starting zone

-- King Varian Wrynn is only in the Stormwind throne room once a player has passed PROGRESSION_TBC_TIER_5 (his spawn
-- is in the phase zz_ipp_aware_npcs.sql gives him). Before that the quest cannot be turned in, and the Dungeon Finder
-- stays locked for Death Knights until it is (LFGMgr checks quest 13188 or 13189). Bolvar stands in for the king, as
-- for the other quests in quest_missing_diplomat.sql.
DELETE FROM `creature_questender` WHERE `quest` = 13188;
INSERT INTO `creature_questender` (`id`, `quest`) VALUES
(1748, 13188),  -- Bolvar ends the quest while King Wrynn is away
(29611, 13188); -- King Wrynn ends it in person when he is back
