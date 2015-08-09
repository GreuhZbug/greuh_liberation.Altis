sectors_allSectors = [];
sectors_capture = [];
sectors_bigtown = [];
sectors_factory = [];
sectors_military = [];
sectors_tower = [];
sectors_opfor = [];

{
	_ismissionsector = false;
	_tempmarker = toArray _x; _tempmarker resize 11;
	if ( toString _tempmarker == "opfor_point" ) then {
		sectors_opfor = sectors_opfor + [_x];
		_ismissionsector = false;
	};
	_tempmarker = toArray _x; _tempmarker resize 7;
	if ( toString _tempmarker == "capture" ) then {
		sectors_capture = sectors_capture + [_x];
		_ismissionsector = true;
	};
	_tempmarker = toArray _x; _tempmarker resize 7;
	if ( toString _tempmarker == "bigtown" ) then {
		sectors_bigtown = sectors_bigtown + [_x];
		_ismissionsector = true;
	};
	_tempmarker = toArray _x; _tempmarker resize 7;
	if ( toString _tempmarker == "factory" ) then {
		sectors_factory = sectors_factory + [_x];
		_ismissionsector = true;
	};
	_tempmarker = toArray _x; _tempmarker resize 8;
	if ( toString _tempmarker == "military" ) then {
		sectors_military = sectors_military + [_x];
		_ismissionsector = true;
	};
	_tempmarker = toArray _x; _tempmarker resize 5;
	if ( toString _tempmarker == "tower" ) then {
		sectors_tower = sectors_tower + [_x];
		_x setMarkerTextLocal format ["%1 %2",markerText _x, mapGridPosition (markerPos _x)];
		_ismissionsector = true;
	};
	
	if ( _ismissionsector ) then {
		sectors_allSectors = sectors_allSectors + [_x];
	};
} foreach allMapMarkers;