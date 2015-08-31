_combat_triggers = [15,30,45,60,75,90];
if ( GRLIB_unitcap < 0.9 ) then { _combat_triggers = [20,40,60,80]; };
if ( GRLIB_unitcap > 1.3 ) then { _combat_triggers = [10,20,30,40,50,60,70,80,90,100]; };

_combat_triggers_infantry = [20,40,60];
if ( GRLIB_unitcap < 0.9 ) then { _combat_triggers_infantry = [25,50]; };
if ( GRLIB_unitcap > 1.3 ) then { _combat_triggers_infantry = [15,30,45,60,75]; };

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
