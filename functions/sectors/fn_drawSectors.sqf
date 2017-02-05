params ["_draw"];

if (_draw) then {

    if (isNil "uo_sector_allPolys") then {
        uo_sector0_poly = [CITYPOSITION vectorAdd [ 2.5, 2.5,0],CITYAREASIZE-5,[0,90],20] call uo_sectors_fnc_generatePartialCircle;
        uo_sector1_poly = [CITYPOSITION vectorAdd [ 2.5,-2.5,0],CITYAREASIZE-5,[90,180],20] call uo_sectors_fnc_generatePartialCircle;
        uo_sector2_poly = [CITYPOSITION vectorAdd [-2.5,-2.5,0],CITYAREASIZE-5,[180,270],20] call uo_sectors_fnc_generatePartialCircle;
        uo_sector3_poly = [CITYPOSITION vectorAdd [-2.5, 2.5,0],CITYAREASIZE-5,[270,360],20] call uo_sectors_fnc_generatePartialCircle;
        uo_sector_allPolys = [uo_sector0_poly,uo_sector1_poly,uo_sector2_poly,uo_sector3_poly];
    };

    uo_sector_mapCtrlEH = findDisplay 12 displayCtrl 51 ctrlAddEventHandler ["Draw",
    {
        {
            _status = [_forEachIndex] call uo_sectors_fnc_checkSector;
            _color = if (_status) then {[0,0.8,0,1]} else {[1,0,0,1]};
            _this select 0 drawPolygon [_x,_color];
        } forEach uo_sector_allPolys;
    }];
} else {
    findDisplay 12 displayCtrl 51 ctrlRemoveEventHandler ["Draw", missionNamespace getVariable ["uo_sector_mapCtrlEH",-1]];
    uo_sector_mapCtrlEH = -1;
};
