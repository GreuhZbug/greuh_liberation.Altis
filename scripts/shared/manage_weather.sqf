waitUntil { !isNil "chosen_weather" };

while { true } do {
	3600 setOvercast chosen_weather;
	if ( overcast < 0.75 ) then { 2 setRain 0 };
	if ( overcast >= 0.75 && overcast < 0.95 ) then { 2 setRain 0.075 };
	if ( overcast >= 0.95 ) then { 2 setRain 0.15 }; // Removed heavy rain due to severe fps issues
	sleep 5;
};