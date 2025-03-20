## 0.9.5.1
- Fixed 4 issues
  - Eating a cookie leads to a crash (#30)
  - Trainings lead to a soft-lock (#29)
  - Fixed a typo in Azazel's 4th "scene"
  - Being clothed during Pawjob scene leads to a crash (#31)

## 0.9.5
- Added Azazel's 4th corruption scene (only appearing before enslavement)
  - This is very involved "scene" as it introduces temporary floor exploring some mechanics. There is some body part morph for penis having characters, and "introduction" to two other perks that player will be able to obtain when playing as a pet
- Implementation of Pet Commands perk
  - Makes the player vulnerable to commands. Guards can naturally spawn and if player has this perk they can stun the player for 1-2 turns by giving them a command
- Implementation of Pet Speech perk
  - Currently unobtainable except temporary state in Azazel's 4th corruption scene
  - Makes player's speech incoherent
- Implementation of non-con mode
  - With two different paths player can take to enable it
    - Player can take Slave Candy to Issix and ask him to feed the player with it
    - Players who don't want to dom in BDCC can also find an event on a pasture walk after obtaining all of the perks on Pet level 10+ (currently impossible as not all perks are implemented)
  - Non-con mode forces the player to come to the harem if they haven't visited it until certain hour or last day, player will move to the harem from their position without any input and be forced to spend required time in the harem
  - This mode also disables some choices to further make it feel like player is no longer in control
  - More is expected to be implemented here in the future
- Added a system for punishment and reward
  - Player can be rewarded or punished for various deeds
  - Currently only 2 scenes have been implemented - one as a reward and one as a punishment, not much currently triggers those
- Rewrote progression system to be based entirely on Pet skill level
- Added 3 Hiisi scenes
- Made pet specific scenes appear only after increasing affection
- Added donating BDSM gear mechanic:
  - Allows the player to donate extra BDSM gear, the one purchasable at the Announcer cannot be traded in
  - Every 10 donations player is entitled to a reward
  - After 50 donations player can apply random slut locks onto items
  - Introduced new item - Luck Token that can be exchanged for credits with The Announcer
- Added Tasks
  - Player can do tasks to slightly increase Issix's mood, tasks unlock after pet level 4
  - There are two tasks implemented: Laundry and Drone finding
    - Laundry is more or less simple walk with Hiisi with Laundry
    - Drone is more involved - it requires steering a "drone" over heads of everyone to find an random item located somewhere in the prison OR on someone. Avoid the guards who do not like buzzing above their heads or face consequences of your actions (requires pet level 6)
- Added protection mechanic where after becoming Master's pet, Hiisi will protect the player from random inmates starting fights
  - This is opt-out feature that you can stop from happening when talking with Hiisi in Pet tasks menu
- Added walks to „Pasture”
  - Currently 3 implemented mechanics there - threesome with Azazel & Issix, a "Ball Chasing" minigame and outhouse with opt-in (via in-game settings) watersport scenes as well as small other scene for hot tub (+ a status effect)
- Countless bugfixes and game design improvements for content in previous release
- Added optional FoxLib dependency - this is highly recommended option, it will allow you to specify skin/fur/scales coverage of the body for use in some dialogues as well as enable support for runes used in two scenes.
- Added a trash can inside Pet tasks menu - it allows the player to discard all of the empty condoms from the inventory - just a convenience feature since doing that one by one is time-consuming
- Azazel can now teach the player mastery of Fertility increasing the Fertility skill - they can do so only if either the player or Azazel is currently pregnant up to level 10, the price the player pays for that however might be high...
- Lamia can help the player with unequipping bondage gear, though they can't help with smart-locks and sometimes might break the equipment
- Player can ask Issix to take off Keylock locked items on them, however if Issix's mood isn't good this will fail

Big thanks to BDCC community for reporting multiple bugs to me!

## Initial release
- A lot of things I don't even plan to list
