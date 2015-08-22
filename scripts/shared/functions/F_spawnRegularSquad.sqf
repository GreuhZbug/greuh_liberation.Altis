params [ "_sector", "_sidespawn", "_squadies_to_spawn" ];
private [ "_sectorpos", "_spawnpos", "_grp", "_unitidx" ];

_sectorpos = getMarkerPos _sector;

_spawnpos = [0,0,0];
while { surfaceIsWater _spawnpos } do {
	_spawnpos = [(((_sectorpos select 0) + 25) - (random 50)),(((_sectorpos select 1) + 25) - random 50),0];
	_spawnpos = _spawnpos findEmptyPosition [0, 100, "B_Heli_Light_01_F"];
};

_grp = createGroup _sidespawn;
{ _x createUnit [_spawnpos, _grp,"this addMPEventHandler [""MPKilled"", {_this spawn kill_manager}]", 0.5, "private"]; } foreach _squadies_to_spawn;

if ( _sector in sectors_capture ) then {
	_unitidx = 0;
	{
		[ _x ] call ( militia_standard_squad select _unitidx );
		_unitidx = _unitidx + 1;
	} foreach (units _grp);
};

_grp;
