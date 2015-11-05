params [ "_thatpos", [ "_localsize", GRLIB_capture_size ] ];
private [ "_cap_thresold_count", "_cap_thresold_ratio", "_cap_min_ratio", "_sectorside", "_countwest_ownership", "_counteast_ownership", "_blufor_ratio" ];

_cap_thresold_count = 3;
_cap_thresold_ratio = 0.85;
_cap_min_ratio = 0.51;

_sectorside = RESISTANCE;
_countwest_ownership = [_thatpos, _localsize, WEST ] call F_getUnitsCount;
_counteast_ownership = [_thatpos, _localsize, EAST ] call F_getUnitsCount;

_blufor_ratio = 0;
if ( _countwest_ownership + _counteast_ownership != 0 ) then {
	_blufor_ratio = _countwest_ownership / ( _countwest_ownership + _counteast_ownership);
};

if ( _countwest_ownership == 0 && _counteast_ownership <= _cap_thresold_count ) then { _sectorside = CIVILIAN; };

if ( _countwest_ownership > 0 && ( ( _counteast_ownership <= _cap_thresold_count && _blufor_ratio > _cap_min_ratio ) || _blufor_ratio > _cap_thresold_ratio) ) then { _sectorside = WEST; };

if ( _countwest_ownership == 0 && _counteast_ownership > _cap_thresold_count ) then { _sectorside = EAST; };

_sectorside
