active_sectors = [];

waitUntil { !isNil "blufor_sectors" };
waitUntil { !isNil "sectors_allSectors" };

while { GRLIB_endgame == 0 } do {

	{
		private [ "_nextsector"];
		_nextsector = _x;
		if ( ( [ getmarkerpos _nextsector , GRLIB_sector_size , WEST ] call F_getUnitsCount > 0 ) && !( _nextsector in active_sectors ) && ( [] call F_opforCap < GRLIB_sector_cap ) ) then {
			_hc = [] call F_lessLoadedHC;
			if ( isNull _hc ) then {
				[ _nextsector ] spawn manage_one_sector;
			} else {
				[ [ _nextsector ] , "manage_one_sector", _hc ] call BIS_fnc_MP;
			}
		};
		sleep 0.1;

	} foreach ( sectors_allSectors - blufor_sectors );

	sleep 1;
};

