if (!isServer) exitWith {};

_h = [{
  (_this select 0) params ["_inner", "_outer"];
  private ["_cvactive"];
  if (isNull COMMANDVEHICLE) exitWith {[_this select 1] call CBA_fnc_removePerFrameHandler};

  _dist = CITYPOSITION distance2D COMMANDVEHICLE;
  if (_dist > _inner) then {
    if (_dist < _outer) then {
      if (speed COMMANDVEHICLE < 2) then {
        _cvactive = true;
      } else {
        _cvactive = false;
      };
    } else {
      _cvactive = false;
    };
  } else {
    _cvactive = false;
  };

  if (_cvactive != CVACTIVE) then {
    CVACTIVE = _cvactive;
    publicVariable "CVACTIVE";
    diag_log format ["fn_checkCommandVehicle - CVACTIVE is now %1.", CVACTIVE];
  };
} , 1, [BLUFORSPAWNDIST,BLUFORSPAWNDIST+BLUFORSPAWNBAND]] call CBA_fnc_addPerFrameHandler;

diag_log format ["fn_checkCommandVehicle - Loop created. Handle: %1.", _h];
