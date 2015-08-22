
_limit = _this select 0;
_postosearch = getpos player;
if ( count _this == 2 ) then {
	_postosearch = _this select 1;
};
_sector_to_return = '';
_close_sectors = [ sectors_allSectors , { (markerPos _x) distance _postosearch < _limit } ] call BIS_fnc_conditionalSelect;
_close_sectors_sorted = [ _close_sectors , [_postosearch, _limit] , { (markerPos _x) distance _input0 } , 'ASCEND' ] call BIS_fnc_sortBy;
if ( count _close_sectors_sorted > 0 ) then { _sector_to_return = _close_sectors_sorted select 0; };

_sector_to_return;
