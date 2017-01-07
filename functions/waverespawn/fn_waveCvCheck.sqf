//check interrupt
if (player getVariable "wr_interrupted") exitWith {
    player setVariable ["wr_cvCheckDone", true];
};

if (player getVariable ["originalSide", "UNKNOWN"] == "WEST") then {
    if ({_x getVariable ["uo_respawnObject_isActive", false]} count uo_cv_allCVs == 0) then {
        [{
            _who = if (count uo_cv_allCVs > 1) then {"Kommandofahrzeuge sind"} else {"Kommandofahrzeug ist"};
            _status = parseText format ["<t align='center' size='1.4'>%1 in Bewegung oder nicht im Spawnbereich.</t>", _who];
            _wait = parseText "<t align='center' size='1.4' color='#ff0000'>Warte...</t>";
            [_status, _wait] call mcd_fnc_respawnHint;

            ({_x getVariable ["uo_respawnObject_isActive", false]} count uo_cv_allCVs > 0)
        }, {player setVariable ["wr_cvCheckDone", true]}, []] call CBA_fnc_waitUntilAndExecute;
    } else{
        player setVariable ["wr_cvCheckDone", true];
    };

} else {
    player setVariable ["wr_cvCheckDone", true];
};
