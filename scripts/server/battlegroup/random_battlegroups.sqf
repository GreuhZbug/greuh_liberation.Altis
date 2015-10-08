private [ "_sleeptime" ];

sleep 900;

while { GRLIB_endgame == 0 } do {

	_sleeptime = 3600 / ([] call  F_adaptiveOpforFactor);

	if ( combat_readiness >= 80 ) then { _sleeptime = _sleeptime * 0.75 };
	if ( combat_readiness >= 90 ) then { _sleeptime = _sleeptime * 0.75 };
	if ( combat_readiness >= 95 ) then { _sleeptime = _sleeptime * 0.75 };

	sleep _sleeptime;

	if ( !isNil "GRLIB_last_battlegroup_time" ) then {
		waitUntil { sleep 5; time > ( GRLIB_last_battlegroup_time + 1200 ) };
	};

	waitUntil { sleep 5; count allPlayers >= 12 };

	if ( combat_readiness > 60 ) then {
		[] spawn spawn_battlegroup;
	};
};