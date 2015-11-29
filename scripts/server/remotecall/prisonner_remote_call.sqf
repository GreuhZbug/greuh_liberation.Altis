params [ "_unit" ];
private [ "_yield", "_resistance_prisonner_ammo_yield", "_csat_prisonner_ammo_yield" ];

_resistance_prisonner_intel_yield = 2;
_csat_prisonner_intel_yield = 5;

if ( isServer ) then {
	intel_obtained = true;
	publicVariable "intel_obtained";
	_yield = _csat_prisonner_intel_yield;
	if ( ( typeof _unit ) in all_resistance_troops ) then {
		_yield = _resistance_prisonner_intel_yield;
	};
	resources_intel = resources_intel + ( _yield + (round (random _yield)));
	stats_prisonners_captured = stats_prisonners_captured + 1;
};