-- 100% mounts that AzerothCore gives Apprentice Riding (75); MountLevel.* would otherwise make them usable at the Apprentice level.
UPDATE `item_template` SET `RequiredSkillRank` = 150 WHERE `entry` IN (18241, 18242, 18243, 18244, 18245, 18246, 18247, 18248) AND `RequiredSkill` = 762;
