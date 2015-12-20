if ( GRLIB_remote_sensors == 0 ) exitWith {};

sleep 10;

while { true } do {

	if ( getRemoteSensorsDisabled ) then {
		if ( GRLIB_remote_sensors == 1 ) then {
			if ( { (local _x) && !(isPlayer _x) } count allUnits > 0 ) then {
				disableRemoteSensors false;
				hint "Remove sensors have been enabled";
			};
		};
	} else {

		private [ "_disable" ];
		_disable = false;

		if ( GRLIB_remote_sensors == 2 ) then {
			_disable = true;
		} else {
			if ( { (local _x) && !(isPlayer _x) } count allUnits == 0 ) then {
				_disable = true;
			};
		};

		if ( _disable ) then {
			disableRemoteSensors true;
			hint "Remove sensors have been disabled";
		};
	};

	sleep 15;
};