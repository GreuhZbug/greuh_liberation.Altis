unitcap = 0;
while { true } do {
	_local_unitcap = 0;
	{
		if ( (side _x == WEST) && (alive _x) && ((_x distance lhd) > 1000)) then {
			_local_unitcap = _local_unitcap + 1;
		};
	} foreach allUnits;
	unitcap = _local_unitcap;
	sleep 1.06;
};