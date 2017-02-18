class uo_buyables {
    class buyables {
        class equipAI {};
        class equipAIGroup {};
        class initBoatBox {};
        class initSuicideBomber {};
        class suicideBomberExplode {};
        class suicideBomberTarget {};
        class unloadBoat {};
    };
};

class uo_choosePlayArea {
    class choosePlayArea {
        class bluforWaitDialog {};
        class chooseCity {};
        class chooseSpawn {};
        class opforWaitDialog {};
    };
};

class uo_civs {
    class civs {
        class createEnemyMarker {};
        class doFlee {};
        class doSurrender {};
        class createCivs {};
        class findPositionOfInterest {};
        class initCivs {};
        class initPunishments {};
        class makeMilitia {};
        class markEnemy {};
        class onKilled {};
        class spawnCiv {};
        class taskPatrol {};
    };
};

class uo_common {
    class common {
        class copyWaypoints {};
        class createArrowMarker {};
        class createArrowMarkerSide {};
        class createLegendMarker {};
        class createSideMarker {};
        class createSideMarkerRemote {};
        class deleteArrowMarker {};
        class deleteArrowMarkerSide {};
        class deleteSideMarker {};
        class deleteSideMarkerRemote {};
        class diagReport {};
        class doAnimation {};
        class emptyContainer {};
        class findBuildingPositions {};
        class findBuildings {};
        class findRandomPos {};
        class getIslandCfgValue {};
        class getNumberOfTeammates {};
        class handleJIP {};
        class handleTakeRadio {};
        class intro {};
        class isCommander {};
        class saveTeammembers {};
        class serverLog {};
        class sideHint {};
        class sideNotification {};
        class startSpectator {};
        class stopAnimation {};
        class teleport {};
        class temp3dMarker {};
    };
};

class uo_endings {
    class endings {
        class checkBluKilled {};
        class checkCapture {};
        class checkOpfKilled {};
        class checkDefense {};
        class endMission {};
    };
};

class uo_init {
    class init {
        class loadoutFaction {};
        class pubVars {};
        class sequentialInit {};
        class systems {postInit = 1;};
    };
};

class uo_missionObjectives {
    class missionObjectives {
        class bluforBuyAction {};
        class checkCommandVehicle {};
        class commandVehicleMarker {};
        class createCommandVehicle {};
        class createDealer {};
        class cvDestroyAction {};
        class destroyCV {};
        class opforBuyAction {};
        class setCommandVehicle {};
    };
};

class uo_sectors {
    class sectors {
        class checkSector {};
        class drawSectors {};
        class generatePartialCircle {};
        class getSector {};
    };
};

class uo_missionstart {
    class missionstart {
        class createTrigger {};
        class disableBFT {};
        class createLegendMarkers {};
        class findOpfStartPos {};
        class findBluStartPos {};
        class playAreaSetup {};
        class tpSide {};
    };
};

class uo_setup {
    class setup {
        class briefingDone {postInit = 1;};
        class createCustomLocations {};
        class createLocationMarkers {};
        class filterLocations {};
        class moveToMapStart {postInit = 1;};
        class setCommandVehicleClass {};
        class setMapRespawnPos {};
        class setMissionParams {};
        class setMoney {};
        class setOriginalSide {};
        class setTime {};
        class setupCountdown {};
        class setWeather {};
    };
};

class uo_waverespawn {
    class waverespawn {
        class addRespawnedToGroup {};
        class addToWaitGroup {};
        class addToWave {};
        class autoChooseRespawn {};
        class blockMap {};
        class canRespawn {};
        class chooseRespawn {};
        class doRespawn {};
        class findBuilding {};
        class findNearestRespawnObject {};
        class findOpfRespawnPos {};
        class generateGroupName {};
        class getHighestRanking {};
        class getRole {};
        class getSmallestGroup {};
        class getStatus {};
        class initWaveRespawn {};
        class onPlayerKilled {};
        class onPlayerRespawn {};
        class organizeInGroup {};
        class playerCountdown {};
        class prepareRespawn {};
        class removeFromWave {};
        class resetPlayerVars {};
        class respawnGroup {};
        class respawnHint {};
        class respawnSelectorMarker {};
        class setWaveSize {};
        class startWaveLoops {};
        class waveCountdown {};
    };
};
