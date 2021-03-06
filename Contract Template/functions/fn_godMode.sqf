#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Sets up ACRE2 God Mode access and groups for Admins.
 * Call from initPlayerLocal.sqf.
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call FUNC(godMode);
 */

params ["_player"];

if ((getPlayerUID _player) in ADMINS) then {
    [true, true] call acre_api_fnc_godModeConfigureAccess;
    [ADMINS, 0] call acre_api_fnc_godModeModifyGroup;
    ["Admins", 0] call acre_api_fnc_godModeNameGroup;
};
