_combat_triggers = [15,30,45,60,75];
if ( GRLIB_unitcap < 0.9 ) then { _combat_triggers = [15,50,75]; };
if ( GRLIB_unitcap > 1.3 ) then { _combat_triggers = [15,25,35,45,55,65,75]; };

_combat_triggers_infantry = [10,25,40,55,70];
if ( GRLIB_unitcap < 0.9 ) then { _combat_triggers_infantry = [10,40,70]; };
if ( GRLIB_unitcap > 1.3 ) then { _combat_triggers_infantry = [10,20,30,40,50,60,70]; };

sleep 5;

waitUntil { sleep 0.3; !isNil "blufor_sectors" };
waitUntil { sleep 0.3; count blufor_sectors > 3 };

{
	[_x, false] spawn manage_one_patrol;
	sleep 1;
} foreach _combat_triggers;

{
	[_x, true] spawn manage_one_patrol;
	sleep 1;
} foreach _combat_triggers_infantry;
