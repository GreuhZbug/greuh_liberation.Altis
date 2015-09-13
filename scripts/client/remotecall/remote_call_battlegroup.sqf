if ( isDedicated ) exitWith {};

params [ "_battlegroup_position" ];

"opfor_bg_marker" setMarkerPosLocal ( getMarkerPos _battlegroup_position );
[ "lib_battlegroup", [ markerText ( [ 5000, getMarkerPos _battlegroup_position ] call F_getNearestSector ) ] ] call BIS_fnc_showNotification;