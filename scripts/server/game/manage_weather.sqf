setTimeMultiplier GRLIB_time_factor;

_weathers = [0,0.01,0.02,0.03,0.05,0.07,0.1,0.15,0.2,0.25,0.3,0.4,0.45,0.5,0.55,0.6,0.7,0.8,0.9,1.0];
_weathertime = 1800;

while { GRLIB_endgame == 0 } do {
	_chosentime = (floor (random (count _weathers)));
	chosen_weather = _weathers select _chosentime;
	publicVariable "chosen_weather";
	sleep _weathertime;
};