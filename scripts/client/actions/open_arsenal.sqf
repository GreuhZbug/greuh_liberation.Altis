private [ "_loadouts_data", "_saved_loadouts", "_counter", "_loadplayers", "_playerselected", "_namestr", "_nextplayer" ];

load_loadout = 0;
edit_loadout = 0;
respawn_loadout = 0;
load_from_player = -1;
createDialog "liberation_arsenal";

_saved_loadouts = profileNamespace getVariable "bis_fnc_saveInventory_data";
_loadouts_data = [];
_counter = 0;
if ( !isNil "_saved_loadouts" ) then {
	{
		if ( _counter % 2 == 0 ) then {
			_loadouts_data pushback _x;
		};
		_counter = _counter + 1;
	} foreach _saved_loadouts;
};

waitUntil { dialog };

if ( count _loadouts_data > 0 ) then {

	{ lbAdd [201, _x]; } foreach _loadouts_data ;

	if ( lbSize 201 > 0 ) then {
		ctrlEnable [ 202, true ];
		lbSetCurSel [ 201, 0 ];
	} else {
		ctrlEnable [ 202, false ];
	};

} else {
	ctrlEnable [ 202, false ];
};

_loadplayers = [];
{
	if ( !(name _x in [ "HC1", "HC2", "HC3" ]) )  then {
		_loadplayers pushback [ name _x, _x ];
	};
} foreach ( allPlayers - [ player ] );

if ( count _loadplayers > 0 ) then {

	{
		_nextplayer = _x select 1;
		_namestr = "";
		if(count (squadParams _nextplayer) != 0) then {
			_namestr = "[" + ((squadParams _nextplayer select 0) select 0) + "] ";
		};
		_namestr = _namestr + name _nextplayer;

		lbAdd [ 203, _namestr ];
		lbSetCurSel [ 203, 0 ];
	} foreach _loadplayers;

} else {
	ctrlEnable [ 203, false ];
	ctrlEnable [ 204, false ];
};

((findDisplay 5251) displayCtrl 201) ctrlAddEventHandler [ "mouseButtonDblClick" , { load_loadout = 1; } ];

waitUntil { !dialog || !(alive player) || load_loadout > 0 || edit_loadout > 0 || respawn_loadout > 0 || load_from_player >= 0 };

if ( load_loadout > 0 ) then {

	[player, [profileNamespace, _loadouts_data select (lbCurSel 201) ]] call bis_fnc_loadInventory;
	closeDialog 0;
};

if ( edit_loadout > 0 ) then {
	closeDialog 0;
	waitUntil { !dialog };
	[ "Open", false ] spawn BIS_fnc_arsenal;
};

if ( respawn_loadout > 0 ) then {
	closeDialog 0;
	GRLIB_respawn_loadout = [ player, ["repetitive"] ] call F_getLoadout;
	hint localize "STR_MAKE_RESPAWN_LOADOUT_HINT";
};

if ( load_from_player >= 0 ) then {
	_playerselected = ( _loadplayers select load_from_player ) select 1;
	if ( alive _playerselected ) then {
		[ player,  [ _playerselected, ["repetitive"] ] call F_getLoadout ] call F_setLoadout;
		hint format [ localize "STR_LOAD_PLAYER_LOADOUT_HINT", name _playerselected ];
	};
	closeDialog 0;
};