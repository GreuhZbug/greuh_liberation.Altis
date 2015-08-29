private [ "_blufor_ai_groups", "_localgroup", "_is_ai_only" ];

while { GRLIB_endgame == 0 } do {

	if ( !(isNil "commandant") ) then {
		if ( !(isNull commandant)) then {

			_blufor_ai_groups = [];

			{
				if ( side _x == WEST ) then {
					_localgroup = _x;
					_is_ai_only = true;

					{ if ( isPlayer _x ) then { _is_ai_only = false; }; } foreach units _localgroup;

					if ( _is_ai_only ) then { _blufor_ai_groups pushback _localgroup };

				};
			} foreach ( [ allGroups, { groupOwner _x != owner commandant } ] call BIS_fnc_conditionalSelect );

			if ( count _blufor_ai_groups > 0 ) then {
				{
					if ( ( ( leader _x ) distance lhd ) > 500 && ( groupOwner _x != owner commandant ) ) then {
						_x setGroupOwner (owner commandant);
						sleep 1;
					};
				} foreach _blufor_ai_groups;
			};
		};
	};

	sleep 15;
};