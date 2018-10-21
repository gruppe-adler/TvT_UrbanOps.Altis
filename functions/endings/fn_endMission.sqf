#define PREFIX uo
#define COMPONENT endings
#include "\x\cba\addons\main\script_macros_mission.hpp"


if (hasInterface) then {
    _endMission = {
        _value = _this select 1;
        _value params ["_winningSide", "_endText"];

        [_winningSide,_endText] spawn {
            params ["_winningSide","_endText"];

            if (missionNamespace getVariable ["uo_endInProgressClient", false]) exitWith {INFO("A different ending is already in progress.")};
            uo_endInProgressClient = true;

            _winningText = switch (_winningSide) do {
                case "WEST": {"BLUFOR WINS"};
                case "EAST": {"OPFOR WINS"};
            };
            _text = format ["<img size= '6' style='vertical-align:middle' shadow='false' image='data\gruppe-adler.paa'/><br/><t size='.9' color='#FFFFFF'>%1<br/>%2</t>", _endText, _winningText];
            [_text,0,0,2,2] spawn BIS_fnc_dynamicText;

            sleep 5;

            if (!isNil "uo_missionStats") then {
                uo_missionStats call grad_scoreboard_fnc_loadScoreboard;
                sleep 18;
            } else {
                systemChat "uo_missionStats has not been received. Not displaying scoreboard.";
            };

            [] call GRAD_replay_fnc_stopRecord;
            waitUntil {missionNamespace getVariable ["REPLAY_FINISHED",false]};

            _isVictory = if (_winningSide == (player getVariable ["originalSide", "UNKNOWN"])) then {true} else {false};
            [{["end1", _this select 0, true, true, true] spawn BIS_fnc_endMission}, [_isVictory], 5] call CBA_fnc_waitAndExecute;
        };
    };

    //dedicated
    if (!isServer) then {
        "uo_gameEnded" addPublicVariableEventHandler _endMission;
    };

    //localhost
    if (isServer) then {
        [{count (missionNamespace getVariable ["uo_gameEnded", []]) > 0}, {
            ["uo_gameEnded", uo_gameEnded] call (_this select 0);
        }, [_endMission]] call CBA_fnc_waitUntilAndExecute;
    };
};
