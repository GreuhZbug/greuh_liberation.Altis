
_cap_thresold_count = 2;
_cap_thresold_ratio = 0.85;
_thatpos = _this select 0;
_localsize = capture_size;

if (count _this == 2) then {
	_localsize = _this select 1;
};

_sectorside = RESISTANCE;
_countwest_ownership = [_thatpos, _localsize, WEST ] call F_getUnitsCount;
_counteast_ownership = ( [_thatpos, _localsize, EAST ] call F_getUnitsCount) + ([_thatpos, _localsize, RESISTANCE ] call F_getUnitsCount);

_blufor_ratio = 0;
if ( _countwest_ownership + _counteast_ownership != 0 ) then {
	_blufor_ratio = _countwest_ownership / ( _countwest_ownership + _counteast_ownership);
};

if ( _countwest_ownership == 0 && _counteast_ownership <= _cap_thresold_count ) then { _sectorside = CIVILIAN; };

if ( _countwest_ownership > 0 && (_counteast_ownership <= _cap_thresold_count || _blufor_ratio > _cap_thresold_ratio) ) then { _sectorside = WEST; };

if ( _countwest_ownership == 0 && _counteast_ownership > _cap_thresold_count ) then { _sectorside = EAST; };

if ( _countwest_ownership > 0 && (_counteast_ownership > _cap_thresold_count && _blufor_ratio <= _cap_thresold_ratio ) ) then { _sectorside = RESISTANCE; };

_sectorside
