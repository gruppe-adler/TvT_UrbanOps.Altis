class uo {
    class choosePlayArea {
        class bluforWaitDialog {};
        class chooseCity {};
        class chooseSpawn {};
        class opforWaitDialog {};
    };

    class chooseRespawn {
        class chooseRespawn {};
        class findNearestRespawnObject {};
        class respawnSelectorMarker {};
    };

    class civs {
        class civKilled {};
        class civKillPunishments {};
        class createCivs {};
        class findBuildingPositions {};
        class findHouses {};
        class findPositionOfInterest {};
        class initCivs {};
        class spawnNonstaticCiv {};
        class spawnStaticCiv {};
        class taskPatrol {};
    };

    class common {
        class createSideMarker {};
        class createSideMarkerRemote {};
        class deleteSideMarker {};
        class deleteSideMarkerRemote {};
        class diagReport {};
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
        class teleport {};
    };

    class endings {
        class endByBluKilled {};
        class endByControl {};
        class endByOpfKilled {};
        class endByTimeout {};
        class endMission {};
    };

    class init {
        class initLoadoutFaction {};
        class initPubVars {};
        class initSystems {postInit = 1;};
        class sequentialInit {};
    };

    class missionObjectives {
        class bluforBuyAction {};
        class checkCommandVehicle {};
        class commandVehicleMarker {};
        class createCommandVehicle {};
        class opforBuyAction {};
        class setCommandVehicle {};
        class spawnDealer {};
    };

    class missionstart {
        class createTrigger {};
        class findOpfSpawnPos {};
        class findOpfStartPos {};
        class findBluStartPos {};
        class playAreaSetup {};
        class tpSide {};
    };

    class setup {
        class briefingDone {postInit = 1;};
        class moveToMapStart {postInit = 1;};
        class setCommandVehicleClass {};
        class setLocationMarkers {};
        class setMapRespawnPos {};
        class setMissionParams {};
        class setMoney {};
        class setOriginalSide {};
        class setTime {};
        class setupCountdown {};
        class setWeather {};
    };

    class waverespawn {
        class addRespawnedToGroup {};
        class addToWave {};
        class blockMap {};
        class doRespawn {};
        class initWaveRespawn {};
        class onWavePlayerKilled {};
        class onWavePlayerRespawn {};
        class prepareRespawn {};
        class removeFromWave {};
        class respawnHint {};
        class setWaveSize {};
        class startWaveLoops {};
        class waveCvCheck {};
        class wavePlayerCountdown {};
        class waveWaveCountdown {};
    };
};
