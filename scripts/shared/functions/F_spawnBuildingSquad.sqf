params [ "_infsquad", "_building_ai_max", "_buildingpositions" ];
private [ "_squadtospawnnn", "_infsquad_classnames", "_usedposits", "_nextposit", "_remainingposits", "_grp" ];

_infsquad_classnames = [];
if ( _infsquad == "militia" ) then {
	_infsquad_classnames = militia_squad;
} else {
	_infsquad_classnames = ([] call F_getAdaptiveSquadComp);
};

if ( _building_ai_max > floor ((count _buildingpositions) * 0.65)) then { _building_ai_max = floor ((count _buildingpositions) * 0.65)};
_squadtospawnnn = [];
while { (count _squadtospawnnn) < _building_ai_max } do { _squadtospawnnn pushback ( _infsquad_classnames call BIS_fnc_selectRandom ); };

_grp = createGroup _sidespawn;
{ _x createUnit [ _sectorpos, _grp,"this addMPEventHandler [""MPKilled"", {_this spawn kill_manager}]", 0.5, "private"]; } foreach _squadtospawnnn;

if ( _infsquad == "militia" ) then {
	{ [ _x ] call ( militia_standard_squad call BIS_fnc_selectRandom ) } foreach (units _grp);
};


_usedposits = [];
_nextposit = -1;
_remainingposits = count _buildingpositions;

sleep 5;

{
	if ( _remainingposits > 2 ) then {
		_nextposit = (floor (random (count _buildingpositions)));
		while { _nextposit in _usedposits } do {
			_nextposit = (floor (random (count _buildingpositions)));
		};
		_usedposits pushback _nextposit;
		_x setdir (random 360);
		_x setpos (_buildingpositions select _nextposit);
		[_x] spawn building_defence_ai;
		_x setUnitPos "UP";
		_remainingposits = _remainingposits - 1;
	};
} foreach (units _grp);

_grp;
