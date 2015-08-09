_sector = _this select 0;

_attacktime = time;
waitUntil { 
	sleep 1;
	( time > (_attacktime  + 600 )) || ( [markerpos _sector] call F_sectorOwnership ) != EAST;
};
waitUntil { [markerpos _sector ] call F_sectorOwnership != RESISTANCE };

if ( endgame == 0 ) then {
	if ( [markerpos _sector] call F_sectorOwnership == EAST ) then {
		blufor_sectors = blufor_sectors - [ _sector ];
		publicVariable "blufor_sectors";
		[ [ _sector, 2 ] , "remote_call_sector" ] call BIS_fnc_MP;
		reset_battlegroups_ai = true;
		trigger_server_save = true;
		[] call recalculate_caps;
		stats_sectors_lost = stats_sectors_lost + 1;
	} else {
		[ [ _sector, 3 ] , "remote_call_sector" ] call BIS_fnc_MP;
	};
};

sleep 15;