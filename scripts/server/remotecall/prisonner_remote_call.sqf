params [ "_unit" ];
private [ "_yield", "_resistance_prisonner_ammo_yield", "_csat_prisonner_ammo_yield" ];

_resistance_prisonner_ammo_yield = 5;
_csat_prisonner_ammo_yield = 10;

if ( isServer ) then {
	intel_obtained = true;
	publicVariable "intel_obtained";
	_yield = _csat_prisonner_ammo_yield;
	if ( ( typeof _unit ) in all_resistance_troops ) then {
		_yield = _resistance_prisonner_ammo_yield;
	};
	resources_ammo = resources_ammo + ( _yield + (round (random _yield)));
	stats_prisonners_captured = stats_prisonners_captured + 1;
};