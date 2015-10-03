private [ "_commanderobj" ];

_commanderobj = objNull;

{ if ( typeOf _x == "B_officer_F" ) exitWith { _commanderobj = _x }; } foreach allPlayers;

_commanderobj