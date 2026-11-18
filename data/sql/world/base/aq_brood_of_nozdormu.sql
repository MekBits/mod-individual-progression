-- MekBits: The Hand of the Righteous (8302), the repeatable Brood of Nozdormu turn-in, takes
-- 20 Silithid Carapace Fragments instead of 200. The reputation per turn-in is unchanged
-- (vanilla_quest_reputations.sql). The values are absolute, so the file can run again.
UPDATE `quest_template` SET `RequiredItemCount1` = 20, `LogDescription` = REPLACE(`LogDescription`, 'Collect 200 ', 'Collect 20 ') WHERE `ID` = 8302;
