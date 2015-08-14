_hostile_markers = [];

while { true } do {

	{ deleteMarkerLocal _x } foreach _hostile_markers;
	_hostile_markers = [];
	_hostile_groups = [];
	
	{
		if ( ((side _x == EAST) || (side _x == RESISTANCE)) && ((count units _x) > 0)) then {
			if ( [(getpos leader _x), WEST, radiotower_size] call F_getNearestTower != "" ) then {

				_hostile_groups pushback _x;
			};
		};
	} foreach allGroups;
	
	{
		_marker = createMarkerLocal [format ["hostilegroup%1",_x], markers_reset];
		_marker setMarkerColorLocal "ColorRED";
		_marker setMarkerTypeLocal "mil_warning";
		_marker setMarkerSizeLocal [ 0.65, 0.65 ];
		_marker setMarkerPosLocal ( [ getpos (leader _x), random 360, random 100 ] call BIS_fnc_relPos );
		_hostile_markers pushback _marker;
	} foreach _hostile_groups;
	
	sleep (30 + (random 30));
};