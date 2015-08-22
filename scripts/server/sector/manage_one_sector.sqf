params [ "_sector" ];

military_value = 75;

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
_sidespawn = EAST;
_managed_units = [];
_squadies_to_spawn = [];
_minimum_building_positions = 20;

if ( isNil "active_sectors" ) then { active_sectors = [] };
if ( _sector in active_sectors ) exitWith {};
active_sectors pushback _sector; publicVariable "active_sectors";

[ _sector ] call wait_to_spawn_sector;

if ( ( [ getmarkerpos _sector , sector_size , WEST ] call F_getUnitsCount ) > 0 ) then {

	if ( _sector in sectors_bigtown ) then {
		_vehtospawn =
		[ ( [] call F_getAdaptiveVehicle ) ,
		( [] call F_getAdaptiveVehicle ),
		( [] call F_getAdaptiveVehicle ),
		( [] call F_getAdaptiveVehicle ),
		(militia_vehicles call BIS_fnc_selectRandom),
		(militia_vehicles call BIS_fnc_selectRandom)];
		_infsquad = "militia";
		_squadies_to_spawn = ([] call F_getAdaptiveSquadComp) + ([] call F_getAdaptiveSquadComp);
		if((random 100) > (50 * GRLIB_difficulty_modifier)) then { _vehtospawn pushback (militia_vehicles call BIS_fnc_selectRandom); };
		if((random 100) > (33 * GRLIB_difficulty_modifier)) then { _vehtospawn pushback (militia_vehicles call BIS_fnc_selectRandom); };
		_spawncivs = true;
		_sidespawn = EAST;
		_combat_readiness_increase = 0;
		_building_ai_max = 70;
		_building_range = 300;
		_local_capture_size = _local_capture_size * 2;
		_iedcount = (3 + (floor (random 6))) * GRLIB_difficulty_modifier;
		if ( _iedcount > 12 ) then { _iedcount = 12 };
	};
	if ( _sector in sectors_capture ) then {
		_vehtospawn = [];
		_infsquad = "militia";
		while { count _squadies_to_spawn < 10 } do { _squadies_to_spawn pushback ( militia_squad call BIS_fnc_selectRandom ) };
		if((random 100) > (50 * GRLIB_difficulty_modifier)) then { _vehtospawn pushback (militia_vehicles call BIS_fnc_selectRandom); };
		if((random 100) > (33 * GRLIB_difficulty_modifier)) then { _vehtospawn pushback (militia_vehicles call BIS_fnc_selectRandom); };
		_spawncivs = true;
		_sidespawn = RESISTANCE;
		_combat_readiness_increase = (floor (random 6)) * GRLIB_difficulty_modifier;
		_building_ai_max = floor (15 + (round (combat_readiness / 10 )) + (random 10));
		_building_range = 100;
		_iedcount = (floor (random 5)) * GRLIB_difficulty_modifier;
		if ( _iedcount > 10 ) then { _iedcount = 10 };
	};
	if ( _sector in sectors_military ) then {
		_infsquad = "csat";
		_squadies_to_spawn = ([] call F_getAdaptiveSquadComp) + ([] call F_getAdaptiveSquadComp);
		_vehtospawn = [( [] call F_getAdaptiveVehicle ),( [] call F_getAdaptiveVehicle )];
		if((random 100) > (50 * GRLIB_difficulty_modifier)) then { _vehtospawn pushback ( [] call F_getAdaptiveVehicle ); };
		if((random 100) > (33 * GRLIB_difficulty_modifier)) then { _vehtospawn pushback ( [] call F_getAdaptiveVehicle ); };
		_sidespawn = EAST;
		_spawncivs = false;
		_combat_readiness_increase = (5 + (floor (random 11))) * GRLIB_difficulty_modifier;
		_building_ai_max = floor (20 + (round (combat_readiness / 5 )) + (random 10));
		_building_range = 150;
		_minimum_building_positions = 5;
	};
	if ( _sector in sectors_factory ) then {
		_vehtospawn = [];
		_infsquad = "militia";
		_squadies_to_spawn = ([] call F_getAdaptiveSquadComp);
		if((random 100) > 50) then { _vehtospawn pushback ( [] call F_getAdaptiveVehicle ); };
		if((random 100) > 50) then { _vehtospawn pushback (militia_vehicles call BIS_fnc_selectRandom); };
		if((random 100) > 33) then { _vehtospawn pushback ( [] call F_getAdaptiveVehicle ); };
		_sidespawn = EAST;
		_spawncivs = false;
		_combat_readiness_increase = (3 + (floor (random 7))) * GRLIB_difficulty_modifier;
		_building_ai_max = floor (15 + (round (combat_readiness / 10 )) + (random 10));
		_building_range = 100;
		_iedcount = (floor (random 3)) * GRLIB_difficulty_modifier;
		if ( _iedcount > 8 ) then { _iedcount = 8 };
		_minimum_building_positions = 5;
	};
	if ( _sector in sectors_tower ) then {
		_spawncivs = false;
		_sidespawn = EAST;
		_squadies_to_spawn = ([] call F_getAdaptiveSquadComp);
		_combat_readiness_increase = (floor (random 4));
		_building_ai_max = 0;
	};






	if ( count _squadies_to_spawn > 0 ) then {
		_grp = [ _sector, _sidespawn, _squadies_to_spawn ] call F_spawnRegularSquad;
		[ _grp, _sectorpos ] spawn add_defense_waypoints;
		_managed_units append (units _grp);
	};

	{
		_vehicle = [_sectorpos, _x] call F_libSpawnVehicle;
		[group ((crew _vehicle) select 0 ),_sectorpos] spawn add_defense_waypoints;
		_managed_units pushback _vehicle;
		{ _managed_units pushback _x; } foreach (crew _vehicle);
		sleep 0.1;
	} foreach _vehtospawn;

	if ( _building_ai_max > 0 ) then {
		_allbuildings = [ nearestObjects [_sectorpos, [], _building_range ], { alive _x } ] call BIS_fnc_conditionalSelect;
		_buildingpositions = [];
		{ _buildingpositions append ( [_x] call BIS_fnc_buildingPositions ); } foreach _allbuildings;
		if ( count _buildingpositions > _minimum_building_positions ) then {
			_managed_units append (units ( [ _infsquad, _building_ai_max, _buildingpositions ] call F_spawnBuildingSquad ));
		};
	};

	_managed_units append ( [ _sectorpos, _sidespawn ] call F_spawnMilitaryPostSquad );

	if ( _spawncivs ) then {
		_managed_units append ( [ _sector ] call F_spawnCivilians );
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
				_sector_ammo_reward = GRLIB_resources_multiplier * (round ( military_value + (random military_value )));
				resources_ammo = resources_ammo + _sector_ammo_reward;
			};

			[] call recalculate_caps;
			[] spawn check_victory_conditions;

			trigger_server_save = true;

			{ [_x] spawn prisonner_ai; } foreach ( (getmarkerpos _sector) nearEntities [["Man"], _local_capture_size] );

			sleep (50 + random (50));
			{ if ( side (driver _x ) == WEST || side (gunner _x) == WEST || side (commander _x) == WEST ) then { _managed_units = _managed_units - [_x] }; } foreach _managed_units;

			active_sectors = active_sectors - [ _sector ]; publicVariable "active_sectors";

			if ( ( ( (random (100.0 / GRLIB_difficulty_modifier)) < (combat_readiness - 50) ) || ( _sector in sectors_bigtown ) ) && ( [] call F_opforCap < 150 ) ) then {
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
} else {
	active_sectors = active_sectors - [ _sector ]; publicVariable "active_sectors";
};