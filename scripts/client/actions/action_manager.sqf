_idact_build = -1;
_idact_arsenal = -1;
_idact_buildfob = -1;
_idact_redeploy = -1;
_idact_tutorial = -1;
_distfob = 100;
_distarsenal = 5;
_distbuildfob = 10;
_distspawn = 10;
_distredeploy = 30;

removefobboxes = false;

waitUntil { !isNil "build_confirmed" };
waitUntil { !isNil "one_synchro_done" };
waitUntil { one_synchro_done };

while { true } do {

	if (!alive player) then {
		removeAllWeapons player;
	};

	waitUntil { alive player };

	_nearfob = call F_getNearestFob;
	_fobdistance = 9999;
	if ( count _nearfob == 3 ) then {
		_fobdistance = player distance _nearfob;
	};

	_neararsenal = ((getpos player) nearobjects [Arsenal_typename,_distarsenal]);
	_nearfobbox = ((getpos player) nearEntities [ [ FOB_box_typename, FOB_truck_typename ] , _distbuildfob]);
	_nearspawn = ((getpos player) nearEntities [ [ Respawn_truck_typename, huron_typename ] ,_distspawn]);

	if ( removefobboxes ) then {
		removefobboxes = false;
		if ( count _nearfobbox > 0 ) then {
			deletevehicle (_nearfobbox select 0);
		};
	};

	if ( (player distance lhd) < 200 && alive player && vehicle player == player ) then {
		if ( _idact_tutorial == -1 ) then {
			_idact_tutorial = player addAction ["<t color='#80FF80'>" + localize "STR_TUTO_ACTION" + "</t>","howtoplay = 1","",-600,false,true,"",""];
		};
	} else {
		if ( _idact_tutorial != -1 ) then {
			player removeAction _idact_tutorial;
			_idact_tutorial = -1;
		};
	};

	if ( (_fobdistance < _distredeploy || count _nearspawn != 0 || (player distance lhd) < 200) && alive player && vehicle player == player ) then {
		if ( _idact_redeploy == -1 ) then {
			_idact_redeploy = player addAction ["<t color='#80FF80'>" + localize "STR_DEPLOY_ACTION" + "</t> <img size='2' image='res\ui_redeploy.paa'/>","scripts\client\actions\redeploy.sqf","",-750,false,true,"","build_confirmed == 0"];
		};
	} else {
		if ( _idact_redeploy != -1 ) then {
			player removeAction _idact_redeploy;
			_idact_redeploy = -1;
		};
	};

	if ( (count _neararsenal != 0 || count _nearspawn != 0 || (player distance lhd) < 200) && alive player && vehicle player == player ) then {
		if (_idact_arsenal == -1) then {
			_idact_arsenal = player addAction ["<t color='#FFFF00'>" + localize "STR_ARSENAL_ACTION" + "</t> <img size='2' image='res\ui_arsenal.paa'/>","scripts\client\actions\open_arsenal.sqf","",-980,true,true,"","build_confirmed == 0"];
		};
	} else {
		if ( _idact_arsenal != -1 ) then {
			player removeAction _idact_arsenal;
			_idact_arsenal = -1;
		};
	};

	if ( _fobdistance < _distfob && alive player && vehicle player == player ) then {
		if ( _idact_build == -1 ) then {
			_idact_build = player addAction ["<t color='#FFFF00'>" + localize "STR_BUILD_ACTION" + "</t> <img size='2' image='res\ui_build.paa'/>","scripts\client\build\open_build_menu.sqf","",-985,false,true,"","build_confirmed == 0"];
		};
	} else {
		if ( _idact_build != -1 ) then {
			player removeAction _idact_build;
			_idact_build = -1;
		};
	};

	if ( count _nearfobbox != 0 && alive player && vehicle player == player && !(surfaceIsWater getpos player)) then {
		if ( _idact_buildfob == -1 ) then {
			_idact_buildfob = player addAction ["<t color='#FFFF00'>" + localize "STR_FOB_ACTION" + "</t> <img size='2' image='res\ui_deployfob.paa'/>","scripts\client\build\do_build_fob.sqf","",-990,false,true,"","build_confirmed == 0"];
		};
	} else {
		if ( _idact_buildfob != -1 ) then {
			player removeAction _idact_buildfob;
			_idact_buildfob = -1;
		};
	};

	sleep 1;
};