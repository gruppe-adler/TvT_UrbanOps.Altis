class mcd {
    class choosePlayArea {
        class bluforWaitDialog {};
        class chooseCity {};
        class chooseSpawn {};
        class opforWaitDialog {};
    };

    class civs {
        class civKilled {};
        class createCivs {};
        class findBuildingPositions {};
        class findHouses {};
        class initCivs {};
        class spawnDealer {};
        class spawnNonstaticCiv {};
        class spawnStaticCiv {};
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
        class intro {};
        class serverLog {};
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
        class initPubVars {};
        class initSystems {postInit = 1;};
        class sequentialInit {};
    };

    class missionstart {
        class checkCommandVehicle {};
        class commandVehicleMarker {};
        class createCommandVehicle {};
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
        class setCommandVehicle {};
        class setLocationMarkers {};
        class setMapRespawnPos {};
        class setMissionParams {};
        class setOriginalSide {};
        class setTime {};
        class setupCountdown {};
        class setWeather {};
    };

    class waverespawn {
        class addRespawnedToGroup {};
        class addToWave {};
        class blockMap {};
        class initWaveRespawn {};
        class onWavePlayerKilled {};
        class onWavePlayerRespawn {};
        class removeFromWave {};
        class respawnHint {};
        class respawnPlayer {};
        class setWaveSize {};
        class startWaveLoops {};
        class waveCvCheck {};
        class wavePlayerCountdown {};
        class waveWaveCountdown {};
    };
};
