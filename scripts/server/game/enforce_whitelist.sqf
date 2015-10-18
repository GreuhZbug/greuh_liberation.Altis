if ( !GRLIB_use_whitelist ) exitWith {};

private [ "_commanderobj", "_tagmatch", "_idmatch", "_namematch" ];

while { true } do {

	_commanderobj = [] call F_getCommander;
	if ( !isNull _commanderobj ) then {

		_tagmatch = false;
		_idmatch = false;
		_namematch = false;

		if ( !isNil "GRLIB_whitelisted_tags" ) then {
			if ( count (squadParams _commanderobj) != 0 ) then {
				if ( ((squadParams _commanderobj select 0) select 0) in GRLIB_whitelisted_tags  ) then {
					_tagmatch = true;
				};
			};
		};

		if ( !isNil "GRLIB_whitelisted_steamids" ) then {
			if ( ( getPlayerUID _commanderobj ) in GRLIB_whitelisted_steamids ) then {
				_idmatch = true;
			};
		};

		if ( !isNil "GRLIB_whitelisted_names" ) then {
			if ( ( name _commanderobj ) in GRLIB_whitelisted_names ) then {
				_namematch = true;
			};
		};

		if ( !( _tagmatch || _idmatch || _namematch ) ) then {

			[ format ["%1 is not authorized to use the commander slot.", name _commanderobj] , "F_globalChat" ] call bis_fnc_mp;
			sleep 1;
			if ( alive _commanderobj ) then {
				_commanderobj setDamage 1;
			};
		};
	};

	sleep 3;

};