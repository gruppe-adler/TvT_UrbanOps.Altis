class uo_choosePlayArea {
    class choosePlayArea {
        class bluforWaitDialog {};
        class chooseCity {};
        class chooseSpawn {};
        class opforWaitDialog {};
    };
};

class uo_chooseRespawn {
    class chooseRespawn {
        class choose {};
        class findNearestRespawnObject {};
        class respawnSelectorMarker {};
    };
};

class uo_civs {
    class civs {
        class createEnemyMarker {};
        class createLegendMarkers {};
        class doFlee {};
        class doSurrender {};
        class createCivs {};
        class findBuildingPositions {};
        class findHouses {};
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
        class createLegendMarker {};
        class createSideMarker {};
        class createSideMarkerRemote {};
        class deleteSideMarker {};
        class deleteSideMarkerRemote {};
        class diagReport {};
        class doAnimation {};
        class emptyContainer {};
        class findRandomPos {};
        class getIslandCfgValue {};
        class getNumberOfTeammates {};
        class intro {};
        class isCommander {};
        class saveTeammembers {};
        class serverLog {};
        class sideHint {};
        class sideNotification {};
        class stopAnimation {};
        class teleport {};
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
        class opforBuyAction {};
        class setCommandVehicle {};
    };
};

class uo_missionstart {
    class missionstart {
        class createTrigger {};
        class findOpfSpawnPos {};
        class findOpfStartPos {};
        class findBluStartPos {};
        class playAreaSetup {};
        class tpSide {};
    };
};

class uo_setup {
    class setup {
        class briefingDone {postInit = 1;};
        class createLocationMarkers {};
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
        class addToWave {};
        class blockMap {};
        class cvCheck {};
        class doRespawn {};
        class initWaveRespawn {};
        class onPlayerKilled {};
        class onPlayerRespawn {};
        class playerCountdown {};
        class prepareRespawn {};
        class removeFromWave {};
        class respawnHint {};
        class setWaveSize {};
        class startWaveLoops {};
        class waveCountdown {};
    };
};
