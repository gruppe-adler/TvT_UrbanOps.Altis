params ["_framesToWait","_code"];

addMissionEventHandler ["Draw3D",format [
    "
        missionNamespace setVariable ['uo_common_wait3Dframes_%1', (missionNamespace getVariable ['uo_common_wait3Dframes_%1',0]) + 1];
        if (uo_common_wait3Dframes_%1 > 3) exitWith {
            uo_common_wait3Dframes_%1 = nil;
            call %2;
            removeMissionEventHandler ['Draw3D',_thisEventHandler];
        };
    ",
round time + round (random 1000) ,_code]];

nil
