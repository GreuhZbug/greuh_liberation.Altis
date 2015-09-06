private [ "_ammobox","_neartransporttrucks", "_truck_to_load", "_truck_load", "_next_truck" ];

_maxload = 4;
_ammobox = _this select 0;

_neartransporttrucks = ((getpos player) nearEntities [ ammobox_transports_typenames ,15]);
_truck_to_load = objNull;

{
	_next_truck = _x;
	if ( isNull _truck_to_load ) then {
		_truck_load = _next_truck getVariable ["GRLIB_ammo_truck_load", 0];
		if (  _truck_load < _maxload ) then {
			_truck_to_load = _next_truck;
			_truck_to_load setVariable ["GRLIB_ammo_truck_load", _truck_load + 1, true]
		}
	};

} foreach _neartransporttrucks;
