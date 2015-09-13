_olddistance_inf = -1;
_olddistance_veh = -1;
_olddistance_obj = -1;
_olddesiredvolume = -1;
_was_vehicle = false;

while { true } do {
	waitUntil { sleep 0.5;
		(round _olddistance_inf != round desiredviewdistance_inf)
		|| (round _olddistance_veh != round desiredviewdistance_veh)
		|| (round _olddistance_obj != round desiredviewdistance_obj)
		|| ( (( vehicle player == player ) && _was_vehicle)
		|| (( vehicle player != player ) && !_was_vehicle) )
		|| !(alive player)
		|| ( round _olddesiredvolume != round desired_vehvolume) };
	waitUntil { alive player };
	_olddistance_inf = round desiredviewdistance_inf;
	_olddistance_veh = round desiredviewdistance_veh;
	_olddistance_obj = round desiredviewdistance_obj;
	_olddesiredvolume = desired_vehvolume;
	_was_vehicle = ( vehicle player != player );

	if ( _was_vehicle ) then {
		setViewDistance (round desiredviewdistance_veh);
		1 fadeSound ( desired_vehvolume / 100.0 );
	} else {
		setViewDistance (round desiredviewdistance_inf);
		1 fadeSound 1;
	};

	setObjectViewDistance ((desiredviewdistance_obj / 100.0) * desiredviewdistance_inf);

};