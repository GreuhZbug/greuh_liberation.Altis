F_getNearestFob = {
	_mindir = 9999;
	_retvalue = [];
	if ( count all_fobs > 0 ) then {
	    _retvalue = ( [ all_fobs , [] , { player distance _x } , "ASCEND" ] call BIS_fnc_sortBy ) select 0;
	};
	
	_retvalue
};

F_getMobileRespawns = {
	_respawn_trucks_unsorted = [ vehicles, { typeof _x == Respawn_truck_typename && alive _x && speed _x < 5 } ] call BIS_fnc_conditionalSelect;
    _respawn_trucks_sorted = [ _respawn_trucks_unsorted , [] , { (getpos _x) select 0 } , "ASCEND" ] call BIS_fnc_sortBy;
	
	_respawn_trucks_sorted 
};

F_getUnitsCount = {
	_position = _this select 0;
	_distance = _this select 1;
	_side = _this select 2;
	
	_infantrycount = _side countSide ( [ _position nearEntities [ "Man", _distance] , { !(captive _x) && alive _x && (getpos _x) select 2 < 500 } ] call BIS_fnc_conditionalSelect );
	_countedvehicles =  [ ( _position nearEntities [ "AllVehicles", _distance] ), { alive _x && (getpos _x) select 2 < 500 && count (crew _x) > 0 } ] call BIS_fnc_conditionalSelect;
	_vehiclecrewcount = 0;
	{ _vehiclecrewcount = _vehiclecrewcount + (_side countSide (crew _x)) } foreach _countedvehicles;
	
	(_infantrycount + _vehiclecrewcount)
};

F_spartanScan = {
	_spartans = [ vehicles , { typeof _x == huron_typename && alive _x } ] call BIS_fnc_conditionalSelect;
	_spartan = objNull;
	if ( count _spartans != 0 ) then { _spartan = _spartans select 0 };
	_spartan
};

F_getGroupType = {
	_grp = _this select 0;
	_grouptype = "infantry";
	_vehicletype = "";
	{
		if ( vehicle _x != _x && _vehicletype == "" ) then {
			if ( ((gunner vehicle _x) == _x) || ((driver  vehicle _x) == _x) || ((commander vehicle _x) == _x) ) then {
				_vehicletype = typeof vehicle _x;
			};
		};
	} foreach units _grp;
	
	if ((_grouptype == "infantry") && (_vehicletype != "")) then {
	
		{
			if  ( _vehicletype == (_x select 0)) then {
				_grouptype = "heavy";
			};
		} foreach heavy_vehicles;
		
		if ( _grouptype == "infantry" ) then {
		{
			if  ( _vehicletype == (_x select 0)) then {
				if ( _vehicletype in uavs ) then {
					_grouptype = "uav";
				} else {
					_grouptype = "air";
				};
			};
		} foreach air_vehicles;
		};

		if ( _grouptype == "infantry" ) then {
		{
			if  ( _vehicletype == (_x select 0)) then {
				if ( _vehicletype in uavs ) then {
					_grouptype = "uav";
				} else {
					_grouptype = "light";
				};
			};
		} foreach light_vehicles;
		};
		
		
		if ( _grouptype == "infantry" ) then {
		{
			if  ( _vehicletype == (_x select 0)) then {
				_grouptype = "support";
			};
		} foreach support_vehicles;
		};
		
		if ( _grouptype == "infantry" ) then {
		{
			if  ( _vehicletype == (_x select 0)) then {
				_grouptype = "static";
			};
		} foreach static_vehicles;
		};

	};
		
	_grouptype
};

F_getForceRatio = {
	_sector = _this select 0;
	
	_actual_capture_size = capture_size;
	if ( _sector in sectors_bigtown ) then {
		_actual_capture_size = capture_size * 2;
	};
	
	_red_forces = ( [ (markerpos _sector), capture_size, RESISTANCE ] call F_getUnitsCount ) + ( [ (markerpos _sector), capture_size, EAST ] call F_getUnitsCount );
	_blue_forces = [ (markerpos _sector), capture_size, WEST ] call F_getUnitsCount;
	_ratio = -1;
	
	if (_red_forces > 0) then {
		_ratio = _blue_forces / ( _red_forces + _blue_forces );
	} else {
		if ( _sector in blufor_sectors || _blue_forces != 0 ) then {
			_ratio = 1;
		} else {
			_ratio = 0;
		};
	};
	
	_ratio
};

F_localCap = {
	_unitcap_local = 10 + (round (infantry_cap / 2));
	if ( _unitcap_local > 100 ) then { 
		_unitcap_local = 100;
	};
	
	_unitcap_local
};

F_opforCap = {
	_opforcap = (EAST countSide allUnits);
	_opforcap = _opforcap + (RESISTANCE countSide allUnits);
	_opforcap
};

F_getNearestSector = {
	_limit = _this select 0;
	_postosearch = getpos player;
	if ( count _this == 2 ) then {
		_postosearch = _this select 1;
	};
	_sector_to_return = "";
	_close_sectors = [ sectors_allSectors , { (markerPos _x) distance _postosearch < _limit } ] call BIS_fnc_conditionalSelect;
	_close_sectors_sorted = [ _close_sectors , [_postosearch, _limit] , { (markerPos _x) distance _input0 } , "ASCEND" ] call BIS_fnc_sortBy;
	if ( count _close_sectors_sorted > 0 ) then { _sector_to_return = _close_sectors_sorted select 0; };
	
	_sector_to_return;
};

F_getNearestTower = {
	_postosearch = _this select 0;
	_side = _this select 1;
	_limit = _this select 2;
	_sector_to_return = "";
	
	_sectors_to_search = [];
	if ( _side == EAST ) then {
		_sectors_to_search = (sectors_tower - blufor_sectors);
	} else {
		_sectors_to_search = [ blufor_sectors , { _x in sectors_tower } ] call BIS_fnc_conditionalSelect;
	};
	
	_sectors_to_search = [ _sectors_to_search , { (markerPos _x) distance _postosearch < _limit } ] call BIS_fnc_conditionalSelect;

	_sectors_to_search_sorted = [ _sectors_to_search , [_postosearch] , { (markerPos _x) distance _input0 } , "ASCEND" ] call BIS_fnc_sortBy;
	if ( count _sectors_to_search_sorted > 0 ) then { _sector_to_return = _sectors_to_search_sorted select 0; } else { _sector_to_return = "" };
	
	_sector_to_return;
};

F_getNearestBluforObjective = {
	_startpos = _this select 0;
	_currentnearest = [];
	_refdistance = 99999;
	_tpositions = [];
	
	if ( count all_fobs != 0 || count blufor_sectors != 0 ) then {
		_tpositions = all_fobs;
		{
			_tpositions = _tpositions + [markerpos _x];
		} foreach blufor_sectors;
	};

	{
		if ( _startpos distance _x < _refdistance ) then {
			_refdistance = (_startpos distance _x);
			_currentnearest = [_x,_refdistance];
		};
	} foreach _tpositions;

	_currentnearest
};

F_libSpawnVehicle = {
	_sectorpos = _this select 0;
	_classname = _this select 1;
	_newvehicle = objNull;
	
	_spawnpos = [0,0,0];
	while { surfaceIsWater _spawnpos } do {
		_spawnpos = ( [ _sectorpos, random 150, random 360 ] call bis_fnc_relpos ) findEmptyPosition [10, 100, "B_Heli_Transport_01_camo_F"];
		if ( count _spawnpos == 0 ) then { _spawnpos = [0,0,0]; };
	};
	
	_newvehicle = objNull;
	if ( _classname in opfor_choppers ) then { 	
		_newvehicle = createVehicle [_classname, _spawnpos, [], 0, "FLY"]; 
		_newvehicle flyInHeight (100 + (random 200));
	} else {
		_newvehicle = _classname createVehicle _spawnpos;
		_newvehicle setpos _spawnpos;
	};
	_newvehicle allowdamage false;
	
	if ( _classname in militia_vehicles ) then {
		[ _newvehicle ] call F_libSpawnMilitiaCrew;
	} else {
		createVehicleCrew _newvehicle;
		sleep 0.1;
		{ _x addMPEventHandler ["MPKilled", {_this spawn kill_manager}]; } foreach (crew _newvehicle);
	};
	
	_newvehicle addMPEventHandler ["MPKilled", {_this spawn kill_manager}];
	_newvehicle setdir (random 360);
	_newvehicle setVectorUp surfaceNormal position _newvehicle;
	
	sleep 0.1;
	_newvehicle allowdamage true;
	_newvehicle setdamage 0;
	
	[ _newvehicle ] spawn csat_abandon_vehicle;
	
	_newvehicle
};

F_libSpawnMilitiaCrew = {
	_vehicle = _this select 0;
	_grp = createGroup RESISTANCE;
	_vehcrew = [];
	while { count units _grp < 3 } do {
		( militia_squad call BIS_fnc_selectRandom ) createUnit [ getpos _vehicle, _grp,"this addMPEventHandler [""MPKilled"", {_this spawn kill_manager}]", 0.5, "private"];
	};
	((units _grp) select 0) moveInDriver _vehicle;
	((units _grp) select 1) moveInGunner _vehicle;
	((units _grp) select 2) moveInCommander _vehicle;
	{ 
		if ( vehicle _x == _x ) then { 
			deleteVehicle _x; 
		} else {
			[ _x ] call loadout_crewman;
		};
	} foreach (units _grp);
};

F_sectorOwnership = {
	_cap_thresold_count = 2;
	_cap_thresold_ratio = 0.85;
	_thatpos = _this select 0;
	_localsize = capture_size;
	
	if (count _this == 2) then {
		_localsize = _this select 1;
	};
	
	_sectorside = RESISTANCE;
	_countwest_ownership = [_thatpos, _localsize, WEST ] call F_getUnitsCount;
	_counteast_ownership = ( [_thatpos, _localsize, EAST ] call F_getUnitsCount) + ([_thatpos, _localsize, RESISTANCE ] call F_getUnitsCount);
	
	_blufor_ratio = 0;
	if ( _countwest_ownership + _counteast_ownership != 0 ) then {
		_blufor_ratio = _countwest_ownership / ( _countwest_ownership + _counteast_ownership);
	};
	
	if ( _countwest_ownership <= _cap_thresold_count && _counteast_ownership <= _cap_thresold_count ) then { _sectorside = CIVILIAN; };
	if ( _countwest_ownership > _cap_thresold_count && (_counteast_ownership <= _cap_thresold_count || _blufor_ratio > _cap_thresold_ratio) ) then { _sectorside = WEST; };
	if ( _countwest_ownership <= _cap_thresold_count && _counteast_ownership > _cap_thresold_count ) then { _sectorside = EAST; };
	if ( _countwest_ownership > _cap_thresold_count && (_counteast_ownership > _cap_thresold_count && _blufor_ratio < _cap_thresold_ratio ) ) then { _sectorside = RESISTANCE; };
	
	_sectorside
};	

F_spawnBuildingSquad = {
	_squadpos = _this select 0;
	_squadside = _this select 1;
	_squad = [] call F_getAdaptiveSquadComp;
	if ( _squadside == RESISTANCE ) then { _squad = militia_squad };
	if ( _squadside == EAST ) then { _squad = _squad + [opfor_basic_soldier,opfor_basic_soldier]; };
	
	_spawned_units_local = [];
	
	_allbuildings = nearestObjects [ _squadpos, [], 50 ];
	_buildingpositions = [];
	{
		if ( count _buildingpositions == 0 ) then {
			_buildingpositions = [_x] call BIS_fnc_buildingPositions;
			if ( count _buildingpositions < 10 ) then {
				_buildingpositions = [];
			};
		};
	} foreach _allbuildings;

	if( count _buildingpositions == 0 ) then {
		{
			if ( count _buildingpositions < 10 ) then {
				_newpositions = [_x] call BIS_fnc_buildingPositions;
				_buildingpositions = _buildingpositions + _newpositions;
			};
		} foreach _allbuildings;
	};
	
	_grp = (createGroup EAST);

	if ( count _buildingpositions >= 10 ) then {
		_buildingpos_index = [];
		_idx = 0;
		{
			_buildingpos_index = _buildingpos_index + [_idx];
			_idx = _idx + 1;
		} foreach _buildingpositions;

		{
			_x createUnit [_squadpos, _grp,"this addMPEventHandler [""MPKilled"", {_this spawn kill_manager}]", 0.5, "private"];
		} foreach _squad;
		
		{
			_next_building_index = _buildingpos_index select (floor (random (count _buildingpos_index)));
			_buildingpos_index = _buildingpos_index - [_next_building_index];
			_next_building_pos = _buildingpositions select (_next_building_index);
			_spawned_units_local = _spawned_units_local + [_x];
			
			_x setpos _next_building_pos;
			[_x] spawn building_defence_ai;
			_x setUnitPos "UP";
		} foreach (units _grp);
		
		_totalx = 0;
		_totaly = 0;
		{
			_totalx = _totalx + ((getpos _x) select 0);
			_totaly = _totaly + ((getpos _x) select 1);
		} foreach (units _grp);
		
		_avgx = _totalx / ( count (units _grp) );
		_avgy = _totaly / ( count (units _grp) );
		
		{
			_vd = (getPosASL _x) vectorDiff [_avgx, _avgy, (getPosASL _x) select 2];
			_newdir = (_vd select 0) atan2 (_vd select 1); 
			if (_newdir < 0) then {_dir = 360 + _newdir }; 
			_x setdir (_newdir);
		} foreach (units _grp);
	};
	
	_spawned_units_local
};

F_spawnMilitaryPostSquad = {
	_squadpos1 = _this select 0;
	_squadside1 = _this select 1;
	_spawned_units_local = [];
	
	_allposts = nearestObjects [ _squadpos1, [ "Land_Cargo_Patrol_V1_F","Land_Cargo_Patrol_V2_F","Land_Cargo_Patrol_V3_F" ], capture_size ];
	if ( count _allposts > 0 ) then {
		_grp2 = createGroup _squadside1;
	
		{
			_building_positions = 	[_x] call BIS_fnc_buildingPositions;
			_unitclasspost = "O_soldier_M_F";
			nextunit_post = objNull;
			if ( random 100 > 60 ) then {
				_unitclasspost = "O_Soldier_AR_F";
			};
			_unitclasspost createUnit [ _squadpos1, _grp2, "nextunit_post = this; this addMPEventHandler [""MPKilled"", {_this spawn kill_manager}]", 0.5, "private"];
			nextunit_post setpos (_building_positions select 1);
			nextunit_post setdir (180 + (getdir _x ));
			
		} foreach _allposts;
		
		_totalx2 = 0;
		_totaly2 = 0;
		
		{
			[_x] spawn building_defence_ai;
			_x setUnitPos "UP";
			_spawned_units_local pushback _x;
			_totalx2 = _totalx2 + ((getpos _x) select 0);
			_totaly2 = _totaly2 + ((getpos _x) select 1);
		} foreach (units _grp2);
		
		_avgx2 = _totalx2 / ( count (units _grp2) );
		_avgy2 = _totaly2 / ( count (units _grp2) );
		
		{
			_vd2 = (getPosASL _x) vectorDiff [_avgx2, _avgy2, (getPosASL _x) select 2];
			_newdir2 = (_vd2 select 0) atan2 (_vd2 select 1); 
			if (_newdir2 < 0) then {_dir = 360 + _newdir2 }; 
			_x setdir (_newdir2);
		} foreach (units _grp2);
		
	};
	
	_spawned_units_local
};

F_findOpforSpawnPoint = {
	
	_mindist = _this select 0;
	_maxdist = _this select 1;
	_try_nearest = _this select 2;
	_spawn_target = "";
	if ( count _this > 3 ) then { _spawn_target = _this select 3; };
	_increment = 500;
	_opfor_spawn_point = "";
	_all_possible_sectors = sectors_opfor;
	_filtered_possible_sectors = [];
	
	{
		_current_sector = _x;
		_accept_current_sector = true;
		_current_sector_distance = 99999;
		
		if ( !isNil "secondary_objective_position" ) then {
			if ( count secondary_objective_position != 0 ) then {
				if ( (( markerpos _current_sector ) distance secondary_objective_position) < 500 ) then {
					_accept_current_sector = false;
				};
			};
		};
		
		if ( !isNil "used_positions" ) then {
			if ( _current_sector in used_positions ) then {
				_accept_current_sector = false;
			};
		};
		
		{
			if ( (( markerpos _current_sector ) distance _x) < _mindist ) then {
				_accept_current_sector = false;
			} else {
				if ( (( markerpos _current_sector ) distance (_x)) < _current_sector_distance ) then {
					_current_sector_distance = (( markerpos _current_sector ) distance (_x));
				};
			};
		} foreach all_fobs;
		
		{
			if ( (( markerpos _current_sector ) distance (markerpos _x)) < _mindist ) then {
				_accept_current_sector = false;
			} else {
				if ( (( markerpos _current_sector ) distance (markerpos _x)) < _current_sector_distance ) then {
					_current_sector_distance = (( markerpos _current_sector ) distance (markerpos _x));
				};
			};
		} foreach blufor_sectors;
		
		if ( _accept_current_sector ) then {
			_one_opfor_sector_in_range = false;
			{
				if ( (( markerpos _current_sector ) distance (markerpos _x)) < 2000 ) then {
					_one_opfor_sector_in_range = true;
				} 
			} foreach (sectors_allSectors - blufor_sectors);
			_accept_current_sector = _one_opfor_sector_in_range;
		};
		
		if ( ( [markerpos _current_sector, _mindist, WEST ] call F_getUnitsCount ) != 0 ) then {
			_accept_current_sector = false;
		};
		
		if (_accept_current_sector) then {
			_filtered_possible_sectors = _filtered_possible_sectors + [[_current_sector,_current_sector_distance]];
		};
	} foreach _all_possible_sectors;
	
	if ( count _filtered_possible_sectors != 0 ) then {
	
		_nearest_possible_sectors = [];
		
		if ( _try_nearest ) then {
			_maxsearchdist = _mindist + _increment;
			while { (count _nearest_possible_sectors == 0) && (_maxsearchdist <= _maxdist) } do {
				{
					_nextsector = _x select 0;
					_nextdistance = _x select 1;
					if ( _nextdistance < _maxsearchdist ) then {
						_nearest_possible_sectors pushback _nextsector;
					};
				} foreach _filtered_possible_sectors;
				_maxsearchdist = _maxsearchdist + _increment;
			};
		} else {
			{
				_nextsector = _x select 0;
				_nextdistance = _x select 1;
				if ( _nextdistance < _maxdist ) then {
					_nearest_possible_sectors pushback _nextsector;
				};
			} foreach _filtered_possible_sectors;
		};
		
		if ( count _nearest_possible_sectors != 0 ) then {
			if ( _spawn_target == "" ) then {
				_opfor_spawn_point = _nearest_possible_sectors select (floor (random (count _nearest_possible_sectors)));
			} else {
				_opfor_spawn_point = ( [ _nearest_possible_sectors , [ _spawn_target ] , { ( getmarkerpos _input0 ) distance ( getmarkerpos _x ) } , "ASCEND" ] call BIS_fnc_sortBy ) select 0;
			};
		};
	};
	
	_opfor_spawn_point
};

F_getAdaptiveSquadComp = {

	if ( isNil "infantry_weight" ) then { infantry_weight = 33 };
	if ( isNil "armor_weight" ) then { armor_weight = 33 };
	if ( isNil "air_weight" ) then { air_weight = 33 };

	_squadcomp = opfor_squad_8_standard;
	_specialists = false;
	
	if ( !isNil "combat_readiness" ) then {
		if ( combat_readiness < 35 ) then {
			_squadcomp = opfor_squad_low_intensity;
			_specialists = true;
		};
	};
	
	if ( armor_weight > 40 && !_specialists) then {
		_randomchance = (armor_weight - 40) * 1.35;
		if ( (random 100) < _randomchance) then {
			_specialists = true;
			_squadcomp = opfor_squad_8_tankkillers;
		};
	};
	
	if ( air_weight > 40 && !_specialists) then {
		_randomchance = (air_weight - 40) * 1.35;
		if ( (random 100) < _randomchance) then {
			_specialists = true;
			_squadcomp = opfor_squad_8_airkillers;
		};
	};
	
	if ( infantry_weight > 40 && !_specialists) then {
		_randomchance = (infantry_weight - 40) * 1.35;
		if ( (random 100) < _randomchance) then {
			_specialists = true;
			_squadcomp = opfor_squad_8_infkillers;
		};
	};
	
	_squadcomp
};

F_getAdaptiveVehicle = {
	_vehicle_to_spawn = opfor_vehicles call BIS_fnc_selectRandom;
	if ( combat_readiness < 35 ) then {
		_vehicle_to_spawn = opfor_vehicles_low_intensity call BIS_fnc_selectRandom;
	};
		
	_vehicle_to_spawn;
};

F_secondsToTimer = {
	_timer = _this select 0;

	_minutes = floor (_timer / 60);
	_seconds = _timer % 60;
	_minutes_zero = "";
	_seconds_zero = "";

	if ( _minutes < 10 ) then { _minutes_zero = "0"; };
	if ( _seconds < 10 ) then { _seconds_zero = "0"; };

	_retstr = format [ "%1%2:%3%4",_minutes_zero,_minutes,_seconds_zero,_seconds ];

	_retstr
};

F_squadRespawn = {
	_member_to_respawn = objNull;
		
	{
		if ( isnull _member_to_respawn && !isPlayer _x && alive _x && ( _x distance (getmarkerpos "respawn_west")) > 200 &&  (_x distance (getmarkerpos "lhd")) > 500 && !(surfaceIsWater (getpos _x)) )then {
			_member_to_respawn = _x;
		}
	} foreach (units (group player));
	
	_member_to_respawn
};

F_checkClass = {
	_classtotest = (_this select 0);
	isClass ( configFile / "cfgVehicles" / _classtotest );
};

F_filterMods = {
	[ (_this select 0) , { [ ( _x select 0 ) ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
};