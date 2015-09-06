GRLIB_sector_size = 1000;
GRLIB_capture_size = 250;
GRLIB_radiotower_size = 2500;
GRLIB_recycling_percentage = 0.65;
GRLIB_endgame = 0;
GRLIB_vulnerability_timer = 900;
GRLIB_defended_buildingpos_part = 0.4;
GRLIB_sector_military_value = 75;
GRLIB_secondary_objective_impact = 0.6;
GRLIB_blufor_cap = 80								* GRLIB_unitcap;
GRLIB_sector_cap = 160								* GRLIB_unitcap;
GRLIB_battlegroup_cap = 150							* GRLIB_unitcap;
GRLIB_patrol_cap = 140								* GRLIB_unitcap;
GRLIB_battlegroup_size = 8							* GRLIB_unitcap;
GRLIB_civilians_amount = 10 						* GRLIB_civilian_activity;

if ( GRLIB_blufor_cap > 100 ) then { GRLIB_blufor_cap = 100 }; // Don't forget that the human commander manages those, not the server

GRLIB_offload_diag = false;