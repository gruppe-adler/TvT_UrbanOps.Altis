mcd_fnc_mmAddMoneyAction = compile preprocessFileLineNumbers "player\moneymenu\fn_mmAddMoneyAction.sqf";
mcd_fnc_mmSendMoney = compile preprocessFileLineNumbers "player\moneymenu\fn_mmSendMoney.sqf";
mcd_fnc_mmReceiveMoney = compile preprocessFileLineNumbers "player\moneymenu\fn_mmReceiveMoney.sqf";
mcd_fnc_mmCheckSendMoney = compile preprocessFileLineNumbers "player\moneymenu\fn_mmCheckSendMoney.sqf";
mcd_fnc_mmUpdateMoney = compile preprocessFileLineNumbers "player\moneymenu\fn_mmUpdateMoney.sqf";

{
  [_x] call mcd_fnc_mmAddMoneyAction;
} forEach playableUnits;
