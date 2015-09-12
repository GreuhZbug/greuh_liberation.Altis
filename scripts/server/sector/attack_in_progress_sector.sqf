params [ "_sector" ];
private [ "_attacktime", "_ownership", "_grp" ];

_attacktime = GRLIB_vulnerability_timer;
_ownership = EAST;

_grp = creategroup WEST;
{
	_x createUnit [ markerpos _sector, _grp,'this addMPEventHandler ["MPKilled", {_this spawn kill_manager}]'];
} foreach blufor_squad_inf;

while { _attacktime > 0 && ( _ownership == EAST || _ownership == RESISTANCE ) } do {
	_ownership = [markerpos _sector] call F_sectorOwnership;
	_attacktime = _attacktime - 1;
	sleep 1;
};

waitUntil {
	sleep 1;
	[markerpos _sector] call F_sectorOwnership != RESISTANCE;
};

if ( GRLIB_endgame == 0 ) then {
	if ( _attacktime <= 1 && ( [markerpos _sector] call F_sectorOwnership == EAST ) ) then {
		blufor_sectors = blufor_sectors - [ _sector ];
		publicVariable "blufor_sectors";
		[ [ _sector, 2 ] , "remote_call_sector" ] call BIS_fnc_MP;
		reset_battlegroups_ai = true;
		trigger_server_save = true;
		[] call recalculate_caps;
		stats_sectors_lost = stats_sectors_lost + 1;
	} else {
		[ [ _sector, 3 ] , "remote_call_sector" ] call BIS_fnc_MP;
		{ [_x] spawn prisonner_ai } foreach ( [ (markerpos _sector) nearEntities [ "Man", 300], { side group _x == EAST || side group _x == RESISTANCE } ] call BIS_fnc_conditionalSelect );
	};
};

sleep 20;

{
	if ( alive _x ) then { deleteVehicle _x };
} foreach units _grp;