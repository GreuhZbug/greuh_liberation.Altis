_combat_triggers = [5,15,30,45,60,75,90,100];
_combat_triggers_infantry = [20,40,65,80];

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
