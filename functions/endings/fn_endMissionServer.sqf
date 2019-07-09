#define PREFIX uo
#define COMPONENT endings
#include "\x\cba\addons\main\script_macros_mission.hpp"


if (missionNamespace getVariable [QGVAR(endInProgressServer),false]) exitWith {INFO("A different ending is already in progress.")};

_this spawn {
    params ["_winner","_winText"];

    _winningText = switch (_winningSide) do {
        case "WEST": {"BLUFOR WINS"};
        case "EAST": {"OPFOR WINS"};
    };
    _text = format ["<img size= '6' style='vertical-align:middle' shadow='false' image='data\gruppe-adler.paa'/><br/><t size='.9' color='#FFFFFF'>%1<br/>%2</t>", _endText, _winningText];
    [_text,0,0,2,2] remoteExec ["BIS_fnc_dynamicText",0,false];

    sleep 5;

    if (!isNil "uo_missionStats") then {
        uo_missionStats remoteExec ["grad_scoreboard_fnc_loadScoreboard",0,false];
        sleep 18;
    } else {
        systemChat "uo_missionStats has not been received. Not displaying scoreboard.";
    };
    
    _this remoteExec [QFUNC(endMissionClient),0,false];
    [] call GRAD_replay_fnc_stopRecord;
};
