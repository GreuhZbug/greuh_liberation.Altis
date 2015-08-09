if ( isDedicated ) exitWith {};

if ( isNil "sector_timer" ) then { sector_timer = 0 };

_fob = _this select 0;
_status = _this select 1;

_fobindex = -1;
_currentidx = 0;
{
	if ( _x distance _fob < 100 ) then {
		_fobindex = _currentidx;
	};
	_currentidx = _currentidx + 1;
} foreach all_fobs;

_fobname = "";
if ( _fobindex != -1 ) then {
	_fobname = military_alphabet select _fobindex;
};

if ( _status == 0 ) then {
	[ "lib_fob_built", [ _fobname ] ] call BIS_fnc_showNotification;
};

if ( _status == 1 ) then {
	[ "lib_fob_attacked", [ _fobname ] ] call BIS_fnc_showNotification;
	"opfor_capture_marker" setMarkerPosLocal _fob;
	sector_timer = 600;
};

if ( _status == 2 ) then {
	[ "lib_fob_lost", [ _fobname ] ] call BIS_fnc_showNotification;
	"opfor_capture_marker" setMarkerPosLocal markers_reset;
	sector_timer = 0;
};

if ( _status == 3 ) then {
	[ "lib_fob_safe", [ _fobname ] ] call BIS_fnc_showNotification;
	"opfor_capture_marker" setMarkerPosLocal markers_reset;
	sector_timer = 0;
};