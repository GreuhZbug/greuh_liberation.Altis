params [ "_minimum_readiness", "_is_infantry" ];

waitUntil { !isNil "blufor_sectors" };
waitUntil { !isNil "combat_readiness" };

while { endgame == 0 } do {
	waitUntil { sleep 0.3; combat_readiness >= _minimum_readiness; };
	waitUntil { sleep 0.3; count blufor_sectors > 3; };

	sleep (random 30);

	while {  [] call F_opforCap > 150 } do {
			sleep (random 30);
	};

	_grp = grpNull;

	_spawn_marker = "";
	while { _spawn_marker == "" } do {
		_spawn_marker = [2000,5000,true] call F_findOpforSpawnPoint;
		if ( _spawn_marker == "" ) then {
			sleep (150 + (random 150));
		};
	};

	_sector_spawn_pos = [0,0,0];
	while { surfaceIsWater _sector_spawn_pos } do {
		_sector_spawn_pos = [(((markerpos _spawn_marker) select 0) - 500) + (random 1000),(((markerpos _spawn_marker) select 1) - 500) + (random 1000),0];
	};

	if (_is_infantry) then {
		_grp = createGroup EAST;
		_squad = [] call F_getAdaptiveSquadComp;
		{
			_x createUnit [_sector_spawn_pos, _grp,"this addMPEventHandler [""MPKilled"", {_this spawn kill_manager}]", 0.5, "private"];
		} foreach _squad;
	} else {
		_vehicle_object = [ _sector_spawn_pos, [] call F_getAdaptiveVehicle ] call F_libSpawnVehicle;
		sleep 0.5;
		_grp = group ((crew _vehicle_object) select 0);
	};

	[_grp] spawn patrol_ai;

	_started_time = time;
	_patrol_continue = true;

	while { _patrol_continue } do {
		sleep 60;
		if ( count (units _grp) == 0  ) then {
			_patrol_continue = false;
		} else {
			if ( time - _started_time > 900 ) then {
				if ( [ getpos (leader _grp) , 4000 , WEST ] call F_getUnitsCount == 0 ) then {
					_patrol_continue = false;
					{
						if ( vehicle _x != _x ) then {
							deleteVehicle (vehicle _x);
						};
						deleteVehicle _x;
					} foreach (units _grp);
				};
			};
		};
	};

	sleep (450.0 / GRLIB_difficulty_modifier);
};