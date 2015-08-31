waitUntil { !isNil "all_fobs" };
waitUntil { !isNil "blufor_sectors" };

attack_in_progress = false;

while { true } do {

	{
		_ownership = [ markerpos _x ] call F_sectorOwnership;
		if ( _ownership == EAST || _ownership == RESISTANCE ) then {
			[ [ _x, 1 ] , "remote_call_sector" ] call BIS_fnc_MP;
			[ _x ] call attack_in_progress_sector;
		};
		sleep 1;
	} foreach blufor_sectors;

	{
		_ownership = [ _x ] call F_sectorOwnership;
		if ( _ownership == EAST || _ownership == RESISTANCE ) then {
			[ [ _x , 1 ] , "remote_call_fob" ] call BIS_fnc_MP;
			[ _x ] call attack_in_progress_fob;
		};
		sleep 1;
	} foreach all_fobs;

	sleep 1;

};