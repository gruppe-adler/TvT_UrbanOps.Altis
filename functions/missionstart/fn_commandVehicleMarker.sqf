params ["_cv", "_id"];

if (player getVariable ["originalSide", "UNKNOWN"] != "WEST") exitWith {};
if (isNil "_cv") exitWith {};
if (isNull _cv) exitWith {};

_marker = createMarkerLocal [format ["cvMarker_%1", _id], getPos _cv];
_marker setMarkerTypeLocal "b_hq";
_markerText = format ["Commandvehicle %1", _id];
_marker setMarkerTextLocal _markerText;

[{
  params ["_args", "_handle"];
  _args params ["_cv", "_marker", "_markerText"];

  //vehicle is gone
  if (isNull _cv) exitWith {
    deleteMarkerLocal _marker;
    [_handle] call CBA_fnc_removePerFrameHandler;
  };

  _marker setMarkerPos (getPos _cv);

  //vehicle is destroyed
  if (!alive _cv) exitWith {
    _marker setMarkerTextLocal format ["%1 (destroyed)", _markerText];
    [_handle] call CBA_fnc_removePerFrameHandler;
  };

  //vehicle is immobilized
  if (!canMove _cv && !(_cv getVariable ["uo_cv_immobilizedMarker", false])) then {
    _cv setVariable ["uo_cv_immobilizedMarker", true];
    _marker setMarkerTextLocal format ["%1 (immobilized)", _markerText];
  };

  //vehicle is no longer immobilized
  if (canMove _cv && (_cv getVariable ["uo_cv_immobilizedMarker", false])) then {
    _cv setVariable ["uo_cv_immobilizedMarker", false];
    _marker setMarkerTextLocal _markerText;
  };

} , 2, [_cv, _marker, _markerText]] call CBA_fnc_addPerFrameHandler;
