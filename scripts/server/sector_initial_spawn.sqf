_sector = _this select 0;
_sectorpos = getmarkerpos _sector;
_inftospawn = [];
_side = EAST;

if ( _sector in sectors_bigtown ) then {
	_inftospawn = ([] call F_getAdaptiveSquadComp) + ([] call F_getAdaptiveSquadComp);
	_side = EAST;
};
if ( _sector in sectors_capture ) then {
	_inftospawn = [];
	while { count _inftospawn < 10 } do { _inftospawn pushback ( militia_squad call BIS_fnc_selectRandom ) };
	_side = RESISTANCE;
};
if ( _sector in sectors_military ) then {
	_inftospawn = ([] call F_getAdaptiveSquadComp);
	_side = EAST;
};
if ( _sector in sectors_factory ) then {
	_inftospawn = ([] call F_getAdaptiveSquadComp);
	_side = EAST;
};
if ( _sector in sectors_tower ) then {
	_inftospawn = ([] call F_getAdaptiveSquadComp);
	_side = EAST;
};


_spawnpos = [0,0,0];
while { surfaceIsWater _spawnpos } do {
	_spawnpos = [(((_sectorpos select 0) + 25) - (random 50)),(((_sectorpos select 1) + 25) - random 50),0];
	_spawnpos = _spawnpos findEmptyPosition [0, 100, "B_Heli_Light_01_F"];
};
		
_grp = createGroup _side;
{ _x createUnit [_spawnpos, _grp,"this addMPEventHandler [""MPKilled"", {_this spawn kill_manager}]", 0.5, "private"]; } foreach _inftospawn;

if ( _sector in sectors_capture ) then {
	_unitidx = 0;
	{
		[ _x ] call ( militia_standard_squad select _unitidx );
		_unitidx = _unitidx + 1;	
	} foreach (units _grp);
};

[_grp,_sectorpos] call add_defense_waypoints;

while { (count (units _grp) > 0) && (( [_sectorpos, (sector_size + 100), WEST ] call F_getUnitsCount ) > 0) } do {
	sleep 5;
};

{
	if ( alive _x ) then {
		deleteVehicle _x;
	};
} foreach (units _grp);
	

