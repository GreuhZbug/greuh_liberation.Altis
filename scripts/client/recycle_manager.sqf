_recycleable_vehicles = [];
veh_action_distance = 10;
_fob_distance = 100;

_recycleable_classnames = [];
{
	_recycleable_classnames pushBack ( _x select 0 );
} foreach (light_vehicles + heavy_vehicles + air_vehicles + static_vehicles + support_vehicles);



while { true } do {

	_detected_vehicles = 	[ (getpos player) nearEntities [ [ "AllVehicles" ], veh_action_distance ] , 
						{ (typeof _x in _recycleable_classnames ) && (count crew _x) == 0 && ((locked _x == 0 || locked _x == 1)) && (_x distance lhd > 1000) && (_x distance (call F_getNearestFob) < _fob_distance ) } ] 
						call BIS_fnc_conditionalSelect;
	
	{
		_next_vehicle = _x;
		_next_vehicle_already_in_list = false;
		{
			if ( (_x select 0) == _next_vehicle ) then {
				_next_vehicle_already_in_list = true;
			};
		} foreach _recycleable_vehicles;
		
		if ( !_next_vehicle_already_in_list ) then {
			_idact_next = _next_vehicle addAction [ "<t color='#FFFF00'>" + localize "STR_RECYCLE" + "</t> <img size='2' image='res\ui_recycle.paa'/>", "scripts\client\do_recycle.sqf", "", -900, true, true, "", "build_confirmed == 0 && (  _this distance _target < veh_action_distance ) && (vehicle player == player)"];
			_recycleable_vehicles = _recycleable_vehicles +  [ [ _next_vehicle, _idact_next ] ];
		};
	} foreach _detected_vehicles;
	
	{
		_next_vehicle = _x;
		_next_vehicle_already_in_list = false;
		{
			if ( _x == (_next_vehicle select 0) ) then {
				_next_vehicle_already_in_list = true;
			};
		} foreach _detected_vehicles;
		
		if ( !_next_vehicle_already_in_list ) then {
			(_next_vehicle select 0) removeAction (_next_vehicle select 1);
			_recycleable_vehicles = _recycleable_vehicles - [ _next_vehicle ];
		};
	
	} foreach _recycleable_vehicles;

	sleep 1;
};