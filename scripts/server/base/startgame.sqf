waitUntil { time > 1 };
waitUntil { !isNil "all_fobs" };
waitUntil { !isNil "save_is_loaded" };

if ( count all_fobs == 0 ) then {

	if ( GRLIB_build_first_fob ) then {
		_potentialplaces = [];
		{
			_nextsector = _x;
			_acceptsector = true;
			{
				if ( ( ( markerPos _nextsector ) distance ( markerPos _x ) ) < 1600 ) then {
					_acceptsector = false;
				};
			} foreach sectors_allSectors;

			if ( _acceptsector ) then {
				_potentialplaces pushBack _nextsector;
			};
		} foreach sectors_opfor;

		_spawnplace = _potentialplaces call BIS_fnc_selectRandom;
		[ [ markerPos _spawnplace, true ] , "build_fob_remote_call" ] call BIS_fnc_MP;

	} else {
		if ( GRLIB_isAtlasPresent ) then {
			_fobbox = FOB_box_typename createVehicle [0,0,50];
			_fobbox enableSimulationGlobal false;
			_fobbox allowDamage false;
			_fobbox setposasl [(getpos lhd select 0) + 10, (getpos lhd select 1) + 62, (18   + (getposasl lhd select 2))];
			clearItemCargoGlobal _fobbox;
			_fobbox setDir 130;
			sleep 1;
			_fobbox enableSimulationGlobal true;
			_fobbox allowDamage true;
		} else {
			_fobbox = FOB_box_typename createVehicle (getpos base_boxspawn);
			_fobbox setpos (getpos base_boxspawn);
			_fobbox setdir 215;
		};
	};
};