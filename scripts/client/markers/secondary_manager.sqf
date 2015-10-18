sleep 30;

private [ "_secondary_marker", "_secondary_marker_zone" ];

waitUntil {
	sleep 0.3;
	!isNil "secondary_objective_position_marker";
};
waitUntil {
	sleep 0.3;
	count secondary_objective_position_marker > 0;
};

secondary_objective_destroyed = false;
if ( isNil "intel_obtained" ) then { intel_obtained = false };

_secondary_marker = createMarkerLocal ["secondarymarker", markers_reset];
_secondary_marker setMarkerColorLocal "ColorRED";
_secondary_marker setMarkerTypeLocal "hd_unknown";

_secondary_marker_zone = createMarkerLocal ["secondarymarkerzone", markers_reset];
_secondary_marker_zone setMarkerColorLocal "ColorRED";
_secondary_marker_zone setMarkerShapeLocal "ELLIPSE";
_secondary_marker_zone setMarkerBrushLocal "FDiagonal";
_secondary_marker_zone setMarkerSizeLocal [1200,1200];


while { true } do {
	waitUntil {
		sleep 1;
		intel_obtained || secondary_objective_destroyed;
	};

	if ( secondary_objective_destroyed ) then {
		[ "lib_secondary", [ ] ] call BIS_fnc_showNotification;
		_secondary_marker setMarkerPosLocal markers_reset;
		_secondary_marker_zone setMarkerPosLocal markers_reset;
		sleep 1;
		secondary_objective_destroyed = false;

	};
	if ( intel_obtained ) then {
		[ "lib_intel", [ markertext ( [ 5000, secondary_objective_position_marker ] call F_getNearestSector ) ] ] call BIS_fnc_showNotification;
		_secondary_marker setMarkerPosLocal secondary_objective_position_marker;
		_secondary_marker_zone setMarkerPosLocal secondary_objective_position_marker;
		sleep 30;
		intel_obtained = false;
	};
};