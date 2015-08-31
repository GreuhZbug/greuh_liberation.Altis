setTimeMultiplier GRLIB_time_factor;

_weathers = [0,0,0,0,0,0.4,0.4,0.4,0.4,0.6,0.8,0.9,1.0];
_fogs = [0,0,0,0,0,0,0,0,0,0,0.05,0.1,0.3];
_weathertime = 1800;

while { GRLIB_endgame == 0 } do {
	_chosentime = (floor (random (count _weathers)));
	chosen_weather = [_weathers select _chosentime,_fogs select _chosentime];
	publicVariable "chosen_weather";
	sleep _weathertime;
};