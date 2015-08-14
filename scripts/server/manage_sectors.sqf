active_sectors = [];

waitUntil { !isNil "blufor_sectors" };
waitUntil { !isNil "sectors_allSectors" };

while { endgame == 0 } do {

	{
		_count_west = [ getmarkerpos _x , sector_size , WEST ] call F_getUnitsCount;
		_west_on_flag = [ getmarkerpos _x , capture_size , WEST ] call F_getUnitsCount;
		_count_east = [ getmarkerpos _x , (capture_size / 1.5) , EAST ] call F_getUnitsCount;
		_count_resistance = [ getmarkerpos _x , (capture_size / 1.5) , RESISTANCE ] call F_getUnitsCount;
		
		if ( ( _count_west > 0 ) && ( _west_on_flag == 0 ) && ( (_count_east + _count_resistance) == 0 ) && !( _x in active_sectors ) && ([] call F_opforCap < 180 )) then {
			[_x] spawn sector_initial_spawn;
		};
		
		if ( ( _count_west > 1 ) && ( _west_on_flag == 0 ) && !( _x in active_sectors ) && ( [] call F_opforCap < 150 ) ) then {
			[_x] spawn manage_one_sector;
		};
		
		sleep 0.1;
		
	} foreach ( sectors_allSectors - blufor_sectors );

	sleep 1;
};

