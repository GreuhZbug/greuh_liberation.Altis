 if ( ( random 100 ) > GRLIB_surrender_chance ) exitWith {};

params [ "_unit" ];

if ( (_unit isKindOf "Man") && ( alive _unit ) && (side group _unit == EAST) ) then {

	if ( vehicle _unit != _unit ) then { deleteVehicle _unit };

	sleep (random 5);

	if ( alive _unit ) then {

		removeAllWeapons _unit;
		removeHeadgear _unit;
		removeBackpack _unit;
		removeVest _unit;
		_unit unassignItem "NVGoggles_OPFOR";
		_unit removeItem "NVGoggles_OPFOR";
		_unit unassignItem "NVGoggles_INDEP";
		_unit removeItem "NVGoggles_INDEP";
		_unit setUnitPos "UP";
		sleep 1;
		_unit disableAI "ANIM";
		_unit disableAI "MOVE";
		_unit playmove "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon" ;
		sleep 2;
		_unit setCaptive true;

		waitUntil { sleep 1;
			!alive _unit || side group _unit == WEST
		};

		if ( alive _unit ) then {
			_unit enableAI "ANIM";
			_unit enableAI "MOVE";
			sleep 1;
			[ [ _unit ], "remote_call_prisonner", _unit ] call bis_fnc_mp;
		};
	};
};