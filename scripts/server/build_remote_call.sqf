if (!isServer) exitWith {};

_built_object_remote = _this select 0;
	
_localtype = _built_object_remote select 0;
_localindex = _built_object_remote select 1;
_playerbuilder = _built_object_remote select 2;
_price_a = (((build_lists select _localtype) select _localindex) select 2);
_typename = (((build_lists select _localtype) select _localindex) select 0);
resources_ammo = resources_ammo - _price_a;

if ( _localtype == 8 ) then {
	stats_blufor_soldiers_recruited = stats_blufor_soldiers_recruited + 10;
} else {
	if ( _typename isKindOf "Man" ) then {
		stats_blufor_soldiers_recruited = stats_blufor_soldiers_recruited + 1;
	} else {
		if ( ! ( _typename isKindOf "Building" ) ) then {
			stats_blufor_vehicles_built = stats_blufor_vehicles_built + 1;
		};
	};
};

stats_ammo_spent = stats_ammo_spent + _price_a;
	
please_recalculate = true;
