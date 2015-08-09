_olddistance_inf = -1;
_olddistance_veh = -1;
_olddistance_obj = -1;
_was_vehicle = false;

while { true } do {
	waitUntil { sleep 0.2;
		(round _olddistance_inf != round desiredviewdistance_inf) 
		|| (round _olddistance_veh != round desiredviewdistance_veh) 
		|| (round _olddistance_obj != round desiredviewdistance_obj) 
		|| ( (( vehicle player == player ) && _was_vehicle) 
		|| (( vehicle player != player ) && !_was_vehicle) ) 
		|| !(alive player) };
	waitUntil { alive player };
	_olddistance_inf = round desiredviewdistance_inf;
	_olddistance_veh = round desiredviewdistance_veh;
	_olddistance_obj = round desiredviewdistance_obj;
	_was_vehicle = ( vehicle player != player );
	
	if ( _was_vehicle ) then {
		setViewDistance (round desiredviewdistance_veh);
	} else {
		setViewDistance (round desiredviewdistance_inf);
	};
	
	setObjectViewDistance ((desiredviewdistance_obj / 100.0) * desiredviewdistance_inf);
};