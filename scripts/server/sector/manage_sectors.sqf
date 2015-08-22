active_sectors = [];

waitUntil { !isNil "blufor_sectors" };
waitUntil { !isNil "sectors_allSectors" };

while { endgame == 0 } do {

	{
		private [ "_nextsector"];
		_nextsector = _x;
		if ( ( [ getmarkerpos _nextsector , sector_size , WEST ] call F_getUnitsCount > 0 ) && !( _nextsector in active_sectors ) && ( [] call F_opforCap < 150 ) ) then {
			[_nextsector] spawn manage_one_sector;
		};
		sleep 0.1;

	} foreach ( sectors_allSectors - blufor_sectors );

	sleep 1;
};

