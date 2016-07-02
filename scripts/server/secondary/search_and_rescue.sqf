
private _spawn_marker = [ 3000, 999999, false ] call F_findOpforSpawnPoint;
if ( _spawn_marker == "" ) exitWith { diag_log "Could not find position for search and rescue mission"; };
used_positions pushbackUnique _spawn_marker;

private _helopos = [ getmarkerpos _spawn_marker, random 200, random 360 ] call BIS_fnc_relPos;
private _helowreck = GRLIB_sar_wreck createVehicle _helopos;
_helowreck allowDamage false;
_helowreck setPos _helopos;
_helowreck setPos _helopos;
private _helowreckDir = (random 360);
_helowreck setDir _helowreckDir;

private _helofire = GRLIB_sar_fire createVehicle ([getpos _helowreck, -1.5, (_helowreckDir + 25)] call BIS_fnc_relPos);

private _pilotsGrp = createGroup GRLIB_side_enemy;
private _pilotsPos = [ getpos _helowreck, 25, random 360 ] call BIS_fnc_relPos;
pilot_classname createUnit [ _pilotsPos, _pilotsGrp,"this addMPEventHandler [""MPKilled"", {_this spawn kill_manager}]", 0.5, "private"];
sleep 0.2;
pilot_classname createUnit [ [ _pilotsPos, 1, random 360 ] call BIS_fnc_relPos, _pilotsGrp,"this addMPEventHandler [""MPKilled"", {_this spawn kill_manager}]", 0.5, "private"];
sleep 2;
private _pilotUnits = units _pilotsGrp;
{
	[ _x, true ] spawn prisonner_ai;
	_x setDir (random 360);
	sleep 0.5
} foreach (_pilotUnits);