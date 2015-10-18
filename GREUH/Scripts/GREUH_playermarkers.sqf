_players = [];
_markers = [];
_vehicle_markers = [];
_squadai_markers = [];
_color = "";
_player = player;
_cfg = configFile >> "cfgVehicles";

if ( side player == WEST ) then {
	_color = "ColorBLUFOR";
} else {
	_color = "ColorOPFOR";
};

while { true } do {
	waitUntil { sleep 0.3; show_teammates };
	while { show_teammates } do {

		// Protection pour le solo et autres cas imprevus
		if ( count playableUnits != 0 ) then {
			_players = playableUnits;
		} else {
			_players = [player];
		};
		_opposing_players = [];

		{
			if ( side _x != side player ) then {
				_opposing_players = _opposing_players + [_x];
			};
		} foreach _players;

		_players = _players - _opposing_players;
		_vehicles = [];
		_squadais = [];

		{
			if (vehicle _x != _x) then {
				_players = _players - [_x];
				if ( !((vehicle _x) in _vehicles) ) then {
					_vehicles = _vehicles + [vehicle _x];
				};
			};
		} foreach _players;

		if ( count _markers != count _players ) then {
			{ deleteMarkerLocal _x } foreach _markers;
			_markers = [];
			for [ {_idx=0},{_idx < count _players},{_idx=_idx+1} ] do {
				_markers = _markers + [createMarkerLocal [format [ "playermarker%1",_idx ], [0,0,0]]];
			}
		};

		{
			if ( !isPlayer _x && alive _x) then {

				if ( vehicle _x == _x ) then {
					_squadais = _squadais + [_x];
				} else {
					if ( !((vehicle _x) in _vehicles)) then {
						_vehicles =_vehicles + [vehicle _x];
					};
				};
			}
		} foreach (units (group player));

		if ( count _squadai_markers != count _squadais ) then {
			{ deleteMarkerLocal _x } foreach _squadai_markers;
			_squadai_markers = [];
			for [ {_idx=0},{_idx < count _squadais},{_idx=_idx+1} ] do {
				_squadai_markers = _squadai_markers + [createMarkerLocal [format [ "squadaimarker%1",_idx ], [0,0,0]]];
			}
		};

		{
			_player = _players select ( _markers find _x );

			_name = "";
			if(count (squadParams _player) != 0) then {
				_name = "[" + ((squadParams _player select 0) select 0) + "] ";
			};
			_name = _name + name _player;

			_x setMarkerTypeLocal "mil_start";
			_x setMarkerSizeLocal [0.75,0.75];
			_x setMarkerPosLocal getpos _player;
			_x setMarkerTextLocal _name;
			_x setMarkerDirLocal getdir _player;
			_x setMarkerColorLocal _color;
		} foreach _markers;

		{
			_squadai = _squadais select ( _squadai_markers find _x );

			_name = [ _squadai ] call F_getUnitPositionId;

			_x setMarkerTypeLocal "mil_triangle";
			_x setMarkerSizeLocal [0.6,0.6];
			_x setMarkerPosLocal getpos _squadai;
			_x setMarkerTextLocal format [ "%1", _name ];
			_x setMarkerDirLocal getdir _squadai;
			_x setMarkerColorLocal _color;
		} foreach _squadai_markers;


		if ( count _vehicle_markers != count _vehicles ) then {
			{ deleteMarkerLocal _x } foreach _vehicle_markers;
			_vehicle_markers = [];
			for [ {_idx=0},{_idx < count _vehicles},{_idx=_idx+1}] do {
				_vehicle_markers = _vehicle_markers + [createMarkerLocal [format [ "vehiclemarker%1",_idx ], [0,0,0]]];
			}
		};

		{
			_vehicle = _vehicles select ( _vehicle_markers find _x );
			_name = "";
			_datcrew = crew _vehicle;

			{
				if (isPlayer _x) then {
					_name = _name + name _x;
				} else {
					_name = _name +  format [ "%1", [ _x ] call F_getUnitPositionId ];
				};

				if( (_datcrew find _x) != ((count _datcrew) - 1) ) then {
				_name = _name + ",";
				};
				_name = _name + " ";
			} foreach  _datcrew;
			_name = _name + "(" + getText (_cfg >> typeOf _vehicle >> "displayName") + ")";

			_x setMarkerTypeLocal "mil_arrow2";
			_x setMarkerSizeLocal [0.75,0.75];
			_x setMarkerPosLocal getpos _vehicle;
			_x setMarkerTextLocal _name;
			_x setMarkerDirLocal getdir _vehicle;
			_x setMarkerColorLocal _color;
		} foreach _vehicle_markers;

		sleep 1;
	};

	{ deleteMarkerLocal _x } foreach _markers;
	_markers = [];
	{ deleteMarkerLocal _x } foreach _vehicle_markers;
	_vehicle_markers = [];
	{ deleteMarkerLocal _x } foreach _squadai_markers;
	_squadai_markers = [];
};