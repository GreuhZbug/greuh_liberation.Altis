["Preload"] call BIS_fnc_arsenal;
respawn_lhd = compileFinal preprocessFileLineNumbers "scripts\client\respawn_lhd.sqf";
spawn_camera = compileFinal preprocessFileLineNumbers "scripts\client\spawn_camera.sqf";
cinematic_camera = compileFinal preprocessFileLineNumbers "scripts\client\cinematic_camera.sqf";
write_credit_line = compileFinal preprocessFileLineNumbers "scripts\client\write_credit_line.sqf";

[] spawn compileFinal preprocessFileLineNumbers "scripts\client\action_manager.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\do_build.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\synchronise_vars.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\fob_markers.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\redeploy_manager.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\huron_marker.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\sector_manager.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\ui_manager.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\manage_weather.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\group_icons.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\spot_timer.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\secondary_manager.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\intel_manager.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\hostile_groups.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\empty_vehicles_marker.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\unflip_manager.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\recycle_manager.sqf";

if ( typeof player == "B_officer_F" ) then {	
	[] spawn compileFinal preprocessFileLineNumbers "scripts\client\delete_groups.sqf";	
};

player addMPEventHandler ["MPKilled", {_this spawn kill_manager}];

{
	[_x] call BIS_fnc_drawCuratorLocations;
} foreach allCurators;

[] spawn compileFinal preprocessFileLineNumbers "scripts\client\intro.sqf";