if ( endgame == 1 ) exitWith {};

last_battlegroup_size = 0;
_spawn_marker = "";
if ( count _this == 1 ) then {
	_spawn_marker = [ 2000, 10000, false, _this select 0 ] call F_findOpforSpawnPoint;
} else {
	_spawn_marker = [ 2000, 10000, false ] call F_findOpforSpawnPoint;
};

if ( _spawn_marker != "" ) then {

	_battlegroups = [opfor_battlegroup_infantry,opfor_battlegroup_armor,opfor_battlegroup_air,opfor_battlegroup_mixed];
	_selected_opfor_battlegroup = _battlegroups call BIS_fnc_selectRandom;

	[ [ _spawn_marker ] , "remote_call_battlegroup" ] call BIS_fnc_MP;

	{
		_compo = _x;
		{
			_nextgrp = createGroup EAST;
			_vehicle = [markerpos _spawn_marker, _x] call F_libSpawnVehicle;
			sleep 0.5;
			(crew _vehicle) joinSilent _nextgrp;
			[_nextgrp] spawn battlegroup_ai;
			if ( _x in opfor_troup_transports ) then {
				[_vehicle] spawn troup_transport;
			};
			last_battlegroup_size = last_battlegroup_size + 1;
		} foreach _compo;
	} foreach _selected_opfor_battlegroup;

	[([markerpos _spawn_marker] call F_getNearestBluforObjective) select 0] spawn spawn_air;

	sleep 5;

	combat_readiness = combat_readiness - (round (last_battlegroup_size + (random last_battlegroup_size)));
	if ( combat_readiness < 0 ) then { combat_readiness = 0 };
	
	stats_hostile_battlegroups = stats_hostile_battlegroups + 1;
};


