if ( !GRLIB_use_whitelist ) exitWith {};

private [ "_commanderobj", "_tagmatch", "_idmatch", "_namematch" ];

while { true } do {

	waitUntil { sleep 1; !(isNull ( [] call F_getCommander ) ) };
	waitUntil { sleep 1; alive ( [] call F_getCommander ) };

	_commanderobj = [] call F_getCommander;
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

	hint format ["%1 %2 %3 %4 %5", _tagmatch, _idmatch, _namematch, name _commanderobj, GRLIB_whitelisted_names];

	if ( !( _tagmatch || _idmatch || _namematch ) ) then {

		[ format ["%1 is not authorized to use the commander slot.", name _commanderobj] , "F_globalChat" ] call bis_fnc_mp;
		sleep 1;
		serverCommand format ["#kick %1", name _commanderobj];
	};

	sleep 1;

	waitUntil { sleep 1; isNull ( [] call F_getCommander ) || !(alive ( [] call F_getCommander )) };

};