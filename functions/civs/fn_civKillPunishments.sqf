uo_civkillRatio = 0;
[{
    _killRatio = CIVSKILLEDBLU - CIVSKILLEDOPF;

    switch (true) do {
        //support blufor
        case (_killRatio < -6): {
            if (uo_civkillRatio >= -6) then {[WEST,'Report','Civilians are starting to actively resist the occupying forces.'] remoteExec ['uo_fnc_sideNotification',0,false]};
            if (50 > random 100) then {[EAST,[0,100]] call uo_fnc_civMarkEnemy};
            if (20 > random 100) then {[selectRandom (missionNamespace getVariable ["uo_cv_allCivs",[]])] call uo_fnc_makeMilitia};
            if (6 > random 100) then {[EAST,[0,20],"RESPAWNOBJECT"] call uo_fnc_civMarkEnemy};

        };

        case (_killRatio < -3): {
            if (uo_civkillRatio >= -3) then {[WEST,'Report','More civilians are starting to support your cause.'] remoteExec ['uo_fnc_sideNotification',0,false]};
            if (uo_civkillRatio < -6) then {[WEST,'Report','Civilians are no longer resisting the invading forces.'] remoteExec ['uo_fnc_sideNotification',0,false]};
            if (30 > random 100) then {[EAST,[50,150]] call uo_fnc_civMarkEnemy};
            if (2 > random 100) then {[EAST,[0,100],"RESPAWNOBJECT"] call uo_fnc_civMarkEnemy};
        };

        case (_killRatio < -1): {
            if (uo_civkillRatio >= -1) then {
                [WEST,'Report','Some civilians are starting to support your cause.'] remoteExec ['uo_fnc_sideNotification',0,false];
                INDEPENDENT setFriend [EAST,0];
                EAST setFriend [INDEPENDENT,0];
            };
            if (uo_civkillRatio < -3) then {[WEST,'Report','Some civilians are hesitant to support you any longer.'] remoteExec ['uo_fnc_sideNotification',0,false]};
            if (10 > random 100) then {[EAST,[100,200]] call uo_fnc_civMarkEnemy};
        };

        //support opfor
        case (_killRatio > 6): {
            if (uo_civkillRatio <= 6) then {[EAST,'Report','Civilians are starting to actively resist the invading forces.'] remoteExec ['uo_fnc_sideNotification',0,false]};
            if (50 > random 100) then {[WEST,[0,100]] call uo_fnc_civMarkEnemy};
            if (20 > random 100) then {[selectRandom (missionNamespace getVariable ["uo_cv_allCivs",[]])] call uo_fnc_makeMilitia};
            if (6 > random 100) then {[WEST,[0,200],"RESPAWNOBJECT"] call uo_fnc_civMarkEnemy};
        };

        case (_killRatio > 3): {
            if (uo_civkillRatio <= 3) then {[EAST,'Report','More civilians are starting to support your cause.'] remoteExec ['uo_fnc_sideNotification',0,false]};
            if (uo_civkillRatio > 6) then {[EAST,'Report','Civilians are no longer resisting the invading forces.'] remoteExec ['uo_fnc_sideNotification',0,false]};
            if (30 > random 100) then {[WEST,[50,150]] call uo_fnc_civMarkEnemy};
            if (2 > random 100) then {[WEST,[100,300],"RESPAWNOBJECT"] call uo_fnc_civMarkEnemy};
        };

        case (_killRatio > 1): {
            if (uo_civkillRatio <= 1) then {
                [EAST,'Report','Some civilians are starting to support your cause.'] remoteExec ['uo_fnc_sideNotification',0,false];
                INDEPENDENT setFriend [WEST,0];
                WEST setFriend [INDEPENDENT,0];
            };
            if (uo_civkillRatio > 3) then {[EAST,'Report','Some civilians are hesitant to support you any longer.'] remoteExec ['uo_fnc_sideNotification',0,false]};
            if (10 > random 100) then {[WEST,[100,200]] call uo_fnc_civMarkEnemy};

        };

        default {
            if (uo_civkillRatio > 1) then {[EAST,'Report','Civilians are no longer supporting you.'] remoteExec ['uo_fnc_sideNotification',0,false]};
            if (uo_civkillRatio < -1) then {[WEST,'Report','Civilians are no longer supporting you.'] remoteExec ['uo_fnc_sideNotification',0,false]};
            if (uo_civkillRatio > 1 || uo_civkillRatio < -1) then {
                INDEPENDENT setFriend [WEST,1];
                WEST setFriend [INDEPENDENT,1];
                INDEPENDENT setFriend [WEST,1];
                WEST setFriend [INDEPENDENT,1];
            };
        };
    };

    uo_civkillRatio = _killRatio;
} , 20, []] call CBA_fnc_addPerFrameHandler;
