_vehmarkers = [];
_markedveh = [];
_cfg = configFile >> "cfgVehicles";
_vehtomark = [];

_supporttomark = [
(support_vehicles select 1),
(support_vehicles select 2),
(support_vehicles select 4),
(support_vehicles select 5),
(support_vehicles select 6),
(support_vehicles select 10),
(support_vehicles select 11),
(support_vehicles select 12),
(support_vehicles select 13)
];

{
	_vehtomark = _vehtomark + [_x select 0];
} foreach light_vehicles + heavy_vehicles + air_vehicles + _supporttomark;

while { true } do {

	_markedveh = [];
	{
		if ( (alive _x) && ((typeof _x) in _vehtomark) && (count (crew _x) == 0) && (_x distance lhd > 500) ) then {
			_markedveh = _markedveh + [_x];
		};
	} foreach vehicles;

	if ( count _markedveh != count _vehmarkers ) then {
		{ deleteMarkerLocal _x; } foreach _vehmarkers;
		_vehmarkers = [];

		{
			_marker = createMarkerLocal [ format [ "markedveh%1" ,_x], markers_reset ];
			_marker setMarkerColorLocal "ColorKhaki";
			_marker setMarkerTypeLocal "mil_dot";
			_marker setMarkerSizeLocal [ 0.75, 0.75 ];
			_vehmarkers = _vehmarkers + [_marker];
		} foreach _markedveh;
	};

	{
		_marker = _vehmarkers select (_markedveh find _x);
		_marker setMarkerPosLocal getpos _x;
		_marker setMarkerTextLocal  (getText (_cfg >> typeOf _x >> "displayName"));

	} foreach _markedveh;

	sleep 5;
};