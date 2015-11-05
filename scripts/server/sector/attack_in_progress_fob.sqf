params [ "_thispos" ];
private [ "_attacktime", "_ownership", "_grp" ];

sleep 15;

_ownership =  [ _thispos ] call F_sectorOwnership;
if ( _ownership != EAST ) exitWith {};

[ [ _thispos , 1 ] , "remote_call_fob" ] call BIS_fnc_MP;
_attacktime = GRLIB_vulnerability_timer;
_grp = creategroup WEST;
{
	_x createUnit [ _thispos, _grp,'this addMPEventHandler ["MPKilled", {_this spawn kill_manager}]'];
} foreach blufor_squad_inf;

while { _attacktime > 0 && ( _ownership == EAST || _ownership == RESISTANCE ) } do {
	_ownership = [ _thispos ] call F_sectorOwnership;
	_attacktime = _attacktime - 1;
	sleep 1;
};

waitUntil {
	sleep 1;
	[ _thispos ] call F_sectorOwnership != RESISTANCE;
};

if ( GRLIB_endgame == 0 ) then {
	if ( _attacktime <= 1 && ( [ _thispos ] call F_sectorOwnership == EAST ) ) then {
		[ [ _thispos , 2 ] , "remote_call_fob" ] call BIS_fnc_MP;
		sleep 3;
		GRLIB_all_fobs = GRLIB_all_fobs - [_thispos];
		publicVariable "GRLIB_all_fobs";
		reset_battlegroups_ai = true;
		[_thispos] call destroy_fob;
		trigger_server_save = true;
		[] call recalculate_caps;
		stats_fobs_lost = stats_fobs_lost + 1;
	} else {
		[ [ _thispos , 3 ] , "remote_call_fob" ] call BIS_fnc_MP;
		{ [_x] spawn prisonner_ai; } foreach ( [ _thispos nearEntities [ "Man", 300], { side group _x == EAST } ] call BIS_fnc_conditionalSelect );
	};
};

sleep 20;

{
	if ( alive _x ) then { deleteVehicle _x };
} foreach units _grp;