military_value = 75;

_sector = _this select 0;
_sectorpos = getmarkerpos _sector;
_stopit = false;
_spawncivs = false;
_building_ai_max = 0;
_infsquad = "militia";
_building_range = 50;
_local_capture_size = capture_size;
_iedcount = 0;

_combat_readiness_increase = 0;
_vehtospawn = [];
_side = EAST;
_managed_units = [];

_minimum_building_positions = 20;

if ( isNil "active_sectors" ) then { active_sectors = [] };

sleep 5;

if ( _sector in active_sectors ) exitWith {};

if ( ( [ getmarkerpos _sector , sector_size , WEST ] call F_getUnitsCount ) > 1 ) then {

	active_sectors pushback _sector; publicVariable "active_sectors";

	if ( _sector in sectors_bigtown ) then {
		_vehtospawn = 
		[ ( [] call F_getAdaptiveVehicle ) ,
		( [] call F_getAdaptiveVehicle ),
		( [] call F_getAdaptiveVehicle ),
		( [] call F_getAdaptiveVehicle ),
		(militia_vehicles call BIS_fnc_selectRandom),
		(militia_vehicles call BIS_fnc_selectRandom)];
		_infsquad = "militia";
		if((random 100) > 50) then { _vehtospawn pushback (militia_vehicles call BIS_fnc_selectRandom); };
		if((random 100) > 33) then { _vehtospawn pushback (militia_vehicles call BIS_fnc_selectRandom); };
		_spawncivs = true;
		_side = EAST;
		_combat_readiness_increase = 0;
		_building_ai_max = 70;
		_building_range = 300;
		_local_capture_size = _local_capture_size * 2;
		_iedcount = 3 + (floor (random 6));
	};
	if ( _sector in sectors_capture ) then {
		_vehtospawn = [];
		_infsquad = "militia";
		if((random 100) > 50) then { _vehtospawn pushback (militia_vehicles call BIS_fnc_selectRandom); };
		if((random 100) > 33) then { _vehtospawn pushback (militia_vehicles call BIS_fnc_selectRandom); };
		_spawncivs = true;
		_side = RESISTANCE;
		_combat_readiness_increase = (floor (random 6));
		_building_ai_max = floor (15 + (round (combat_readiness / 10 )) + (random 10));
		_building_range = 100;
		_iedcount = (floor (random 5));
	};
	if ( _sector in sectors_military ) then {
		_infsquad = "csat";
		_vehtospawn = [( [] call F_getAdaptiveVehicle ),( [] call F_getAdaptiveVehicle )];
		if((random 100) > 50) then { _vehtospawn pushback ( [] call F_getAdaptiveVehicle ); };
		if((random 100) > 33) then { _vehtospawn pushback ( [] call F_getAdaptiveVehicle ); };
		_side = EAST;
		_spawncivs = false;
		_combat_readiness_increase = 5 + (floor (random 16));
		_building_ai_max = floor (20 + (round (combat_readiness / 5 )) + (random 10));
		_building_range = 150;
		_minimum_building_positions = 5;
	};
	if ( _sector in sectors_factory ) then {
		_vehtospawn = [];
		_infsquad = "militia";
		if((random 100) > 50) then { _vehtospawn pushback ( [] call F_getAdaptiveVehicle ); };
		if((random 100) > 50) then { _vehtospawn pushback (militia_vehicles call BIS_fnc_selectRandom); };
		if((random 100) > 33) then { _vehtospawn pushback ( [] call F_getAdaptiveVehicle ); };
		_side = EAST;
		_spawncivs = false;
		_combat_readiness_increase = 3 + (floor (random 8));
		_building_ai_max = floor (15 + (round (combat_readiness / 10 )) + (random 10));
		_building_range = 100;
		_iedcount = (floor (random 3));
		_minimum_building_positions = 5;
	};
	if ( _sector in sectors_tower ) then {
		_spawncivs = false;
		_combat_readiness_increase = (floor (random 4));
		_building_ai_max = 0;
	};

	{
		_vehicle = [_sectorpos, _x] call F_libSpawnVehicle;
		[group ((crew _vehicle) select 0 ),_sectorpos] spawn add_defense_waypoints;
		_managed_units pushback _vehicle; 
		{ _managed_units pushback _x; } foreach (crew _vehicle);
		sleep 0.1;
	} foreach _vehtospawn;


	if ( _building_ai_max > 0 ) then {

	
		_allbuildings = nearestObjects [_sectorpos, [], _building_range ];
		
		_buildingpositions = [];
		{
			_buildingpositions append ( [_x] call BIS_fnc_buildingPositions );
		} foreach _allbuildings;

		if ( count _buildingpositions > _minimum_building_positions ) then {
		
			_infsquad_classnames = [];
			if ( _infsquad == "militia" ) then {
				_infsquad_classnames = militia_squad;
			} else {
				_infsquad_classnames = ([] call F_getAdaptiveSquadComp);
			};
			
			if ( _building_ai_max > floor ((count _buildingpositions) * 0.65)) then { _building_ai_max = floor ((count _buildingpositions) * 0.65)};
			_squadtospawnnn = [];
			while { (count _squadtospawnnn) < _building_ai_max } do { _squadtospawnnn pushback ( _infsquad_classnames call BIS_fnc_selectRandom ); };
			
			_grp = createGroup _side;
			{ _x createUnit [ _sectorpos, _grp,"this addMPEventHandler [""MPKilled"", {_this spawn kill_manager}]", 0.5, "private"]; } foreach _squadtospawnnn;
			
			if ( _infsquad == "militia" ) then { 
				{ [ _x ] call ( militia_standard_squad call BIS_fnc_selectRandom ) } foreach (units _grp);
			};
			_managed_units append (units _grp);
		
			_usedposits = [];
			_nextposit = -1;
			_remainingposits = count _buildingpositions;
			
			sleep 5;
			
			{
				if ( _remainingposits > 2 ) then {
					_nextposit = (floor (random (count _buildingpositions)));
					while { _nextposit in _usedposits } do {
						_nextposit = (floor (random (count _buildingpositions)));
					};
					_usedposits pushback _nextposit;
					_x setdir (random 360);
					_x setpos (_buildingpositions select _nextposit);
					[_x] spawn building_defence_ai;
					_x setUnitPos "UP";
					_remainingposits = _remainingposits - 1;
				};
			} foreach (units _grp);
		};
	};
		
	_managed_units append ( [ _sectorpos, _side ] call F_spawnMilitaryPostSquad );
		
	if ( _spawncivs ) then {
		_idx = 0;
		_nbcivs = 3 + (floor (random 7));
		_spread = 1;
		if ( _sector in sectors_bigtown ) then {
			_nbcivs = _nbcivs + 10;
			_spread = 2.5;
		};
		while { _idx < _nbcivs } do {
			_spawnpos = [(((_sectorpos select 0) + (75 * _spread)) - (random (150 * _spread))),(((_sectorpos select 1) + (75 * _spread)) - (random (150 * _spread))),0];
			_grp = createGroup CIVILIAN;
			(civilians select (floor (random (count civilians)))) createUnit [_spawnpos, _grp,"this addMPEventHandler [""MPKilled"", {_this spawn kill_manager}]", 0.5, "private"];
			_nextciv = ((units _grp) select 0);
			_managed_units pushback _nextciv;
			_nextciv disableAI "FSM";
			[_grp] call add_civ_waypoints;
			_idx = _idx + 1;
		};
	};
	
	[ _sector, _building_range, _iedcount ] spawn ied_manager;

	sleep 10;
	
	if ( ( _sector in sectors_factory ) || (_sector in sectors_capture ) || (_sector in sectors_bigtown ) || (_sector in sectors_military ) ) then {
		[_sector] spawn reinforcements_manager;
	};

	while { !_stopit } do {

		if ( ( [_sectorpos, _local_capture_size] call F_sectorOwnership == WEST ) && ( endgame == 0 ) ) then {
			blufor_sectors pushback _sector; publicVariable "blufor_sectors";
			stats_sectors_liberated = stats_sectors_liberated + 1;
			combat_readiness = combat_readiness + _combat_readiness_increase;
			stats_readiness_earned = stats_readiness_earned + _combat_readiness_increase;
			[ [ _sector, 0 ] , "remote_call_sector" ] call BIS_fnc_MP;
			_stopit = true;
			reset_battlegroups_ai = true;
			
			if ( _sector in sectors_military ) then { 
				resources_ammo = resources_ammo + (round ( military_value + (random military_value )));
			};
			
			[] call recalculate_caps;
			[] spawn check_victory_conditions;
			
			trigger_server_save = true;
			
			{ [_x] spawn prisonner_ai; } foreach ( (getmarkerpos _sector) nearEntities [["Man"], _local_capture_size] );
			
			sleep (50 + random (50));
			{ if ( side (driver _x ) == WEST || side (gunner _x) == WEST || side (commander _x) == WEST ) then { _managed_units = _managed_units - [_x] }; } foreach _managed_units;
			
			active_sectors = active_sectors - [ _sector ]; publicVariable "active_sectors";
						
			if ( ( ( (random 100) < (combat_readiness - 50) ) || ( _sector in sectors_bigtown ) ) && ( [] call F_opforCap < 150 ) ) then { 
				[ _sector ] spawn spawn_battlegroup;
			};
			
			sleep 100;
			{ if ( side (driver _x ) == WEST || side (gunner _x) == WEST || side (commander _x) == WEST ) then { _managed_units = _managed_units - [_x] }; } foreach _managed_units;
			
			sleep 100;
			{ if ( side (driver _x ) == WEST || side (gunner _x) == WEST || side (commander _x) == WEST ) then { _managed_units = _managed_units - [_x] }; } foreach _managed_units;
			
			sleep 100;
			{ if ( side (driver _x ) == WEST || side (gunner _x) == WEST || side (commander _x) == WEST ) then { _managed_units = _managed_units - [_x] }; } foreach _managed_units;
			
			sleep 100;
			{ if ( side (driver _x ) == WEST || side (gunner _x) == WEST || side (commander _x) == WEST ) then { _managed_units = _managed_units - [_x] }; } foreach _managed_units;
			
			sleep 100;
			{ if ( side (driver _x ) == WEST || side (gunner _x) == WEST || side (commander _x) == WEST ) then { _managed_units = _managed_units - [_x] }; } foreach _managed_units;
			
			{ deleteVehicle _x } foreach _managed_units;
			
		} else {
			if ( ( [_sectorpos, (sector_size + 250), WEST ] call F_getUnitsCount ) == 0 ) then {
				{ 
					if ( side (driver _x ) == WEST ) then { _managed_units = _managed_units - [_x] };
				} foreach _managed_units;
				{ deleteVehicle _x } foreach _managed_units;
				_stopit = true;
				active_sectors = active_sectors - [ _sector ]; publicVariable "active_sectors";
			};
		};
		sleep 5;
	};
};

