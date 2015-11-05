diag_log format [ "Spawning regular squad at %1", time ];

params [ "_sector", "_squadies_to_spawn" ];
private [ "_sectorpos", "_spawnpos", "_grp", "_unitidx", "_corrected_amount" ];

_sectorpos = [ getMarkerPos _sector, random 100, random 360 ] call BIS_fnc_relPos;

_spawnpos = [0,0,0];
while { surfaceIsWater _spawnpos } do {
	_spawnpos = ( [ _sectorpos, random 50, random 360 ] call BIS_fnc_relPos ) findEmptyPosition [0, 100, "B_Heli_Light_01_F"];
};

_corrected_amount = round ( (count _squadies_to_spawn) * ([] call F_adaptiveOpforFactor) );
_grp = createGroup EAST;
{
	if ( ( count units _grp ) < _corrected_amount) then {
		_x createUnit [_spawnpos, _grp,'this addMPEventHandler ["MPKilled", {_this spawn kill_manager}]'];
	};
	sleep 0.1;
} foreach _squadies_to_spawn;

if ( _sector in sectors_capture ) then {
	_unitidx = 0;
	{
		if ( (typeof _x) in original_resistance ) then {
			[ _x ] call ( militia_standard_squad select _unitidx );
		};
		_unitidx = _unitidx + 1;
		if ( _unitidx > 9 ) then { _unitidx = 0 };
	} foreach (units _grp);
};

diag_log format [ "Done Spawning regular squad at %1", time ];

_grp;
