_grp = _this select 0;
_startpos = getpos (leader _grp);
_infantry = false;

if ( count _this == 2 ) then {
	_infantry = true;
};

if (isNil "reset_battlegroups_ai" ) then { reset_battlegroups_ai = false };

sleep (3 + (random 3));

while { ( count units _grp != 0 ) && ( GRLIB_endgame == 0 ) } do {

	sleep (5 + (random 5));

	_objectivepos = ([getpos (leader _grp)] call F_getNearestBluforObjective) select 0;

	[ [ _objectivepos ] , "remote_call_incoming" ] call BIS_fnc_MP;

	while { ((getpos (leader _grp)) distance _startpos) < 50 } do {

		while {(count (waypoints _grp)) != 0} do {deleteWaypoint ((waypoints _grp) select 0);};

		sleep 1;

		{_x doFollow leader _grp} foreach units _grp;

		sleep 1;

		_startpos = getpos (leader _grp);
		_waypoint = _grp addWaypoint [_startpos, 10];
		_waypoint setWaypointType "MOVE";
		_waypoint setWaypointCompletionRadius 300;

		_waypoint = _grp addWaypoint [_objectivepos, 100];
		_waypoint setWaypointType "MOVE";
		_waypoint setWaypointSpeed "NORMAL";

		_waypoint setWaypointBehaviour "AWARE";
		_waypoint setWaypointCombatMode "YELLOW";
		_waypoint setWaypointCompletionRadius 30;

		_waypoint = _grp addWaypoint [_objectivepos, 100];
		_waypoint setWaypointType "SAD";
		_waypoint setWaypointSpeed "NORMAL";

		_waypoint = _grp addWaypoint [_objectivepos, 100];
		_waypoint setWaypointType "SAD";

		_waypoint = _grp addWaypoint [_objectivepos, 100];
		_waypoint setWaypointType "SAD";

		_waypoint = _grp addWaypoint [_objectivepos, 100];
		_waypoint setWaypointType "CYCLE";

		_grp setCurrentWaypoint [_grp, 0];

		sleep 30;
	};


	waitUntil {
		sleep 5;
		( { alive _x } count (units _grp) == 0) || reset_battlegroups_ai;
	};
	sleep (5 + (random 5));
	reset_battlegroups_ai = false;
};