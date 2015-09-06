private [ "_source_position" ];
_source_position = getpos player;
if ( count _this == 1) then {
	_source_position = _this select 0;
};

_mindir = 9999;
_retvalue = [];
if ( count all_fobs > 0 ) then {
	_retvalue = ( [ all_fobs , [] , { _source_position distance _x } , 'ASCEND' ] call BIS_fnc_sortBy ) select 0;
};

_retvalue
