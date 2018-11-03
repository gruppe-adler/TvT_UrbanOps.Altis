#include "script_component.hpp"

params ["_map"];

private _color = [GVAR(highcommandSide)] call FUNC(getSideColor);
{
    _pos = getPos leader _x;

    // draw group icon and ID
    _map drawIcon [
        format ["\A3\ui_f\data\map\markers\nato\%1.paa",[_x] call ace_common_fnc_getMarkerType],
        _color,
        _pos,
        24,
        24,
        0,
        groupID _x,
        0,
        0.04,
        'TahomaB',
        'right'
    ];

    // draw selector icon
    _icon = ["\A3\ui_f\data\map\groupicons\selector_selectable_ca.paa","\A3\ui_f\data\map\groupicons\selector_selected_ca.paa"] select (_x == GVAR(currentGroup));
    _map drawIcon [
        _icon,
        [1,1,1,1],
        _pos,
        40,
        40,
        0,
        "",
        0,
        0.04,
        'TahomaB',
        'right'
    ];
} forEach GVAR(editableGroups);
