private [ "_actionned_captive_units", "_near_people" ];
_actionned_captive_units = [];

while { true } do {

	if (  [ player, 5 ] call F_fetchPermission  ) then {

		_near_people = (getPosATL player) nearEntities [["Man"], 5];
		{
			if ( (captive _x) && !(_x in _actionned_captive_units) && !((side group _x) == WEST)  ) then {
				_x addAction ["<t color='#FFFF00'>" + localize "STR_SECONDARY_CAPTURE" + "</t>","scripts\client\actions\do_capture.sqf","",-850,true,true,"","(vehicle player == player) && (side group _target != WEST) && (captive _target)"];
				_actionned_captive_units pushback _x;
			};
		} foreach _near_people;

		{
			if ( !(alive _x) || ((player distance _x) > 5) || ((side group _x) == WEST) ) then {
				removeAllActions _x;
				_actionned_captive_units = _actionned_captive_units - [_x];
			};
		} foreach _actionned_captive_units;

	} else {
		{
			removeAllActions _x;
			_actionned_captive_units = _actionned_captive_units - [_x];
		} foreach _actionned_captive_units;
	};

	sleep 3;
};
