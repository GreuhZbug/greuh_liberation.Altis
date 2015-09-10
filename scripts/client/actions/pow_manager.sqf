_actionned_captive_units = [];

while { true } do {
	_near_people = (getpos player) nearEntities [["Man"], 4];
	{
		if ( (captive _x) && !(_x in _actionned_captive_units) && ! (_x in (units group player)) ) then {
			_x addAction ["<t color='#FFFF00'>" + localize "STR_SECONDARY_CAPTURE" + "</t>","scripts\client\actions\do_capture.sqf","",-850,true,true,"","(vehicle player == player) && (group _target != group player) && (captive _target)"];
			_actionned_captive_units = _actionned_captive_units + [_x];
		};
	} foreach _near_people;

	{
		if ( !(alive _x) || ((player distance _x) > 5) || (_x in (units group player)) ) then {
			removeAllActions _x;
			_actionned_captive_units = _actionned_captive_units - [_x];
		};
	} foreach _actionned_captive_units;
	sleep 3;
};