createMarkerLocal ["opfor_bg_marker", markers_reset];
"opfor_bg_marker" setMarkerTypeLocal "mil_unknown";
"opfor_bg_marker" setMarkerColorLocal "ColorRED";

createMarkerLocal ["opfor_capture_marker", markers_reset];
"opfor_capture_marker" setMarkerTypeLocal "mil_objective";
"opfor_capture_marker" setMarkerColorLocal "ColorRED";

if ( isNil "sector_timer" ) then { sector_timer = 0 };

while { true } do {
	sleep 1;
	if ( sector_timer > 0 ) then {
		"opfor_capture_marker" setMarkerTextLocal format ["%1",([sector_timer] call F_secondsToTimer)];
		sector_timer = sector_timer - 1;
	} else {
		"opfor_capture_marker" setMarkerTextLocal "VULNERABLE";
		waitUntil{
			sleep 1;
			sector_timer > 0
		};
	};
};