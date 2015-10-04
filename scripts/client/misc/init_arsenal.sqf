private [ "_virtualStuff", "_virtualBackpacks" ];

_virtualStuff = [] call LARs_fnc_addAllVirtualCargo;

_virtualBackpacks = [];
{ if ( !(_x in GRLIB_blacklisted_from_arsenal) ) then { _virtualBackpacks pushback _x } } foreach (_virtualStuff);

[ missionNamespace, true ] call BIS_fnc_addVirtualWeaponCargo;
[ missionNamespace, true ] call BIS_fnc_addVirtualMagazineCargo;
[ missionNamespace, true ] call BIS_fnc_addVirtualItemCargo;
[ missionNamespace, _virtualBackpacks ] call BIS_fnc_addVirtualBackpackCargo;

