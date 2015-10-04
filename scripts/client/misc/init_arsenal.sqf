private [ "_virtualStuff", "_nextTable", "_virtualItems", "_virtualWeapons", "_virtualMagazines", "_virtualBackpacks" ];

["Preload"] call BIS_fnc_arsenal;
_virtualStuff = [] call LARs_fnc_addAllVirtualCargo;

_virtualWeapons = [];
{ if ( !(_x in GRLIB_blacklisted_from_arsenal) ) then { _virtualWeapons pushback _x } } foreach (_virtualStuff select 0);

_virtualMagazines = [];
{ if ( !(_x in GRLIB_blacklisted_from_arsenal) ) then { _virtualMagazines pushback _x } } foreach (_virtualStuff select 1);

_virtualItems = [];
{ if ( !(_x in GRLIB_blacklisted_from_arsenal) ) then { _virtualItems pushback _x } } foreach (_virtualStuff select 2);

_virtualBackpacks = [];
{ if ( !(_x in GRLIB_blacklisted_from_arsenal) ) then { _virtualBackpacks pushback _x } } foreach (_virtualStuff select 3);

[ missionNamespace, _virtualWeapons ] call BIS_fnc_addVirtualWeaponCargo;
[ missionNamespace, _virtualMagazines ] call BIS_fnc_addVirtualMagazineCargo;
[ missionNamespace, _virtualItems ] call BIS_fnc_addVirtualItemCargo;
[ missionNamespace, _virtualBackpacks ] call BIS_fnc_addVirtualBackpackCargo;