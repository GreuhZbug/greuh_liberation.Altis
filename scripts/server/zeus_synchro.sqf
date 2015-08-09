waitUntil { !isNil "huron_typename" };

_vehicleClassnames = [huron_typename];


{
	_vehicleClassnames = _vehicleClassnames + [_x select 0];
} foreach (light_vehicles + heavy_vehicles + air_vehicles + static_vehicles + support_vehicles) ;


while { true } do {
	
	waitUntil { sleep 0.1; count allCurators > 0 };
	
	_units = [];
	{
		if ( (side _x == WEST ) && ( _x distance lhd > 1000 ) && alive _x ) then {
			_units = _units + [_x];
		};
	} foreach allUnits;
	
	{
		if ((typeof _x in _vehicleClassnames ) && (( _x distance lhd > 1000 ) || (typeof _x == huron_typename)) && alive _x ) then {
			_units = _units + [_x];
		};
	} foreach vehicles;
	
	_units = _units + switchableUnits;
	_units = _units + playableUnits;
	_units = _units - (curatorEditableObjects (allCurators select 0));
	
	_units_to_remove = [];
	{
		if ( !(alive _x) ) then {
			_units_to_remove = _units_to_remove + [_x];
		};
	} foreach (curatorEditableObjects (allCurators select 0));
	
	{ 
		_zgm = _x;
		_zgm addCuratorEditableObjects [_units,true]; 
		_zgm removeCuratorEditableObjects [_units_to_remove,true];
		
		_zgm  setCuratorCoef ["edit", -1e8];
		_zgm  setCuratorCoef ["place", -1e8];
		_zgm  setCuratorCoef ["synchronize", -1e8];
		_zgm  setCuratorCoef ["delete", -1e8];
		_zgm  setCuratorCoef ["destroy", -1e8];
		
	} foreach allCurators;

	sleep 5;
};