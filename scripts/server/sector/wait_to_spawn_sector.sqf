params [ "_sector" ];
private [ "_unitscount" ];

sleep 0.1;
_unitscount = [ getmarkerpos _sector , sector_size , WEST ] call F_getUnitsCount;
if ( _unitscount > 0 && _unitscount <= 10 ) then {
	sleep 5;
};

sleep 0.1;
_unitscount = [ getmarkerpos _sector , sector_size , WEST ] call F_getUnitsCount;
if ( _unitscount > 0 && _unitscount <= 6 ) then {
	sleep 10;
};

sleep 0.1;
_unitscount = [ getmarkerpos _sector , sector_size , WEST ] call F_getUnitsCount;
if ( _unitscount > 0 && _unitscount <= 4 ) then {
	sleep 10;
};

sleep 0.1;
_unitscount = [ getmarkerpos _sector , sector_size , WEST ] call F_getUnitsCount;
if ( _unitscount > 0 && _unitscount <= 3 ) then {
	sleep 10;
};

sleep 0.1;
_unitscount = [ getmarkerpos _sector , sector_size , WEST ] call F_getUnitsCount;
if ( _unitscount > 0 && _unitscount <= 2 ) then {
	sleep 10;
};

sleep 0.1;
_unitscount = [ getmarkerpos _sector , sector_size , WEST ] call F_getUnitsCount;
if ( _unitscount == 1 ) then {
	sleep 10;
};