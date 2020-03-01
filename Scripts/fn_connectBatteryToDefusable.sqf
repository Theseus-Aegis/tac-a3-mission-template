/*
 * Author: Jonpas, TyroneMF
 * Requires a Battery to IED setup, handles disconnecting battery from IED and defusing it.
 * 
 * Call from initPlayerLocal.sqf
 *
 * Arguments
 * 0: Battery <OBJECT>
 * 1: IED <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [Battery, IED] call TAC_Scripts_fnc_connectIEDBattery;
 */
#include "..\script_component.hpp"

params ["_battery", "_explosive"];

private _action = [
    QGVAR(disconnectIEDAction),
    "Disconnect IED",
    "",
    {
        params ["_target", "_player", "_args"];
        _args params ["_battery", "_explosive"];
        [5, [_player, _explosive], {(_this select 0) call ACEFUNC(explosives,defuseExplosive)}, {}, "Disconnecting Battery...", {true}, ["isNotSwimming"]] call ACEFUNC(common,progressBar);
    },
    {true},
    {},
    [_battery, _explosive]
] call ACEFUNC(interact_menu,createAction);

[_battery, 0, ["ACE_MainActions"], _action] call ACEFUNC(interact_menu,addActionToObject);