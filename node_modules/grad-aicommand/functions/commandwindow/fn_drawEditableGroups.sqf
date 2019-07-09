#include "script_component.hpp"

params ["_map"];

private _color = [GVAR(highcommandSide)] call FUNC(getSideColor);
{
    private _pos = getPos leader _x;
    private _marker = if (_x in GVAR(individualUnitsGroups)) then {
        "\A3\ui_f\data\map\markers\system\dummy_ca.paa"
    } else {
        format ["\A3\ui_f\data\map\markers\nato\%1.paa",[_x] call ace_common_fnc_getMarkerType]
    };

    // draw group icon and ID
    _map drawIcon [
        _marker,
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
    _icon = ["\A3\ui_f\data\map\groupicons\selector_selectable_ca.paa","\A3\ui_f\data\map\groupicons\selector_selected_ca.paa"] select (_x in GVAR(currentGroups));
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
