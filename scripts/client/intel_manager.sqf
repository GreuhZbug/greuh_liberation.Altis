_actionned_captive_units = [];

while { true } do {
	_near_people = (getpos player) nearEntities [["Man"], 3];
	{
		if ( (captive _x) && (side (group _x) == EAST) && !(_x in _actionned_captive_units) ) then {
			_x addAction ["<t color='#FFFF00'>" + localize "STR_SECONDARY_INTERROGATE" + "</t>","scripts\client\do_interrogate.sqf","",-850,true,true,"",""];
			_actionned_captive_units = _actionned_captive_units + [_x];
		};
	} foreach _near_people;
	
	{
		if ( !(alive _x) || ((player distance _x) > 5) ) then {
			removeAllActions _x;
			_actionned_captive_units = _actionned_captive_units - [_x];
		};
	} foreach _actionned_captive_units;
	sleep 1;
};