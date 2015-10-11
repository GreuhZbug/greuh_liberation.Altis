private [ "_loadouts_data", "_saved_loadouts", "_counter" ];

load_loadout = 0;
edit_loadout = 0;
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

((findDisplay 5251) displayCtrl 201) ctrlAddEventHandler [ "mouseButtonDblClick" , { load_loadout = 1; } ];

waitUntil { !dialog || !(alive player) || load_loadout > 0 || edit_loadout > 0 };

if ( load_loadout > 0 ) then {

	[player, [profileNamespace, _loadouts_data select (lbCurSel 201) ]] call bis_fnc_loadInventory;
	closeDialog 0;
};

if ( edit_loadout > 0 ) then {
	closeDialog 0;
	waitUntil { !dialog };
	[ "Open", false ] spawn BIS_fnc_arsenal;
};