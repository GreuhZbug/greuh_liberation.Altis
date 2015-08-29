if ( isMultiplayer ) then {
	GRLIB_difficulty_modifier = ["Difficulty",1] call bis_fnc_getParamValue;
	GRLIB_time_factor = ["DayDuration",12] call bis_fnc_getParamValue;
	GRLIB_resources_multiplier = ["ResourcesMultiplier",1] call bis_fnc_getParamValue;
	GRLIB_fatigue = ["Fatigue",1] call bis_fnc_getParamValue;
	GRLIB_revive = ["Revive",1] call bis_fnc_getParamValue;
	GRLIB_introduction = ["Introduction",1] call bis_fnc_getParamValue;
	GRLIB_deployment_cinematic = ["DeploymentCinematic",1] call bis_fnc_getParamValue;
	GRLIB_unitcap = ["Unitcap",1] call bis_fnc_getParamValue;
	GRLIB_civilian_activity = ["Civilians",1] call bis_fnc_getParamValue;
	GRLIB_build_first_fob = ["FirstFob",0] call bis_fnc_getParamValue;
	GRLIB_param_wipe_savegame_1 = ["WipeSave1",0] call bis_fnc_getParamValue;
	GRLIB_param_wipe_savegame_2 = ["WipeSave2",0] call bis_fnc_getParamValue;
} else {
	GRLIB_difficulty_modifier = 1;
	GRLIB_time_factor = 12;
	GRLIB_resources_multiplier = 1;
	GRLIB_fatigue = 1;
	GRLIB_revive = 1;
	GRLIB_introduction = 0;
	GRLIB_deployment_cinematic = 0;
	GRLIB_unitcap = 1;
	GRLIB_civilian_activity = 1;
	GRLIB_build_first_fob = 0;
	GRLIB_param_wipe_savegame_1 = 0;
	GRLIB_param_wipe_savegame_2 = 0;
};

if ( GRLIB_fatigue == 1 ) then { GRLIB_fatigue = true } else { GRLIB_fatigue = false };
if ( GRLIB_revive == 1 ) then { GRLIB_revive = true } else { GRLIB_revive = false };
if ( GRLIB_introduction == 1 ) then { GRLIB_introduction = true } else { GRLIB_introduction = false };
if ( GRLIB_deployment_cinematic == 1 ) then { GRLIB_deployment_cinematic = true } else { GRLIB_deployment_cinematic = false };
if ( GRLIB_build_first_fob == 1 ) then { GRLIB_build_first_fob = true } else { GRLIB_build_first_fob = false };