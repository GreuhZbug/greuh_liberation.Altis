_side = _this select 0;
while { true } do {
	waitUntil { sleep 0.3; _side countside allUnits != 0 };
	_resunits = [];
	{
		if ( side _x == _side && local _x ) then { _resunits = _resunits + [_x]; };
	} foreach allUnits;
	
	{
		if (("NVGoggles_INDEP"  in assignedItems _x) || ("NVGoggles_OPFOR" in assignedItems _x)) then {
			[_x] spawn correct_loadout;
		};
	} foreach _resunits;
	sleep 1;
};