waitUntil { !isNil "chosen_weather" };

private [ "_ticks" ];

_ticks = 0;

while { true } do {
	while { true } do {
		if ( _ticks % 12 == 0 ) then {
			2400 setOvercast chosen_weather;
		};
		if ( overcast < 0.83 ) then { 3 setRain 0 };
		if ( overcast >= 0.83 && overcast < 0.96 ) then { 3 setRain 0.1 };
		if ( overcast >= 0.96 ) then { 3 setRain 0.15 }; // Removed heavy rain due to severe fps issues
		_ticks = _ticks + 1;
		sleep 5;
	};
};