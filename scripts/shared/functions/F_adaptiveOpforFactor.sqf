private [ "_bluforcount, _ratio" ];

_ratio = 1;

if ( GRLIB_adaptive_opfor ) then {

	_bluforcount = 0.25 * ( WEST countSide allUnits );
	_bluforcount = _bluforcount + (count allPlayers);

	if ( _bluforcount <= 10 ) then {
		_ratio = 0.5 + (_bluforcount / 20.0);
	}

};

_ratio