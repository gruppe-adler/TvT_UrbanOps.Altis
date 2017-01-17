params ["_type","_color","_text","_side"];

_allLegendMarkers = missionNamespace getVariable ["uo_allLegendMarkers",[]];
_markerPos = [worldSize + (worldSize/35),worldSize - ((worldSize/16) * (count _allLegendMarkers)),0];

_markername = format ["marker_legend_%1", count _allLegendMarkers];
_allLegendMarkers pushBack _markername;
missionNamespace setVariable ["uo_allLegendMarkers",_allLegendMarkers];


if (!isNil "_side") then {
    [_side,_markername,_false,_markerPos,_type,_color,_text] call uo_fnc_createSideMarkerRemote;

} else {
    _marker = createMarker [_markername,_markerPos];

    _marker setMarkerType _type;
    _marker setMarkerColor _color;
    _marker setMarkerText _text;
};
