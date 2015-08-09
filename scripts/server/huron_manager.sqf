waitUntil { time > 1 };
waitUntil { !isNil "all_fobs" };
waitUntil { !isNil "save_is_loaded" };

firstloop = true;
huron = objNull;
_savedhuron = objNull;

if ( count all_fobs == 0 ) then {
	_fobbox = FOB_box_typename createVehicle [0,0,50];
	_fobbox setposasl [(getpos lhd select 0) + 10, (getpos lhd select 1) + 62, (17.2   + (getposasl lhd select 2))];
	clearItemCargoGlobal _fobbox;
	_fobbox setDir 130;
};

while { true } do {

	{
		if ( typeof _x == huron_typename ) then {
			_savedhuron = _x;
		};
	} foreach vehicles;
	
	if ( firstloop && !isNull _savedhuron ) then {
		huron = _savedhuron;
	} else {
		huron = huron_typename createVehicle [0,0,50];
		huron allowdamage false;
		huron setDir 0;
		huron setposasl [(getpos lhd select 0) -9, (getpos lhd select 1) + 62, (17.5   + (getposasl lhd select 2))];
	};
	
	firstloop = false;
	
	huron AnimateDoor ["Door_rear_source", 1, true];
	publicVariable "huron";
	clearWeaponCargoGlobal huron;
	clearMagazineCargoGlobal huron;
	clearItemCargoGlobal huron;
	clearBackpackCargoGlobal huron;
	sleep 5;
	huron setDamage 0;
	huron allowdamage true;
	waitUntil { 
		sleep 1;
		!alive huron; 
	};
	stats_spartan_respawns = stats_spartan_respawns + 1;
	sleep 9;
	if (huron distance lhd < 500) then {
		deletevehicle huron;
	};
	sleep 1;
};
	
