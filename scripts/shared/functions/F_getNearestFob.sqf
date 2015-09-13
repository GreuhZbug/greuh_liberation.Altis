params [ [ "_source_position", (getpos player) ] ];
private [ "_mindir", "_retvalue" ];

_mindir = 9999;
_retvalue = [];
if ( count all_fobs > 0 ) then {
	_retvalue = ( [ all_fobs , [] , { _source_position distance _x } , 'ASCEND' ] call BIS_fnc_sortBy ) select 0;
};

_retvalue
