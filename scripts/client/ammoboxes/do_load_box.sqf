params [ "_ammobox"];
private [ "_neartransporttrucks", "_truck_to_load", "_truck_load", "_next_truck", "_maxload" ];

_maxload = 3;
_neartransporttrucks = ((getpos player) nearEntities [ ammobox_transports_typenames, 12]);
_truck_to_load = objNull;

_offsets = [
[0,	-0.4,	0.4],
[0,	-2.1,	0.4],
[0,	-3.8,	0.4]
];

{
	_next_truck = _x;
	if ( isNull _truck_to_load ) then {
		_truck_load = _next_truck getVariable ["GRLIB_ammo_truck_load", 0];
		if (  _truck_load < _maxload ) then {
			_truck_to_load = _next_truck;
			_ammobox attachTo [ _truck_to_load, _offsets select _truck_load ];
			_truck_to_load setVariable ["GRLIB_ammo_truck_load", _truck_load + 1, true];
			hint localize "STR_BOX_LOADED";
		}
	};
} foreach _neartransporttrucks;

if ( isNull _truck_to_load ) then {
	hint localize "STR_BOX_CANTLOAD";
};
