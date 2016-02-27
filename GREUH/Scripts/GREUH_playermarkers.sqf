private _players = [];
private _vehicles = [];
private _squadais = [];
private _color = "";
private _ticks = 0;
private _cfg = configFile >> "cfgVehicles";

if ( side player == WEST ) then {
	_color = "ColorBLUFOR";
} else {
	_color = "ColorOPFOR";
};

while { true } do {
	waitUntil { sleep 0.3; show_teammates };
	while { show_teammates } do {
		if ( _ticks == 0 ) then {

			if ( count playableUnits != 0 ) then {
				_players = [ playableUnits, { (side (group _x)) == (side (group player)) } ] call BIS_fnc_conditionalSelect;
			} else {
				_players = [player];
			};

			_vehicles = [];
			_squadais = [];

			{
				if (vehicle _x != _x) then {
					_players = _players - [_x];
					_vehicles pushbackUnique (vehicle _x);
				};
			} foreach _players;

			{
				if ( !isPlayer _x && alive _x) then {
					if ( (vehicle _x) == _x ) then {
						_squadais pushback _x;
					} else {
						_vehicles pushbackUnique (vehicle _x);
					};
				};
			} foreach (units (group player));

			{
				private _nextplayer = _x;
				private _marker = _nextplayer getVariable [ "spotmarker", "" ];
				if ( _marker == "" ) then {
					_marker = ( createMarkerLocal [ format [ "playermarker%1", (allUnits find _x) * (time % 1000) * (floor (random 100)) ], getpos _nextplayer ] );
					_nextplayer setVariable [ "spotmarker", _marker ];

					private _playername = "";
					if( count (squadParams _nextplayer) != 0 ) then {
						_playername = "[" + ((squadParams _nextplayer select 0) select 0) + "] ";
					};
					_playername = _playername + (name _nextplayer);
					_marker setMarkerTextLocal _playername;

					_marker setMarkerSizeLocal [ 0.75, 0.75 ];
					_marker setMarkerColorLocal _color;
				};

				private _markertype = "mil_start";
				if ( _nextplayer getVariable [ "FAR_isUnconscious", 0 ] == 1 ) then {
					_markertype = "mil_warning";
				};
				_marker setMarkerTypeLocal _markertype;
			} foreach _players;

			{
				private _nextai = _x;
				private _marker = _nextai getVariable [ "spotmarker", "" ];

				if ( _marker == "" ) then {
					_marker = ( createMarkerLocal [ format [ "squadaimarker%1", (allUnits find _x) * (time % 1000) * (floor (random 10000)) ], getpos _nextai ] );
					_nextai setVariable [ "spotmarker", _marker ];
					_marker setMarkerTypeLocal "mil_triangle";
					_marker setMarkerSizeLocal [ 0.6, 0.6 ];
					_marker setMarkerColorLocal _color;
				};

				_marker setMarkerTextLocal format [ "%1", ( [ _nextai ] call F_getUnitPositionId )];
			} foreach _squadais;

			{
				private _nextvehicle = _x;
				private _marker = _nextvehicle getVariable [ "spotmarker", "" ];
				if ( _marker == "" ) then {
					_marker = ( createMarkerLocal [ format [ "vehiclemarker%1", (vehicles find _x) * (time % 1000) * (floor (random 10000)) ], getpos _nextvehicle ] );
					_nextvehicle setVariable [ "spotmarker", _marker ];
					_marker setMarkerTypeLocal "mil_arrow2";
					_marker setMarkerSizeLocal [0.75,0.75];
					_marker setMarkerColorLocal _color;
				};

				private _datcrew = crew _nextvehicle;
				private _vehiclename = "";
				{
					if (isPlayer _x) then {
						_vehiclename = _vehiclename + (name _x);
					} else {
						_vehiclename = _vehiclename + ( format [ "%1", [ _x ] call F_getUnitPositionId ] );
					};

					if( (_datcrew find _x) != ((count _datcrew) - 1) ) then {
						_vehiclename = _vehiclename + ",";
					};
					_vehiclename = _vehiclename + " ";
				} foreach  _datcrew;

				_vehiclename = _vehiclename + "(" + getText (_cfg >> typeOf _nextvehicle >> "displayName") + ")";
				_marker setMarkerTextLocal _vehiclename;
			} foreach _vehicles;

			{
				private _nextunit = _x;
				private _marker = _nextunit getVariable [ "spotmarker", "" ];
				if ( _marker != "" ) then {
					if ( !(_nextunit in _players || _nextunit in _squadais) ) then {
						deleteMarkerLocal _marker;
						_nextunit setVariable [ "spotmarker", "" ];
					};
				};
			} foreach ( [ allUnits, { side (group _x) == side (group player) }] call BIS_fnc_conditionalSelect);

			{
				private _nextvehicle = _x;
				private _marker = _nextvehicle getVariable [ "spotmarker", "" ];
				if ( _marker != "" ) then {
					if ( !(_nextvehicle in _vehicles)) then {
						deleteMarkerLocal _marker;
						_nextvehicle setVariable [ "spotmarker", "" ];
					};
				};
			} foreach vehicles;
		};

		private _markerunits = [] + _players + _squadais + _vehicles;
		{
			private _nextunit = _x;
			private _marker = _nextunit getVariable [ "spotmarker", "" ];
			if ( _marker != "" ) then {
				_marker setMarkerPosLocal (getPos _nextunit);
				_marker setMarkerDirLocal (getDir _nextunit);
			};
		} foreach _markerunits;

		_ticks = _ticks + 1;

		if ( _ticks > 10 ) then {
			_ticks = 0;
		};
		sleep 0.1;
	};

	{
		private _nextunit = _x;
		private _marker =  _nextunit getVariable [ "spotmarker", "" ];
		if ( _marker != "" ) then {
			deleteMarkerLocal _marker;
			_nextunit setVariable [ "spotmarker", "" ];
		};
	} forEach (allUnits + vehicles);
};