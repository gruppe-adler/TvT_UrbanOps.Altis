params ["_unit","_player"];

alive _unit &&
{side _unit == side _player} &&
{!(isPlayer _unit)} &&
{_unit getVariable ["grad_aicommand_canReceiveCommands",grad_aicommand_canReceiveCommandsDefault]} &&
{_player getVariable ["grad_aicommand_canGiveCommands",grad_aicommand_canGiveCommandsDefault]} &&
{_player getVariable ["grad_aicommand_givePermissionLevel",0] >= _unit getVariable ["grad_aicommand_receivePermissionLevel",0]}
