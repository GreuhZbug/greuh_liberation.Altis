params [ "_startpos" ];
private [ "_currentnearest", "_refdistance", "_tpositions"];

_currentnearest = [];
_refdistance = 99999;
_tpositions = [];

if ( count GRLIB_all_fobs != 0 || count blufor_sectors != 0 ) then {
	_tpositions = GRLIB_all_fobs;
	{
		_tpositions pushback (markerpos _x);
	} foreach blufor_sectors;
};

{
	if ( _startpos distance _x < _refdistance ) then {
		_refdistance = (_startpos distance _x);
		_currentnearest = [_x,_refdistance];
	};
} foreach _tpositions;

_currentnearest
