waitUntil { !isNil "all_fobs" };
waitUntil { !isNil "blufor_sectors" };

attack_in_progress = false;

while { true } do {

	{
		if (  [ markerpos _x ] call F_sectorOwnership == EAST ) then {
			[ [ _x, 1 ] , "remote_call_sector" ] call BIS_fnc_MP;
			[ _x ] call attack_in_progress_sector;
		};	
		sleep 0.5;
	} foreach blufor_sectors;
	
	{
		if (  [_x] call F_sectorOwnership == EAST) then {
			[ [ _x , 1 ] , "remote_call_fob" ] call BIS_fnc_MP;
			[ _x ] call attack_in_progress_fob;
		};	
		sleep 0.5;
	} foreach all_fobs;
	
	sleep 0.5;

};