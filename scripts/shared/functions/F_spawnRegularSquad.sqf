params [ "_sector", "_sidespawn", "_squadies_to_spawn" ];
private [ "_sectorpos", "_spawnpos", "_grp", "_unitidx" ];

_sectorpos = [ getMarkerPos _sector, random 100, random 360 ] call BIS_fnc_relPos;

_spawnpos = [0,0,0];
while { surfaceIsWater _spawnpos } do {
	_spawnpos = ( [ _sectorpos, random 50, random 360 ] call BIS_fnc_relPos ) findEmptyPosition [0, 100, "B_Heli_Light_01_F"];
};

_grp = createGroup _sidespawn;
{
	_x createUnit [_spawnpos, _grp,'this addMPEventHandler ["MPKilled", {_this spawn kill_manager}]'];
	sleep 0.1;
} foreach _squadies_to_spawn;

if ( _sector in sectors_capture ) then {
	_unitidx = 0;
	{
		[ _x ] call ( militia_standard_squad select _unitidx );
		_unitidx = _unitidx + 1;
		if ( _unitidx > 9 ) then { _unitidx = 0 };
	} foreach (units _grp);
};

_grp;
