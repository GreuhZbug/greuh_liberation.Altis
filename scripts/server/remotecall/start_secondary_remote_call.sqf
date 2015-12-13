if ( !isServer ) exitWith {};
if ( isNil "GRLIB_secondary_starting" ) then { GRLIB_secondary_starting = false; };
if ( GRLIB_secondary_starting ) exitWith { diag_log "Multiple calls to start secondary mission : shouldn't be possible, isn't allowed"; };
if ( isNil "used_positions" ) then { used_positions = []; };

GRLIB_secondary_starting = true; publicVariable "GRLIB_secondary_starting";
params [ "_mission_index" ];

// FOB Hunting
if ( _mission_index == 0 ) then {
	resources_intel = resources_intel - ( GRLIB_secondary_missions_costs select _mission_index );
	[] call fob_hunting;
};

GRLIB_secondary_starting = false; publicVariable "GRLIB_secondary_starting";