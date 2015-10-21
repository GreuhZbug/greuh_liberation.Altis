if ( isMultiplayer ) then {
	GRLIB_difficulty_modifier = ["Difficulty",1] call bis_fnc_getParamValue;
	GRLIB_time_factor = ["DayDuration",12] call bis_fnc_getParamValue;
	GRLIB_resources_multiplier = ["ResourcesMultiplier",1] call bis_fnc_getParamValue;
	GRLIB_fatigue = ["Fatigue",1] call bis_fnc_getParamValue;
	GRLIB_revive = ["Revive",3] call bis_fnc_getParamValue;
	GRLIB_introduction = ["Introduction",1] call bis_fnc_getParamValue;
	GRLIB_deployment_cinematic = ["DeploymentCinematic",1] call bis_fnc_getParamValue;
	GRLIB_unitcap = ["Unitcap",1] call bis_fnc_getParamValue;
	GRLIB_adaptive_opfor = ["AdaptToPlayercount",1] call bis_fnc_getParamValue;
	GRLIB_civilian_activity = ["Civilians",1] call bis_fnc_getParamValue;
	GRLIB_teamkill_penalty = ["TeamkillPenalty",0] call bis_fnc_getParamValue;
	GRLIB_build_first_fob = ["FirstFob",0] call bis_fnc_getParamValue;
	GRLIB_param_wipe_savegame_1 = ["WipeSave1",0] call bis_fnc_getParamValue;
	GRLIB_param_wipe_savegame_2 = ["WipeSave2",0] call bis_fnc_getParamValue;
	GRLIB_passive_income = ["PassiveIncome",0] call bis_fnc_getParamValue;
	GRLIB_permissions_param = ["Permissions",1] call bis_fnc_getParamValue;
	GRLIB_halo_param = ["HaloJump",1] call bis_fnc_getParamValue;
	GRLIB_use_whitelist = ["Whitelist",0] call bis_fnc_getParamValue;
	GRLIB_cleanup_vehicles = ["CleanupVehicles",2] call bis_fnc_getParamValue;
} else {
	GRLIB_difficulty_modifier = 1;
	GRLIB_time_factor = 12;
	GRLIB_resources_multiplier = 1;
	GRLIB_fatigue = 1;
	GRLIB_revive = 3;
	GRLIB_introduction = 0;
	GRLIB_deployment_cinematic = 0;
	GRLIB_adaptive_opfor = 1;
	GRLIB_unitcap = 1;
	GRLIB_civilian_activity = 1;
	GRLIB_teamkill_penalty = 0;
	GRLIB_build_first_fob = 0;
	GRLIB_param_wipe_savegame_1 = 0;
	GRLIB_param_wipe_savegame_2 = 0;
	GRLIB_passive_income = 0;
	GRLIB_permissions_param = 1;
	GRLIB_halo_param = 1;
	GRLIB_use_whitelist = 0;
	GRLIB_cleanup_vehicles = 2;
};

GRLIB_fatigue = GRLIB_fatigue / 2.0; // This is stupid but you can't use a decimal value as the default setting

if ( GRLIB_introduction == 1 ) then { GRLIB_introduction = true } else { GRLIB_introduction = false };
if ( GRLIB_deployment_cinematic == 1 ) then { GRLIB_deployment_cinematic = true } else { GRLIB_deployment_cinematic = false };
if ( GRLIB_build_first_fob == 1 ) then { GRLIB_build_first_fob = true } else { GRLIB_build_first_fob = false };
if ( GRLIB_teamkill_penalty == 1 ) then { GRLIB_teamkill_penalty = true } else { GRLIB_teamkill_penalty = false };
if ( GRLIB_adaptive_opfor == 1 ) then { GRLIB_adaptive_opfor = true } else { GRLIB_adaptive_opfor = false };
if ( GRLIB_passive_income == 1 ) then { GRLIB_passive_income = true } else { GRLIB_passive_income = false };
if ( GRLIB_permissions_param == 1 ) then { GRLIB_permissions_param = true } else { GRLIB_permissions_param = false };
if ( GRLIB_halo_param == 1 ) then { GRLIB_halo_param = true } else { GRLIB_halo_param = false };
if ( GRLIB_use_whitelist == 1 ) then { GRLIB_use_whitelist = true } else { GRLIB_use_whitelist = false };