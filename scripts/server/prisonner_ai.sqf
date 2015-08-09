_unit = _this select 0;
if ( (_unit isKindOf "Man") && ( alive _unit ) && ((side _unit == EAST) || (side _unit == RESISTANCE)) ) then {

	if ( vehicle _unit != _unit ) then { deleteVehicle _unit };

	sleep (random 5);

	if ( alive _unit ) then {

		removeAllWeapons _unit;
		sleep 1;
		_unit disableai "ANIM";
		_unit disableAI "MOVE";
		_unit playmove "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon" ;
		sleep 2;
		_unit setCaptive true;

	};
}; 