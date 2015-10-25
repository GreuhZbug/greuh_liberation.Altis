private [ "_currentgroupdelete" ];

while { true } do {
	{
		if ( side _x == WEST ) then {
			if ( groupid _x == "delete" || groupid _x == "DELETE" || groupid _x == "delete" ) then {
				_currentgroupdelete = _x;
				_currentgroupdelete setGroupId [format ["Deleted Squad %1",(floor random 1000)]];
				{deleteVehicle _x; } foreach units _currentgroupdelete;
			};
		};
		sleep 0.1;
	} foreach allGroups;
	sleep 5;
};
