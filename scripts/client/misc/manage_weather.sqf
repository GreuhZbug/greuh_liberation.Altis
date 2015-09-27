waitUntil { !isNil "chosen_weather" };

while { true } do {
	while { true } do {
		4800 setOvercast chosen_weather;
		if ( overcast < 0.83 ) then { 10 setRain 0 };
		if ( overcast >= 0.83 && overcast < 0.96 ) then { 10 setRain 0.1 };
		if ( overcast >= 0.96 ) then { 10 setRain 0.15 }; // Removed heavy rain due to severe fps issues
		sleep 30;
	};
};