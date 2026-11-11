# Individual Player Progression

## Azerothcore Playerbots Module

This module simulates progress through expansions and expansion tiers for individual players.

Each tier is designed to simulate the experience of being within that tier and expansion, within the limitations of the WotLK client. This means Vanilla content is like it was during Vanilla WoW.

The goal of the module is to focus on the journey of the player. All catch-up mechanics have been removed. There is no goal to rush to end-game or find a "fresh" server, because each new character is a fresh experience.

Note that this module either requires many players working together, or adjustments for smaller raid size to allow individual groups to progress. This module works well together with Playerbots and NPCbots.

Lower-level content added in later expansions that is not "catch-up" content has NOT been removed. This includes Draenei and Blood Elf starting zones, Inscription and Jewelcrafting skills, new quests and hubs added to the Vanilla world in TBC, and so on. I feel this content does not negatively impact the player journey like "catch-up" content. Some of this content can optionally be phased until the appropriate patch in which it was introduced for those who prefer an even more authentic Vanilla world - see the optional SQL files for more details.

## Some Included Features
* NPCs and Game Objects are aware of individual player progress, visible depending on player progression
* Restoration of content that was removed, nerfed or released in a later patch. (examples: original Naxxramas, Onyxia, TBC Attunement quests and open world elites)
* Overhaul of vanilla creatures and quests. (Smart AI, quest drop chances, creature respawn times, patrols and spawn locations have all been restored.)
* Optional power and healing adjustment for Vanilla and TBC content to simulate the original world difficulty.
* WotLK emblems progression.
* Original vanilla AV
* Isle of Quel'Danas Progression
* Playerbots support

Here you can find a list of all the [changes](https://github.com/ZhengPeiRu21/mod-individual-progression/wiki/List-of-Changes) and [progression tiers](https://github.com/ZhengPeiRu21/mod-individual-progression/wiki/List-of-Progression-Tiers).

Options are provided that allow changes to the player experience, based on preference. Please see the config file.

## How to Install
Please see [How to Install](https://github.com/ZhengPeiRu21/mod-individual-progression/wiki/How-to-Install)

- You need my fork of AzerothCore for this module! https://github.com/Grimfeather/azerothcore-wotlk
- This fork uses the default branch of mod-playerbots/azerothcore-wotlk as it's base. I need to do this to be able to make my own changes to AzerothCore. 
Going through the process of making pull requests for AzerothCore and test phases on the playerbots fork takes months. This no longer makes sense. I can't wait months for every small change I want to make.

## Please Note!
For item changes to take effect, please ensure *DBC.EnforceItemAttributes is set to 0*! This will allow the module to override item stats with their correct Vanilla/TBC values.

### Optional Data Files
Some changes for Vanilla and TBC content require DBC modification. The .mpq file for the client and .dbc files for the server can be found in the "optional" directory. These changes include requiring Vanilla reagents such as Flint and Steel for campfires, changing Level 60 enchanting to use Vanilla and not TBC reagents, profession leveling adjustments, etc. These files are all optional and the module will work without the patch, but these recipes will remain their WotLK versions.

### Optional Recommended Addons
- MultiBot: https://github.com/Wishmaster117/MultiBot-Chatless
- Character Services: https://github.com/Badgermilk0/mod-character-services
- Reagent Bank Account: https://github.com/Grimfeather/mod-reagent-bank-account

## VanillaProfessions
`IndividualProgression.VanillaProfessions` (default 1) switches this module's profession data on and off, the way `VanillaHunterPets` and `WarlockDemonTrainers` do for pets. With 1 the module's trainers, recipe lists, Cooking/First Aid/Fishing ranks, profession vendors and books and profession NPC data are in the game's tables, as before. With 0 they are AzerothCore's 3.3.5a values in every tier. `ProfessionTierCap` is a separate option and still limits the rank per progression tier. The option is read at startup; changing it needs a restart.

### How it works
The base SQL files do not write profession data to the core tables. They write it to `ipp_prof_*` tables (created by `ipp_professions_tables.sql`, which sorts before every file that writes to them). At startup, before the core tables are loaded, the worldserver copies the `ipp_prof_*` data into the core tables while the option is 1, and takes it out again when it is 0. Per core table `<t>`:

| Table | Holds |
|---|---|
| `ipp_prof_<t>` | what the module wants in `<t>` (written by the base files) |
| `ipp_prof_applied_<t>` | what the startup step wrote last (written by C++) |
| `ipp_prof_backup_<t>` | the core rows or column values it replaced (written by C++) |
| `ipp_prof_<t>_remove` | where the module deletes AzerothCore's rows: `trainer_spell` (`TrainerId` 0 = every trainer), `npc_vendor` (`entry` 0 = every vendor), `item_template_locale` (`locale` '' = every locale), `creature_default_trainer`, `conditions` (the "Train me." skill conditions of a gossip menu) |
| `ipp_prof_state` | whether the data is written to the core tables (written by C++) |

The row tables are `trainer`, `trainer_spell`, `creature_default_trainer`, `conditions`, `npc_vendor` and `item_template_locale`. The tables with columns, where NULL means "the module does not set this column", are `creature_template` (`subname`, `npcflag`, `type_flags`), `quest_template` (`RewardItem1-4`, `RewardAmount1-4`) and `item_template` (`description`, `spellid_1`, `spellcharges_1`, `spellppmRate_1`, `RequiredLevel`, `SellPrice`). Everything else the module writes stays on the core tables as it was; so do trainer 651, the creatures 119187, 118754, 118771 and 121087, and `gossip_menu_option`.

Every start with the option at 1 first takes out what an earlier start wrote and then writes it again, so the result does not depend on which files changed since. A core row that something else changed in the meantime (an AzerothCore update) is backed up with that new value and then overwritten by the module's value; AzerothCore's newer value is what comes back when the option is turned off. Before it reads or writes anything, the startup step checks in `information_schema` that every table and column it names exists. A missing one logs one ERROR naming it, and the data is left as it is.

### Writing a profession change
| The module wrote | It now writes |
|---|---|
| a DELETE and INSERT of its own rows | the same on `ipp_prof_<t>` |
| a DELETE of AzerothCore's rows by a condition | the same DELETE on `ipp_prof_<t>`, plus `INSERT IGNORE` rows in `ipp_prof_<t>_remove` that match what it deletes |
| an UPDATE of columns on core rows | `INSERT IGNORE INTO ipp_prof_<t> (<key>) VALUES ...` for its keys, then the UPDATE on `ipp_prof_<t>` |
| an UPDATE of one column of a row table, such as `ReqLevel` | `REPLACE INTO ipp_prof_<t> (<all columns>) SELECT <columns, with the new value> FROM <t> WHERE <the same condition>` |
| a statement on owned and other columns | split: the other columns stay on the core table |
| an R3.4 exception, such as `DELETE FROM trainer WHERE Id BETWEEN 611 AND 651` | split: `ipp_prof_trainer` for 611-650; the core `DELETE ... WHERE Id = 651` stays next to trainer 651's insert |
| a block that mixes owned and non-owned items, such as the vendor DELETE and INSERT block in `vanilla_vendors.sql` | per item: an owned item's DELETE and INSERT rows move as above; a non-owned item's DELETE stays on the core table together with its INSERT rows, so no removal row ever matches a row a core INSERT adds |
| an `INSERT IGNORE` into a core row table | per key: if AzerothCore's data has the row, the statement does nothing and is removed (staging it would replace AzerothCore's row under key 1); otherwise `INSERT IGNORE INTO ipp_prof_<t>` |

Every statement names its columns. Whether an item or spell is "owned" is decided from AzerothCore's data (a rank book, or an item that teaches a spell an AzerothCore profession trainer teaches), not from a database this module's files already wrote to.

**One writer per owned row**, and for the tables with columns per key and column, also when two files write the same value. Where two files write it, the file last in name order keeps the statement and the earlier one is removed, because a changed file is run in full by db-import and a later file that did not change is not run again. If a changed file and a later unchanged one write the same row, add a comment line to the later file so that it runs again after it. This is not checked by a tool.

**A row key that a pet option owns is never put in `ipp_prof_*`, and the reverse.** The warlock pet feature (`WarlockDemonTrainers`) and the profession feature write the same core tables (`creature_template.npcflag`, `npc_vendor`, `item_template.description` and `spellid_1`). The pets apply first, so an overlap would make each feature back up the other's value.

**Adding a column to an `ipp_prof_*` table later** takes a new SQL file with a single `ALTER TABLE`, never edited afterwards, whose name sorts after `ipp_professions_tables.sql` and before `professions.sql`, together with the change to the column list in `IndividualProgression.cpp`. Never edit the `CREATE TABLE` statements: `CREATE TABLE IF NOT EXISTS` does not change a table that exists, and a missing column makes the feature log an ERROR and skip, including the restore at key 0.

### Known limits
* A line deleted from a base file leaves its row in `ipp_prof_*`.
* Turning the option off restores what this module wrote at startup. A database that the module's older profession SQL wrote to the core tables directly, before the `ipp_prof_` tables existed, keeps those values until they are restored by hand.
* A profession change that writes trainers, recipes, profession books or a profession NPC's `subname`/`npcflag`/`type_flags` straight to a core table is not covered by the option. It has to go to `ipp_prof_*`.

## Discord
[https://discord.gg/PTXxh3KSgQ](https://discord.gg/PTXxh3KSgQ)

## Thank You
Special thanks to the following contributors and projects that made this module possible:
* AzerothCore and TrinityCore, along with ancestors Mangos.
* AzerothCore mod-war-effort
* AzerothCore mod-pvp-titles
* vMangos for Vanilla game and patch progression data
* cMangos for TBC game data
* Sogladev for Naxx 40 scripts and data
* ZhengPeiRu21 for creating the original version of this module.
