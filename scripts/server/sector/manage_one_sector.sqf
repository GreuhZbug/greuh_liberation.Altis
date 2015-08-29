params [ "_sector" ];
private [ "_sectorpos", "_stopit", "_spawncivs", "_building_ai_max", "_infsquad", "_building_range", "_local_capture_size", "_iedcount","_combat_readiness_increase","_vehtospawn","_sidespawn","_managed_units","_squad1", "_squad2", "_squad3", "_squad4", "_minimum_building_positions", "_popfactor" ];

waitUntil { !isNil "combat_readiness" };

_sectorpos = getmarkerpos _sector;
_stopit = false;
_spawncivs = false;
_building_ai_max = 0;
_infsquad = "militia";
_building_range = 50;
_local_capture_size = GRLIB_capture_size;
_iedcount = 0;
_vehtospawn = [];
_sidespawn = EAST;
_managed_units = [];
_squad1 = [];
_squad2 = [];
_squad3 = [];
_squad4 = [];
_minimum_building_positions = 5;

_popfactor = 1;
if ( GRLIB_unitcap < 1 ) then { _popfactor = GRLIB_unitcap; };
if ( GRLIB_unitcap > 1 ) then { _popfactor = sqrt ( GRLIB_unitcap ) };

if ( isNil "active_sectors" ) then { active_sectors = [] };
if ( _sector in active_sectors ) exitWith {};
active_sectors pushback _sector; publicVariable "active_sectors";

[ _sector ] call wait_to_spawn_sector;

if ( ( [ getmarkerpos _sector , GRLIB_sector_size , WEST ] call F_getUnitsCount ) > 0 ) then {

	if ( _sector in sectors_bigtown ) then {
		_vehtospawn =
		[ ( [] call F_getAdaptiveVehicle ) ,
		( [] call F_getAdaptiveVehicle ),
		( [] call F_getAdaptiveVehicle ),
		( [] call F_getAdaptiveVehicle ),
		(militia_vehicles call BIS_fnc_selectRandom),
		(militia_vehicles call BIS_fnc_selectRandom)];
		_infsquad = "militia";
		_squad1 = ([] call F_getAdaptiveSquadComp);
		if ( GRLIB_unitcap >= 1) then {
			_squad2 = ([] call F_getAdaptiveSquadComp);
		};
		if ( GRLIB_unitcap >= 1.5) then {
			_squad3 = ([] call F_getAdaptiveSquadComp);
		};
		if((random 100) > (50 / GRLIB_difficulty_modifier)) then { _vehtospawn pushback (militia_vehicles call BIS_fnc_selectRandom); };
		if((random 100) > (33 / GRLIB_difficulty_modifier)) then { _vehtospawn pushback (militia_vehicles call BIS_fnc_selectRandom); };
		_spawncivs = true;
		_sidespawn = EAST;

		_building_ai_max = round ((40 + (round (combat_readiness / 5 ))) * _popfactor) ;
		_building_range = 300;
		_local_capture_size = _local_capture_size * 2;
		_iedcount = (3 + (floor (random 6))) * GRLIB_difficulty_modifier;
		if ( _iedcount > 12 ) then { _iedcount = 12 };
	};
	if ( _sector in sectors_capture ) then {
		_vehtospawn = [];
		_infsquad = "militia";
		while { count _squad1 < ( 10 * _popfactor) } do { _squad1 pushback ( militia_squad call BIS_fnc_selectRandom ) };
		if((random 100) > (50 / GRLIB_difficulty_modifier)) then { _vehtospawn pushback (militia_vehicles call BIS_fnc_selectRandom); };
		if((random 100) > (33 / GRLIB_difficulty_modifier)) then { _vehtospawn pushback (militia_vehicles call BIS_fnc_selectRandom); };
		_spawncivs = true;
		_sidespawn = RESISTANCE;
		_building_ai_max = round ((floor (15 + (round (combat_readiness / 10 )) + (random 6))) * _popfactor);
		_building_range = 100;
		_iedcount = (floor (random 5)) * GRLIB_difficulty_modifier;
		if ( _iedcount > 10 ) then { _iedcount = 10 };
	};
	if ( _sector in sectors_military ) then {
		_infsquad = "csat";
		_squadies_to_spawn = ([] call F_getAdaptiveSquadComp);
		_squad1 = ([] call F_getAdaptiveSquadComp);
		if ( GRLIB_unitcap >= 1) then {
			_squad2 = ([] call F_getAdaptiveSquadComp);
		};
		if ( GRLIB_unitcap >= 1.5) then {
			_squad3 = ([] call F_getAdaptiveSquadComp);
		};
		_vehtospawn = [( [] call F_getAdaptiveVehicle ),( [] call F_getAdaptiveVehicle )];
		if((random 100) > (50 / GRLIB_difficulty_modifier)) then { _vehtospawn pushback ( [] call F_getAdaptiveVehicle ); };
		if((random 100) > (33 / GRLIB_difficulty_modifier)) then { _vehtospawn pushback ( [] call F_getAdaptiveVehicle ); };
		_sidespawn = EAST;
		_spawncivs = false;
		_building_ai_max = round ((floor (20 + (round (combat_readiness / 5 )) + (random 6))) * _popfactor);
		_building_range = 150;
	};
	if ( _sector in sectors_factory ) then {
		_vehtospawn = [];
		_infsquad = "militia";
		_squad1 = ([] call F_getAdaptiveSquadComp);
		if ( GRLIB_unitcap >= 1.25) then {
			_squad2 = ([] call F_getAdaptiveSquadComp);
		};
		if((random 100) > 50) then { _vehtospawn pushback ( [] call F_getAdaptiveVehicle ); };
		if((random 100) > 50) then { _vehtospawn pushback (militia_vehicles call BIS_fnc_selectRandom); };
		if((random 100) > 33) then { _vehtospawn pushback ( [] call F_getAdaptiveVehicle ); };
		_sidespawn = EAST;
		_spawncivs = false;
		_building_ai_max = round ((floor (15 + (round (combat_readiness / 10 )) + (random 6))) * _popfactor);
		_building_range = 100;
		_iedcount = (floor (random 3)) * GRLIB_difficulty_modifier;
		if ( _iedcount > 8 ) then { _iedcount = 8 };
	};
	if ( _sector in sectors_tower ) then {
		_spawncivs = false;
		_sidespawn = EAST;
		_squad1 = ([] call F_getAdaptiveSquadComp);
		if ( GRLIB_unitcap >= 1.5) then {
			_squad2 = ([] call F_getAdaptiveSquadComp);
		};
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
		_allbuildings = [ nearestObjects [_sectorpos, ["House"], _building_range ], { alive _x } ] call BIS_fnc_conditionalSelect;
		_buildingpositions = [];
		{ _buildingpositions = _buildingpositions + ( [_x] call BIS_fnc_buildingPositions ); } foreach _allbuildings;
		if ( count _buildingpositions > _minimum_building_positions ) then {
			_managed_units = _managed_units + ( [ _infsquad, _building_ai_max, _buildingpositions, _sectorpos, _sidespawn ] call F_spawnBuildingSquad );
		};
	};

	_managed_units = _managed_units + ( [ _sectorpos, _sidespawn ] call F_spawnMilitaryPostSquad );

	if ( count _squad1 > 0 ) then {
		_grp = [ _sector, _sidespawn, _squad1 ] call F_spawnRegularSquad;
		[ _grp, _sectorpos ] spawn add_defense_waypoints;
		_managed_units = _managed_units + (units _grp);
	};

	if ( count _squad2 > 0 ) then {
		_grp = [ _sector, _sidespawn, _squad2 ] call F_spawnRegularSquad;
		[ _grp, _sectorpos ] spawn add_defense_waypoints;
		_managed_units = _managed_units + (units _grp);
	};

	if ( count _squad3 > 0 ) then {
		_grp = [ _sector, _sidespawn, _squad3 ] call F_spawnRegularSquad;
		[ _grp, _sectorpos ] spawn add_defense_waypoints;
		_managed_units = _managed_units + (units _grp);
	};

	if ( count _squad4 > 0 ) then {
		_grp = [ _sector, _sidespawn, _squad4 ] call F_spawnRegularSquad;
		[ _grp, _sectorpos ] spawn add_defense_waypoints;
		_managed_units = _managed_units + (units _grp);
	};

	if ( _spawncivs && GRLIB_civilian_activity > 0) then {
		_managed_units = _managed_units + ( [ _sector ] call F_spawnCivilians );
	};

	[ _sector, _building_range, _iedcount ] spawn ied_manager;

	sleep 10;

	if ( ( _sector in sectors_factory ) || (_sector in sectors_capture ) || (_sector in sectors_bigtown ) || (_sector in sectors_military ) ) then {
		[_sector] spawn reinforcements_manager;
	};

	while { !_stopit } do {

		if ( ( [_sectorpos, _local_capture_size] call F_sectorOwnership == WEST ) && ( GRLIB_endgame == 0 ) ) then {

			if (isServer) then {
				[ _sector ] spawn sector_liberated_remote_call;
			} else {
				[ [ _sector ] , "sector_liberated_remote_call" ] call BIS_fnc_MP;
			};

			_stopit = true;

			{ [_x] spawn prisonner_ai; } foreach ( (getmarkerpos _sector) nearEntities [["Man"], _local_capture_size] );

			sleep 30;
			{ if ( side (driver _x ) == WEST || side (gunner _x) == WEST || side (commander _x) == WEST ) then { _managed_units = _managed_units - [_x] }; } foreach _managed_units;

			active_sectors = active_sectors - [ _sector ]; publicVariable "active_sectors";

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
			if ( ( [_sectorpos, (GRLIB_sector_size + 250), WEST ] call F_getUnitsCount ) == 0 ) then {
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