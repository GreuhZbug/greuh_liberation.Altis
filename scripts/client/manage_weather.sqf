waitUntil { !isNil "chosen_weather" };

while { true } do {
	4500 setOvercast (chosen_weather select 0);
	if ( overcast < 0.83 ) then { 10 setRain 0 };
	if ( overcast >= 0.83 && overcast < 0.96 ) then { 10 setRain 0.16 };
	if ( overcast >= 0.96 ) then { 10 setRain 0.4 };
	sleep 30;
};