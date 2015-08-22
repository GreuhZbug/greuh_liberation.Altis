
_mindir = 9999;
_retvalue = [];
if ( count all_fobs > 0 ) then {
	_retvalue = ( [ all_fobs , [] , { player distance _x } , 'ASCEND' ] call BIS_fnc_sortBy ) select 0;
};

_retvalue
