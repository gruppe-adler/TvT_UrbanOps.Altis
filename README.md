# Urban Ops
Urban Ops is a dynamic seize/defend mission for all maps.  
OPFOR chooses a city that they will have to defend for X minutes (*Capture Time*), while BLUFOR tries to capture it. Both teams have to be careful not to hurt any civilians or else they might start helping the opponent.

<!-- TOC depthFrom:2 depthTo:6 withLinks:1 updateOnSave:1 orderedList:0 -->

- [Info](#info)
- [Game Flow](#game-flow)
- [Objectives](#objectives)
	- [BLUFOR](#blufor)
	- [OPFOR](#opfor)
- [The Dealer (OPFOR)](#the-dealer-opfor)
- [Commandvehicles (BLUFOR)](#commandvehicles-blufor)
- [Factions](#factions)
- [Civilians](#civilians)
- [Parameters](#parameters)
- [Pictures](#pictures)

<!-- /TOC -->


## Info
* Gamemode: TvT - seize/defend
* Map: Can be used on all maps that are included in [cfgIslands](https://github.com/gruppe-adler/TvT_UrbanOps.Altis/blob/master/cfgIslands.hpp)
* Medical system: ACE basic
* Respawn: Wave-respawn / conditional permadeath

## Game Flow
1. OPFOR commander chooses one of the available *Locations* from the map (OPFOR players can watch)
2. OPFOR spawns at the chosen *Location* and has X minutes (*SetupTime*) to prepare for the attack
3. OPFOR can buy equipment from the *Dealer* (position marked on map, visible to OPFOR)
4. BLUFOR is on the map during preparation time and can make plans to attack (they see the chosen *Location*)
5. BLUFOR commander chooses a start position outside the *Respawn Zone*
6. BLUFOR can buy equipment at the *Commandvehicle* (spawns on start position, marked on map, visible to BLUFOR)

## Objectives
### BLUFOR
BLUFOR wins when:
* all OPFOR units (including AI) have been eliminated and OPFOR is unable to respawn
* BLUFOR controls the *Location* for X minutes (*CaptureTime*)
  * BLUFOR is in control when the ratio of BLUFOR units to OPFOR units (including AI) is at X:Y (*ControlRatio*)
  * if BLUFOR loses control, the capture time needed to win is not reset

### OPFOR
OPFOR wins when:
* all BLUFOR units (including AI) have been eliminated and BLUFOR is unable to respawn
* the *Location* has been defended for X minutes (*DefenseTime*)

## The Dealer (OPFOR)
The *Dealer* is a shady character with connections. He moves supplies into and out of the *Location*. He will help the defending forces, but for a price.

The *Dealer*'s position is marked on OPFOR's map. OPFOR units can buy supplies from the *Dealer*. As long as the *Dealer* is alive, OPFOR units can respawn in waves. Respawned units will respawn somewhere in the *Location* area, not necessarily on the *Dealer's* position.

The *Dealer* will most likely have his shop in a building of some sort. He will look like a normal civilian, but is identifiable by the drugs that he has in his inventory.

## Commandvehicles (BLUFOR)
BLUFOR will start their game with a *Commandvehicle*. Supplies, including additional *Commandvehicles* can be bought from each one. *OPFOR* can destroy *Commandvehicles* with an ACE-Interaction.

Each *Commandvehicle's* position is marked on BLUFOR's map. The markers will be blue if respawn is possible and red if respawn is not possible on the respective vehicle. Respawning on a *Commandvehicle* is possible if all conditions are met:

* is inside the *Respawn Zone*
* is not moving
* is not disabled (engine or hull in critical condition) or destroyed
* does not have any enemies near it (100m)

Respawning *BLUFOR* units will be prompted to choose which *Commandvehicle* to respawn on from the map, if their team has more than one.

## Factions
Different factions for BLUFOR and OPFOR can be chosen during mission setup. The chosen faction will determine the loadouts, the *Commandvehicles* and the supplies that players can buy. Typical BLUFOR factions (e.g. USA - Army) can be chosen for the OPFOR side to put them in the defending role.

Buyables for each faction depending on side (click the *EAST* tab on the bottom) can be found [here (Google Docs)](https://docs.google.com/spreadsheets/d/1w11wbEgCwPNKWOaUPZlpDI1xXoBMm5X9WyYgqM6s26w/edit?usp=sharing).

playable:
* USA - Army
* Russia - MSV

planned:
* Germany - Heer
* Independent - Eastern European Rebels
* Independent - Islamic Terrorists

## Civilians
Civilians will go about their lives in the *Location*. The more buildings there are in a *Location* the more civilians will usually be present. Some civilians will be in or around their houses while others will walk around. When civilians are killed by one side, they will start supporting the other. The amount of kills that one side has over the other is relevant. When each level of support is reached for the first time, both sides will get a notification.

Civilians can be ordered to surrender by ACE-interacting with them. If they actually do it and if so for how long, or if they just try to flee instead, depends on how much they trust you.

Kills more | Effect
-----------|-----------------------------------------------------------------------------------------------------------------------------------
2          | markers on enemy units near the *Location*
4          | more accurate, more frequent markers on enemy units near the *Location*; markers on the *Dealer* or *Commandvehicles* respectively
6          | more accurate markers on *Dealer* or *Commandvehicles*; civilians will start taking up arms and fight


## Parameters

Parameter           | Default      | Explanation
--------------------|--------------|----------------------------------------------------------------------------
Weather             | Random       | sets weather
Time of Day         | Random       | sets time (random is only day)
BLUFOR Faction      | USA - Army   | sets BLUFOR faction
OPFOR Faction       | Russia - MSV | sets OPFOR faction
Preset              | Custom       | sets all other parameters for you, unless *Custom* is selected
*DefenseTime*       | 45 min       | time that OPFOR has to defend the *Location* for
*CaptureTime*       | 10 min       | time that BLUFOR has to be in control of the *Location* to win
*SetupTime*         | 3 min        | time after OPFOR spawn after which BLUFOR may choose their spawn
*ControlRatio*      | 2:1          | ratio BLUFOR:OPFOR for BLUFOR to be considered in control of the *Location*
Money               | Normal       | relative amount of money for both teams
OPFOR Respawn       | Enabled      | sets if OPFOR can respawn
BLUFOR Wave Size    | Automatic    | BLUFOR wave respawn wave size
OPFOR Wave Size     | Automatic    | OPFOR wave respawn wave size
Player Respawn Time | 2.5 min      | player respawn time for wave respawn
Wave Respawn Time   | 4.5 min      | wave respawn time for wave respawn

## Pictures

**OPFOR commander is choosing a location:**
![](http://i.imgur.com/bYgqxTH.jpg)

**BLUFOR commander is choosing a start position outside the *Respawn Zone***
![](http://i.imgur.com/2Rf5cOX.jpg)

**Buy menu on a *Commandvehicle*:**
![](http://i.imgur.com/Dr8qG8a.jpg)

**Two *Commandvehicles* near BLUFOR spawn, one inside, one outside the *Respawn Zone*:**
![](http://i.imgur.com/1ZJhQLg.jpg)

**Drugs in the *Dealer's* inventory:**
![](http://i.imgur.com/AoB0YpU.jpg)
