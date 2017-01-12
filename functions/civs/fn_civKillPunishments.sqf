uo_civkillRatio = 0;
[{
    _killRatio = CIVSKILLEDBLU - CIVSKILLEDOPF;

    switch (true) do {
        //support blufor
        case (_killRatio < -6): {
            if (uo_civkillRatio >= -6) then {[WEST,'Report','Civilians are starting to actively resist the occupying forces.'] remoteExec ['uo_fnc_sideNotification',0,false]};
        };

        case (_killRatio < -3): {
            if (uo_civkillRatio >= -6) then {[WEST,'Report','More Civilians are starting to support your cause.'] remoteExec ['uo_fnc_sideNotification',0,false]};
        };

        case (_killRatio < -1): {
            if (uo_civkillRatio >= -6) then {[WEST,'Report','Some Civilians are starting to support your cause.'] remoteExec ['uo_fnc_sideNotification',0,false]};
        };

        //support opfor
        case (_killRatio > 1): {
            if (uo_civkillRatio >= -6) then {[EAST,'Report','Civilians are starting to support your cause.'] remoteExec ['uo_fnc_sideNotification',0,false]};
        };

        case (_killRatio > 3): {
            if (uo_civkillRatio >= -6) then {[EAST,'Report','More Civilians are starting to support your cause.'] remoteExec ['uo_fnc_sideNotification',0,false]};
        };

        case (_killRatio > 6): {
            if (uo_civkillRatio >= -6) then {[EAST,'Report','Civilians are starting to actively resist the invading forces.'] remoteExec ['uo_fnc_sideNotification',0,false]};
        };
    };

    uo_civkillRatio = _killRatio;
} , 20, []] call CBA_fnc_addPerFrameHandler;
