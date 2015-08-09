waitUntil { !isNil "blufor_sectors" };
waitUntil { !isNil "combat_readiness" };
waitUntil { !isNil "sectors_bigtown" };
waitUntil { !isNil "active_sectors" };

while { true } do {
	if ( (count blufor_sectors) >= ((count sectors_allSectors) * 0.85)) then {
		if ( combat_readiness > 0 ) then {
			combat_readiness = combat_readiness - 0.2;
		};
	} else {
		if ( combat_readiness < ((count blufor_sectors) * 0.66) && combat_readiness < 75 ) then {
			combat_readiness = combat_readiness + 0.2;
			stats_readiness_earned = stats_readiness_earned + 0.2;
		};
		
		_one_bigtown_active = false;
		{
			if ( _x in active_sectors ) then {
				_one_bigtown_active = true;
			}
		} foreach sectors_bigtown;
		
		if (_one_bigtown_active && combat_readiness < 100) then {
			combat_readiness = combat_readiness + 1;
			stats_readiness_earned = stats_readiness_earned + 1;
		};
	};
	
	if (combat_readiness > 100) then {
		combat_readiness = 100;
	};
	
	sleep (30 + random (60));
};